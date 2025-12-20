# Zig 0.14.1 to 0.15.2 Migration Summary

## Overview

This document summarizes the changes made to migrate the project from Zig 0.14.1 to Zig 0.15.2.

## Build System Changes

### build.zig

| Change | Description |
|--------|-------------|
| Pointer dereference | All `b.method()` calls changed to `b.*.method()` |
| Library creation | `addStaticLibrary()` replaced with `addLibrary(.{ .linkage = .static, .root_module = ... })` |
| Module creation | Now uses `b.*.createModule()` to create modules separately |
| Test configuration | `addTest()` now uses `root_module` parameter instead of inline options |

### build.zig.zon

| Change | Old Value | New Value |
|--------|-----------|-----------|
| `minimum_zig_version` | `"0.14.0"` | `"0.15.0"` |
| `mailbox` dependency | v0.0.10 | v0.0.13 |

### vendor/zul/build.zig

| Change | Description |
|--------|-------------|
| Pointer dereference | All `b.method()` calls changed to `b.*.method()` |

## Source File Changes

### src/Client.zig

**Line 215:**
```zig
// Before
const amt = cl.stream.readAll(buffer[index..]) catch |err| { ... }

// After
const amt = cl.stream.read(buffer[index..]) catch |err| { ... }
```
- `readAll` method was removed from `net.Stream` in 0.15.2
- Direct `read()` method is now used instead

### src/Formatter.zig

Complete rewrite to use new I/O API:

| Change | Old API | New API |
|--------|---------|---------|
| Buffer type | `std.io.FixedBufferStream` | `std.Io.Writer.fixed()` |
| JSON options | `json.StringifyOptions` | `json.Stringify.Options` |
| JSON stringify | `json.stringify(value, options, writer)` | `json.Stringify.value(value, options, &writer)` |
| Bytes written | `fbs.getWritten().len` | `writer.end` |
| Error handling | N/A | `WriteFailed` maps to `NoSpaceLeft` |

### src/messages.zig

**Line 294:**
```zig
// Before
pub fn receive(msgs: *Messages, timeout_ns: u64) error{ Timeout, Closed }!*AllocatedMSG

// After
pub fn receive(msgs: *Messages, timeout_ns: u64) error{ Timeout, Closed, Interrupted }!*AllocatedMSG
```
- Added `Interrupted` to error set to match updated mailbox dependency

### src/Conn.zig

**Line 85 (formerly 92):**
```zig
// Before - timer initialized AFTER read_mt()
const mt = try cn.read_mt();
// ...
cn.timeout_timer = std.time.Timer.start() catch unreachable;

// After - timer initialized BEFORE read_mt()
cn.timeout_timer = std.time.Timer.start() catch unreachable;
const mt = try cn.read_mt();
```
- Fixed integer overflow panic in `std.time.Timer`
- `read_mt()` calls `read_line()` which calls `sendHeartBit()` that reads the timer
- Timer must be initialized before any code path that reads from it
- In Zig 0.15.2, reading from an uninitialized `std.time.Timer` causes integer overflow in `since()`

### src/net_tests.zig

**Line 41:**
```zig
// Before
_ = try stream.writer().writeAll("Hello world!");

// After
try stream.writeAll("Hello world!");
```

**Line 51:**
```zig
// Before
const n = try client.stream.reader().read(&buf);

// After
const n = try client.stream.read(&buf);
```
- `reader()` and `writer()` now require buffer arguments in 0.15.2
- Direct `read()` and `writeAll()` methods are preferred

## CI/CD Changes

### .github/workflows/*.yml

Updated Zig version in all workflow files:

| File | Old Version | New Version |
|------|-------------|-------------|
| `linux.yml` | `0.14.1` | `0.15.2` |
| `windows.yml` | `0.14.1` | `0.15.2` |
| `mac.yml` | `0.14.1` | `0.15.2` |

## Key Breaking Changes in Zig 0.15.2

1. **Build API Restructure**: `*std.Build` methods require explicit pointer dereference (`b.*`)

2. **Library API**: `addStaticLibrary` and `addSharedLibrary` consolidated into `addLibrary` with `linkage` option

3. **I/O API Overhaul** ("Writergate"):
   - `std.io` renamed to `std.Io`
   - Reader/Writer interfaces redesigned with concrete types
   - Buffered I/O is now the default
   - `reader()` and `writer()` require explicit buffer arguments

4. **JSON API**:
   - `StringifyOptions` moved to `Stringify.Options`
   - `stringify()` function moved to `Stringify.value()`

5. **Stream API**:
   - `readAll` removed from `net.Stream`
   - Direct `read()`, `write()`, `writeAll()` methods preferred

## New Features

### Standalone Modules

Added separate module exports in `build.zig` for projects that only need specific utilities without the full NATS client.

**build.zig additions:**
```zig
// Standalone Appendable module for projects that only need buffer utilities
_ = b.*.addModule("Appendable", .{
    .root_source_file = b.*.path("src/Appendable.zig"),
    .target = target,
    .optimize = optimize,
});

// Standalone Formatter module for projects that only need formatting utilities
_ = b.*.addModule("Formatter", .{
    .root_source_file = b.*.path("src/Formatter.zig"),
    .target = target,
    .optimize = optimize,
});
```

**Usage in dependent project:**
```zig
// build.zig
const nats_dep = b.dependency("nats", .{ .target = target, .optimize = optimize });
exe.root_module.addImport("Appendable", nats_dep.module("Appendable"));
exe.root_module.addImport("Formatter", nats_dep.module("Formatter"));

// source code
const Appendable = @import("Appendable");
const Formatter = @import("Formatter");
```

Note: Zig only compiles what's actually imported - using just these modules won't compile the rest of nats.

## Verification

All source files pass `zig ast-check` and the project builds successfully with `zig build`.
