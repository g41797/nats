// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

/// JetStream client for managing NATS JetStream streams.
/// Provides methods for creating, updating, purging, and deleting streams.
pub const JetStream = @This();

const CREATE_STREAM_T: []const u8 = "$JS.API.STREAM.CREATE.{s}";
const UPDATE_STREAM_T: []const u8 = "$JS.API.STREAM.UPDATE.{s}";
const PURGE_STREAM_T: []const u8 = "$JS.API.STREAM.PURGE.{s}";
const DELETE_STREAM_T: []const u8 = "$JS.API.STREAM.DELETE.{s}";

mutex: Mutex = .{},
allocator: Allocator = undefined,
co: protocol.ConnectOpts = undefined,
connection: ?*Conn = null,
cmd: Formatter = .{},
jsn: Formatter = .{},

/// Connects to a NATS server with JetStream support.
/// Returns a JetStream client instance.
pub fn CONNECT(allocator: Allocator, co: protocol.ConnectOpts) !JetStream {
    var js: JetStream = .{ .allocator = allocator };

    js.connection = try createConn(allocator, co);

    js.cmd = try Formatter.init(js.allocator, 128);
    js.jsn = try Formatter.init(js.allocator, 256);

    js.co = co;
    return js;
}

/// Creates a new stream with the given configuration.
pub fn CREATE(js: *JetStream, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(CREATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    return js.process(protocol.SECNS * 5);
}

/// Updates an existing stream with the given configuration.
pub fn UPDATE(js: *JetStream, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(UPDATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    return js.process(protocol.SECNS * 5);
}

/// Purges all messages from the specified stream.
pub fn PURGE(js: *JetStream, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(PURGE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

/// Deletes the specified stream.
pub fn DELETE(js: *JetStream, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(DELETE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

/// Publishes a message to JetStream with optional headers and payload.
pub fn PUBLISH(js: *JetStream, subject: []const u8, headers: ?*Headers, payload: ?[]const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    const response = try js.connection.?.requestNMT(subject, headers, payload, protocol.SECNS * 10);
    defer js.connection.?.reuse(response);

    if (response.letter.getPayload()) |data| {
        if (parse.isFailed(data)) {
            return error.JetStreamsRequestFailed;
        } else {
            return;
        }
    } else {
        return;
    }
}

/// Disconnects from the NATS server and releases all resources.
pub fn DISCONNECT(js: *JetStream) void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return;
    }

    js.connection.?.interrupt() catch {};
    js.connection.?.disconnect();
    js.allocator.destroy(js.connection.?);
    js.connection = null;

    js.cmd.deinit();
    js.jsn.deinit();

    return;
}

fn process(js: *JetStream, timeout_ns: u64) !void {
    const response = try js.connection.?.requestNMT(js.cmd.formatbuf.body().?, null, js.jsn.formatbuf.body(), timeout_ns);
    defer js.connection.?.reuse(response);
    if (response.letter.getPayload()) |payload| {
        if (parse.isFailed(payload)) {
            return error.JetStreamsRequestFailed;
        } else {
            return;
        }
    } else {
        return;
    }
}

/// Creates and connects a new connection to the NATS server.
pub fn createConn(allocator: Allocator, co: protocol.ConnectOpts) !*Conn {
    const conn = try allocator.create(Conn);
    conn.* = .{};
    errdefer allocator.destroy(conn);

    try conn.*.connect(allocator, co);

    return conn;
}

const std = @import("std");
const Conn = @import("Conn.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const parse = @import("parse.zig");

const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const Headers = messages.Headers;
/// Re-export of the allocated message type.
pub const AllocatedMSG = messages.AllocatedMSG;
const Formatter = @import("Formatter.zig");
