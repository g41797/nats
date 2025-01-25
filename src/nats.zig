// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");
const err = @import("err.zig");
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

const net = std.net;
const http = std.http;
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

pub const DefaultAddr = "127.0.0.1";
pub const DefaultPort = 4222;

pub const ConnectOpts = struct {
    addr: ?[]const u8 = DefaultAddr,
    port: ?u16 = DefaultPort,
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

const ConnectString = "CONNECT {\"verbose\":false,\"pedantic\":false,\"tls_required\":false,\"lang\":\"Zig\",\"version\":\"T.B.D\",\"protocol\":0,\"echo\":true}\r\n";
const InfoString = "INFO {\"server_id\":\"SID\",\"server_name\":\"SNAM\",\"proto\":1,\"headers\":true,\"max_payload\":1048576,\"jetstream\":true}\r\n";

pub const Conn = struct {
    allocator: Allocator = undefined,
    connection: ?*Connection = null,
    line: Appendable = .{},
    printbuf: Appendable = .{},
    fbs: std.io.FixedBufferStream([]u8) = undefined,

    pub fn connect(cn: *Conn, allocator: Allocator, co: ConnectOpts) !void {
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

        return;
    }

    pub fn use(cn: *Conn, allocator: Allocator, socket: Socket) !void {
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

    pub fn disconnect(cn: *Conn) void {
        if (cn.connection == null) {
            return;
        }

        cn.connection.?.close();

        cn.allocator.destroy(cn.connection.?);

        cn.connection = null;
        cn.line.deinit();
        cn.printbuf.deinit();

        return;
    }

    pub fn publish(cn: *Conn, subject: []const u8, reply2: ?[]const u8, headers: ?*Headers, payload: ?[]const u8) !void {
        if ((headers == null) or (headers.?.buffer.body() == null) or (headers.?.buffer.body().?.len == 0)) {
            return cn.PUB(subject, reply2, payload);
        }
        return cn.HPUB(subject, reply2, headers.?, payload);
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
        try cn.write(body);
        try cn.write("\r\n");
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
        try cn.write(headers.buffer.body().?);
        try cn.write("\r\n");
        try cn.write(body);
        try cn.write("\r\n");

        return;
    }

    // =======================================
    //          SUB [Subscriber=>Server]
    // =======================================
    // SUB <subject> [queue group] <sid>␍␊
    pub fn SUB(cn: *Conn, subject: []const u8, queue_group: ?[]const u8, sid: []const u8) !void {
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
    // UNSUB <sid>
    pub fn UNSUB(cn: *Conn, sid: []const u8) !void {
        try cn.print("UNSUB {0s}\r\n", .{sid});

        return;
    }

    // =======================================
    // PING/PONG [Client<=>Server]
    // =======================================
    pub fn PING(cn: *Conn) !void {
        try cn.write("PING\r\n");
    }
    pub fn PONG(cn: *Conn) !void {
        try cn.write("PONG\r\n");
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
        try cn.connection.?.writer().writeAll(cn.printbuf.body().?);
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
        try cn.connection.?.writer().writeAll(buffer);
    }

    pub fn read_msg(cn: *Conn, pool: *Messages) !?*AllocatedMSG {
        if (cn.read_mt()) |mt| {
            switch (mt) {
                .UNKNOWN => {
                    return ReturnedError.CommunicationFailure;
                },
                .PUB => {
                    return cn.read_PUB(pool);
                },
                .HPUB => {
                    return cn.read_HPUB(pool);
                },
                .MSG => {
                    return cn.read_MSG(pool);
                },
                .HMSG => {
                    return cn.read_HMSG(pool);
                },
                // .INFO .CONNECT .SUB .UNSUB .PING .PONG .OK .ERR
                else => {
                    return cn.read_oneliner(mt, pool);
                },
            }
        } else |rerr| {
            return rerr;
        }
    }

    // .INFO .CONNECT .SUB .UNSUB .PING .PONG .OK .ERR
    fn read_oneliner(cn: *Conn, mt: MT, pool: *Messages) !?*AllocatedMSG {
        _ = cn;

        const alm = pool.get(0).?;

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
    fn read_MSG(cn: *Conn, pool: *Messages) !?*AllocatedMSG {
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

        const alm = pool.get(0).?;

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
    pub fn MSG(cn: *Conn, subject: []const u8, sid: []const u8, reply2: []const u8, payload: []const u8) !void {
        try cn.print("MSG {0s} {1s} {2s} {3d}\r\n", .{ subject, sid, reply2, payload.len });
        try cn.write(payload);
        try cn.write("\r\n");
        return;
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
    fn read_HMSG(cn: *Conn, pool: *Messages) !?*AllocatedMSG {
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

        var alm = pool.get(0).?;
        errdefer pool.put(alm);

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
    pub fn HMSG(cn: *Conn, subject: []const u8, sid: []const u8, reply2: []const u8, headers: *Headers, payload: []const u8) !void {
        const HDR_LEN = headers.buffer.body().?.len + 1; // +1 for ␍␊
        const TOT_LEN = HDR_LEN + payload.len;

        try cn.print("HMSG {0s} {1s} {2s} {3d} {4d}\r\n", .{ subject, sid, reply2, HDR_LEN, TOT_LEN });
        try cn.write(headers.buffer.body().?);
        try cn.write("\r\n");
        try cn.write(payload);
        try cn.write("\r\n");
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
            if (cn.connection.?.reader().readByte()) |char| {
                const str: [1]u8 = .{char};
                try cn.line.append(str[0..1]);

                if (char == '\r') {
                    continue;
                }

                if (char == '\n') {
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

        const rlen = try cn.connection.?.reader().readAll(buffer.buffer.?[0..len]);

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

    fn read_PUB(cn: *Conn, pool: *Messages) !?*AllocatedMSG {
        _ = cn;
        _ = pool;
        return error.NotImplemented;
    }

    fn read_HPUB(cn: *Conn, pool: *Messages) !?*AllocatedMSG {
        _ = cn;
        _ = pool;
        return error.NotImplemented;
    }
};
