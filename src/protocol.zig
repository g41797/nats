// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");
const ascii = std.ascii;
const EnumMap = std.enums.EnumMap;
const Allocator = std.mem.Allocator;
pub const Header = std.http.Header;
pub const HeaderIterator = std.http.HeaderIterator;
const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");
pub const Appendable = @import("Appendable.zig");

pub const MessageType = enum {
    UNKNOWN,
    INFO,
    CONNECT,
    SUB,
    UNSUB,
    PING,
    PONG,
    OK,
    ERR,
    PUB,
    HPUB,
    MSG,
    HMSG,

    pub fn from_line(line: []const u8) MessageType {
        const trl = std.mem.trim(u8, line, " \t\r\n");

        if (trl.len == 0) {
            return .UNKNOWN;
        }

        var split = std.mem.splitScalar(u8, trl, ' ');

        return from_string(split.first());
    }

    pub fn to_string(mt: MessageType) ?[]const u8 {
        return MessageTypeMap.get(mt);
    }

    pub fn from_string(str: []const u8) MessageType {
        if (str.len == 0) {
            return .UNKNOWN;
        }

        const result = std.meta.stringToEnum(MessageType, str);
        if (result == null) {
            return .UNKNOWN;
        }
        return result.?;
    }

    pub fn has_header(mt: MessageType) bool {
        return ((mt == .HMSG) or (mt == .HPUB));
    }

    pub fn has_payload(mt: MessageType) bool {
        return switch (mt) {
            .PUB, .HPUB, .MSG, .HMSG => true,
            else => false,
        };
    }
};

const MessageTypeMap = EnumMap(MessageType, []const u8).init(.{
    .UNKNOWN = "UNKNOWN",
    .INFO = "INFO",
    .CONNECT = "CONNECT",
    .SUB = "SUB",
    .UNSUB = "UNSUB",
    .PING = "PING",
    .PONG = "PONG",
    .OK = "+OK",
    .ERR = "-ERR",
    .PUB = "PUB",
    .HPUB = "HPUB",
    .MSG = "MSG",
    .HMSG = "HMSG",
});

pub const Headers = struct {
    buffer: Appendable = .{},

    pub fn init(hdrs: *Headers, allocator: Allocator, len: usize) !void {
        try hdrs.buffer.init(allocator, len, null);
        return;
    }

    pub fn deinit(hdrs: *Headers) void {
        hdrs.buffer.deinit();
    }

    pub fn append(hdrs: *Headers, name: []const u8, value: []const u8) !void {
        const nam = std.mem.trim(u8, name, " \t\r\n");
        if (nam.len == 0) {
            return error.BadName;
        }

        // const val = std.mem.trim(u8, value, " \t\r\n");
        if (value.len == 0) {
            return error.BadValue;
        }

        if (hdrs.buffer.actual_len == 0) {
            try hdrs.buffer.append("NATS/1.0\r\n");
        } else {
            hdrs.buffer.shrink(2) catch unreachable; // Remove tail "\r\n"
        }

        try hdrs.buffer.append(nam);
        try hdrs.buffer.append(":");
        try hdrs.buffer.append(value);
        try hdrs.buffer.append("\r\n");
        try hdrs.buffer.append("\r\n"); // Add tail
        return;
    }

    pub fn reset(hdrs: *Headers) !void {
        try hdrs.buffer.reset();
        return;
    }

    pub fn hiter(hdrs: *Headers) !HeaderIterator {
        const raw = hdrs.buffer.body();
        if (raw == null) {
            return error.WithoutHeaders;
        }
        return HeaderIterator.init(raw.?);
    }
};

pub const MSG = struct {
    mt: MessageType = MessageType.UNKNOWN,
    subject: Appendable = .{},
    sid: Appendable = .{},
    reply_to: Appendable = .{},
    headers: Headers = .{},
    payload: Appendable = .{},

    pub fn init(msg: *MSG, allocator: Allocator, plen: usize) !void {
        msg.mt = MessageType.UNKNOWN;
        try msg.subject.init(allocator, 32, 32);
        try msg.sid.init(allocator, 32, 32);
        try msg.reply_to.init(allocator, 32, 32);
        try msg.headers.init(allocator, 256);
        try msg.payload.init(allocator, plen, null);
        return;
    }

    pub fn deinit(msg: *MSG) void {
        msg.mt = MessageType.UNKNOWN;
        msg.subject.deinit();
        msg.sid.deinit();
        msg.reply_to.deinit();
        msg.headers.deinit();
        msg.payload.deinit();
        return;
    }

    pub fn reset(msg: *MSG) !void {
        try msg.subject.reset();
        try msg.sid.reset();
        try msg.reply_to.reset();
        try msg.headers.reset();
        try msg.payload.reset();
        return;
    }

    pub fn prepare(msg: *MSG, mt: MessageType) !void {
        msg.mt = mt;
        try msg.reset();
        return;
    }

    pub fn Subject(msg: *MSG) ?[]const u8 {
        return msg.subject.body();
    }

    pub fn Sid(msg: *MSG) ?[]const u8 {
        return msg.sid.body();
    }

    pub fn ReplyTo(msg: *MSG) ?[]const u8 {
        return msg.reply_to.body();
    }

    pub fn getHeaders(msg: *MSG) ?*Headers {
        if (msg.mt.has_header()) {
            return msg.headers;
        }
        return null;
    }

    pub fn getPayload(msg: *MSG) ?[]const u8 {
        if (msg.mt.has_payload()) {
            return msg.payload.body();
        }
        return null;
    }

    pub fn detachPayload(msg: *MSG) Appendable {
        const result = msg.payload;
        msg.payload.buffer = null;
        msg.payload.actual_len = 0;
        return result;
    }
};
