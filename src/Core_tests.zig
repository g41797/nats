// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const testing = std.testing;
const expect = testing.expect;
const Allocator = std.mem.Allocator;

const err = @import("err.zig");
const ReturnedError = err.ReturnedError;

const protocol = @import("protocol.zig");
const Appendable = protocol.Appendable;
const MT = protocol.MessageType;
const Header = protocol.Header;
const Headers = protocol.Headers;
const HeaderIterator = protocol.HeaderIterator;
const Core = @import("Core.zig");

const SECNS = protocol.SECNS;

test "CONNECT DISCONNECT" {
    var cl: Core = .{};
    try cl.CONNECT(std.testing.allocator, .{});
    defer cl.DISCONNECT();
}

test "PING-PONG" {
    var cl: Core = .{};
    try cl.CONNECT(std.testing.allocator, .{});
    defer cl.DISCONNECT();

    try cl.PING();
    try cl.PONG();
}

const mailbox = @import("mailbox");
const messages = @import("messages.zig");
const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;

const NOTIFY: []const u8 = "NOTIFY";

test "PUB-SUB" {
    var sb: Core = .{};
    try sb.CONNECT(std.testing.allocator, .{});
    defer sb.DISCONNECT();

    // SUB <subject> [queue group] <sid>␍␊
    // SUB NOTIFY                  NSID
    try sb.SUB(NOTIFY, null, "NSID");

    var pb: Core = .{};
    try pb.CONNECT(std.testing.allocator, .{});
    defer pb.DISCONNECT();

    // PUB <subject> [reply-to] <#bytes>␍␊[payload]␍␊
    // PUB NOTIFY 0␍␊␍␊     #bytes == 0 => empty payload
    try pb.PUB(NOTIFY, null, null);

    const rmsg = try wait(&sb, .MSG);

    try testing.expectEqual(std.mem.eql(u8, NOTIFY, rmsg.letter.Subject().?), true);

    sb.REUSE(rmsg);

    // UNSUB <sid>
    try sb.UNSUB("NSID", null);

    return;
}

fn wait(cl: *Core, mt: MT) !*AllocatedMSG {
    for (0..10) |_| {
        const recv = try cl.FETCH(SECNS * 10);

        try testing.expect(recv != null);

        const almsg = recv.?;

        //std.io.getStdOut().writer().print("Receive message {0s}\r\n", .{almsg.*.letter.mt.to_string().?}) catch unreachable;

        if (almsg.*.letter.mt == mt) {
            return almsg;
        }

        const rmt = almsg.letter.mt;

        cl.REUSE(almsg);

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

test "PUB-SUB the same connection" {
    var sb: Core = .{};
    try sb.CONNECT(std.testing.allocator, .{});
    defer sb.DISCONNECT();

    // SUB <subject> [queue group] <sid>␍␊
    // SUB NOTIFY                  NSID
    try sb.SUB(NOTIFY, null, "NSID");

    // PUB <subject> [reply-to] <#bytes>␍␊[payload]␍␊
    // PUB NOTIFY 0␍␊␍␊     #bytes == 0 => empty payload
    try sb.PUB(NOTIFY, null, null);

    const rmsg = try wait(&sb, .MSG);

    try testing.expectEqual(std.mem.eql(u8, NOTIFY, rmsg.letter.Subject().?), true);

    sb.REUSE(rmsg);

    // UNSUB <sid>
    try sb.UNSUB("NSID", null);

    return;
}

test "request prototype" {
    var cl: Core = .{};
    try cl.CONNECT(std.testing.allocator, .{});
    defer cl.DISCONNECT();

    // Prepare for response
    const inbox = try protocol.newInbox();
    try cl.SUB(&inbox, null, &inbox);
    defer _unsub_(&cl, &inbox);

    // Request
    // try cl.PUB(subject,  &inbox, payload)

    // Simulate response
    try cl.PUB(&inbox, null, null);

    const rmsg = try wait(&cl, .MSG);

    try testing.expectEqual(std.mem.eql(u8, &inbox, rmsg.letter.Subject().?), true);

    cl.REUSE(rmsg);

    return;
}

fn _unsub_(cl: *Core, sid: []const u8) void {
    if (cl.UNSUB(sid, 0)) |_| {
        return;
    } else |_| {
        return;
    }
}

test "request" {
    const SUBJECT = "$JS.API.INFO";

    var rqtr: Core = .{};
    try rqtr.CONNECT(std.testing.allocator, .{});
    defer rqtr.DISCONNECT();

    const resp = try rqtr.REQUEST(SUBJECT, null, SECNS * 20);

    rqtr.REUSE(resp);

    return;
}
