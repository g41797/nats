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
const Srv = nats.Srv;

test "connect disconnect" {
    var cl: Conn = .{};
    try cl.connect(std.testing.allocator, .{});
    defer cl.disconnect();
}

test "ping-pong" {
    var cl: Conn = .{};
    try cl.connect(std.testing.allocator, .{});
    defer cl.disconnect();

    try cl.ping();
    try cl.pong();
}

test "server listen" {
    var srv: Srv = .{};
    const port = try srv.listen(std.testing.allocator);

    try testing.expect(port != 0);

    defer srv.close();
}

test "server accept 1" {
    var srv: Srv = .{};
    const port = try srv.listen(std.testing.allocator);
    try testing.expect(port != 0);
    defer srv.close();

    srv.startAccept(1);

    var cl: Conn = .{};
    try cl.connect(std.testing.allocator, .{ .port = port });
    defer cl.disconnect();

    srv.waitAccept();

    try testing.expectEqual(1, srv.connected.letters());
}
