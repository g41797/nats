// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Conn = @This();

mutex: Mutex = .{},
allocator: Allocator = undefined,
client: ?*Client = null,
line: Appendable = .{},
printbuf: Formatter = .{},

thread: Thread = undefined,
pool: Messages = .{},
received: Messages = .{},
inbox: [38]u8 = undefined,
subscribed: bool = false,
next: u64 = 0,
req_sid: u64 = 0,
req_reply2: Formatter = .{},
timeout_timer: std.time.Timer = undefined,
allow_heartBit: bool = false,

pub fn connect(cn: *Conn, allocator: Allocator, co: protocol.ConnectOpts) !void {
    {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        try cn._connect(allocator, co);
    }

    cn.thread = std.Thread.spawn(.{}, run, .{cn}) catch unreachable;

    return;
}

fn _connect(cn: *Conn, allocator: Allocator, co: protocol.ConnectOpts) !void {
    if (cn.client != null) {
        return error.AlreadyConnected;
    }

    const inbox = try newInbox();
    std.mem.copyForwards(u8, cn.inbox[0..36], &inbox);
    cn.inbox[36] = '.';
    cn.inbox[37] = '*';

    cn.allocator = allocator;

    var host: []const u8 = protocol.DefaultAddr;

    if (co.addr != null) {
        host = co.addr.?;
    }

    var prt: u16 = protocol.DefaultPort;

    if (co.port != null) {
        prt = co.port.?;
    }

    try cn.line.init(allocator, 128, 32);
    cn.printbuf = try Formatter.init(allocator, 128);
    cn.pool.init(allocator);
    cn.received.init(allocator);
    cn.req_reply2 = try Formatter.init(allocator, 48);

    cn.client = try cn.connectTcp(.{
        .addr = host,
        .port = prt,
    });

    errdefer cn.disconnect();

    const mt = try cn.read_mt();

    if (mt != .INFO) {
        return error.ProtocolError;
    }

    try cn.writeAll(protocol.ConnectString);

    cn.timeout_timer = std.time.Timer.start() catch unreachable;

    return;
}

pub fn disconnect(cn: *Conn) void {
    cn.mutex.lock();
    defer cn.mutex.unlock();

    if (cn.client == null) {
        return;
    }

    if (cn.subscribed) {
        cn.printNMT("UNSUB {0d}\r\n", .{cn.req_sid}) catch {};
    }

    cn.raiseAttention();
    cn.pool.deinit();
    cn.received.deinit();

    cn.client.?.close();

    cn.waitFinish();

    cn.line.deinit();
    cn.printbuf.deinit();
    cn.req_reply2.deinit();

    cn.allocator.destroy(cn.client.?);
    cn.client = null;

    return;
}

pub fn fetch(cn: *Conn, timeout_ns: u64) error{ Interrupted, Timeout, Closed }!*AllocatedMSG {
    if (cn.received.receive(timeout_ns)) |recvd| {
        if (recvd.*.letter.mt == .INTERRUPT) {
            cn.pool.put(recvd);
            return error.Interrupted;
        }
        return recvd;
    } else |rerr| {
        return rerr;
    }
}

pub fn interrupt(cn: *Conn) !void {
    const alm = try cn.pool.get(0);

    alm.letter.prepare(.INTERRUPT);

    errdefer _free(alm);

    try cn.received.send(alm);
}

inline fn _free(alm: *AllocatedMSG) void {
    messages.free(alm);
}

pub fn reuse(cn: *Conn, msg: *AllocatedMSG) void {
    cn.pool.put(msg);
}

pub fn publish(cn: *Conn, subject: []const u8, reply2: ?[]const u8, headers: ?*Headers, payload: ?[]const u8) !void {
    if (headers == null) {
        return cn.@"pub"(subject, reply2, payload);
    } else {
        return cn.hpub(subject, reply2, headers.?, payload);
    }
}

pub fn @"pub"(cn: *Conn, subject: []const u8, reply2: ?[]const u8, payload: ?[]const u8) !void {
    cn.mutex.lock();
    defer cn.mutex.unlock();

    var repl: []const u8 = undefined;

    if (reply2 == null) {
        repl = "";
    } else {
        repl = reply2.?;
    }

    var body: []const u8 = undefined;

    if (payload == null) {
        body = "";
    } else {
        body = payload.?;
    }

    try cn.printNMT("PUB {0s} {1s} {2d}\r\n", .{ subject, repl, body.len });

    var buffers: [2]std.posix.iovec_const = .{
        .{ .base = body.ptr, .len = body.len },
        .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },
    };

    try cn.writevNMT(&buffers);

    return;
}

pub fn hpub(cn: *Conn, subject: []const u8, reply2: ?[]const u8, headers: *Headers, payload: ?[]const u8) !void {
    cn.mutex.lock();
    defer cn.mutex.unlock();

    var repl: []const u8 = undefined;

    if (reply2 == null) {
        repl = "";
    } else {
        repl = reply2.?;
    }

    var body: []const u8 = undefined;

    if (payload == null) {
        body = "";
    } else {
        body = payload.?;
    }

    const HDR_LEN = headers.buffer.body().?.len + 1; // +1 for ␍␊
    const TOT_LEN = HDR_LEN + body.len;

    try cn.printNMT("HPUB {0s} {1s} {2d} {3d}\r\n", .{ subject, repl, HDR_LEN, TOT_LEN });

    var buffers: [4]posix.iovec_const = .{
        .{ .base = headers.buffer.body().?.ptr, .len = headers.buffer.body().?.len },
        .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },
        .{ .base = body.ptr, .len = body.len },
        .{ .base = protocol.CRLF.ptr, .len = protocol.CRLF.len },
    };

    try cn.writevNMT(&buffers);

    return;
}

pub fn sub(cn: *Conn, subject: []const u8, queue_group: ?[]const u8, sid: []const u8) !void {
    var qgr: []const u8 = undefined;

    if (queue_group == null) {
        qgr = "";
    } else {
        qgr = queue_group.?;
    }

    try cn.printMT("SUB {0s} {1s} {2s}\r\n", .{ subject, qgr, sid });

    return;
}

pub fn unsub(cn: *Conn, sid: []const u8, max_msgs: ?u32) !void {
    var mm: u32 = undefined;

    if (max_msgs == null) {
        mm = 0;
    } else {
        mm = max_msgs.?;
    }

    if (mm == 0) {
        try cn.printMT("UNSUB {0s}\r\n", .{sid});
    } else {
        try cn.printMT("UNSUB {0s} {1d}\r\n", .{ sid, mm });
    }
    return;
}

// Does not return error - used for defer
fn _unsub_(cn: *Conn, sid: []const u8) void {
    if (cn.unsub(sid, 0)) |_| {
        return;
    } else |_| {
        return;
    }
}

pub fn ping(cn: *Conn) !void {
    try cn.writeMT("PING\r\n");
}

pub fn pong(cn: *Conn) !void {
    try cn.writeMT("PONG\r\n");
}

fn read_msg(cn: *Conn) !?*AllocatedMSG {
    if (cn.read_mt()) |mt| {
        switch (mt) {
            .UNKNOWN => {
                return error.CommunicationFailure;
            },
            .PUB => {
                return cn.read_PUB();
            },
            .HPUB => {
                return cn.read_HPUB();
            },
            .MSG => {
                return cn.read_MSG();
            },
            .HMSG => {
                return cn.read_HMSG();
            },
            // .INFO .CONNECT .SUB .UNSUB .PING .PONG .OK .ERR
            else => {
                return cn.read_oneliner(mt);
            },
        }
    } else |rerr| {
        return rerr;
    }
}

// [Server=>Client].INFO .PING .PONG .OK .ERR
// [Client=>Server].CONNECT .SUB .UNSUB .PING .PONG
fn read_oneliner(cn: *Conn, mt: MT) !*AllocatedMSG {
    const alm = try cn.pool.get(0);

    alm.letter.prepare(mt);

    return alm;
}

// =======================================
//          MSG [Server=>Subscriber]
// =======================================
// MSG <subject> <sid> [reply-to] <#bytes>␍␊[payload]␍␊
//
// #bytes> - length of payload without ␍␊
//
// MSG FOO.BAR 9 11␍␊Hello World␍␊
//
// MSG FOO.BAR 9 GREETING.34 11␍␊Hello World␍␊
fn read_MSG(cn: *Conn) !?*AllocatedMSG {
    const recvd = cn.line.body().?;

    var repl2exists: bool = true;
    const args = parse.count_substrings(recvd);

    while (true) {
        if (args == 5) {
            break;
        }
        if (args == 4) {
            repl2exists = false;
            break;
        }
        return error.BadFormat;
    }

    const parsed = try parse.cut_tail_size(recvd);

    const alm = try cn.pool.get(0);
    errdefer cn.pool.put(alm);

    alm.letter.prepare(.MSG);
    try cn.read_buffer(&alm.letter.payload, parsed.size + 2); // ␍␊
    try alm.letter.payload.shrink(2);

    var procstrs = try parse.cut_tail(parsed.shrinked);

    if (repl2exists) {
        try alm.letter.reply_to.copy(procstrs.tail);
        procstrs = try parse.cut_tail(procstrs.shrinked);
    }

    try alm.letter.sid.copy(procstrs.tail);

    procstrs = try parse.cut_tail(procstrs.shrinked);
    try alm.letter.subject.copy(procstrs.tail);

    return alm;
}

// =======================================
//          HMSG [Server=>Subscriber]
// =======================================
// HMSG <SUBJECT> <SID> [REPLY] <HDR_LEN> <TOT_LEN>
// <PAYLOAD>
//
// HMSG SUBJECT 1 REPLY 23 30␍␊NATS/1.0␍␊Header: X␍␊␍␊PAYLOAD␍␊
// HMSG SUBJECT 1 REPLY 23 23␍␊NATS/1.0␍␊Header: X␍␊␍␊␍␊
// HMSG SUBJECT 1 REPLY 48 55␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊PAYLOAD␍␊
// HMSG SUBJECT 1 REPLY 48 48␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊␍␊
//
//
// HDR_LEN includes the entire serialized header, from the start of the version string (NATS/1.0)
// up to and including the ␍␊ before the payload
//
// TOT_LEN the payload length plus the HDR_LEN
//
// [My notes] if HDR_LEN == TOT_LEN => empty payload without ␍␊
//
fn read_HMSG(cn: *Conn) !?*AllocatedMSG {
    const recvd = cn.line.body().?;

    var repl2exists: bool = true;
    const args = parse.count_substrings(recvd);

    while (true) {
        if (args == 6) {
            break;
        }
        if (args == 5) {
            repl2exists = false;
            break;
        }
        return error.BadFormat;
    }

    var parsed = try parse.cut_tail_size(recvd);

    var alm = try cn.pool.get(0);
    errdefer cn.pool.put(alm);

    alm.letter.prepare(.HMSG);

    const TOT_LEN = parsed.size;
    parsed = try parse.cut_tail_size(parsed.shrinked);

    const HDR_LEN = parsed.size;

    try cn.read_buffer(&alm.letter.headers.buffer, HDR_LEN);
    try alm.letter.headers.buffer.shrink(2); // remove ␍␊

    if (HDR_LEN == TOT_LEN) {
        alm.letter.payload.reset();
    } else {
        try cn.read_buffer(&alm.letter.payload, TOT_LEN - HDR_LEN + 1);
        try alm.letter.payload.shrink(2); // remove ␍␊
    }

    var procstrs = try parse.cut_tail(parsed.shrinked);

    if (repl2exists) {
        try alm.letter.reply_to.copy(procstrs.tail);
        procstrs = try parse.cut_tail(procstrs.shrinked);
    }

    try alm.letter.sid.copy(procstrs.tail);

    procstrs = try parse.cut_tail(procstrs.shrinked);
    try alm.letter.subject.copy(procstrs.tail);

    return alm;
}

fn read_mt(cn: *Conn) !MT {
    try cn.read_line();

    const recvd = cn.line.body();
    if (recvd != null) {
        const mt = MT.from_line(recvd.?);
        return mt;
    } else {
        return error.NoCRLF;
    }
}

// Reads underlying stream include \r\n or \n to the internal buffer.
fn read_line(cn: *Conn) !void {
    if (cn.client == null) {
        return error.CommunicationFailure;
    }

    cn.line.reset();

    try cn.setTimeOut();

    while (!cn.wasRaised()) {
        cn.sendHeartBit();
        const byte: u8 = cn.client.?.readByte() catch |er| {
            if (er == error.WouldBlock) {
                continue;
            }
            return er;
        };

        var addIt: [1]u8 = undefined;
        addIt[0] = byte;

        try cn.line.append(&addIt);

        if (byte == '\r') {
            continue;
        }

        if (byte == '\n') {
            try cn.resetTimeOut();
            return;
        }
    }

    return error.WasCancelled;
}

fn connectTcp(cn: *Conn, co: protocol.ConnectOpts) !*Client {
    const cl = try cn.allocator.create(Client);
    errdefer cn.allocator.destroy(cl);

    cl.* = try Client.connect(cn.allocator, co);

    return cl;
}

pub fn raiseAttention(cn: *Conn) void {
    cn.client.?.raiseAttention();
}

inline fn wasRaised(cn: *Conn) bool {
    return cn.client.?.wasRaised();
}

fn waitFinish(cn: *Conn) void {
    cn.thread.join();
}

fn setTimeOut(_: *Conn) !void {
    // try cn.client.?.setTimeOut();
}

fn resetTimeOut(_: *Conn) !void {
    // try cn.client.?.resetTimeOut();
}

pub fn requestNMT(cn: *Conn, subject: []const u8, headers: ?*Headers, payload: ?[]const u8, timeout_ns: u64) !*AllocatedMSG {
    if (!cn.subscribed) {
        try cn.printMT("SUB {0s}.* {1d} \r\n", .{ cn.inbox[0..36], cn.nextSidNMT() });
        cn.req_sid = cn.next;
        cn.subscribed = true;
    }

    // Send requestNMT
    const REPLY_TO = try cn.nextReply2NMT();
    try cn.publish(subject, REPLY_TO, headers, payload);

    return cn.waitMessageNMT(timeout_ns, REPLY_TO);
}

pub fn nextReply2NMT(cn: *Conn) ![]const u8 {
    const REPLY_TO = try cn.req_reply2.sprintf("{0s}.{1d}", .{ cn.inbox[0..36], cn.nextSidNMT() });
    return REPLY_TO.?;
}

pub fn nextSidNMT(cn: *Conn) u64 {
    cn.next += 1;
    return cn.next;
}

pub fn waitMessageNMT(cn: *Conn, timeout_ns: u64, subject: ?[]const u8) error{ CommunicationFailure, Interrupted, Closed, NotConnected, Timeout }!*AllocatedMSG {
    _ = subject;

    var timeout_timer = std.time.Timer.start() catch unreachable;

    var local_timeout_ns = timeout_ns;

    while (true) {
        const recv = try cn.fetch(local_timeout_ns);
        const rmt = recv.*.letter.mt;

        if ((recv.*.letter.mt == .MSG) or (recv.*.letter.mt == .HMSG)) {
            // if (subject == null) {
            //     return recv;
            // }
            //
            // if (std.mem.eql(u8, subject.?, recv.letter.Subject().?)) {
            //     return recv;
            // }
            // cn.reuse(recv);
            // continue;
            return recv;
        }

        cn.reuse(recv);

        switch (rmt) {
            .PING => {
                cn.pong() catch {
                    return error.CommunicationFailure;
                };
            },
            .PONG, .OK => {},
            .INTERRUPT => {
                return error.Interrupted;
            },
            // .INFO .CONNECT .SUB .UNSUB .ERR
            else => {
                return error.CommunicationFailure;
            },
        }

        const elapsed = timeout_timer.read();

        if (elapsed > timeout_ns)
            return error.Timeout;

        local_timeout_ns = timeout_ns - elapsed;
    }
}

fn read_PUB(cn: *Conn) !?*AllocatedMSG {
    _ = cn;
    return error.NotImplemented;
}

fn read_HPUB(cn: *Conn) !?*AllocatedMSG {
    _ = cn;
    return error.NotImplemented;
}

fn run(cn: *Conn) void {
    cn.allow_heartBit = true;

    while (!cn.wasRaised()) {
        cn.sendHeartBit();

        if (cn.read_msg()) |almsg| {
            if (almsg == null) {
                continue;
            }
            if (cn.received.send(almsg.?)) |_| {
                continue;
            } else |_| {
                break;
            }
        } else |_| {
            break;
        }
    }

    return;
}

const DefaultHeartBitTimeOut = 1 * protocol.SECNS;

fn sendHeartBit(cn: *Conn) void {
    const elapsed = cn.timeout_timer.read();
    if (elapsed > DefaultHeartBitTimeOut) {
        if (cn.allow_heartBit) {
            cn.ping() catch {};
        }
        cn.timeout_timer.reset();
    }
}

//
// MT writes
//

pub fn printMT(cn: *Conn, comptime fmt: []const u8, args: anytype) !void {
    cn.mutex.lock();
    defer cn.mutex.unlock();

    try cn.printNMT(fmt, args);

    return;
}

pub fn writeMT(cn: *Conn, buffer: []const u8) !void {
    cn.mutex.lock();
    defer cn.mutex.unlock();

    try cn.writeNMT(buffer);
    return;
}

pub fn writevMT(cn: *Conn, iovecs: []posix.iovec_const) !void {
    cn.mutex.lock();
    defer cn.mutex.unlock();

    try cn.writevNMT(iovecs);
    return;
}

//
// Non MT writes
//
pub fn printNMT(cn: *Conn, comptime fmt: []const u8, args: anytype) !void {
    // try cn._format(fmt, args, &cn.printbuf);
    if (cn.printbuf.sprintf(fmt, args)) |fstr| {
        if (fstr == null) {
            return;
        }
        try cn.writeAll(fstr.?);
    } else |serr| {
        return serr;
    }

    return;
}

pub fn writeNMT(cn: *Conn, buffer: []const u8) !void {
    if (cn.client == null) {
        return error.CommunicationFailure;
    }
    if (buffer.len == 0) {
        return;
    }
    try cn.writeAll(buffer);
}

pub fn writevNMT(cn: *Conn, iovecs: []posix.iovec_const) !void {
    if (cn.client == null) {
        return error.CommunicationFailure;
    }
    if (iovecs.len == 0) {
        return;
    }
    try cn.writevAll(iovecs);
}

//
// Non MT write wrappers
//
pub fn writeAll(cn: *Conn, bytes: []const u8) !void {
    try cn.client.?.writeAll(bytes);
}

fn writevAll(cn: *Conn, iovecs: []posix.iovec_const) !void {
    try cn.client.?.writevAll(iovecs);
}

//
// Non MT read wrappers
//
fn readByte(cn: *Conn) !?u8 {
    return cn.client.?.readByte();
}

// fn read(cn: *Conn, buffer: []u8) !usize {
//     return try cn.client.?.read(buffer);
// }

fn readAll(cn: *Conn, buffer: []u8) !usize {
    return try cn.client.?.readAll(buffer);
}

// Reads 'len' bytes from underlying stream to the buffer.
fn read_buffer(cn: *Conn, buffer: *Appendable, len: usize) !void {
    if (cn.client == null) {
        return error.CommunicationFailure;
    }

    buffer.reset();

    if (len == 0) {
        return;
    }

    try buffer.alloc(len);

    const rlen = try cn.readAll(buffer.buffer.?[0..len]);

    if (rlen < len) {
        return error.NoCRLF;
    }

    try buffer.change(rlen);

    return;
}

const zul = @import("zul");

pub const UUID = zul.UUID;

/// Unique ID used as INBOX
/// in Request/Reply flow
pub fn newInbox() ![36]u8 {
    const uuid4 = UUID.v4();
    return UUID.binToHex(&uuid4.bin, .upper);
}

const std = @import("std");
const builtin = @import("builtin");
const posix = std.posix;
const Allocator = std.mem.Allocator;
const Thread = std.Thread;
const Mutex = std.Thread.Mutex;

const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const Client = @import("Client.zig");
const messages = @import("messages.zig");
const Appendable = @import("Appendable.zig");
const Formatter = @import("Formatter.zig");

const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;
pub const alloc = messages.alloc;
pub const Messages = messages.Messages;
pub const AllocatedMSG = messages.AllocatedMSG;
