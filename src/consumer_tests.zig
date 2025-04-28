// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const STREAM: []const u8 = "ORDERS";

test "create stream" {
    {
        var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
        defer js.DISCONNECT();

        var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{ "orders.*", "items.*" } };

        try js.CREATE(&CONF);
    }
    return;
}

test "create/consume/delete consumer" {
    // { // ephemeral consumer
    //     var conf: ConsumerConfig = .{};
    //     conf.filter_subject = "orders.*";
    //     var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    //
    //     try testing.expectError(error.NoMessages, consumer.CONSUME(protocol.SECNS * 2));
    //
    //     defer consumer.STOP(null);
    // }

    { // durable consumer
        var conf: ConsumerConfig = .{
            .durable_name = "DurableConsumer",
        };
        conf.filter_subject = "orders.*";
        var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);

        try testing.expectError(error.NoMessages, consumer.CONSUME(protocol.SECNS * 3));

        defer consumer.STOP(true);
    }

    return;
}

test "delete stream" {
    {
        var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
        defer js.DISCONNECT();

        js.DELETE(STREAM) catch {};
    }
}

const std = @import("std");
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
