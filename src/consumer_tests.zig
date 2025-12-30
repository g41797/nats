// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const DefaultConnectOpts: protocol.ConnectOpts = .{};
const DeleteConsumer: bool = true;
const DontDeleteConsumer = !DeleteConsumer;

test "create/consume/delete consumer" {
    const STREAM = "ORDERS_TEST1"; // Unique stream name to avoid parallel test conflicts

    deleteStream(STREAM) catch return error.SkipZigTest;

    createStream(STREAM) catch return error.SkipZigTest;

    { // ephemeral consumer
        var conf: ConsumerConfig = .{};
        // Match the stream's subject pattern
        var filter_buf: [64]u8 = undefined;
        const filter = try std.fmt.bufPrint(&filter_buf, "{s}.*", .{STREAM});
        conf.filter_subject = filter;
        var consumer: Consumer = Consumer.START(std.testing.allocator, .{}, STREAM, &conf) catch return error.SkipZigTest;

        try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 1));

        defer consumer.STOP(null);
    }

    { // durable consumer
        var conf: ConsumerConfig = .{
            .durable_name = "DurableConsumer",
        };
        // Match the stream's subject pattern
        var filter_buf2: [64]u8 = undefined;
        const filter2 = try std.fmt.bufPrint(&filter_buf2, "{s}.*", .{STREAM});
        conf.filter_subject = filter2;
        var consumer: Consumer = Consumer.START(std.testing.allocator, .{}, STREAM, &conf) catch return error.SkipZigTest;

        try testing.expectEqual(null, consumer.CONSUME(protocol.SECNS * 1));

        defer consumer.STOP(DeleteConsumer);
    }

    return;
}

test "publish/consume ephemeral consumer" {
    const STREAM = "ORDERS_TEST2"; // Unique stream name to avoid parallel test conflicts

    createStream(STREAM) catch return error.SkipZigTest;

    purgeStream(STREAM) catch return error.SkipZigTest;

    defer _deleteStream(STREAM);

    var submitter: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer submitter.DISCONNECT();

    // ephemeral consumer
    var filter_buf: [64]u8 = undefined;
    const filter = try std.fmt.bufPrint(&filter_buf, "{s}.*", .{STREAM});

    var subject_buf: [64]u8 = undefined;
    const subject = try std.fmt.bufPrint(&subject_buf, "{s}.received", .{STREAM});

    var conf: ConsumerConfig = .{
        .filter_subject = filter,
    };

    var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer consumer.STOP(DeleteConsumer);

    var order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    try submitter.PUBLISH(subject, null, "1");
    try submitter.PUBLISH(subject, null, "2");
    try submitter.PUBLISH(subject, null, "3");

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
    const STREAM = "ORDERS_TEST3"; // Unique stream name to avoid parallel test conflicts

    createStream(STREAM) catch return error.SkipZigTest;

    purgeStream(STREAM) catch return error.SkipZigTest;

    defer _deleteStream(STREAM);

    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();

    var filter_buf: [64]u8 = undefined;
    const filter = try std.fmt.bufPrint(&filter_buf, "{s}.*", .{STREAM});

    var subject_buf: [64]u8 = undefined;
    const subject = try std.fmt.bufPrint(&subject_buf, "{s}.received", .{STREAM});

    // durable consumer
    var conf: ConsumerConfig = .{
        .durable_name = "DurableConsumer",
        .filter_subject = filter,
    };

    var consumer: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer consumer.STOP(DeleteConsumer);

    var order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    order = try consumer.CONSUME(protocol.SECNS * 1);
    try testing.expectEqual(null, order);

    try js.PUBLISH(subject, null, "1");
    try js.PUBLISH(subject, null, "2");
    try js.PUBLISH(subject, null, "3");

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
    const STREAM = "ORDERS_TEST4"; // Unique stream name to avoid parallel test conflicts

    createStream(STREAM) catch return error.SkipZigTest;
    purgeStream(STREAM) catch return error.SkipZigTest;
    defer _deleteStream(STREAM);

    var subject_received_buf: [64]u8 = undefined;
    const subject_received = try std.fmt.bufPrint(&subject_received_buf, "{s}.received", .{STREAM});

    var subject_processed_buf: [64]u8 = undefined;
    const subject_processed = try std.fmt.bufPrint(&subject_processed_buf, "{s}.processed", .{STREAM});

    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, .{});
    defer js.DISCONNECT();
    try js.PUBLISH(subject_received, null, "1");

    var conf: ConsumerConfig = .{
        .durable_name = "NEW",
        .filter_subject = subject_received,
    };

    var NEW: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer NEW.STOP(DeleteConsumer);

    conf = .{
        .durable_name = "DISPATCH",
        .filter_subject = subject_processed,
    };

    var DISPATCH: Consumer = try Consumer.START(std.testing.allocator, .{}, STREAM, &conf);
    errdefer DISPATCH.STOP(DeleteConsumer);

    var order = try NEW.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try NEW.ACK(order.?, false);
    try NEW.PUBLISH(subject_processed, null, order.?.letter.getPayload().?);
    NEW.REUSE(order.?);

    order = try DISPATCH.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try DISPATCH.ACK(order.?, true);

    NEW.STOP(DeleteConsumer);
    DISPATCH.STOP(DeleteConsumer);

    return;
}

test "publish/consume/subscribe" {
    const STREAM = "ORDERS_TEST5"; // Unique stream name to avoid parallel test conflicts

    createStream(STREAM) catch return error.SkipZigTest;
    purgeStream(STREAM) catch return error.SkipZigTest;
    defer _deleteStream(STREAM);

    var stream_pattern_buf: [64]u8 = undefined;
    const stream_pattern = try std.fmt.bufPrint(&stream_pattern_buf, "{s}.*", .{STREAM});

    var subscriber: Subscriber = try Subscriber.SUBSCRIBE(std.testing.allocator, DefaultConnectOpts, STREAM, stream_pattern);
    defer subscriber.UNSUBSCRIBE();

    var mcount: u8 = 0;

    var subject_received_buf: [64]u8 = undefined;
    const subject_received = try std.fmt.bufPrint(&subject_received_buf, "{s}.received", .{STREAM});

    var subject_processed_buf: [64]u8 = undefined;
    const subject_processed = try std.fmt.bufPrint(&subject_processed_buf, "{s}.processed", .{STREAM});

    var subject_completed_buf: [64]u8 = undefined;
    const subject_completed = try std.fmt.bufPrint(&subject_completed_buf, "{s}.completed", .{STREAM});

    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer js.DISCONNECT();
    try js.PUBLISH(subject_received, null, "1");
    mcount += 1;

    var conf: ConsumerConfig = .{
        .durable_name = "NEW",
        .filter_subject = subject_received,
    };

    var NEW: Consumer = try Consumer.START(std.testing.allocator, DefaultConnectOpts, STREAM, &conf);
    errdefer NEW.STOP(DeleteConsumer);

    conf = .{
        .durable_name = "DISPATCH",
        .filter_subject = subject_processed,
    };

    var DISPATCH: Consumer = try Consumer.START(std.testing.allocator, DefaultConnectOpts, STREAM, &conf);
    errdefer DISPATCH.STOP(DeleteConsumer);

    var order = try NEW.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try NEW.ACK(order.?, false);
    try NEW.PUBLISH(subject_processed, null, order.?.letter.getPayload().?);
    mcount += 1;
    NEW.REUSE(order.?);

    order = try DISPATCH.CONSUME(protocol.SECNS * 2);
    try testing.expectEqual(std.mem.eql(u8, "1", order.?.letter.getPayload().?), true);
    try DISPATCH.ACK(order.?, false);
    try DISPATCH.PUBLISH(subject_completed, null, order.?.letter.getPayload().?);
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

// Helper functions now accept stream name to avoid parallel test conflicts
// Note: In NATS JetStream, each subject can only belong to ONE stream
// So we make subjects unique per stream to avoid conflicts
fn createStream(stream_name: []const u8) !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer js.DISCONNECT();

    // Use stream name as subject prefix to ensure uniqueness
    var subject_buf: [64]u8 = undefined;
    const subject = try std.fmt.bufPrint(&subject_buf, "{s}.*", .{stream_name});

    var subjects: [1][]const u8 = .{subject};
    var CONF: protocol.StreamConfig = .{ .name = stream_name, .subjects = &subjects };

    try js.CREATE(&CONF);
}

fn purgeStream(stream_name: []const u8) !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer js.DISCONNECT();

    js.PURGE(stream_name) catch {};
}

fn deleteStream(stream_name: []const u8) !void {
    var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
    defer js.DISCONNECT();

    js.DELETE(stream_name) catch {};
}

fn _deleteStream(stream_name: []const u8) void {
    deleteStream(stream_name) catch {};
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
