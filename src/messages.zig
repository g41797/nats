// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

/// Represents the type of NATS protocol message.
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
    INTERRUPT, // For internal communication - not related to NATS per se

    /// Parses a message type from a protocol line.
    pub fn from_line(line: []const u8) MessageType {
        const trl = std.mem.trim(u8, line, " \t\r\n");

        if (trl.len == 0) {
            return .UNKNOWN;
        }

        var split = std.mem.splitScalar(u8, trl, ' ');

        return from_string(split.first());
    }

    /// Converts the message type to its string representation.
    pub fn to_string(mt: MessageType) ?[]const u8 {
        return MessageTypeMap.get(mt);
    }

    /// Parses a message type from a string.
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

    /// Returns true if this message type includes headers (HMSG or HPUB).
    pub fn has_header(mt: MessageType) bool {
        return ((mt == .HMSG) or (mt == .HPUB));
    }

    /// Returns true if this message type includes a payload.
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
    .INTERRUPT = "INTERRUPT",
});

/// Container for NATS message headers.
/// Headers are formatted according to the NATS protocol (NATS/1.0 prefix).
pub const Headers = struct {
    /// Internal buffer storing the serialized headers.
    buffer: Appendable = .{},

    /// Initializes the headers container with the given allocator.
    pub fn init(hdrs: *Headers, allocator: Allocator, len: usize) !void {
        try hdrs.buffer.init(allocator, len, null);
        return;
    }

    /// Releases all allocated memory.
    pub fn deinit(hdrs: *Headers) void {
        hdrs.buffer.deinit();
    }

    /// Appends a header name-value pair.
    /// Automatically adds the NATS/1.0 prefix on first header.
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

    /// Clears all headers without freeing memory.
    pub fn reset(hdrs: *Headers) void {
        hdrs.buffer.reset();
        return;
    }

    /// Returns an iterator for traversing the headers.
    pub fn hiter(hdrs: *Headers) !HeaderIterator {
        const raw = hdrs.buffer.body();
        if (raw == null) {
            return error.WithoutHeaders;
        }
        return HeaderIterator.init(raw.?);
    }
};

/// Represents a NATS protocol message with subject, headers, and payload.
pub const MSG = struct {
    /// The message type.
    mt: MessageType = MessageType.UNKNOWN,
    /// The message subject.
    subject: Appendable = .{},
    /// The subscription ID.
    sid: Appendable = .{},
    /// Optional reply-to subject for request-reply patterns.
    reply_to: Appendable = .{},
    /// Message headers (for HMSG/HPUB types).
    headers: Headers = .{},
    /// Message payload data.
    payload: Appendable = .{},

    /// Initializes the message with the given allocator and payload length.
    pub fn init(msg: *MSG, allocator: Allocator, plen: usize) !void {
        msg.mt = MessageType.UNKNOWN;
        try msg.subject.init(allocator, 32, 32);
        try msg.sid.init(allocator, 32, 32);
        try msg.reply_to.init(allocator, 32, 32);
        try msg.headers.init(allocator, 256);
        try msg.payload.init(allocator, plen, null);
        return;
    }

    /// Releases all allocated memory.
    pub fn deinit(msg: *MSG) void {
        msg.mt = MessageType.UNKNOWN;
        msg.subject.deinit();
        msg.sid.deinit();
        msg.reply_to.deinit();
        msg.headers.deinit();
        msg.payload.deinit();
        return;
    }

    /// Resets all message fields without freeing memory.
    pub fn reset(msg: *MSG) void {
        msg.subject.reset();
        msg.sid.reset();
        msg.reply_to.reset();
        msg.headers.reset();
        msg.payload.reset();
        return;
    }

    /// Prepares the message for a specific type and resets all fields.
    pub fn prepare(msg: *MSG, mt: MessageType) void {
        msg.mt = mt;
        msg.reset();
        return;
    }

    /// Returns the message subject.
    pub fn Subject(msg: *MSG) ?[]const u8 {
        return msg.subject.body();
    }

    /// Returns the subscription ID.
    pub fn Sid(msg: *MSG) ?[]const u8 {
        return msg.sid.body();
    }

    /// Returns the reply-to subject, if present.
    pub fn ReplyTo(msg: *MSG) ?[]const u8 {
        return msg.reply_to.body();
    }

    /// Returns the headers if this message type supports them.
    pub fn getHeaders(msg: *MSG) ?*Headers {
        if (msg.mt.has_header()) {
            return msg.headers;
        }
        return null;
    }

    /// Returns the payload if this message type supports it.
    pub fn getPayload(msg: *MSG) ?[]const u8 {
        if (msg.mt.has_payload()) {
            return msg.payload.body();
        }
        return null;
    }

    /// Detaches and returns the payload buffer, clearing the message's reference.
    pub fn detachPayload(msg: *MSG) Appendable {
        const result = msg.payload;
        msg.payload.buffer = null;
        msg.payload.actual_len = 0;
        return result;
    }
};

const PAYLOADLEN = 256;

/// Allocates a new message envelope with the given payload capacity.
pub fn alloc(allocator: Allocator, plen: usize) !*AllocatedMSG {
    const am = try allocator.create(AllocatedMSG);
    errdefer allocator.destroy(am);
    am.*.letter = .{};
    try am.*.letter.init(allocator, plen);
    return am;
}

/// Frees an allocated message envelope and its contents.
pub fn free(amsg: *AllocatedMSG) void {
    const allocator = amsg.letter.subject.allocator;
    amsg.letter.deinit();
    allocator.destroy(amsg);
}

/// Message pool for efficient message allocation and reuse.
pub const Messages = struct {
    /// Internal mailbox for pooled messages.
    pool: MSGMailBox = .{},
    /// Allocator used for creating new messages.
    allocator: Allocator = undefined,

    /// Initializes the message pool with the given allocator.
    pub fn init(msgs: *Messages, allocator: Allocator) void {
        msgs.allocator = allocator;
    }

    /// Closes the pool and frees all pooled messages.
    pub fn deinit(msgs: *Messages) void {
        var allocated = msgs.pool.close();
        while (allocated != null) {
            const next = allocated.?.next;
            free(allocated.?);
            allocated = next;
        }
    }

    /// Gets a message from the pool or allocates a new one if pool is empty.
    pub fn get(msgs: *Messages, timeout_ns: u64) !*AllocatedMSG {
        if (msgs.pool.receive(timeout_ns)) |amsg| {
            amsg.*.letter.reset();
            //std.io.getStdOut().writer().print("Get message from the pool\r\n", .{}) catch unreachable;
            return amsg;
        } else |er| {
            if (er == error.Timeout) {
                //std.io.getStdOut().writer().print("Allocate message\r\n", .{}) catch unreachable;
                return alloc(msgs.allocator, PAYLOADLEN);
            } else {
                return er;
            }
        }
    }

    /// Receives a message from the pool with timeout.
    pub fn receive(msgs: *Messages, timeout_ns: u64) error{ Timeout, Closed }!*AllocatedMSG {
        if (msgs.pool.receive(timeout_ns)) |amsg| {
            return amsg;
        } else |rer| {
            return rer;
        }
    }

    /// Returns a message to the pool for reuse.
    pub fn put(msgs: *Messages, amsg: *AllocatedMSG) void {
        msgs.pool.send(amsg) catch {
            free(amsg);
        };
    }

    /// Sends a message to the pool, freeing it if the pool is closed.
    pub fn send(msgs: *Messages, amsg: *AllocatedMSG) !void {
        msgs.pool.send(amsg) catch |serr| {
            free(amsg);
            return serr;
        };
    }
};

const std = @import("std");
const mailbox = @import("mailbox");

/// HTTP header type used for NATS headers.
pub const Header = std.http.Header;
/// Iterator for traversing HTTP-style headers.
pub const HeaderIterator = std.http.HeaderIterator;
const EnumMap = std.enums.EnumMap;
const Allocator = std.mem.Allocator;

/// Re-export of the Appendable buffer type.
pub const Appendable = @import("Appendable.zig");
/// Re-export of the protocol definitions.
pub const protocol = @import("protocol.zig");

/// Mailbox type for passing messages between threads.
pub const MSGMailBox = mailbox.MailBox(MSG);
/// Allocated message envelope wrapping a MSG.
pub const AllocatedMSG = MSGMailBox.Envelope;
