// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const builtin = @import("builtin");
const protocol = @import("protocol.zig");
const net = std.net;
const posix = std.posix;
const io = std.io; // Note: This is usually the namespace, but we use std.Io types
const Stream = net.Stream;
const Allocator = std.mem.Allocator;
const Sema = std.Thread.Semaphore;
const linux = std.os.linux;
const windows = std.os.windows;
const wasi = std.os.wasi;
const system = posix.system;
const pollfd = posix.pollfd;
const POLL = posix.POLL;
const Tls = @import("Tls.zig");

const SEC_TIMEOUT_MS = 1_000;
const MIN_TIMEOUT_MS = SEC_TIMEOUT_MS * 60;
const INFINITE_TIMEOUT_MS = -1;
const POLL_TIMEOUT_MS = 1000;

/// Low-level TCP client for NATS protocol communication.
/// Handles socket operations with non-blocking I/O and optional TLS.
pub const Client = @This();

allocator: Allocator,
/// The underlying TCP stream.
raw_stream: Stream = undefined,
// If null, we are in plain TCP mode. If set, we are in TLS mode.
tls_box: ?*Tls.Box = null,
/// Indicates whether the client is connected.
connected: bool = false,
/// Semaphore for signaling attention/interrupts.
attention: Sema = .{},

/// Connects to a NATS server at the specified address and port.
pub fn connect(allocator: Allocator, opts: protocol.ConnectOpts) !Client {
    const port = opts.port orelse protocol.DefaultPort;
    const host = opts.addr orelse protocol.DefaultAddr;
    const stream = try net.tcpConnectToHost(allocator, host, port);

    // SET NON-BLOCKING for Polling to work
    try setNonBlocking(stream.handle);

    return Client{
        .allocator = allocator,
        .raw_stream = stream,
        .connected = true,
    };
}

pub fn upgradeTLS(self: *Client, host: []const u8, opts: protocol.ConnectOpts) !void {
    if (self.tls_box != null) return error.AlreadyTls;

    var bundle = std.crypto.Certificate.Bundle{};
    errdefer bundle.deinit(self.allocator);

    if (opts.tls_ca_file) |ca_path| {
        const cwd = std.fs.cwd();
        const abs_path = try cwd.realpathAlloc(self.allocator, ca_path);
        defer self.allocator.free(abs_path);
        try bundle.addCertsFromFilePathAbsolute(self.allocator, abs_path);
    } else {
        try bundle.rescan(self.allocator);
    }

    // TLS handshake requires blocking I/O
    try setBlocking(self.raw_stream.handle);
    errdefer setNonBlocking(self.raw_stream.handle) catch {};

    self.tls_box = try Tls.Box.init(
        self.allocator,
        self.raw_stream,
        host,
        bundle,
    );

    // Restore non-blocking mode after handshake
    try setNonBlocking(self.raw_stream.handle);
}

pub fn close(self: *Client) void {
    if (self.tls_box) |wrapper| {
        wrapper.deinit(self.allocator);
        self.tls_box = null;
    }
    self.raw_stream.close();
    self.connected = false;
}

// -------------------------------------------------------------------------
// READ OPERATIONS
// -------------------------------------------------------------------------

/// Reads a single byte. Handles Polling and TLS decryption transparently.
pub fn readByte(self: *Client) !u8 {
    var buf: [1]u8 = undefined;

    while (self.connected) {
        // 1. Attempt Read
        const n = try self.readAny(&buf);

        if (n > 0) return buf[0];

        // 2. If WouldBlock (or 0 bytes read indicating wait), we poll.
        if (self.wasRaised()) return error.WasCancelled;

        try self.pollSocket(POLL.IN, POLL_TIMEOUT_MS);
    }
    return error.NotConnected;
}

/// Helper that dispatches read to TLS (via readVec) or TCP.
fn readAny(self: *Client, buf: []u8) !usize {
    if (self.tls_box) |box| {
        // TLS MODE
        // 1. Create a slice of slices for readVec
        var iov = [1][]u8{buf};

        // 2. Call readVec (which returns generic errors)
        return box.client.reader.readVec(&iov) catch |err| switch (err) {
            error.EndOfStream => return error.EndOfStream,
            error.ReadFailed => {
                // 3. RETRIEVE THE REAL ERROR
                // std.Io masks WouldBlock as ReadFailed. We must check the internal state.
                if (box.client.read_err) |real_err| {
                    if (real_err == error.WouldBlock) {
                        return 0; // Signal to poll loop: "Wait and Retry"
                    }
                    return real_err; // Return the actual error (e.g. TlsAlert)
                }
                return error.ReadFailed; // Genuine generic failure
            },
        };
    } else {
        // TCP MODE
        return self.raw_stream.read(buf) catch |err| switch (err) {
            error.WouldBlock => 0,
            else => return err,
        };
    }
}

/// Reads until the buffer is full.
pub fn readAll(self: *Client, buffer: []u8) !usize {
    if (!self.connected) return error.NotConnected;

    var index: usize = 0;
    while (index < buffer.len) {
        if (self.wasRaised()) return error.WasCancelled;

        // Try to read into the remaining slice
        const n = try self.readAny(buffer[index..]);

        if (n > 0) {
            index += n;
            continue;
        }

        // If we got 0, it means WouldBlock. Poll and wait.
        try self.pollSocket(POLL.IN, POLL_TIMEOUT_MS);
    }
    return index;
}

// -------------------------------------------------------------------------
// WRITE OPERATIONS
// -------------------------------------------------------------------------

/// Writes a single buffer to the socket.
pub fn writeAll(self: *Client, data: []const u8) !void {
    // We wrap the single buffer in an iovec to reuse the writevAll logic
    var iov = [1]posix.iovec_const{
        .{ .base = data.ptr, .len = data.len },
    };
    return self.writevAll(&iov);
}

/// Writes multiple buffers to the socket using vectored I/O.
pub fn writevAll(self: *Client, iovecs: []posix.iovec_const) !void {
    if (!self.connected) return error.NotConnected;

    if (self.tls_box) |box| {
        // TLS MODE: Loop through vectors
        for (iovecs) |iov| {
            const slice = iov.base[0..iov.len];
            var pos: usize = 0;

            while (pos < slice.len) {
                // 1. Write to TLS Internal Buffer
                // This usually succeeds immediately unless the internal buffer is full.
                const n = box.client.writer.write(slice[pos..]) catch |err| switch (err) {
                    error.WriteFailed => 0, // Buffer likely full, force a flush/poll cycle
                    else => return err,
                };

                pos += n;

                // 2. Flush to Network
                // If this fails with WriteFailed, we assume it's WouldBlock
                var flush_success = true;
                flushTls(box) catch |err| switch (err) {
                    error.WriteFailed => {
                        flush_success = false;
                        // We hit WouldBlock (masked).
                        // We do NOT return error here. We fall through to poll.
                    },
                    else => return err,
                };

                // 3. Poll if we have more to write OR if flush "failed" (blocked)
                if (pos < slice.len or !flush_success) {
                    try self.pollSocket(POLL.OUT, INFINITE_TIMEOUT_MS);
                }
            }
        }
    } else {
        // TCP MODE: Original optimized writev
        for (iovecs) |iov| {
            var offset: usize = 0;
            while (offset < iov.len) {
                const remaining = iov.base[offset..][0..(iov.len - offset)];

                const n = self.raw_stream.write(remaining) catch |err| switch (err) {
                    error.WouldBlock => 0,
                    else => return err,
                };

                offset += n;

                if (offset < iov.len) {
                    try self.pollSocket(POLL.OUT, INFINITE_TIMEOUT_MS);
                }
            }
        }
    }
}

fn flushTls(box: *Tls.Box) !void {
    // 1. Flush TLS logic (encrypts plaintext -> write_buffer)
    try box.client.writer.flush();

    // 2. Flush Socket logic (sends write_buffer -> network)
    // This is where WouldBlock (masked as WriteFailed) happens.
    try box.stream_writer.interface.flush();
}

// -------------------------------------------------------------------------
// UTILS
// -------------------------------------------------------------------------

fn pollSocket(self: *Client, event: i16, timeout: i32) !void {
    const pfd = pollfd{
        .fd = self.raw_stream.handle,
        .events = event,
        .revents = 0,
    };
    var fds = [1]pollfd{pfd};
    const rc = system.poll(&fds, 1, timeout);

    if (rc < 0) return error.PollError;
    if (rc == 0) return error.WouldBlock; // Timeout

    if (pfd.revents & (POLL.HUP | POLL.ERR | POLL.NVAL) != 0) {
        return error.SocketError;
    }
}

pub fn raiseAttention(cl: *Client) void {
    cl.attention.post();
}

pub fn wasRaised(self: *Client) bool {
    // Try to acquire semaphore with 0 timeout.
    // If it fails (error.TimedOut), return false.
    self.attention.timedWait(0) catch return false;

    // If we are here, we successfully acquired it.
    return true;
}

fn setNonBlocking(fd: posix.fd_t) !void {
    if (builtin.os.tag == .windows) {
        // Windows implementation using ioctlsocket
        var mode: c_ulong = 1; // 1 = Non-Blocking
        const res = std.os.windows.ws2_32.ioctlsocket(fd, std.os.windows.ws2_32.FIONBIO, &mode);
        if (res != 0) {
            switch (std.os.windows.ws2_32.WSAGetLastError()) {
                .WSANOTINITIALISED => unreachable,
                .WSAENETDOWN => return error.NetworkSubsystemFailed,
                .WSAENOTSOCK => return error.FileDescriptorNotASocket,
                else => |err| return std.os.windows.unexpectedWSAError(err),
            }
        }
    } else {
        // POSIX implementation using fcntl and packed structs

        // 1. Get current flags
        const current_flags_int = try posix.fcntl(fd, posix.F.GETFL, 0);

        // 2. Create the bitmask for NONBLOCK safely
        const nonblock_struct = posix.O{ .NONBLOCK = true };
        const nonblock_mask = @as(u32, @bitCast(nonblock_struct));

        // 3. Combine with existing flags
        const new_flags = @as(u32, @intCast(current_flags_int)) | nonblock_mask;

        // 4. Set the new flags
        _ = try posix.fcntl(fd, posix.F.SETFL, new_flags);
    }
}

fn setBlocking(fd: posix.fd_t) !void {
    if (builtin.os.tag == .windows) {
        // Windows implementation using ioctlsocket
        var mode: c_ulong = 0; // 0 = Blocking
        const res = std.os.windows.ws2_32.ioctlsocket(fd, std.os.windows.ws2_32.FIONBIO, &mode);
        if (res != 0) {
            switch (std.os.windows.ws2_32.WSAGetLastError()) {
                .WSANOTINITIALISED => unreachable,
                .WSAENETDOWN => return error.NetworkSubsystemFailed,
                .WSAENOTSOCK => return error.FileDescriptorNotASocket,
                else => |err| return std.os.windows.unexpectedWSAError(err),
            }
        }
    } else {
        // POSIX implementation using fcntl
        // 1. Get current flags
        const current_flags_int = try posix.fcntl(fd, posix.F.GETFL, 0);

        // 2. Create the bitmask for NONBLOCK
        const nonblock_struct = posix.O{ .NONBLOCK = true };
        const nonblock_mask = @as(u32, @bitCast(nonblock_struct));

        // 3. Remove NONBLOCK from existing flags
        const new_flags = @as(u32, @intCast(current_flags_int)) & ~nonblock_mask;

        // 4. Set the new flags
        _ = try posix.fcntl(fd, posix.F.SETFL, new_flags);
    }
}

pub fn setSockNONBLOCK(sock: posix.socket_t) !void {
    if (builtin.os.tag == .windows) {
        var mode: c_ulong = 1;
        if (windows.ws2_32.ioctlsocket(sock, windows.ws2_32.FIONBIO, &mode) == windows.ws2_32.SOCKET_ERROR) {
            switch (windows.ws2_32.WSAGetLastError()) {
                .WSANOTINITIALISED => unreachable,
                .WSAENETDOWN => return error.NetworkSubsystemFailed,
                .WSAENOTSOCK => return error.FileDescriptorNotASocket,
                // !!! handle more errors !!!
                else => |err| return windows.unexpectedWSAError(err),
            }
        }
    } else {
        var fl_flags = posix.fcntl(sock, posix.F.GETFL, 0) catch |err| switch (err) {
            error.FileBusy => unreachable,
            error.Locked => unreachable,
            error.PermissionDenied => unreachable,
            error.DeadLock => unreachable,
            error.LockedRegionLimitExceeded => unreachable,
            else => |e| return e,
        };
        fl_flags |= 1 << @bitOffsetOf(system.O, "NONBLOCK");
        _ = posix.fcntl(sock, posix.F.SETFL, fl_flags) catch |err| switch (err) {
            error.FileBusy => unreachable,
            error.Locked => unreachable,
            error.PermissionDenied => unreachable,
            error.DeadLock => unreachable,
            error.LockedRegionLimitExceeded => unreachable,
            else => |e| return e,
        };
    }
}
