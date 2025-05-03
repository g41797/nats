// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const STREAM: []const u8 = "ORDERS";
const DeleteConsumer: bool = true;
const DontDeleteConsumer = !DeleteConsumer;

// test "create/consume/delete consumer" {
//     try deleteStream();
//
//     try createStream();
//
//     { // ephemeral consumer
//         var conf: ConsumerConfig = .{};
//         conf.filter_subject = "orders.*";
//         var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
//
//         try testing.expectError(error.NoMessages, consumer.CONSUME(protocol.SECNS * 1));
//
//         defer consumer.STOP(null);
//     }
//
//     { // durable consumer
//         var conf: ConsumerConfig = .{
//             .durable_name = "DurableConsumer",
//         };
//         conf.filter_subject = "orders.*";
//         var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
//
//         try testing.expectError(error.NoMessages, consumer.CONSUME(protocol.SECNS * 1));
//
//         defer consumer.STOP(DeleteConsumer);
//     }
//
//     return;
// }

test "publish/consume" {
    try deleteStream();

    try createStream();

    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    // durable consumer
    var conf: ConsumerConfig = .{
        .durable_name = "DurableConsumer",
    };
    conf.filter_subject = "orders.*";
    var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);

    try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 1));

    try js.PUBLISH("orders.received", null, "1");

    var order = try consumer.CONSUME(protocol.SECNS * 1);

    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);

    try consumer.ACK(order.?, true);

    defer consumer.STOP(DeleteConsumer);

    return;
}

// test "delete stream" {
//     try deleteStream();
// }

fn createStream() !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{ "orders.*", "items.*" } };

    try js.CREATE(&CONF);
}

fn purgeStream() !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    js.PURGE(STREAM) catch {};
}

fn deleteStream() !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    js.DELETE(STREAM) catch {};
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

const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;
const StreamConfig = protocol.StreamConfig;
const ConsumerConfig = protocol.ConsumerConfig;
