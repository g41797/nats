// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

/// NATS Core client for basic publish/subscribe messaging.
/// Provides the fundamental NATS protocol operations.
pub const Core = @This();

mutex: Mutex = .{},
allocator: Allocator = undefined,
connection: ?*Conn = null,

/// Connects to a NATS server.
/// Returns an error if already connected.
pub fn CONNECT(core: *Core, allocator: Allocator, co: protocol.ConnectOpts) !void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection != null) {
        return error.AlreadyConnected;
    }

    core.allocator = allocator;

    try core.createConn(allocator, co);

    core.allocator = allocator;
    return;
}

/// Disconnects from the NATS server and releases all resources.
pub fn DISCONNECT(core: *Core) void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return;
    }

    core.connection.?.interrupt() catch {};
    core.connection.?.disconnect();
    core.allocator.destroy(core.connection.?);
    core.connection = null;

    return;
}

/// PUB [Publisher=>Server]
/// PUB <subject> [reply-to] <#bytes>␍␊[payload]␍␊
///
/// #bytes> - length of payload without ␍␊
///
/// PUB FOO 11␍␊Hello NATS!␍␊
///
/// PUB FRONT.DOOR JOKE.22 11␍␊Knock Knock␍␊
///
/// PUB NOTIFY 0␍␊␍␊     #bytes == 0 => empty payload
pub fn PUB(core: *Core, subject: []const u8, reply2: ?[]const u8, payload: ?[]const u8) !void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    return core.connection.?.@"pub"(subject, reply2, payload);
}

/// HPUB [Publisher=>Server]
/// HPUB <subject> [reply-to] <#header bytes> <#total bytes>␍␊[headers]␍␊␍␊[payload]␍␊
///
/// HPUB FOO 22 33␍␊NATS/1.0␍␊Bar: Baz␍␊␍␊Hello NATS!␍␊
///
/// HPUB FRONT.DOOR JOKE.22 45 56␍␊NATS/1.0␍␊BREAKFAST: donut␍␊LUNCH: burger␍␊␍␊Knock Knock␍␊
///
/// HPUB MORNING.MENU 47 51␍␊NATS/1.0␍␊BREAKFAST: donut␍␊BREAKFAST: eggs␍␊␍␊Yum!␍␊
///
/// HPUB <SUBJ> [REPLY] <HDR_LEN> <TOT_LEN> <HEADER><PAYLOAD>
///
/// HDR_LEN includes the entire serialized header,
/// from the start of the version string (NATS/1.0)
/// up to and including the ␍␊ before the payload
///
/// TOT_LEN the payload length plus the HDR_LEN
pub fn HPUB(core: *Core, subject: []const u8, reply2: ?[]const u8, headers: *Headers, payload: ?[]const u8) !void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    return core.connection.?.hpub(subject, reply2, headers, payload);
}

/// SUB [Subscriber=>Server]
///
/// SUB <subject> [queue group] <sid>␍␊
pub fn SUB(core: *Core, subject: []const u8, queue_group: ?[]const u8, sid: []const u8) !void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    return core.connection.?.sub(subject, queue_group, sid);
}

/// UNSUB [Subscriber=>Server]
///
/// UNSUB <sid>  [max_msgs]␍␊
pub fn UNSUB(core: *Core, sid: []const u8, max_msgs: ?u32) !void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    return core.connection.?.unsub(sid, max_msgs);
}

/// PING␍␊ [Client<=>Server]
pub fn PING(core: *Core) !void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    try core.connection.?.ping();
}

/// PONG␍␊ [Client<=>Server]
pub fn PONG(core: *Core) !void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    try core.connection.?.pong();
}

/// Tries to get messages from receiver queue.
/// Errors:
/// Interrupted - need attention, usually stop processing
/// Closed - disconnect was started
/// NotConnected - obvious
/// Timeout - nothing to fetch
pub fn FETCH(core: *Core, timeout_ns: u64) error{ Interrupted, Closed, NotConnected, Timeout }!*AllocatedMSG {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    return core.connection.?.fetch(timeout_ns);
}

/// REQUEST/REPLY flow
/// Usually used by JetStream Clients
pub fn REQUEST(core: *Core, subject: []const u8, payload: ?[]const u8, timeout_ns: u64) !*AllocatedMSG {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        return error.NotConnected;
    }

    return core.connection.?.requestNMT(subject, null, payload, timeout_ns);
}

/// Returns message to the pool
/// After disconnect - frees memory
pub fn REUSE(core: *Core, msg: *AllocatedMSG) void {
    core.mutex.lock();
    defer core.mutex.unlock();

    if (core.connection == null) {
        messages.free(msg);
        return;
    }
    core.connection.?.reuse(msg);
}

fn createConn(core: *Core, allocator: Allocator, co: protocol.ConnectOpts) !void {
    const conn = try allocator.create(Conn);
    conn.* = .{};
    errdefer allocator.destroy(conn);

    try conn.*.connect(allocator, co);
    core.connection = conn;

    return;
}

const std = @import("std");
const Conn = @import("Conn.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const Headers = messages.Headers;
/// Re-export of the allocated message type.
pub const AllocatedMSG = messages.AllocatedMSG;
