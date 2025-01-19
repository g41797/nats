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
    try sb.client.connect(allocator, co);
    sb.thread = std.Thread.spawn(.{}, run, .{sb}) catch unreachable;
    sb.pool.init(allocator);
    sb.received.init(allocator);
}

pub fn disconnect(sb: *Subscriber) void {
    _ = sb;
}

// SUB <subject> [queue group] <sid>␍␊
pub fn subscribe(sb: *Subscriber, subject: []const u8, queue_group: ?[]const u8, sid: ?[]const u8) !void {
    _ = sb;
    _ = subject;
    _ = queue_group;
    _ = sid;
}

pub fn unsubscribe(sb: *Subscriber, sid: []const u8) !void {
    _ = sb;
    _ = sid;
}

pub fn fetch(sb: *Subscriber, timeout_ns: u64) !?*AllocatedMSG {
    _ = sb;
    _ = timeout_ns;
}

pub fn reuse(sb: *Subscriber, msg: *AllocatedMSG) !?*AllocatedMSG {
    _ = sb;
    _ = msg;
}

fn run(sb: *Subscriber) void {
    _ = sb;
}
