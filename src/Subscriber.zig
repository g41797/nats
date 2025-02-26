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

const CREATE_NONAME_SUBSCRIBER: []const u8 = "$JS.API.CONSUMER.CREATE.{s}";
const CREATE_SUBSCRIBER: []const u8 = "$JS.API.CONSUMER.DURABLE.CREATE.{s}.{s}";
const DELETE_SUBSCRIBER: []const u8 = "$JS.API.CONSUMER.DELETE.{s}.{s}";

mutex: Mutex = .{},
allocator: Allocator = undefined,
co: protocol.ConnectOpts = undefined,
connection: ?*Conn = null,
stream: Appendable = .{},
name: Appendable = .{},
cmd: Formatter = .{},
jsn: Formatter = .{},
subscribed: bool = false,
durable: bool = false,
deliver_subject: [36]u8 = undefined,

pub fn SUBSCRIBE(allocator: Allocator, co: protocol.ConnectOpts, stream: []const u8, conf: SubscriberConfig) !Subscriber {
    var sb: Subscriber = .{ .allocator = allocator };

    sb.connection = try JetStream.createConn(allocator, co);
    errdefer sb.deinit();

    _ = try sb.stream.init(sb.allocator, stream.len, null);
    try sb.stream.copy(stream);

    _ = try sb.name.init(sb.allocator, 32, null);

    sb.cmd = try Formatter.init(sb.allocator, 128);
    sb.jsn = try Formatter.init(sb.allocator, 256);

    try sb.subscribe(conf);

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

fn subscribe(sb: *Subscriber, conf: SubscriberConfig) !void {

    // if (conf.name == null) {
    _ = try sb.cmd.sprintf(CREATE_NONAME_SUBSCRIBER, .{sb.stream.body().?});
    // } else {
    //     _ = try sb.cmd.sprintf(CREATE_SUBSCRIBER, .{
    //         sb.stream.body().?,
    //         conf.name.?,
    //     });
    //     sb.durable = true;
    // }

    sb.deliver_subject = try Conn.newInbox();

    var tempCfg = conf;
    tempCfg.deliver_subject = &sb.deliver_subject;

    const ccr: protocol.CreateConsumerRequest = .{ .stream_name = sb.stream.body().?, .config = tempCfg };

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

    const consName = parse.responseNameText(crresp.?.letter.getPayload().?);

    if (consName == null) {
        return error.UnexpectedSubscribeErrorEmptyName;
    }

    sb.name.copy(consName.?) catch unreachable;

    // try sb.connection.?.sub(conf.deliver_subject.?, null, "");

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
        sb.name.body().?,
    });
    sb.jsn.reset();

    const delresp = try sb.process(protocol.SECNS * 10);
    if (delresp != null) {
        sb.connection.?.reuse(delresp.?);
    }
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
    sb.name.deinit();
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
