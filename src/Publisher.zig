// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Publisher = @This();

const std = @import("std");
const net = std.net;
const http = std.http;
const Thread = std.Thread;
const Mutex = std.Thread.Mutex;
const Sema = std.Thread.Semaphore;
const Connection = http.Client.Connection;
const Allocator = std.mem.Allocator;

const err = @import("err.zig");
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const nats = @import("nats.zig");
const messages = @import("messages.zig");

const ReturnedError = err.ReturnedError;
pub const Appendable = @import("Appendable");
pub const MT = protocol.MessageType;
pub const Header = protocol.Header;
pub const Headers = protocol.Headers;
pub const HeaderIterator = protocol.HeaderIterator;
const Client = nats.Conn;
pub const ConnectOpts = nats.ConnectOpts;

mutex: Mutex = .{},
client: Client = .{},
attention: Sema = .{},
thread: Thread = undefined,
disconnected: bool = false,
mt: MT = MT.UNKNOWN,

/// Connects to NATS.
/// Arguments:
///     allocator:
///     connection options:
///         addr: IPv4 address or host name, for null - DefaultAddr is used
///         port: TCP/IP port,  for null - DafaultPort is used
///
/// Returns errors for:
///     - failed connection
///     - already existing connection
pub fn connect(pb: *Publisher, allocator: Allocator, co: ConnectOpts) !void {
    pb.mutex.lock();
    defer pb.mutex.unlock();

    try pb.client.connect(allocator, co);
    pb.thread = std.Thread.spawn(.{}, run, .{pb}) catch unreachable;
}

pub fn publish(pb: *Publisher, subject: []const u8, reply2: ?[]const u8, headers: ?*Headers, payload: ?[]const u8) !void {
    pb.mutex.lock();
    defer pb.mutex.unlock();

    return pb.client.publish(subject, reply2, headers, payload);
}

pub fn disconnect(pb: *Publisher) void {
    pb.mutex.lock();
    defer pb.mutex.unlock();

    if (pb.disconnected) {
        return;
    }

    pb.raiseAttention();
    pb.waitFinish();

    pb.client.disconnect();
    pb.disconnected = true;
    return;
}

fn raiseAttention(pb: *Publisher) void {
    _ = pb.attention.post();
}

inline fn wasRaised(pb: *Publisher) bool {
    if (pb.attention.timedWait(0)) |_| {
        return true;
    } else |_| {
        return false;
    }
}

fn run(pb: *Publisher) void {
    while (!pb.wasRaised()) {
        pb.mt = MT.UNKNOWN;
        pb.recv_next() catch {
            pb.raiseAttention();
            break;
        };
    }

    return;
}

fn recv_next(pb: *Publisher) !void {
    if (pb.client.read_mt()) |mt| {
        pb.mt = mt;
        switch (mt) {
            .PING => {
                try pb.pong();
            },
            .PONG => {
                return;
            },
            .OK => {
                return;
            },
            else => {
                return error.WrongFlow;
            },
        }
    } else |rerr| {
        return rerr;
    }
}

fn waitFinish(pb: *Publisher) void {
    pb.thread.join();
}

fn ping(pb: *Publisher) !void {
    pb.mutex.lock();
    defer pb.mutex.unlock();

    try pb.client.PING();
}

fn pong(pb: *Publisher) !void {
    pb.mutex.lock();
    defer pb.mutex.unlock();

    try pb.client.PONG();
}
