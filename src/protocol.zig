// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const ascii = std.ascii;
const EnumMap = std.enums.EnumMap;
const Allocator = std.mem.Allocator;
const Header = std.http.Header;
const HeaderIterator = std.http.HeaderIterator;
const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");


// ==========================================
// Messages with payload and optional headers
// ==========================================

// =======================================
//                  PUB [Client]
// =======================================
// PUB <subject> [reply-to] <#bytes>␍␊[payload]␍␊
//
// #bytes> - length of payload without ␍␊
//
// PUB FOO 11␍␊Hello NATS!␍␊
//
// PUB FRONT.DOOR JOKE.22 11␍␊Knock Knock␍␊
//
// PUB NOTIFY 0␍␊␍␊     #bytes == 0 => empty payload
//

// =======================================
//                  MSG [Server]
// =======================================
// MSG <subject> <sid> [reply-to] <#bytes>␍␊[payload]␍␊
//
// #bytes> - length of payload without ␍␊
//
// MSG FOO.BAR 9 11␍␊Hello World␍␊
//
// MSG FOO.BAR 9 GREETING.34 11␍␊Hello World␍␊

// =======================================
//                  HPUB [Client]
// =======================================
// HPUB SUBJECT REPLY 23 30␍␊NATS/1.0␍␊Header: X␍␊␍␊PAYLOAD␍␊
// HPUB SUBJECT REPLY 23 23␍␊NATS/1.0␍␊Header: X␍␊␍␊␍␊
// HPUB SUBJECT REPLY 48 55␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊PAYLOAD␍␊
// HPUB SUBJECT REPLY 48 48␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊␍␊
//
// HPUB <SUBJ> [REPLY] <HDR_LEN> <TOT_LEN>
// <HEADER><PAYLOAD>
//
// HDR_LEN includes the entire serialized header, from the start of the version string (NATS/1.0)
// up to and including the ␍␊ before the payload
//
// TOT_LEN the payload length plus the HDR_LEN

// =======================================
//                  HMSG [Server]
// =======================================
// HMSG SUBJECT 1 REPLY 23 30␍␊NATS/1.0␍␊Header: X␍␊␍␊PAYLOAD␍␊
// HMSG SUBJECT 1 REPLY 23 23␍␊NATS/1.0␍␊Header: X␍␊␍␊␍␊
// HMSG SUBJECT 1 REPLY 48 55␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊PAYLOAD␍␊
// HMSG SUBJECT 1 REPLY 48 48␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊␍␊
//
// HMSG <SUBJECT> <SID> [REPLY] <HDR_LEN> <TOT_LEN>
// <PAYLOAD>
//
// HDR_LEN includes the entire serialized header, from the start of the version string (NATS/1.0)
// up to and including the ␍␊ before the payload
//
// TOT_LEN the payload length plus the HDR_LEN


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

    pub fn to_string(mt: MessageType) ?[]const u8 {
        return MessageTypeMap.get(mt);
    }

    pub fn from_string(str: []const u8) ?MessageType {
        if (str.len == 0) {
            return null;
        }

        const result = std.meta.stringToEnum(MessageType, str);
        return result;
    }

    pub fn has_header(mt: MessageType) bool {
        return ((mt == .HMSG) or (mt == .HPUB));
    }

    pub fn has_payload(mt: MessageType) bool {
        return switch (mt) {
            mt.PUB, mt.HPUB, mt.MSG, mt.HMSG => true,
            else => false,
        };
    }
};

const MessageTypeMap = EnumMap(MessageType, []u8).init(.{
    .UNKNOWN = "!@#$%^&",
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

pub fn cut_message_type(line: []const u8) !struct { mt: ?MessageType, tail: []const u8 } {
    _ = line;
    return error.BadFormat;
}

pub const Headers = struct {
    buffer: Appendable = undefined,

    pub fn init(hdrs: *Headers, allocator: Allocator, len: usize) !void {
        try hdrs.buffer.init(allocator, len);
        return;
    }

    pub fn deinit(hdrs: *Headers) void {
        hdrs.buffer.free();
    }

    pub fn append(hdrs: *Headers, name: []u8, value: []u8) !void {
        if (hdrs.buffer.actual_len == 0) {
            try hdrs.buffer.append("NATS/1.0\r\n");
        } else {
            hdrs.buffer.shrink(1) catch void; // Remove tail "\r\n"
        }
        try hdrs.buffer.append(name);
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
        const raw = hdrs.body();
        if (raw == null) {
            return error.WithoutHeaders;
        }
        return HeaderIterator.init(raw.?);
    }
};

pub const MSG = struct {
    mt: MessageType = MessageType.UNKNOWN,
    subject: Appendable = undefined,
    sid: Appendable = undefined,
    reply_to: Appendable = undefined,
    headers: Headers = undefined,
    payload: Appendable = undefined,

    pub fn init(msg: *MSG, allocator: Allocator, plen: usize) !void {
        msg.mt = MessageType.UNKNOWN;
        try msg.subject.init(allocator, 256);
        try msg.sid.init(allocator, 256);
        try msg.reply_to.init(allocator, 256);
        try msg.headers.init(allocator, 256);
        try msg.payload.init(allocator, plen);
        return;
    }

    pub fn set(msg: *MSG, mt: MessageType) !void {
        try msg.subject.reset();
        try msg.sid.reset();
        try msg.reply_to.reset();
        try msg.headers.reset();
        try msg.payload.reset();
        msg.mt = mt;
        return;
    }

    pub fn deinit(msg: *MSG) void {
        msg.mt = MessageType.UNKNOWN;
        msg.subject.free();
        msg.sid.free();
        msg.reply_to.free();
        msg.headers.free();
        msg.payload.free();
        return;
    }

    pub fn Subject(msg: *MSG) ?[]u8 {
        return msg.subject.body();
    }

    pub fn Sid(msg: *MSG) ?[]u8 {
        return msg.sid.body();
    }

    pub fn ReplyTo(msg: *MSG) ?[]u8 {
        return msg.reply_to.body();
    }

    pub fn getHeaders(msg: *MSG) ?[]u8 {
        if (msg.mt.has_header()) {
            return msg.headers.body();
        }
        return null;
    }

    pub fn getPayload(msg: *MSG) ?[]u8 {
        if (msg.mt.has_payload()) {
            return msg.payload.body();
        }
        return null;
    }
};

pub const Appendable = struct {
    buffer: ?[]u8 = null,
    actual_len: usize = 0,
    allocator: Allocator = undefined,

    pub fn init(apndbl: *Appendable, allocator: Allocator, len: usize) !void {
        apndbl.allocator = allocator;
        try apndbl.alloc(len);
        return;
    }

    pub fn reset(apndbl: *Appendable) !void {
        if (apndbl.buffer == null) {
            error.WasNotAllocated;
        }
        apndbl.actual_len = 0;
        return;
    }

    pub fn deinit(apndbl: *Appendable) void {
        apndbl.free();
    }

    pub inline fn append(apndbl: *Appendable, buff: []u8) !void {
        if (apndbl.buffer == null) {
            return error.WasNotAllocated;
        }
        _ = buff;
        return;
    }

    pub inline fn shrink(apndbl: *Appendable, count: usize) !void {
        if (apndbl.buffer == null) {
            return error.WasNotAllocated;
        }
        if (apndbl.actual_len < count) {
            return error.NotEnoughMemory;
        }
        apndbl.actual_len -= count;
        return;
    }

    pub fn copy(apndbl: *Appendable, from: []u8) !void {
        try apndbl.reset();
        try apndbl.append(from);

        return;
    }

    pub fn alloc(apndbl: *Appendable, len: usize) !void {
        if (apndbl.buffer == null) {
            apndbl.len = roundlen(len);
            apndbl.actual_len = 0;
            apndbl.buffer = try apndbl.allocator.alloc(u8, apndbl.len);
            return;
        }

        const rlen = roundlen(len);

        if (apndbl.len >= rlen) {
            return;
        }

        apndbl.buffer = try apndbl.allocator.realloc(apndbl.buffer[0..apndbl.actual_len], rlen);

        return;
    }

    fn free(apndbl: *Appendable) void {
        if (apndbl.buffer != null) {
            apndbl.allocator.free(apndbl.buffer.?);
            apndbl.buffer = null;
            apndbl.actual_len = 0;
        }
        return;
    }

    pub fn body(apndbl: *Appendable) ?[]u8 {
        if (apndbl.buffer == null) {
            return null;
        }
        if (apndbl.actual_len == 0) {
            return null;
        }
        return apndbl.buffer.?[0..apndbl.actual_len];
    }

    inline fn roundlen(len: usize) usize {
        if (len == 0) {
            return 256;
        }
        return ((len / 256) + 1) * 256;
    }
};
