// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Subscriber = @This();

const std = @import("std");
const mailbox = @import("mailbox");
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
const nats = @import("client.zig");
const messages = @import("messages.zig");

const ReturnedError = err.ReturnedError;
pub const Appendable = @import("Appendable");
pub const MT = protocol.MessageType;
pub const Header = protocol.Header;
pub const Headers = protocol.Headers;
pub const HeaderIterator = protocol.HeaderIterator;
const Client = nats.Client;
pub const ConnectOpts = nats.ConnectOpts;
pub const alloc = messages.alloc;
pub const Messages = messages.Messages;
pub const AllocatedMSG = messages.AllocatedMSG;

mutex: Mutex = .{},
client: Client = .{},
attention: Sema = .{},
thread: Thread = undefined,
disconnected: bool = false,
mt: MT = MT.UNKNOWN,

pool: Messages = .{},
received: Messages = .{},

pub fn connect(sb: *Subscriber, allocator: Allocator, co: ConnectOpts) !void {
    sb.mutex.lock();
    defer sb.mutex.unlock();

    try sb.client.connect(allocator, co);
    sb.thread = std.Thread.spawn(.{}, run, .{sb}) catch unreachable;
    sb.pool.init(allocator);
    sb.received.init(allocator);
}

pub fn disconnect(sb: *Subscriber) void {
    sb.mutex.lock();
    defer sb.mutex.unlock();

    if (sb.disconnected) {
        return;
    }

    sb.raiseAttention();
    sb.waitFinish();

    sb.pool.deinit();
    sb.received.deinit();

    sb.client.disconnect();
    sb.disconnected = true;

    return;
}

// SUB <subject> [queue group] <sid>␍␊
pub fn subscribe(sb: *Subscriber, subject: []const u8, queue_group: ?[]const u8, sid: []const u8) !void {
    sb.mutex.lock();
    defer sb.mutex.unlock();

    var qgr: []const u8 = undefined;

    if (queue_group == null) {
        qgr = "";
    } else {
        qgr = queue_group.?;
    }

    try sb.client.print("SUB {0s} {1s} {2d}\r\n", .{ subject, qgr, sid });

    return;
}
// UNSUB <sid>
pub fn unsubscribe(sb: *Subscriber, sid: []const u8) !void {
    sb.mutex.lock();
    defer sb.mutex.unlock();

    try sb.client.print("UNSUB {0s}\r\n", .{sid});

    return;
}

pub fn fetch(sb: *Subscriber, timeout_ns: u64) !?*AllocatedMSG {
    if (sb.received.receive(timeout_ns)) |recvd| {
        return recvd;
    } else |rerr| {
        return rerr;
    }
}

pub fn reuse(sb: *Subscriber, msg: *AllocatedMSG) !?*AllocatedMSG {
    sb.pool.put(msg);
}

fn run(sb: *Subscriber) void {
    while (!sb.wasRaised()) {
        if (sb.client.read_msg(&sb.pool)) |almsg| {
            if (almsg == null) {
                continue;
            }
            if (sb.received.send(almsg.?)) |_| {
                continue;
            } else |_| {
                break;
            }
        } else |_| {
            break;
        }
    }

    sb.raiseAttention();

    return;
}

fn raiseAttention(sb: *Subscriber) void {
    _ = sb.attention.post();
}

inline fn wasRaised(sb: *Subscriber) bool {
    if (sb.attention.timedWait(0)) |_| {
        return true;
    } else |_| {
        return false;
    }
}

fn waitFinish(sb: *Subscriber) void {
    sb.thread.join();
}
