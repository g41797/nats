// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const JetStreams = @This();

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

pub fn CONNECT(allocator: Allocator, co: protocol.ConnectOpts) !JetStreams {
    var js: JetStreams = .{ .allocator = allocator };

    js.cmd = try Formatter.init(js.allocator, 128);
    js.jsn = try Formatter.init(js.allocator, 256);

    try js.createConn(co);

    return js;
}

pub fn CREATE(js: *JetStreams, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.CREATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{ .emit_strings_as_arrays = false, .whitespace = .minified });

    return js.process(protocol.SECNS * 5);
}

pub fn UPDATE(js: *JetStreams, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.UPDATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{ .emit_strings_as_arrays = false, .whitespace = .minified });

    return js.process(protocol.SECNS * 5);
}

pub fn PURGE(js: *JetStreams, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.PURGE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

pub fn DELETE(js: *JetStreams, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(protocol.DELETE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

pub fn DISCONNECT(js: *JetStreams) void {
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

fn process(js: *JetStreams, timeout_ns: u64) !void {
    const response = try js.connection.?.request(js.cmd.formatbuf.body().?, js.jsn.formatbuf.body(), timeout_ns);
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

fn createConn(js: *JetStreams, co: protocol.ConnectOpts) !void {
    const conn = try js.allocator.create(Conn);
    conn.* = .{};
    errdefer js.allocator.destroy(conn);

    try conn.*.connect(js.allocator, co);
    js.connection = conn;

    return;
}
