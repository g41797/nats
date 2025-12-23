# NATS Protocol Implementation Reference

## Overview
This document provides a comprehensive reference for analyzing and verifying NATS protocol command implementations in the Zig-based NATS client library.

---

## Project Structure

### Key Files and Their Responsibilities

| File | Purpose | Key Functions |
|------|---------|--------------|
| `src/Conn.zig` | Connection management and protocol command implementation | `connect()`, `disconnect()`, `pub()`, `hpub()`, `sub()`, `unsub()`, `ping()`, `pong()`, `request()` |
| `src/messages.zig` | Message types, headers, and message pooling | `MessageType`, `Headers`, `MSG`, `Messages` pool |
| `src/protocol.zig` | Protocol constants and configuration | `CRLF`, `DefaultAddr`, `DefaultPort`, `ConnectOpts`, `StreamConfig` |
| `src/Client.zig` | TCP client implementation | Low-level socket operations |
| `src/parse.zig` | Protocol message parsing utilities | `count_substrings()`, `cut_tail()`, `cut_tail_size()` |
| `src/Appendable.zig` | Dynamic buffer management | Buffer operations for building messages |
| `src/Formatter.zig` | String formatting utilities | `sprintf()` for building protocol commands |

### Architecture Pattern
- **Conn.zig** = High-level protocol operations (what users call)
- **Client.zig** = Low-level TCP/socket operations
- **messages.zig** = Data structures and message representation
- **parse.zig** = Incoming message parsing
- **Formatter/Appendable** = Outgoing message construction

---

## NATS Protocol Specification Quick Reference

### Protocol Fundamentals

**Field Delimiters:**
- Space (` `) or Tab (`\t`) separate fields
- Multiple whitespace treated as single delimiter

**Line Terminator:**
- Always `\r\n` (CRLF, `0x0D0A`)
- Marks end of command line AND end of payload

**Message Structure:**
```
<COMMAND> <args>\r\n
[optional payload data]
\r\n
```

### Protocol Commands

#### Client → Server Commands

##### PUB - Publish without headers
```
PUB <subject> [reply-to] <#bytes>\r\n
[payload]\r\n
```

**Example:**
```
PUB FOO 11\r\n
Hello NATS!\r\n
```

**Implementation:** `src/Conn.zig:179-209` (`pub()` function)

**Key Points:**
- `<#bytes>` = payload length ONLY (not including final `\r\n`)
- Empty payload allowed: `PUB NOTIFY 0\r\n\r\n`
- Buffer structure: `[payload][CRLF]`

---

##### HPUB - Publish with headers
```
HPUB <subject> [reply-to] <#header bytes> <#total bytes>\r\n
[headers]\r\n\r\n
[payload]\r\n
```

**Example:**
```
HPUB FOO 22 33\r\n
NATS/1.0\r\n
Bar: Baz\r\n
\r\n
Hello NATS!\r\n
```

**Implementation:** `src/Conn.zig:212-247` (`hpub()` function)

**Key Points:**
- `<#header bytes>` = Length INCLUDING the trailing `\r\n\r\n` separator
- `<#total bytes>` = header bytes + payload bytes
- Headers format: `NATS/1.0\r\n<name>:<value>\r\n...\r\n\r\n`
- **CRITICAL:** Headers buffer ALREADY includes trailing `\r\n\r\n` (see `messages.zig:100-125`)
- Buffer structure: `[headers_with_separator][payload][CRLF]`
- **Common Bug:** Don't add extra CRLF between headers and payload!

---

##### SUB - Subscribe to subject
```
SUB <subject> [queue group] <sid>\r\n
```

**Example:**
```
SUB FOO 1\r\n
SUB BAR G1 44\r\n
```

**Implementation:** `src/Conn.zig:250-262` (`sub()` function)

---

##### UNSUB - Unsubscribe
```
UNSUB <sid> [max_msgs]\r\n
```

**Example:**
```
UNSUB 1\r\n
UNSUB 1 5\r\n
```

**Implementation:** `src/Conn.zig:265-280` (`unsub()` function)

---

##### PING/PONG - Keepalive
```
PING\r\n
PONG\r\n
```

**Implementation:**
- `ping()`: `src/Conn.zig:292-294`
- `pong()`: `src/Conn.zig:297-299`

---

#### Server → Client Commands

##### MSG - Message without headers
```
MSG <subject> <sid> [reply-to] <#bytes>\r\n
[payload]\r\n
```

**Example:**
```
MSG FOO.BAR 9 11\r\n
Hello World\r\n

MSG FOO.BAR 9 GREETING.34 11\r\n
Hello World\r\n
```

**Implementation:** `src/Conn.zig:349-388` (`read_MSG()` function)

**Key Points:**
- 4 args (no reply-to) or 5 args (with reply-to)
- `<#bytes>` = payload length only
- Parser reads `<#bytes> + 2` to include trailing CRLF

---

##### HMSG - Message with headers
```
HMSG <subject> <sid> [reply-to] <#header bytes> <#total bytes>\r\n
[headers]\r\n\r\n
[payload]\r\n
```

**Example:**
```
HMSG FOO.BAR 9 BAZ.69 34 45\r\n
NATS/1.0\r\n
FoodGroup: vegetable\r\n
\r\n
Hello World\r\n
```

**Implementation:** `src/Conn.zig:409-462` (`read_HMSG()` function)

**Key Points:**
- 5 args (no reply-to) or 6 args (with reply-to)
- `<#header bytes>` includes trailing `\r\n\r\n` (4 bytes removed when storing)
- `<#total bytes>` = header bytes + payload bytes
- Special case: If HDR_LEN == TOT_LEN, payload is empty
- Parser reads headers, removes trailing `\r\n\r\n`, stores clean headers

---

##### INFO - Server information
```
INFO {"option_name":option_value,...}\r\n
```

**Implementation:** Parsed in `src/Conn.zig:87-91` during connect

---

##### +OK / -ERR - Acknowledgment / Error
```
+OK\r\n
-ERR <error message>\r\n
```

---

## Headers Implementation Deep Dive

### Headers Structure (`src/messages.zig:85-141`)

**Initialization:**
```zig
var headers: Headers = .{};
try headers.init(allocator, buffer_size);
defer headers.deinit();
```

**Adding Headers:**
```zig
try headers.append("Nats-Msg-Id", "test-msg-123");
try headers.append("Another-Header", "value");
```

**Internal Format After `append()`:**
```
NATS/1.0\r\n
Nats-Msg-Id:test-msg-123\r\n
Another-Header:value\r\n
\r\n
```

**CRITICAL:** The trailing `\r\n\r\n` separator is ALWAYS present in the buffer!

**Implementation Details:**
- First header: Prepends `NATS/1.0\r\n`
- Subsequent headers: Removes last `\r\n`, adds new header, re-adds `\r\n\r\n`
- Format: `<name>:<value>\r\n` (no space after colon)
- Buffer always ends with `\r\n\r\n`

**Getting Headers Buffer:**
```zig
const header_bytes = headers.buffer.body().?;
const length = header_bytes.len;  // Includes trailing \r\n\r\n
```

---

## Common Implementation Patterns

### 1. Buffer Construction with `iovec_const`

Most NATS commands use vectored I/O for efficiency:

```zig
var buffers: [N]posix.iovec_const = .{
    .{ .base = data1.ptr, .len = data1.len },
    .{ .base = data2.ptr, .len = data2.len },
    // ... more buffers
};

try cn.writevNMT(&buffers);
```

**Pattern for PUB:**
```zig
// Send: PUB subject reply length\r\n + payload + \r\n
var buffers: [2]posix.iovec_const = .{
    .{ .base = body.ptr, .len = body.len },
    .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },
};
```

**Pattern for HPUB:**
```zig
// Send: HPUB subject reply hdr_len tot_len\r\n + headers_with_separator + payload + \r\n
var buffers: [3]posix.iovec_const = .{
    .{ .base = headers.buffer.body().?.ptr, .len = headers.buffer.body().?.len },
    .{ .base = body.ptr, .len = body.len },
    .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },
};
```

### 2. Length Calculations

**For PUB:**
```zig
const payload_len = body.len;
try cn.printNMT("PUB {0s} {1s} {2d}\r\n", .{ subject, reply, payload_len });
```

**For HPUB:**
```zig
const HDR_LEN = headers.buffer.body().?.len;  // Already includes \r\n\r\n
const TOT_LEN = HDR_LEN + body.len;
try cn.printNMT("HPUB {0s} {1s} {2d} {3d}\r\n", .{ subject, reply, HDR_LEN, TOT_LEN });
```

**Common Mistake:** Adding extra bytes to account for CRLF that's already included!

### 3. Reading Messages

**Pattern:**
```zig
fn read_MSG(cn: *Conn) !?*AllocatedMSG {
    // 1. Parse command line (already in cn.line.body())
    const recvd = cn.line.body().?;

    // 2. Count arguments to detect optional fields
    const args = parse.count_substrings(recvd);

    // 3. Extract size from end of line
    const parsed = try parse.cut_tail_size(recvd);

    // 4. Allocate message from pool
    const alm = try cn.pool.get(0);
    errdefer cn.pool.put(alm);

    // 5. Read payload (size + 2 for \r\n)
    try cn.read_buffer(&alm.letter.payload, parsed.size + 2);

    // 6. Remove trailing \r\n
    try alm.letter.payload.shrink(2);

    // 7. Parse remaining fields (subject, sid, reply-to)
    // ... field extraction using parse.cut_tail()

    return alm;
}
```

### 4. Mutex Management

**Thread-safe variants (MT = MultiThreaded):**
- `printMT()`, `writeMT()`, `writevMT()` - Lock before operation
- Used for operations that might be called from different threads

**Not Thread-Safe (NMT = Non-MultiThreaded):**
- `printNMT()`, `writeNMT()`, `writevNMT()` - Assume already locked
- Used internally when mutex is already held

**Pattern:**
```zig
pub fn someOperation(cn: *Conn, ...) !void {
    cn.mutex.lock();
    defer cn.mutex.unlock();

    // Use NMT variants here since we hold the lock
    try cn.printNMT("COMMAND ...\r\n", .{...});
    try cn.writevNMT(&buffers);
}
```

---

## Verification Checklist

When analyzing or implementing a protocol command:

### 1. Protocol Specification
- [ ] Read the official NATS protocol spec for the command
- [ ] Note all required and optional fields
- [ ] Understand the exact byte format expected
- [ ] Check example messages from protocol.txt

### 2. Length Calculations
- [ ] Are lengths calculated correctly?
- [ ] Does length include or exclude CRLF terminators?
- [ ] For headers: Is trailing `\r\n\r\n` already in buffer?
- [ ] Are you double-counting any bytes?

### 3. Buffer Construction
- [ ] Are buffers in the correct order?
- [ ] Is CRLF terminator at the end?
- [ ] Are you adding extra separators that are already present?
- [ ] Count total bytes: command + data + CRLF

### 4. Syntax Verification
```bash
zig ast-check src/Conn.zig
```

### 5. Testing Approach
- [ ] Write unit test with known input/output
- [ ] Test with NATS CLI commands for comparison
- [ ] Test edge cases (empty payload, no reply-to, etc.)
- [ ] Verify against live NATS server

### 6. Common Gotchas
- [ ] Headers ALREADY include `\r\n\r\n` - don't add extra!
- [ ] Payload lengths don't include final `\r\n`
- [ ] But you must SEND the final `\r\n` after payload
- [ ] Optional fields (reply-to) require different parsing
- [ ] Empty strings vs null for optional fields

---

## Testing Commands

### Manual Testing with NATS CLI

```bash
# Start NATS server (if not running)
nats-server

# Publish without headers
nats pub subject.name "message payload"

# Publish with headers
nats pub subject.name "message" --header "Key:Value"

# Subscribe
nats sub subject.name

# Request-Reply
nats request subject.name "request data"

# View JetStream stream
nats stream view STREAM_NAME --subject "subject.filter"
```

### Comparing Implementations

To verify your implementation matches NATS behavior:

1. Capture actual NATS client traffic (tcpdump, wireshark)
2. Compare byte-for-byte with your implementation
3. Check server responses for protocol errors

---

## Protocol Constants

From `src/protocol.zig`:

```zig
pub const CRLF: []const u8 = "\r\n";
pub const DefaultAddr: []const u8 = "127.0.0.1";
pub const DefaultPort: u16 = 4222;
pub const SECNS: u64 = 1000000000;  // Nanoseconds in a second
```

---

## Message Flow

### Publishing Flow (Client → Server)
1. User calls `conn.publish()` or `conn.hpub()`
2. Function acquires mutex
3. Builds command line with `printNMT()`
4. Constructs iovec buffers
5. Sends via `writevNMT()`
6. Releases mutex

### Receiving Flow (Server → Client)
1. Background thread runs `read_msg()` in loop
2. Calls `read_line()` to get command line
3. Parses message type with `MT.from_line()`
4. Calls appropriate handler (`read_MSG()`, `read_HMSG()`, etc.)
5. Handler allocates message from pool
6. Reads payload/headers from socket
7. Parses fields, populates message
8. Sends message to `received` queue
9. User calls `fetch()` to retrieve message

---

## Quick Reference: File Locations

| What | Where |
|------|-------|
| PUB implementation | `src/Conn.zig:179-209` |
| HPUB implementation | `src/Conn.zig:212-247` |
| SUB implementation | `src/Conn.zig:250-262` |
| UNSUB implementation | `src/Conn.zig:265-280` |
| MSG parsing | `src/Conn.zig:349-388` |
| HMSG parsing | `src/Conn.zig:409-462` |
| Headers.append() | `src/messages.zig:100-125` |
| MessageType enum | `src/messages.zig:5-64` |
| Protocol constants | `src/protocol.zig` |
| Parsing utilities | `src/parse.zig` |

---

## Additional Resources

- **NATS Protocol:** https://docs.nats.io/reference/reference-protocols/nats-protocol
- **NATS Headers ADR:** https://github.com/nats-io/nats-architecture-and-design/blob/main/adr/ADR-4.md
- **JetStream API:** https://docs.nats.io/reference/reference-protocols/nats_api_reference
- **Protocol Documentation:** `protocol.txt` in project root
- **Notes and Links:** `_notes.txt` in project root

---

## Known Issues and Fixes

### Issue #6: Cannot Publish with Headers (FIXED)
- **Problem:** Timeout when using HPUB with headers
- **Cause:** Incorrect header length (+1) and extra CRLF separator
- **Fix:** Remove +1, remove extra CRLF buffer
- **Details:** See `.claude/takeaways/06_Cannot publish with headers.md`

---

*Last Updated: 2025-12-23*
*Based on NATS protocol and Zig implementation v0.15.2*
