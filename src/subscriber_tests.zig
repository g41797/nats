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
    var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{"orders.*", "items.*"} };

    js.DELETE(STREAM) catch {};

    try js.CREATE(&CONF);

    try js.PUBLISH("orders.1", null, "First Order");

    // const name = try Conn.newInbox();
    // const deliver_subject = try Conn.newInbox();

    const PUSHCONF: protocol.ConsumerConfig = .{
        // .name = &name,
        // .deliver_subject = &deliver_subject,
        // .filter_subject = "events.1",
        .ack_policy = protocol.ACKPOLICY_NONE,
        .max_deliver = 1,
        .ack_wait = protocol.SECNS * 3600 * 22,
        .num_replicas = 1,
        .mem_storage = true,
        // .flow_control = true,
        // .idle_heartbeat = protocol.SECNS * 3600 * 24,
        .inactive_threshold = 300000000000,
    };

    var pcons: Subscriber = try Subscriber.SUBSCRIBE(std.testing.allocator, .{}, STREAM, PUSHCONF);

    const pmsg = try pcons.NEXT(protocol.SECNS * 360);

    pcons.REUSE(pmsg);

    pcons.UNSUBSCRIBE();

    try js.DELETE(STREAM);
    return;
}
