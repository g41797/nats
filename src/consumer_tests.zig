// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const DefaultConnectOpts: protocol.ConnectOpts = .{};
const STREAM: []const u8 = "ORDERS";
const DeleteConsumer: bool = true;
const DontDeleteConsumer = !DeleteConsumer;

test "create/consume/delete consumer" {
    try deleteStream();

    try createStream();

    { // ephemeral consumer
        var conf: ConsumerConfig = .{};
        conf.filter_subject = "ORDERS.*";
        var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);

        try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 1));

        defer consumer.STOP(null);
    }

    { // durable consumer
        var conf: ConsumerConfig = .{
            .durable_name = "DurableConsumer",
        };
        conf.filter_subject = "ORDERS.*";
        var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);

        try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 1));

        defer consumer.STOP(DeleteConsumer);
    }

    return;
}

test "publish/consume ephemeral consumer" {
    try createStream();

    try purgeStream();

    defer _deleteStream();

    var submitter: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);

    // ephemeral consumer
    var conf: ConsumerConfig = .{
        .filter_subject = "ORDERS.*",
    };

    var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer consumer.STOP(DeleteConsumer);

    var order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    try submitter.PUBLISH("ORDERS.received", null, "1");
    try submitter.PUBLISH("ORDERS.received", null, "2");
    try submitter.PUBLISH("ORDERS.received", null, "3");
    submitter.DISCONNECT();

    order = try consumer.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try consumer.ACK(order.?, true);

    order = try consumer.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "2", order.?.letter.getPayload().?), true);
    try consumer.ACK(order.?, true);

    order = try consumer.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "3", order.?.letter.getPayload().?), true);
    try consumer.NACK(order.?, true);

    order = try consumer.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "3", order.?.letter.getPayload().?), true);
    try consumer.ACK(order.?, true);

    try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 2));

    try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 2));

    consumer.STOP(DeleteConsumer);

    return;
}

test "publish/consume durable consumer" {
    try createStream();

    try purgeStream();

    defer _deleteStream();

    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});

    // durable consumer
    var conf: ConsumerConfig = .{
        .durable_name = "DurableConsumer",
        .filter_subject = "ORDERS.*",
    };

    var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer consumer.STOP(DeleteConsumer);

    var order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    try js.PUBLISH("ORDERS.received", null, "1");
    try js.PUBLISH("ORDERS.received", null, "2");
    try js.PUBLISH("ORDERS.received", null, "3");
    js.DISCONNECT();

    order = try consumer.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try consumer.ACK(order.?, true);

    order = try consumer.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "2", order.?.letter.getPayload().?), true);
    try consumer.ACK(order.?, true);

    order = try consumer.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "3", order.?.letter.getPayload().?), true);
    try consumer.ACK(order.?, true);

    try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 2));
    try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 2));

    consumer.STOP(DeleteConsumer);

    return;
}

test "publish/consume two consumers" {
    try createStream();
    try purgeStream();
    defer _deleteStream();

    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    try js.PUBLISH("ORDERS.received", null, "1");
    js.DISCONNECT();

    var conf: ConsumerConfig = .{
        .durable_name = "NEW",
        .filter_subject = "ORDERS.received",
    };

    var NEW: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer NEW.STOP(DeleteConsumer);

    conf = .{
        .durable_name = "DISPATCH",
        .filter_subject = "ORDERS.processed",
    };

    var DISPATCH: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer DISPATCH.STOP(DeleteConsumer);

    var order = try NEW.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try NEW.ACK(order.?, false);
    try NEW.PUBLISH("ORDERS.processed", null, order.?.letter.getPayload().?);
    NEW.REUSE(order.?);

    order = try DISPATCH.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try DISPATCH.ACK(order.?, true);

    NEW.STOP(DeleteConsumer);
    DISPATCH.STOP(DeleteConsumer);

    return;
}

test "publish/consume/subscribe" {
    try createStream();
    try purgeStream();
    defer _deleteStream();

    var subscriber: Subscriber = try Subscriber.SUBSCRIBE(std.testing.allocator, DefaultConnectOpts, STREAM, "ORDERS.*");
    defer subscriber.UNSUBSCRIBE();

    var mcount: u8 = 0;

    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    try js.PUBLISH("ORDERS.received", null, "1");
    mcount += 1;
    js.DISCONNECT();

    var conf: ConsumerConfig = .{
        .durable_name = "NEW",
        .filter_subject = "ORDERS.received",
    };

    var NEW: Consumer = try Consumer.START(std.testing.allocator, DefaultConnectOpts, STREAM, &conf);
    errdefer NEW.STOP(DeleteConsumer);

    conf = .{
        .durable_name = "DISPATCH",
        .filter_subject = "ORDERS.processed",
    };

    var DISPATCH: Consumer = try Consumer.START(std.testing.allocator, DefaultConnectOpts, STREAM, &conf);
    errdefer DISPATCH.STOP(DeleteConsumer);

    var order = try NEW.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try NEW.ACK(order.?, false);
    try NEW.PUBLISH("ORDERS.processed", null, order.?.letter.getPayload().?);
    mcount += 1;
    NEW.REUSE(order.?);

    order = try DISPATCH.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try DISPATCH.ACK(order.?, false);
    try DISPATCH.PUBLISH("ORDERS.completed", null, order.?.letter.getPayload().?);
    mcount += 1;
    DISPATCH.REUSE(order.?);

    NEW.STOP(DeleteConsumer);
    DISPATCH.STOP(DeleteConsumer);

    for (0..mcount) |_| {
        const pmsg = try subscriber.NEXT(protocol.SECNS * 5);

        subscriber.REUSE(pmsg);
    }
    return;
}

fn createStream() !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer js.DISCONNECT();

    var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{ "ORDERS.*", "items.*" } };

    try js.CREATE(&CONF);
}

fn purgeStream() !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer js.DISCONNECT();

    js.PURGE(STREAM) catch {};
}

fn deleteStream() !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer js.DISCONNECT();

    js.DELETE(STREAM) catch {};
}

fn _deleteStream() void {
    deleteStream() catch {};
}

const std = @import("std");
const builtin = @import("builtin");
const mailbox = @import("mailbox");

const testing = std.testing;
const Allocator = std.mem.Allocator;

const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

const Conn = @import("Conn.zig");
const JetStream = @import("JetStream.zig");
const Consumer = @import("Consumer.zig");
const Subscriber = @import("Subscriber.zig");

const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;
const StreamConfig = protocol.StreamConfig;
const ConsumerConfig = protocol.ConsumerConfig;
