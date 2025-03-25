// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Subscriber = @This();

const std = @import("std");
const Conn = @import("Conn.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const parse = @import("parse.zig");
const JetStream = @import("JetStream.zig");
const Appendable = @import("Appendable.zig");

const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const Headers = messages.Headers;
pub const AllocatedMSG = messages.AllocatedMSG;
const Formatter = @import("Formatter.zig");
const SubscriberConfig = protocol.ConsumerConfig;

// $JS.API.CONSUMER.CREATE.<stream>
// $JS.API.CONSUMER.DURABLE.CREATE.<stream>.<consumer>
// $JS.API.CONSUMER.DELETE.<stream>.<consumer>

const CREATE_SUBJECT_SUBSCRIBER: []const u8 = "$JS.API.CONSUMER.CREATE.{s}.{s}.{s}";
const CREATE_ALL_SUBSCRIBER: []const u8 = "$JS.API.CONSUMER.CREATE.{s}.{s}";
const DELETE_SUBSCRIBER: []const u8 = "$JS.API.CONSUMER.DELETE.{s}.{s}";

mutex: Mutex = .{},
allocator: Allocator = undefined,
co: protocol.ConnectOpts = undefined,
connection: ?*Conn = null,
stream: Appendable = .{},
cmd: Formatter = .{},
jsn: Formatter = .{},
deliver_subject: [36]u8 = undefined,
subscr_sid: u64 = 0,
name: [36]u8 = undefined,
subscribed: bool = false,

pub fn SUBSCRIBE(allocator: Allocator, co: protocol.ConnectOpts, stream: []const u8, subject: []const u8) !Subscriber {
    var sb: Subscriber = .{ .allocator = allocator };

    sb.connection = try JetStream.createConn(allocator, co);
    errdefer sb.deinit();

    _ = try sb.stream.init(sb.allocator, stream.len, null);
    try sb.stream.copy(stream);

    sb.cmd = try Formatter.init(sb.allocator, 128);
    sb.jsn = try Formatter.init(sb.allocator, 256);

    try sb.subscribe(subject);

    return sb;
}

pub fn NEXT(sb: *Subscriber, timeout_ns: u64) error{ Interrupted, Closed, NotConnected, Timeout, CommunicationFailure }!*AllocatedMSG {
    sb.mutex.lock();
    defer sb.mutex.unlock();

    if (sb.connection == null) {
        return error.NotConnected;
    }

    return sb.connection.?.waitMessage(timeout_ns, null);
}

pub fn REUSE(sb: *Subscriber, msg: *AllocatedMSG) void {
    sb.mutex.lock();
    defer sb.mutex.unlock();

    if (sb.connection == null) {
        messages.free(msg);
    }
    sb.connection.?.reuse(msg);
}

pub fn UNSUBSCRIBE(sb: *Subscriber) void {
    sb.mutex.lock();
    defer sb.mutex.unlock();

    if (sb.connection == null) {
        return;
    }

    sb.unsubscribe() catch {};
    sb.deinit();

    return;
}

fn subscribe(sb: *Subscriber, subject: []const u8) !void {
    if (subject.len == 0) {
        return error.EmptySubject;
    }

    sb.deliver_subject = try Conn.newInbox();
    sb.subscr_sid = sb.connection.?.nextSid();
    sb.name = try Conn.newInbox();

    try sb.connection.?.print("SUB {0s} {1d} \r\n", .{ sb.deliver_subject[0..36], sb.subscr_sid });

    const subscrAll = ((subject[0] == '>') and (subject.len == 1));

    const PUSHCONF: protocol.ConsumerConfig = .{
        .deliver_subject = sb.deliver_subject[0..36],
        .filter_subject = subject,
        .ack_policy = protocol.ACKPOLICY_NONE,
        .max_deliver = 1,
        .ack_wait = protocol.SECNS * 3600 * 22,
        .num_replicas = 1,
        .mem_storage = true,
        .inactive_threshold = 300000000000,
    };

    if (subscrAll) {
        _ = try sb.cmd.sprintf(CREATE_ALL_SUBSCRIBER, .{ sb.stream.body().?, sb.name[0..36] });
    } else {
        _ = try sb.cmd.sprintf(CREATE_SUBJECT_SUBSCRIBER, .{ sb.stream.body().?, sb.name[0..36], subject });
    }

    const ccr: protocol.CreateConsumerRequest = .{ .stream_name = sb.stream.body().?, .config = PUSHCONF };

    _ = try sb.jsn.stringify(ccr, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    const crresp = try sb.process(protocol.SECNS * 10);

    if (crresp == null) {
        return error.UnexpectedSubscribeErrorEmptyResponse;
    }

    defer sb.connection.?.reuse(crresp.?);

    sb.subscribed = true;
    return;
}

fn unsubscribe(sb: *Subscriber) !void {
    if (sb.connection == null) {
        return;
    }

    if (!sb.subscribed) {
        return;
    }

    _ = try sb.cmd.sprintf(DELETE_SUBSCRIBER, .{
        sb.stream.body().?,
        sb.name[0..36],
    });
    sb.jsn.reset();

    const delresp = try sb.process(protocol.SECNS * 10);
    if (delresp != null) {
        sb.connection.?.reuse(delresp.?);
    }

    sb.connection.?.print("UNSUB {0d}\r\n", .{sb.subscr_sid}) catch {};

    return;
}

fn deinit(sb: *Subscriber) void {
    if (sb.connection == null) {
        return;
    }

    sb.connection.?.interrupt() catch {};
    sb.connection.?.disconnect();
    sb.allocator.destroy(sb.connection.?);
    sb.connection = null;

    sb.stream.deinit();
    sb.cmd.deinit();
    sb.jsn.deinit();
}

fn process(sb: *Subscriber, timeout_ns: u64) !?*AllocatedMSG {
    const response = try sb.connection.?.request(sb.cmd.formatbuf.body().?, null, sb.jsn.formatbuf.body(), timeout_ns);
    errdefer sb.connection.?.reuse(response);
    if (response.letter.getPayload()) |payload| {
        if (parse.isFailed(payload)) {
            return error.JetStreamsRequestFailed;
        } else {
            return response;
        }
    } else {
        sb.connection.?.reuse(response);
        return null;
    }
}
