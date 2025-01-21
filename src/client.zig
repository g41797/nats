// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");
const net = std.net;
const http = std.http;
const Connection = net.Stream;
const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");

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

const ConnectString = "CONNECT {{{\"verbose\":false,\"pedantic\":false,\"tls_required\":false,\"lang\":\"Zig\",\"version\":\"T.B.D\",\"protocol\":0,\"echo\":false}}}\r\n";

pub const Client = struct {
    allocator: Allocator = undefined,
    connection: ?*Connection = null,
    line: Appendable = undefined,
    printbuf: Appendable = undefined,
    fbs: std.io.FixedBufferStream([]u8) = undefined,

    pub fn connect(cl: *Client, allocator: Allocator, co: ConnectOpts) !void {
        if (cl.connection != null) {
            return error.AlreadyConnected;
        }

        cl.allocator = allocator;

        var host: []const u8 = DefaultAddr;

        if (co.addr != null) {
            host = co.addr.?;
        }

        var prt: u16 = DefaultPort;

        if (co.port != null) {
            prt = co.port.?;
        }

        cl.connection = try cl.connectTcp(host, prt);

        errdefer cl.disconnect();

        try cl.line.init(allocator, 128, 32);
        try cl.printbuf.init(allocator, 128, 32);

        const mt = try cl.read_mt();

        if (mt != .INFO) {
            return error.ProtocolError;
        }

        try cl.connection.?.writer().writeAll(ConnectString);

        cl.fbs = std.io.fixedBufferStream(cl.printbuf.buffer.?);

        return;
    }

    pub fn disconnect(cl: *Client) void {
        if (cl.connection == null) {
            return;
        }

        cl.connection.?.close();

        cl.allocator.destroy(cl.connection.?);

        cl.connection = null;
        cl.line.deinit();
        cl.printbuf.deinit();

        return;
    }

    pub fn ping(cl: *Client) !void {
        try cl.write("PING\r\n");
    }

    pub fn pong(cl: *Client) !void {
        try cl.write("PONG\r\n");
    }

    // Writes the formatted output to underlying stream.
    pub fn print(cl: *Client, comptime fmt: []const u8, args: anytype) !void {
        if (cl.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        while (true) {
            if (cl._print(fmt, args)) |_| {
                break;
            } else |_| {
                _ = try cl.printbuf.alloc(cl.printbuf.buffer.?.len + 256);
                cl.fbs = std.io.fixedBufferStream(cl.printbuf.buffer.?);
                continue;
            }
        }
        try cl.connection.?.writer().writeAll(cl.printbuf.body().?);
    }

    pub fn _print(cl: *Client, comptime fmt: []const u8, args: anytype) !void {
        cl.*.fbs.reset();
        _ = try cl.*.fbs.writer().print(fmt, args);
        try cl.printbuf.change(cl.*.fbs.getWritten().len);
    }

    // Writes the buffer to underlying stream.
    pub fn write(cl: *Client, buffer: []const u8) !void {
        if (cl.connection == null) {
            return ReturnedError.CommunicationFailure;
        }
        if (buffer.len == 0) {
            return;
        }
        try cl.connection.?.writer().writeAll(buffer);
    }

    pub fn read_msg(cl: *Client, pool: *Messages) !?*AllocatedMSG {
        const mt = try cl.read_mt();

        switch (mt) {
            .UNKNOWN => {
                return ReturnedError.CommunicationFailure;
            },
            .PING => {
                try cl.pong();
                return null;
            },
            .MSG => {
                return cl.read_MSG(pool);
            },
            .HMSG => {
                return cl.read_HMSG(pool);
            },
            else => {
                return null;
            },
        }
    }

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
    fn read_MSG(cl: *Client, pool: *Messages) !?*AllocatedMSG {
        const recvd = cl.line.body().?;

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
        try cl.read_buffer(&alm.letter.payload, parsed.size + 2); // ␍␊
        try alm.letter.payload.shrink(2);

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
    fn read_HMSG(cl: *Client, pool: *Messages) !?*AllocatedMSG {
        const recvd = cl.line.body().?;

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

        try cl.read_buffer(&alm.letter.headers.buffer, HDR_LEN);
        try alm.letter.headers.buffer.shrink(2); // remove ␍␊

        try cl.read_buffer(&alm.letter.payload, TOT_LEN - HDR_LEN + 1);
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

    pub fn read_mt(cl: *Client) !MT {
        try cl.read_line();

        const recvd = cl.line.body();
        if (recvd != null) {
            const mt = MT.from_line(recvd.?);
            return mt;
        } else {
            return error.NoCRLF;
        }
    }

    // Reads underlying stream exclude \r\n or \n to the internal buffer.
    fn read_line(cl: *Client) !void {
        if (cl.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        try cl.line.reset();

        while (true) {
            if (cl.connection.?.reader().readByte()) |char| {
                if (char == '\r') {
                    continue;
                }
                if (char == '\n') {
                    return;
                }
                const str: [1]u8 = .{char};
                try cl.line.append(str[0..1]);
            } else |er| {
                return er;
            }
        }

        return error.NoCRLF;
    }

    // Reads 'len' bytes from underlying stream to the buffer.
    pub fn read_buffer(cl: *Client, buffer: *Appendable, len: usize) !void {
        if (cl.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        try buffer.reset();

        if (len == 0) {
            return;
        }

        try buffer.alloc(len);

        const rlen = try cl.connection.?.reader().readAll(buffer.buffer.?[0..len]);

        if (rlen < len) {
            return error.NoCRLF;
        }

        return;
    }

    fn connectTcp(client: *Client, host: []const u8, port: u16) !*Connection {
        const conn = try client.allocator.create(Connection);
        errdefer client.allocator.destroy(conn);

        const stream = try net.tcpConnectToHost(client.allocator, host, port);
        errdefer stream.close();

        conn.* = stream;

        return conn;
    }
};
