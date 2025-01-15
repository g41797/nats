// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const net = std.net;
const http = std.http;
const Connection = net.Stream;
const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const Appendable = protocol.Appendable;
const MT = protocol.MessageType;
const Header = protocol.Header;
const Headers = protocol.Headers;
const HeaderIterator = protocol.HeaderIterator;

pub const DefaultAddr = "127.0.0.1";
pub const DafaultPort = 4222;

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
    mutex: Mutex = .{},
    allocator: Allocator = undefined,
    connection: ?*Connection = null,
    line: Appendable = undefined,

    /// Returns connected to NATS client.
    /// Arguments:
    ///     allocator:
    ///     addr: IPv4 address or host name, for null - DefaultAddr is used
    ///     port: TCP/IP port,  for null - DafaultPort is used
    ///
    /// Returns errors for:
    ///     - failed connection
    ///     - already existing connection
    pub fn connect(cl: *Client, allocator: Allocator, addr: ?[]const u8, port: ?u16) !void {
        cl.mutex.lock();
        defer cl.mutex.unlock();

        if (cl.connection != null) {
            return error.AlreadyConnected;
        }

        cl.allocator = allocator;

        var host: []const u8 = DefaultAddr;

        if (addr != null) {
            host = addr.?;
        }

        var prt: u16 = DafaultPort;

        if (port != null) {
            prt = port.?;
        }

        cl.connection = try cl.connectTcp(host, prt);

        errdefer cl.disconnect();

        try cl.line.init(allocator, 128, 32);

        const mt = try cl.read_mt();

        if (mt != .INFO) {
            return error.ProtocolError;
        }

        try cl.connection.?.writer().writeAll(ConnectString);

        return;
    }

    pub fn disconnect(cl: *Client) void {
        cl.mutex.lock();
        defer cl.mutex.unlock();

        if (cl.connection == null) {
            return;
        }

        cl.connection.?.close();

        cl.allocator.destroy(cl.connection.?);

        cl.connection = null;
        cl.line.deinit();

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
        cl.mutex.lock();
        defer cl.mutex.unlock();

        if (cl.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        try cl.connection.?.writer().print(fmt, args);
    }

    // Writes the buffer to underlying stream.
    pub fn write(cl: *Client, buffer: []const u8) !void {
        cl.mutex.lock();
        defer cl.mutex.unlock();

        if (cl.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        try cl.connection.?.writer().writeAll(buffer);
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
    pub fn read_buffer(cl: *Client, buffer: Appendable, len: usize) !void {
        if (cl.connection == null) {
            return ReturnedError.CommunicationFailure;
        }

        try buffer.reset();

        if (len == 0) {
            return;
        }

        try buffer.alloc(len);

        const rlen = try cl.connection.?.reader().readAll(buffer.buffer[0..len]);

        if (rlen < len) {
            return ReturnedError.NoCRLF;
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
