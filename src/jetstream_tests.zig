// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");

const testing = std.testing;
const Allocator = std.mem.Allocator;

const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

const JetStream = @import("JetStream.zig");

const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;
const StreamConfig = protocol.StreamConfig;

// test "base jetstream requests" {
//     var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
//     defer js.DISCONNECT();
//
//     const STREAM: []const u8 = "ORDS";
//     var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{"ords.>"} };
//
//     try testing.expectError(error.JetStreamsRequestFailed, js.DELETE(STREAM));
//     //
//     try js.CREATE(&CONF);
//     try js.UPDATE(&CONF);
//     //
//     try js.PUBLISH("ords.received", null, "First Order");
//     //
//     try js.PURGE(STREAM);
//     //
//     try js.DELETE(STREAM);
//     return;
// }

test "min jetstream requests" {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    const STREAM: []const u8 = "ORDS";
    var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{"ords.>"} };

    try js.CREATE(&CONF);
    try js.UPDATE(&CONF);
    try js.PURGE(STREAM);
    try js.DELETE(STREAM);

    return;
}
