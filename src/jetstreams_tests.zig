// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");

const testing = std.testing;
const Allocator = std.mem.Allocator;

const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

const JetStreams = @import("JetStreams.zig");

const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;
const StreamConfig = protocol.StreamConfig;

test "base jetstream requests" {
    var js: JetStreams = try JetStreams.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    const STREAM: []const u8 = "NEW-ORDERS";
    var CONF: protocol.StreamConfig = .{ .name = STREAM };

    try testing.expectError(error.JetStreamsRequestFailed, js.DELETE(STREAM));

    try js.CREATE(&CONF);
    try js.UPDATE(&CONF);

    try js.PUBLISH(STREAM, null, null);

    try js.PURGE(STREAM);

    try js.DELETE(STREAM);
    return;
}
