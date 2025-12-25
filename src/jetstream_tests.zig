// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test "base jetstream requests" {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    const STREAM: []const u8 = "ORDS";
    var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{"ords.>"} };

    try testing.expectError(error.JetStreamsRequestFailed, js.DELETE(STREAM));
    //
    try js.CREATE(&CONF);
    try js.UPDATE(&CONF);
    //
    try js.PUBLISH("ords.received", null, "First Order");
    //
    try js.PURGE(STREAM);
    //
    try js.DELETE(STREAM);
    return;
}

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

test "stream info functionality" {
    // Step 1: Connect to JetStream
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    const STREAM: []const u8 = "TESTINFO";
    var CONF: protocol.StreamConfig = .{
        .name = STREAM,
        .subjects = &.{"testinfo.>"},
        .retention = protocol.RETENTION_LIMITS,
        .storage = protocol.STORAGE_FILE,
        .max_consumers = -1,
        .max_msgs = 1000,
        .max_bytes = 1048576,
        .num_replicas = 1,
    };

    // Ensure clean state - delete stream if it exists
    js.DELETE(STREAM) catch {};

    // Step 2: Create the stream
    try js.CREATE(&CONF);
    defer js.DELETE(STREAM) catch {};

    // Step 3: Publish some messages to the stream
    try js.PUBLISH("testinfo.orders", null, "Order 1");
    try js.PUBLISH("testinfo.orders", null, "Order 2");
    try js.PUBLISH("testinfo.events", null, "Event 1");

    // Step 4: Call INFO with empty request (basic info)
    const empty_request: JetStream.StreamInfoRequest = .{};
    const info = try js.INFO(STREAM, &empty_request);

    // Step 5: Verify the response contains expected data
    // Check response type
    if (info.type) |resp_type| {
        try testing.expect(std.mem.indexOf(u8, resp_type, "stream_info_response") != null);
    }

    // Check config matches what we created
    if (info.config) |config| {
        try testing.expectEqualStrings(STREAM, config.name);
        try testing.expectEqualStrings(protocol.RETENTION_LIMITS, config.retention);
        try testing.expectEqualStrings(protocol.STORAGE_FILE, config.storage);
        try testing.expectEqual(@as(i32, 1000), config.max_msgs);
    } else {
        return error.MissingConfig;
    }

    // Check state reflects our published messages
    if (info.state) |state| {
        try testing.expectEqual(@as(u64, 3), state.messages);
        try testing.expect(state.bytes > 0);
        try testing.expectEqual(@as(u64, 1), state.first_seq);
        try testing.expectEqual(@as(u64, 3), state.last_seq);
        try testing.expectEqual(@as(i64, 0), state.consumer_count);
    } else {
        return error.MissingState;
    }

    // Check created timestamp exists
    try testing.expect(info.created != null);

    // Step 6: Test INFO on non-existent stream returns error
    const nonexistent_request: JetStream.StreamInfoRequest = .{};
    const result = js.INFO("NONEXISTENT_STREAM", &nonexistent_request);
    try testing.expectError(error.JetStreamsRequestFailed, result);

    return;
}

test "stream info with subjects filter" {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    const STREAM: []const u8 = "TESTFILTER";
    var CONF: protocol.StreamConfig = .{
        .name = STREAM,
        .subjects = &.{"filter.>"},
    };

    // Ensure clean state
    js.DELETE(STREAM) catch {};

    try js.CREATE(&CONF);
    defer js.DELETE(STREAM) catch {};

    // Publish messages to different subjects
    try js.PUBLISH("filter.a", null, "Message A1");
    try js.PUBLISH("filter.a", null, "Message A2");
    try js.PUBLISH("filter.b", null, "Message B1");

    // Request info with subjects filter
    const filtered_request: JetStream.StreamInfoRequest = .{
        .subjects_filter = "filter.a",
    };
    const info = try js.INFO(STREAM, &filtered_request);

    // Verify we got stream info
    if (info.state) |state| {
        // Total messages should still be 3
        try testing.expectEqual(@as(u64, 3), state.messages);
    }

    return;
}

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
