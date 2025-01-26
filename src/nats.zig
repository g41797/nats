// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");
const err = @import("err.zig");
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

const net = std.net;
const posix = std.posix;
const Connection = net.Stream;
const Stream = net.Stream;
const Socket = posix.socket_t;
const Allocator = std.mem.Allocator;
const Thread = std.Thread;
const Mutex = std.Thread.Mutex;
const Sema = std.Thread.Semaphore;

const ReturnedError = err.ReturnedError;
const Appendable = protocol.Appendable;
const MT = protocol.MessageType;
const Header = protocol.Header;
const Headers = protocol.Headers;
const HeaderIterator = protocol.HeaderIterator;
pub const alloc = messages.alloc;
pub const Messages = messages.Messages;
pub const AllocatedMSG = messages.AllocatedMSG;

const CRLF: [2]u8 = .{
    '\r',
    '\n',
};

pub const DefaultAddr = "127.0.0.1";
pub const DefaultPort = 4222;

pub const ConnectOpts = struct {
    addr: ?[]const u8 = DefaultAddr,
    port: ?u16 = DefaultPort,
};

const ConnectString = "CONNECT {\"verbose\":false,\"pedantic\":false,\"tls_required\":false,\"lang\":\"Zig\",\"version\":\"T.B.D\",\"protocol\":0,\"echo\":true}\r\n";
const InfoString = "INFO {\"server_id\":\"SID\",\"server_name\":\"SNAM\",\"proto\":1,\"headers\":true,\"max_payload\":1048576,\"jetstream\":true}\r\n";

pub const Conn = struct {
    mutex: Mutex = .{},
    allocator: Allocator = undefined,
    connection: ?*Connection = null,
    line: Appendable = .{},
    printbuf: Appendable = .{},
    fbs: std.io.FixedBufferStream([]u8) = undefined,

    attention: Sema = .{},
    thread: Thread = undefined,
    pool: Messages = .{},
    received: Messages = .{},

    pub fn connect(cn: *Conn, allocator: Allocator, co: ConnectOpts) !void {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        if (cn.connection != null) {
            return error.AlreadyConnected;
        }

        cn.allocator = allocator;

        var host: []const u8 = DefaultAddr;

        if (co.addr != null) {
            host = co.addr.?;
        }

        var prt: u16 = DefaultPort;

        if (co.port != null) {
            prt = co.port.?;
        }

        cn.connection = try cn.connectTcp(host, prt);

        errdefer cn.disconnect();

        try cn.line.init(allocator, 128, 32);
        try cn.printbuf.init(allocator, 128, 32);

        const mt = try cn.read_mt();

        if (mt != .INFO) {
            return error.ProtocolError;
        }

        try cn.connection.?.writer().writeAll(ConnectString);

        cn.fbs = std.io.fixedBufferStream(cn.printbuf.buffer.?);

        cn.thread = std.Thread.spawn(.{}, run, .{cn}) catch unreachable;
        cn.pool.init(allocator);
        cn.received.init(allocator);

        return;
    }

    pub fn disconnect(cn: *Conn) void {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        if (cn.connection == null) {
            return;
        }

        cn.connection.?.close();

        cn.line.deinit();
        cn.printbuf.deinit();

        cn.raiseAttention();
        cn.waitFinish();

        cn.allocator.destroy(cn.connection.?);
        cn.connection = null;
        cn.pool.deinit();
        cn.received.deinit();

        return;
    }

    pub fn fetch(cn: *Conn, timeout_ns: u64) !?*AllocatedMSG {
        if (cn.received.receive(timeout_ns)) |recvd| {
            return recvd;
        } else |rerr| {
            return rerr;
        }
    }

    // =======================================
    //            PUB [Publisher=>Server]
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
    // =======================================
    pub fn PUB(cn: *Conn, subject: []const u8, reply2: ?[]const u8, payload: ?[]const u8) !void {
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

        try cn.print("PUB {0s} {1s} {2d}\r\n", .{ subject, repl, body.len });

        var buffers: [2]std.posix.iovec_const = .{
            .{ .base = body.ptr, .len = body.len },
            .{ .base = &CRLF, .len = CRLF.len },
        };

        try cn.writev(&buffers);

        return;
    }

    // =======================================
    //          HPUB [Publisher=>Server]
    // =======================================
    // HPUB <subject> [reply-to] <#header bytes> <#total bytes>␍␊[headers]␍␊␍␊[payload]␍␊
    //
    // HPUB FOO 22 33␍␊NATS/1.0␍␊Bar: Baz␍␊␍␊Hello NATS!␍␊
    //
    // HPUB FRONT.DOOR JOKE.22 45 56␍␊NATS/1.0␍␊BREAKFAST: donut␍␊LUNCH: burger␍␊␍␊Knock Knock␍␊
    //
    // HPUB MORNING.MENU 47 51␍␊NATS/1.0␍␊BREAKFAST: donut␍␊BREAKFAST: eggs␍␊␍␊Yum!␍␊
    //
    // HPUB <SUBJ> [REPLY] <HDR_LEN> <TOT_LEN> <HEADER><PAYLOAD>
    //
    // HDR_LEN includes the entire serialized header,
    // from the start of the version string (NATS/1.0)
    // up to and including the ␍␊ before the payload
    //
    // TOT_LEN the payload length plus the HDR_LEN
    // =======================================
    pub fn HPUB(cn: *Conn, subject: []const u8, reply2: ?[]const u8, headers: *Headers, payload: ?[]const u8) !void {
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

        try cn.print("HPUB {0s} {1s} {2d} {3d}\r\n", .{ subject, repl, HDR_LEN, TOT_LEN });

        var buffers: [4]posix.iovec_const = .{
            .{ .base = headers.buffer.body().?.ptr, .len = headers.buffer.body().?.len },
            .{ .base = CRLF.ptr, .len = CRLF.len },
            .{ .base = body.ptr, .len = body.len },
            .{ .base = CRLF.ptr, .len = CRLF.len },
        };

        try cn.writev(&buffers);

        return;
    }

    // =======================================
    //          SUB [Subscriber=>Server]
    // =======================================
    // SUB <subject> [queue group] <sid>␍␊
    pub fn SUB(cn: *Conn, subject: []const u8, queue_group: ?[]const u8, sid: []const u8) !void {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        var qgr: []const u8 = undefined;

        if (queue_group == null) {
            qgr = "";
        } else {
            qgr = queue_group.?;
        }

        try cn.print("SUB {0s} {1s} {2s}\r\n", .{ subject, qgr, sid });

        return;
    }

    // =======================================
    //          UNSUB [Subscriber=>Server]
    // =======================================
    // UNSUB <sid>  [max_msgs]␍␊
    pub fn UNSUB(cn: *Conn, sid: []const u8, max_msgs: ?u32) !void {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        var mm: u32 = undefined;

        if (max_msgs == null) {
            mm = 0;
        } else {
            mm = max_msgs.?;
        }

        if (mm == 0) {
            try cn.print("UNSUB {0s}\r\n", .{sid});
        } else {
            try cn.print("UNSUB {0s} {1d}\r\n", .{ sid, mm });
        }
        return;
    }

    // =======================================
    // PING/PONG [Client<=>Server]
    // =======================================
    pub fn PING(cn: *Conn) !void {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        try cn.write("PING\r\n");
    }
    pub fn PONG(cn: *Conn) !void {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        try cn.write("PONG\r\n");
    }

    pub fn reuse(cn: *Conn, msg: *AllocatedMSG) void {
        cn.pool.put(msg);
    }

    // Writes the formatted output to underlying stream.
    pub fn print(cn: *Conn, comptime fmt: []const u8, args: anytype) !void {
        if (cn.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        while (true) {
            if (cn._print(fmt, args)) |_| {
                break;
            } else |_| {
                _ = try cn.printbuf.alloc(cn.printbuf.buffer.?.len + 256);
                cn.fbs = std.io.fixedBufferStream(cn.printbuf.buffer.?);
                continue;
            }
        }
        try cn.connection.?.writeAll(cn.printbuf.body().?);
    }

    pub fn _print(cn: *Conn, comptime fmt: []const u8, args: anytype) !void {
        cn.*.fbs.reset();
        _ = try cn.*.fbs.writer().print(fmt, args);
        try cn.printbuf.change(cn.*.fbs.getWritten().len);
    }

    // Writes the buffer to underlying stream.
    pub fn write(cn: *Conn, buffer: []const u8) !void {
        if (cn.connection == null) {
            return ReturnedError.CommunicationFailure;
        }
        if (buffer.len == 0) {
            return;
        }
        try cn.connection.?.writeAll(buffer);
    }

    // Writes the buffers to underlying stream.
    pub fn writev(cn: *Conn, iovecs: []posix.iovec_const) !void {
        if (cn.connection == null) {
            return ReturnedError.CommunicationFailure;
        }
        if (iovecs.len == 0) {
            return;
        }
        try cn.connection.?.writevAll(iovecs);
    }

    pub fn read_msg(cn: *Conn) !?*AllocatedMSG {
        if (cn.read_mt()) |mt| {
            switch (mt) {
                .UNKNOWN => {
                    return ReturnedError.CommunicationFailure;
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
    fn read_oneliner(cn: *Conn, mt: MT) !?*AllocatedMSG {
        const alm = cn.pool.get(0).?;

        try alm.letter.prepare(mt);

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

        const alm = cn.pool.get(0).?;
        errdefer cn.pool.put(alm);

        try alm.letter.prepare(.MSG);
        try cn.read_buffer(&alm.letter.payload, parsed.size + 2); // ␍␊
        try alm.letter.payload.shrink(2);

        var procstrs = try parse.cut_tail(parsed.shrinked);

        if (repl2exists) {
            try alm.letter.reply_to.copy(procstrs.tail);
            procstrs = try parse.cut_tail(parsed.shrinked);
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

        var alm = cn.pool.get(0).?;
        errdefer cn.pool.put(alm);

        try alm.letter.prepare(.HMSG);

        const TOT_LEN = parsed.size;
        parsed = try parse.cut_tail_size(parsed.shrinked);

        const HDR_LEN = parsed.size;

        try cn.read_buffer(&alm.letter.headers.buffer, HDR_LEN);
        try alm.letter.headers.buffer.shrink(2); // remove ␍␊

        try cn.read_buffer(&alm.letter.payload, TOT_LEN - HDR_LEN + 1);
        try alm.letter.payload.shrink(2); // remove ␍␊

        var procstrs = try parse.cut_tail(parsed.shrinked);

        if (repl2exists) {
            try alm.letter.reply_to.copy(procstrs.tail);
            procstrs = try parse.cut_tail(parsed.shrinked);
        }

        try alm.letter.sid.copy(procstrs.tail);

        procstrs = try parse.cut_tail(parsed.shrinked);
        try alm.letter.subject.copy(procstrs.tail);

        return alm;
    }

    pub fn read_mt(cn: *Conn) !MT {
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
        if (cn.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        try cn.line.reset();

        while (true) {
            var str: [1]u8 = undefined;
            if (cn.connection.?.readAll(&str)) |_| {
                try cn.line.append(str[0..1]);

                if (str[0] == '\r') {
                    continue;
                }

                if (str[0] == '\n') {
                    return;
                }
            } else |er| {
                return er;
            }
        }

        return error.NoCRLF;
    }

    // Reads 'len' bytes from underlying stream to the buffer.
    pub fn read_buffer(cn: *Conn, buffer: *Appendable, len: usize) !void {
        if (cn.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        try buffer.reset();

        if (len == 0) {
            return;
        }

        try buffer.alloc(len);

        const rlen = try cn.connection.?.readAll(buffer.buffer.?[0..len]);

        if (rlen < len) {
            return error.NoCRLF;
        }

        try buffer.change(rlen);

        return;
    }

    fn connectTcp(client: *Conn, host: []const u8, port: u16) !*Connection {
        const conn = try client.allocator.create(Connection);
        errdefer client.allocator.destroy(conn);

        const stream = try net.tcpConnectToHost(client.allocator, host, port);
        errdefer stream.close();

        conn.* = stream;

        return conn;
    }

    fn useTcp(client: *Conn, socket: Socket) !*Connection {
        const conn = try client.allocator.create(Connection);
        errdefer client.allocator.destroy(conn);

        conn.* = Stream{ .handle = socket };

        return conn;
    }

    pub fn publish(cn: *Conn, subject: []const u8, reply2: ?[]const u8, headers: ?*Headers, payload: ?[]const u8) !void {
        if ((headers == null) or (headers.?.buffer.body() == null) or (headers.?.buffer.body().?.len == 0)) {
            return cn.PUB(subject, reply2, payload);
        }
        return cn.HPUB(subject, reply2, headers.?, payload);
    }

    pub fn use(cn: *Conn, allocator: Allocator, socket: Socket) !void {
        cn.mutex.lock();
        defer cn.mutex.unlock();

        cn.allocator = allocator;

        cn.connection = try cn.useTcp(socket);

        errdefer cn.disconnect();

        try cn.line.init(allocator, 128, 32);
        try cn.printbuf.init(allocator, 128, 32);
        cn.fbs = std.io.fixedBufferStream(cn.printbuf.buffer.?);

        try cn.connection.?.writer().writeAll(InfoString);

        const mt = try cn.read_mt();

        if (mt != .CONNECT) {
            return error.ProtocolError;
        }

        return;
    }

    pub fn MSG(cn: *Conn, subject: []const u8, sid: []const u8, reply2: []const u8, payload: []const u8) !void {
        try cn.print("MSG {0s} {1s} {2s} {3d}\r\n", .{ subject, sid, reply2, payload.len });

        var buffers: [2]posix.iovec_const = .{
            .{ .base = payload.ptr, .len = payload.len },
            .{ .base = CRLF.ptr, .len = CRLF.len },
        };

        try cn.writev(&buffers);
        return;
    }

    pub fn HMSG(cn: *Conn, subject: []const u8, sid: []const u8, reply2: []const u8, headers: *Headers, payload: []const u8) !void {
        const HDR_LEN = headers.buffer.body().?.len + 1; // +1 for ␍␊
        const TOT_LEN = HDR_LEN + payload.len;

        try cn.print("HMSG {0s} {1s} {2s} {3d} {4d}\r\n", .{ subject, sid, reply2, HDR_LEN, TOT_LEN });

        var buffers: [4]posix.iovec_const = .{
            .{ .base = headers.buffer.body().?.ptr, .len = headers.buffer.body().?.len },
            .{ .base = CRLF.ptr, .len = CRLF.len },
            .{ .base = payload.ptr, .len = payload.len },
            .{ .base = CRLF.ptr, .len = CRLF.len },
        };

        try cn.writev(&buffers);

        return;
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
        while (!cn.wasRaised()) {
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

    fn raiseAttention(cn: *Conn) void {
        _ = cn.attention.post();
    }

    inline fn wasRaised(cn: *Conn) bool {
        if (cn.attention.timedWait(0)) |_| {
            return true;
        } else |_| {
            return false;
        }
    }

    fn waitFinish(cn: *Conn) void {
        cn.thread.join();
    }
};

const ClientOpts = struct {
    verbose: bool = false,
    pedantic: bool = false,
    tls_required: bool = false,
    auth_token: ?[]const u8 = null,
    user: ?[]const u8 = null,
    pass: ?[]const u8 = null,
    lang: []const u8 = "Zig",
    version: []const u8 = "TBD",
    protocol: []const u8 = "0",
    echo: bool = false,
    sig: ?[]const u8 = null,
    headers: bool = true,
    nkey: ?[]const u8 = null,
};
