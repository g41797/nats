// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const testing = std.testing;
const expect = testing.expect;
const net = std.net;
const http = std.http;
const Connection = http.Conn.Connection;
const Allocator = std.mem.Allocator;

const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const Appendable = protocol.Appendable;
const MT = protocol.MessageType;
const Header = protocol.Header;
const Headers = protocol.Headers;
const HeaderIterator = protocol.HeaderIterator;
const nats = @import("nats.zig");
const Conn = nats.Conn;

const SECNS = 1000000000;

test "connect disconnect" {
    var cl: Conn = .{};
    try cl.connect(std.testing.allocator, .{});
    defer cl.disconnect();
}

test "PING-PONG" {
    var cl: Conn = .{};
    try cl.connect(std.testing.allocator, .{});
    defer cl.disconnect();

    try cl.PING();
    try cl.PONG();
}

const mailbox = @import("mailbox");
const messages = @import("messages.zig");
const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;

const NOTIFY: []const u8 = "NOTIFY";

test "PUB-SUB" {
    var sb: Conn = .{};
    try sb.connect(std.testing.allocator, .{});
    defer sb.disconnect();

    // SUB <subject> [queue group] <sid>␍␊
    // SUB NOTIFY                  NSID
    try sb.SUB(NOTIFY, null, "NSID");

    var pb: Conn = .{};
    try pb.connect(std.testing.allocator, .{});
    defer pb.disconnect();

    // PUB <subject> [reply-to] <#bytes>␍␊[payload]␍␊
    // PUB NOTIFY 0␍␊␍␊     #bytes == 0 => empty payload
    try pb.PUB(NOTIFY, null, null);

    const rmsg = try wait(&sb, .MSG);

    try testing.expectEqual(std.mem.eql(u8, NOTIFY, rmsg.letter.Subject().?), true);

    sb.reuse(rmsg);

    // UNSUB <sid>
    try sb.UNSUB("NSID", null);

    return;
}

fn wait(cl: *Conn, mt: MT) !*AllocatedMSG {
    for (0..10) |_| {
        const recv = try cl.fetch(SECNS * 10);

        try testing.expect(recv != null);

        const almsg = recv.?;

        //std.io.getStdOut().writer().print("Receive message {0s}\r\n", .{almsg.*.letter.mt.to_string().?}) catch unreachable;

        if (almsg.*.letter.mt == mt) {
            return almsg;
        }

        const rmt = almsg.letter.mt;

        cl.reuse(almsg);

        switch (rmt) {
            .PING => {
                try cl.PONG();
                continue;
            },
            .PONG, .OK => {
                continue;
            },
            // .INFO .CONNECT .SUB .UNSUB .ERR
            else => {
                return ReturnedError.CommunicationFailure;
            },
        }
    }

    return error.NotReceived;
}

// test "server listen" {
//     var srv: Srv = .{};
//     const port = try srv.listen(std.testing.allocator);
//
//     try testing.expect(port != 0);
//
//     defer srv.close();
// }
//
// test "server accept 1" {
//     var srv: Srv = .{};
//     const port = try srv.listen(std.testing.allocator);
//     try testing.expect(port != 0);
//     defer srv.close();
//
//     srv.startAccept(1);
//
//     var cl: Conn = .{};
//     try cl.connect(std.testing.allocator, .{ .port = port });
//     defer cl.disconnect();
//
//     srv.waitAccept();
//
//     try testing.expectEqual(1, srv.connected.letters());
// }

const posix = std.posix;
const Socket = posix.socket_t;
const Thread = std.Thread;
const ServersMailBox = mailbox.MailBox(Conn);
const AllocatedConn = ServersMailBox.Envelope;

pub const Srv = struct {
    listener: Socket = undefined,
    allocator: Allocator = undefined,
    port: u16 = undefined,
    thread: Thread = undefined,
    connected: ServersMailBox = .{},
    count: u16 = 0,

    pub fn listen(srv: *Srv, allocator: Allocator) !u16 {
        srv.allocator = allocator;

        var address: std.net.Address = undefined;
        address = try std.net.Address.parseIp("127.0.0.1", 0);

        const listener = try posix.socket(address.any.family, posix.SOCK.STREAM, posix.IPPROTO.TCP);
        errdefer posix.close(listener);

        try posix.setsockopt(listener, posix.SOL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));

        try posix.bind(listener, &address.any, address.getOsSockLen());
        try posix.listen(listener, 128);

        var len: posix.socklen_t = @sizeOf(net.Address);

        try posix.getsockname(listener, &address.any, &len);

        const port: u16 = address.getPort();

        srv.listener = listener;
        srv.port = port;

        return port;
    }

    pub fn close(srv: *Srv) void {
        posix.close(srv.listener);

        var chain = srv.connected.close();
        if (chain != null) {
            const next = chain.?.next;
            chain.?.letter.disconnect();
            srv.allocator.destroy(chain.?);
            chain = next;
        }
    }

    pub fn startAccept(srv: *Srv, count: u16) void {
        srv.count = count;
        srv.thread = std.Thread.spawn(.{}, run, .{srv}) catch unreachable;
    }

    pub fn waitAccept(srv: *Srv) void {
        srv.thread.join();
    }

    fn accept(srv: *Srv) *AllocatedConn {
        var client_address: net.Address = undefined;
        var client_address_len: posix.socklen_t = @sizeOf(net.Address);
        const socket = posix.accept(srv.listener, &client_address.any, &client_address_len, 0) catch unreachable;
        errdefer posix.close(socket);

        var alc = srv.allocator.create(AllocatedConn) catch unreachable;
        alc.* = .{ .letter = .{} };
        alc.letter.use(srv.allocator, socket) catch unreachable;

        return alc;
    }

    fn run(srv: *Srv) void {
        for (0..srv.count) |_| {
            const cl = srv.accept();
            srv.connected.send(cl) catch unreachable;
        }
        return;
    }
};

pub const Server = struct {
    allocator: Allocator = undefined,
    alcon: *AllocatedConn = undefined,
    pool: Messages = .{},

    pub fn init(s: *Server, allocator: Allocator, alcon: *AllocatedConn) void {
        s.allocator = allocator;
        s.alcon = alcon;
        s.pool.init(allocator);
    }

    pub fn deinit(s: *Server) void {
        s.alcon.letter.disconnect();
        s.allocator.destroy(s.alcon);
    }

    pub fn read_msg(s: *Server) !?*AllocatedMSG {
        return s.alcon.letter.read_msg(s.pool);
    }

    pub fn reuse_msg(s: *Server, almsg: *AllocatedMSG) void {
        return s.pool.put(almsg);
    }
};
