// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");

pub const Header = std.http.Header;
pub const HeaderIterator = std.http.HeaderIterator;
const EnumMap = std.enums.EnumMap;
const Allocator = std.mem.Allocator;

pub const Appendable = @import("Appendable.zig");
pub const protocol = @import("protocol.zig");

pub const MSGMailBox = mailbox.MailBox(MSG);
pub const AllocatedMSG = MSGMailBox.Envelope;

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
    INTERNAL, // For internal communication - not related to NATS per se

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
    .INTERNAL = "INTERNAL",
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

    pub fn reset(hdrs: *Headers) void {
        hdrs.buffer.reset();
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

    pub fn reset(msg: *MSG) void {
        msg.subject.reset();
        msg.sid.reset();
        msg.reply_to.reset();
        msg.headers.reset();
        msg.payload.reset();
        return;
    }

    pub fn prepare(msg: *MSG, mt: MessageType) !void {
        msg.mt = mt;
        msg.reset();
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

const PAYLOADLEN = 256;

pub fn alloc(allocator: Allocator, plen: usize) ?*AllocatedMSG {
    if (allocator.create(AllocatedMSG)) |am| {
        errdefer allocator.destroy(am);
        am.*.letter = .{};
        am.*.letter.init(allocator, plen) catch {
            return null;
        };
        return am;
    } else |_| {
        return null;
    }
}

pub fn free(amsg: *AllocatedMSG) void {
    const allocator = amsg.letter.subject.allocator;
    amsg.letter.deinit();
    allocator.destroy(amsg);
}

pub const Messages = struct {
    pool: MSGMailBox = .{},
    allocator: Allocator = undefined,

    pub fn init(msgs: *Messages, allocator: Allocator) void {
        msgs.allocator = allocator;
    }

    pub fn deinit(msgs: *Messages) void {
        var allocated = msgs.pool.close();
        if (allocated != null) {
            const next = allocated.?.next;
            free(allocated.?);
            allocated = next;
        }
    }

    pub fn get(msgs: *Messages, timeout_ns: u64) ?*AllocatedMSG {
        if (msgs.pool.receive(timeout_ns)) |amsg| {
            amsg.*.letter.reset();
            //std.io.getStdOut().writer().print("Get message from the pool\r\n", .{}) catch unreachable;
            return amsg;
        } else |er| {
            if (er == error.Timeout) {
                //std.io.getStdOut().writer().print("Allocate message\r\n", .{}) catch unreachable;
                return alloc(msgs.allocator, PAYLOADLEN);
            } else {
                return null;
            }
        }
    }

    pub fn receive(msgs: *Messages, timeout_ns: u64) !?*AllocatedMSG {
        if (msgs.pool.receive(timeout_ns)) |amsg| {
            return amsg;
        } else |rer| {
            if (rer == error.Timeout) {
                return null;
            } else {
                return rer;
            }
        }
    }

    pub fn put(msgs: *Messages, amsg: *AllocatedMSG) void {
        msgs.pool.send(amsg) catch {
            free(amsg);
        };
    }

    pub fn send(msgs: *Messages, amsg: *AllocatedMSG) !void {
        msgs.pool.send(amsg) catch |serr| {
            free(amsg);
            return serr;
        };
    }
};
