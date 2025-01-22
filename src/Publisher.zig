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

    var repl: []const u8 = undefined;

    if (reply2 == null) {
        repl = "";
    } else {
        repl = reply2.?;
    }

    var body: []const u8 = undefined;

    if (payload == null) {
        body = "";
    } else {
        body = payload.?;
    }

    if ((headers == null) or (headers.?.buffer.body() == null) or (headers.?.buffer.body().?.len == 0)) {
        return pb._PUB(subject, repl, body);
    }
    return pb._HPUB(subject, repl, headers.?, body);
}

// =======================================
//                  PUB [Client]
// =======================================
// PUB <subject> [reply-to] <#bytes>␍␊[payload]␍␊
//
// #bytes> - length of payload without ␍␊
//
// PUB FOO 11␍␊Hello NATS!␍␊
//
// PUB FRONT.DOOR JOKE.22 11␍␊Knock Knock␍␊
//
// PUB NOTIFY 0␍␊␍␊     #bytes == 0 => empty payload
// =======================================
fn _PUB(pb: *Publisher, subject: []const u8, reply2: []const u8, payload: []const u8) !void {
    try pb.client.print("PUB {0s} {1s} {2d}\r\n", .{ subject, reply2, payload.len });
    try pb.client.write(payload);
    try pb.client.write("\r\n");
    return;
}

// =======================================
//                  HPUB [Client]
// =======================================
// HPUB SUBJECT REPLY 23 30␍␊NATS/1.0␍␊Header: X␍␊␍␊PAYLOAD␍␊
// HPUB SUBJECT REPLY 23 23␍␊NATS/1.0␍␊Header: X␍␊␍␊␍␊
// HPUB SUBJECT REPLY 48 55␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊PAYLOAD␍␊
// HPUB SUBJECT REPLY 48 48␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊␍␊
//
// HPUB <SUBJ> [REPLY] <HDR_LEN> <TOT_LEN>
// <HEADER><PAYLOAD>
//
// HDR_LEN includes the entire serialized header,
// from the start of the version string (NATS/1.0)
// up to and including the ␍␊ before the payload
//
// TOT_LEN the payload length plus the HDR_LEN
// =======================================
fn _HPUB(pb: *Publisher, subject: []const u8, reply2: []const u8, headers: *Headers, payload: []const u8) !void {
    const HDR_LEN = headers.buffer.body().?.len + 1; // +1 for ␍␊
    const TOT_LEN = HDR_LEN + payload.len;

    try pb.client.print("HPUB {0s} {1s} {2d} {3d}\r\n", .{ subject, reply2, HDR_LEN, TOT_LEN });
    try pb.client.write(headers.buffer.body().?);
    try pb.client.write("\r\n");
    try pb.client.write(payload);
    try pb.client.write("\r\n");

    return;
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

    try pb.client.ping();
}

fn pong(pb: *Publisher) !void {
    pb.mutex.lock();
    defer pb.mutex.unlock();

    try pb.client.pong();
}
