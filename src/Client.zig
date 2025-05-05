// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Client = @This();

stream: Stream = undefined,
connected: bool = false,
attention: Sema = .{},

pub fn connect(allocator: Allocator, co: protocol.ConnectOpts) !Client {
    var host: []const u8 = protocol.DefaultAddr;

    if (co.addr != null) {
        host = co.addr.?;
    }

    var prt: u16 = protocol.DefaultPort;

    if (co.port != null) {
        prt = co.port.?;
    }
    var client: Client = .{};

    client.stream = try net.tcpConnectToHost(allocator, host, prt);
    client.connected = true;
    return client;
}

pub fn close(cl: *Client) void {
    if (!cl.connected) {
        return;
    }

    cl.stream.close();
    cl.connected = false;
    return;
}

pub fn raiseAttention(cl: *Client) void {
    _ = cl.attention.post();
}

pub fn wasRaised(cl: *Client) bool {
    if (cl.attention.timedWait(0)) |_| {
        return true;
    } else |_| {
        return false;
    }
}

//
// Non MT write wrappers
//
pub fn writeAll(cl: *Client, bytes: []const u8) !void {
    if (!cl.connected) {
        return error.NotConnected;
    }
    try cl.stream.writeAll(bytes);
}

pub fn writevAll(cl: *Client, iovecs: []posix.iovec_const) !void {
    if (!cl.connected) {
        return error.NotConnected;
    }
    try cl.stream.writevAll(iovecs);
}

//
// Non MT read wrappers
//
pub fn readByte(cl: *Client) !?u8 {
    if (!cl.connected) {
        return error.NotConnected;
    }
    var byte: [1]u8 = undefined;
    const rlen = try cl.stream.read(&byte);
    if (rlen == 0) {
        return null;
    }
    return byte[0];
}

pub fn readAll(cl: *Client, buffer: []u8) !usize {
    if (!cl.connected) {
        return error.NotConnected;
    }
    if (cl.wasRaised()) {// move to poll loop
        return error.WasCancelled;
    }
    return try cl.stream.readAll(buffer);
}

pub fn setTimeOut(cl: *Client) !void {
    const timeout = posix.timeval{ .sec = 1, .usec = 0 };
    try posix.setsockopt(cl.stream.handle, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout));
}

pub fn resetTimeOut(cl: *Client) !void {
    const timeout = posix.timeval{ .sec = 0, .usec = 0 };
    try posix.setsockopt(cl.stream.handle, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout));
}

const std = @import("std");
const builtin = @import("builtin");
const protocol = @import("protocol.zig");
const net = std.net;
const posix = std.posix;
const Stream = net.Stream;
const Socket = posix.socket_t;
const Allocator = std.mem.Allocator;
const Sema = std.Thread.Semaphore;
