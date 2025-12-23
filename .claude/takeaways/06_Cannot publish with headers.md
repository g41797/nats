# HPUB Bug Analysis - Cannot Publish with Headers

## Issue Summary
GitHub Issue #6: Timeout when publishing messages with headers using HPUB command.
The bug is in the header length calculation and buffer construction in Conn.zig:212-247.

## Root Cause Analysis

### NATS Protocol Specification (from protocol.txt lines 117-125)

```
HPUB <subject> [reply-to] <#header bytes> <#total bytes>␍␊
[headers]␍␊␍␊[payload]␍␊
```

Examples from protocol:
1. `HPUB FOO 22 33␍␊NATS/1.0␍␊Bar: Baz␍␊␍␊Hello NATS!␍␊`
   - Header bytes: 22 (includes "NATS/1.0␍␊Bar: Baz␍␊␍␊")
   - Total bytes: 33 (22 + 11 for "Hello NATS!")

2. `HPUB MORNING.MENU 47 51␍␊NATS/1.0␍␊BREAKFAST: donut␍␊BREAKFAST: eggs␍␊␍␊Yum!␍␊`
   - Header bytes: 47 (includes trailing ␍␊␍␊)
   - Total bytes: 51 (47 + 4 for "Yum!")

**Key Protocol Requirements:**
- `<#header bytes>` = Length of headers INCLUDING the trailing ␍␊␍␊ separator
- `<#total bytes>` = header bytes + payload bytes (NOT including final ␍␊ after payload)
- Headers already contain their terminating ␍␊␍␊ separator

### Headers Implementation (src/messages.zig:100-125)

The Headers.append() function:
```zig
pub fn append(hdrs: *Headers, name: []const u8, value: []const u8) !void {
    if (hdrs.buffer.actual_len == 0) {
        try hdrs.buffer.append("NATS/1.0\r\n");
    } else {
        hdrs.buffer.shrink(2) catch unreachable; // Remove tail "\r\n"
    }

    try hdrs.buffer.append(nam);
    try hdrs.buffer.append(":");
    try hdrs.buffer.append(value);
    try hdrs.buffer.append("\r\n");
    try hdrs.buffer.append("\r\n"); // Add tail separator
}
```

**Result:** Headers buffer ALWAYS includes trailing ␍␊␍␊

Example: `"NATS/1.0\r\nNats-Msg-Id:test-msg-123\r\n\r\n"` = 38 bytes

### Current Buggy Implementation (src/Conn.zig:232-246)

```zig
const HDR_LEN = headers.buffer.body().?.len + 1; // BUG: +1 is wrong!
const TOT_LEN = HDR_LEN + body.len;

try cn.printNMT("HPUB {0s} {1s} {2d} {3d}\r\n", .{ subject, repl, HDR_LEN, TOT_LEN });

var buffers: [4]posix.iovec_const = .{
    .{ .base = headers.buffer.body().?.ptr, .len = headers.buffer.body().?.len },
    .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },  // BUG: Extra CRLF!
    .{ .base = body.ptr, .len = body.len },
    .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },
};
```

**Problems:**
1. **Line 232:** Adds +1 to header length, but headers already include trailing ␍␊␍␊
2. **Line 239:** Inserts extra CRLF between headers and payload
3. **Result:** Server receives incorrect byte counts and malformed message structure

**What's Actually Sent:**
```
HPUB subject reply 39 50\r\n          <-- HDR_LEN=39 (should be 38), TOT_LEN=50 (should be 49)
NATS/1.0\r\nNats-Msg-Id:test-msg-123\r\n\r\n    <-- 38 bytes (headers)
\r\n                                         <-- 2 extra bytes (BUG!)
Hello NATS!                                  <-- 11 bytes (payload)
\r\n
```

Server expects 39 header bytes but receives only 38, then finds extra ␍␊, causing protocol desynchronization.

## Correct Implementation

### Fix for src/Conn.zig:232-246

```zig
const HDR_LEN = headers.buffer.body().?.len;  // Headers already include trailing \r\n\r\n
const TOT_LEN = HDR_LEN + body.len;

try cn.printNMT("HPUB {0s} {1s} {2d} {3d}\r\n", .{ subject, repl, HDR_LEN, TOT_LEN });

var buffers: [3]posix.iovec_const = .{
    .{ .base = headers.buffer.body().?.ptr, .len = headers.buffer.body().?.len },
    .{ .base = body.ptr, .len = body.len },
    .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },
};
```

**Changes:**
1. Removed `+ 1` from HDR_LEN calculation
2. Changed buffers array from [4] to [3] elements
3. Removed the extra CRLF buffer between headers and payload

**What Will Be Sent (Correct):**
```
HPUB subject reply 38 49\r\n          <-- HDR_LEN=38, TOT_LEN=49
NATS/1.0\r\nNats-Msg-Id:test-msg-123\r\n\r\n    <-- 38 bytes (headers with separator)
Hello NATS!                                  <-- 11 bytes (payload)
\r\n                                         <-- Final message terminator
```

## Test Validation

From the bug report test (lines 60-79):
```zig
test "header serialization format" {
    var headers: Headers = .{};
    try headers.init(std.testing.allocator, 256);
    defer headers.deinit();

    try headers.append("Nats-Msg-Id", "test-msg-123");

    const header_bytes = headers.buffer.body().?;
    const expected = "NATS/1.0\r\nNats-Msg-Id:test-msg-123\r\n\r\n";
    try testing.expectEqualStrings(expected, header_bytes);

    const HDR_LEN = header_bytes.len;
    try testing.expectEqual(@as(usize, 38), HDR_LEN);
}
```

This test confirms:
- Headers buffer contains the full serialized headers including trailing ␍␊␍␊
- Length is 38 bytes for this example
- No additional separator should be added

## Manual Verification Commands

```sh
# Publish with headers using nats CLI
nats pub ords.received "with Nats-Msg-Id header" --header "Nats-Msg-Id:test-msg-123"

# Try duplicate (should be detected by deduplication)
nats pub ords.received "dup" --header "Nats-Msg-Id:test-msg-123"

# View the stream
nats stream view ORDS --subject "ords.received"
```

## References

- NATS Protocol: https://docs.nats.io/reference/reference-protocols/nats-protocol
- NATS Headers ADR: https://github.com/nats-io/nats-architecture-and-design/blob/main/adr/ADR-4.md
- GitHub Issue: https://github.com/g41797/nats/issues/6

## Summary

The bug was caused by incorrect understanding of the NATS HPUB protocol:
- The implementation assumed headers needed an extra byte count and separator
- In reality, the Headers.append() function already includes the trailing ␍␊␍␊
- The fix removes the erroneous +1 and extra CRLF buffer, aligning with protocol spec

This matches the suggestion from the bug reporter who identified the same issue.

## Update History

**2025-12-23: Byte Count Correction**
- Corrected header byte count from 42 to 38 bytes
- The example header string `"NATS/1.0\r\nNats-Msg-Id:test-msg-123\r\n\r\n"` is actually 38 bytes:
  - "NATS/1.0" = 8 bytes
  - "\r\n" = 2 bytes
  - "Nats-Msg-Id:test-msg-123" = 24 bytes
  - "\r\n\r\n" = 4 bytes
  - Total = 8 + 2 + 24 + 4 = 38 bytes
- Updated all references throughout the document
- Updated test expectation in misc_tests.zig:95 to expect 38 bytes
- All tests now pass successfully
