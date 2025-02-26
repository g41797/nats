// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const testing = std.testing;

const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const Appendable = @import("Appendable.zig");
const Conn = @import("Conn.zig");
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = protocol.HeaderIterator;

test "new inbox" {
    const inbox = try Conn.newInbox();
    _ = inbox;
}

test "appendable" {
    var ap: Appendable = .{};
    try ap.init(std.testing.allocator, 1, 1);
    defer ap.deinit();

    const line = "0123456789";
    try ap.copy(line);
    try testing.expectEqual(std.mem.eql(u8, line, ap.body().?), true);
    try ap.append(line);
    try ap.shrink(2);
    try testing.expectEqual(std.mem.eql(u8, "012345678901234567", ap.body().?), true);
}

test "from_line" {
    const line = "HMSG SUBJECT 1 REPLY 23 30\r\n";
    var mt = MT.from_line(line);
    try testing.expectEqual(mt, MT.HMSG);
    try testing.expectEqual(mt.has_header(), true);
    try testing.expectEqual(mt.has_payload(), true);

    const line2 = "MSG FOO.BAR 9 11\r\n";
    mt = MT.from_line(line2);
    try testing.expectEqual(mt, MT.MSG);
    try testing.expectEqual(mt.has_header(), false);
    try testing.expectEqual(mt.has_payload(), true);
}

test "to string" {
    const line = "HMSG SUBJECT 1 REPLY 23 30\r\n";
    const mt = MT.from_line(line);

    try testing.expectEqual(std.mem.eql(u8, "HMSG", MT.to_string(mt).?), true);
}

test "headers" {
    var hs: Headers = .{};
    try hs.init(std.testing.allocator, 8);
    defer hs.deinit();

    try hs.append("1", " 1111111111 ");
    try hs.append("2", " 2222222222 ");
    try hs.append("3", " 3333333333 ");
    try hs.append("4", " 4444444444 ");

    const h1: Header = .{ .name = "1", .value = "1111111111" };
    const h4: Header = .{ .name = "4", .value = "4444444444" };

    var hit = try hs.hiter();

    var hdr = hit.next() orelse unreachable;
    _ = hit.next() orelse unreachable;
    _ = hit.next() orelse unreachable;

    try testing.expectEqual(std.mem.eql(u8, hdr.name, h1.name), true);
    try testing.expectEqual(std.mem.eql(u8, hdr.value, h1.value), true);

    hdr = hit.next() orelse unreachable;

    try testing.expectEqual(std.mem.eql(u8, hdr.name, h4.name), true);
    try testing.expectEqual(std.mem.eql(u8, hdr.value, h4.value), true);

    try testing.expect(hit.next() == null);
}
