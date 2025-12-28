// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test "base requests" {
    const STREAM: []const u8 = "ORDERS";

    {
        var js: JetStream = JetStream.CONNECT(std.testing.allocator, .{}) catch |err| {
            if (err == error.ConnectionRefused) return error.SkipZigTest;
            return err;
        };
        defer js.DISCONNECT();

        js.DELETE(STREAM) catch {};
    }

    {
        var js: JetStream = JetStream.CONNECT(std.testing.allocator, .{}) catch |err| {
            if (err == error.ConnectionRefused) return error.SkipZigTest;
            return err;
        };
        defer js.DISCONNECT();

        var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{ "orders.*", "items.*" } };

        try js.CREATE(&CONF);
    }

    {
        var js: JetStream = JetStream.CONNECT(std.testing.allocator, .{}) catch |err| {
            if (err == error.ConnectionRefused) return error.SkipZigTest;
            return err;
        };
        defer js.DISCONNECT();

        try js.PUBLISH("orders.1", null, "First Order");
    }

    {
        var pcons: Subscriber = try Subscriber.SUBSCRIBE(std.testing.allocator, .{}, STREAM, "orders.*");
        defer pcons.UNSUBSCRIBE();

        const pmsg = try pcons.NEXT(protocol.SECNS * 5);

        pcons.REUSE(pmsg);
    }

    return;
}

const std = @import("std");
const mailbox = @import("mailbox");

const testing = std.testing;
const Allocator = std.mem.Allocator;

const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

const Conn = @import("Conn.zig");
const JetStream = @import("JetStream.zig");
const Subscriber = @import("Subscriber.zig");

const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;
const StreamConfig = protocol.StreamConfig;
const SubscriberConfig = protocol.ConsumerConfig;
