// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const JetStream = @This();

const std = @import("std");
const Conn = @import("Conn.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const parse = @import("parse.zig");

const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const Headers = messages.Headers;
pub const AllocatedMSG = messages.AllocatedMSG;
const Formatter = @import("Formatter.zig");

mutex: Mutex = .{},
allocator: Allocator = undefined,
connection: ?*Conn = null,
cmd: Formatter = .{},
jsn: Formatter = .{},

pub fn CONNECT(allocator: Allocator, co: protocol.ConnectOpts) !JetStream {
    var js: JetStream = .{ .allocator = allocator };

    js.cmd = try Formatter.init(js.allocator, 128);
    js.jsn = try Formatter.init(js.allocator, 256);

    try js.createConn(co);

    return js;
}

pub fn CREATE(js: *JetStream, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.CREATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{ .emit_strings_as_arrays = false, .whitespace = .minified });

    return js.process(protocol.SECNS * 5);
}

pub fn UPDATE(js: *JetStream, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.UPDATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{ .emit_strings_as_arrays = false, .whitespace = .minified });

    return js.process(protocol.SECNS * 5);
}

pub fn PURGE(js: *JetStream, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.PURGE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

pub fn DELETE(js: *JetStream, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.DELETE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

pub fn PUBLISH(js: *JetStream, subject: []const u8, headers: ?*Headers, payload: ?[]const u8) !void { // Check HEADERS
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    try js.connection.?.publish(subject, null, headers, payload);
}

pub fn DISCONNECT(js: *JetStream) void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return;
    }

    js.connection.?.disconnect();
    js.allocator.destroy(js.connection.?);
    js.connection = null;

    js.cmd.deinit();
    js.jsn.deinit();

    return;
}

fn process(js: *JetStream, timeout_ns: u64) !void {
    const response = try js.connection.?.request(js.cmd.formatbuf.body().?, null, js.jsn.formatbuf.body(), timeout_ns);
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

fn createConn(js: *JetStream, co: protocol.ConnectOpts) !void {
    const conn = try js.allocator.create(Conn);
    conn.* = .{};
    errdefer js.allocator.destroy(conn);

    try conn.*.connect(js.allocator, co);
    js.connection = conn;

    return;
}
