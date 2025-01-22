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
const messages = @import("messages.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const Appendable = protocol.Appendable;
const MT = protocol.MessageType;
const Header = protocol.Header;
const Headers = protocol.Headers;
const HeaderIterator = protocol.HeaderIterator;
const nats = @import("nats.zig");
const Publisher = @import("Publisher.zig");
const Subscriber = @import("Subscriber.zig");
pub const Messages = messages.Messages;
pub const AllocatedMSG = messages.AllocatedMSG;

const SECNS = 1000000000;

// test "publisher/Subscriber connect disconnect" {
//     var pb: Publisher = .{};
//     try pb.connect(std.testing.allocator, .{});
//     defer pb.disconnect();
//
//     var sb: Subscriber = .{};
//     try sb.connect(std.testing.allocator, .{});
//     defer sb.disconnect();
// }

// test "simplest PUB/SUB" {
//     var pb: Publisher = .{};
//     try pb.connect(std.testing.allocator, .{});
//     defer pb.disconnect();
//
//     try pb.publish("subject", null, null, null);
//
//     var sb: Subscriber = .{};
//     try sb.connect(std.testing.allocator, .{});
//     defer sb.disconnect();
//
//     try sb.subscribe("subject", null, "subject");
//
//     const recv = try sb.fetch(SECNS * 20);
//
//     try testing.expect(recv != null);
//
//     const almsg = recv.?;
//
//     sb.reuse(almsg);
//
//     try sb.unsubscribe("subject");
//     return;
// }

// test "publisher PUB with payload" {
//     var pb: Publisher = .{};
//     try pb.connect(std.testing.allocator, .{});
//     defer pb.disconnect();
//
//     // PUB FRONT.DOOR JOKE.22 11␍␊Knock Knock␍␊
//
//     const payload: ?[]const u8 = "Knock Knock";
//
//     try pb.publish("FRONT.DOOR", "JOKE.22", null, payload);
// }
//
// test "publisher HPUB" {
//     // HPUB SUBJECT REPLY 48 55␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊PAYLOAD␍␊
//     var pb: Publisher = .{};
//     try pb.connect(std.testing.allocator, .{});
//     defer pb.disconnect();
//
//     var hdrs: Headers = .{};
//     try hdrs.init(std.testing.allocator, 0);
//     defer hdrs.deinit();
//
//     try hdrs.append("Header1", " X");
//     try hdrs.append("Header2", " Y");
//     try hdrs.append("Header3", " Z");
//
//     const HDR_LEN = hdrs.buffer.body().?.len;
//
//     try testing.expectEqual(48, HDR_LEN);
//
//     try pb.publish("SUBJECT", "REPLY", &hdrs, "payload");
// }
