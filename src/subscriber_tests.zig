// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

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

test "base requests" {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    const STREAM: []const u8 = "ORDERS";
    var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{ "orders.*", "items.*" } };

    js.DELETE(STREAM) catch {};

    try js.CREATE(&CONF);

    try js.PUBLISH("orders.1", null, "First Order");

    var pcons: Subscriber = try Subscriber.SUBSCRIBE(std.testing.allocator, .{}, STREAM, ">");

    const pmsg = try pcons.NEXT(protocol.SECNS * 360);

    pcons.REUSE(pmsg);

    pcons.UNSUBSCRIBE();

    try js.DELETE(STREAM);
    return;
}
