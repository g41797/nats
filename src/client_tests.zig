// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const testing = std.testing;
const expect = testing.expect;
const net = std.net;
const http = std.http;
const Connection = http.Client.Connection;
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
const Client = @import("client.zig").Client;

test "connect disconnect" {
    var cl: Client = .{};
    try cl.connect(std.testing.allocator, null, null);
    defer cl.disconnect();
}

test "ping-pong" {
    var cl: Client = .{};
    try cl.connect(std.testing.allocator, null, null);
    defer cl.disconnect();

    try cl.ping();
    try cl.pong();
}
