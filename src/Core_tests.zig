// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");

const testing = std.testing;
const Allocator = std.mem.Allocator;

const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const Appendable = @import("Appendable.zig");
const Formatter = @import("Formatter.zig");

const err = @import("err.zig");
const Core = @import("Core.zig");

const ReturnedError = err.ReturnedError;

const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;

const NOTIFY: []const u8 = "NOTIFY";

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

test "delete non existing stream" {
    var frmtr: Formatter = try Formatter.init(std.testing.allocator, 128);
    defer frmtr.deinit();

    const DELETE_STREAM_T: []const u8 = "$JS.API.STREAM.DELETE.{s}";
    const NONEXISTINGSTREAM: []const u8 = "NONEXISTINGSTREAM";
    const SUBJECT = try frmtr.sprintf(DELETE_STREAM_T, .{NONEXISTINGSTREAM});

    if (SUBJECT == null) {
        return error.EmptyString;
    }

    var rqtr: Core = .{};
    try rqtr.CONNECT(std.testing.allocator, .{});
    defer rqtr.DISCONNECT();

    const resp = try rqtr.REQUEST(SUBJECT.?, null, SECNS * 20);

    rqtr.REUSE(resp);

    return;
}

test "delete existing stream" {
    var frmtr: Formatter = try Formatter.init(std.testing.allocator, 128);
    defer frmtr.deinit();

    const EXISTINGSTREAM: []const u8 = "EXISTINGSTREAM";

    const CREATE_STREAM_T: []const u8 = "$JS.API.STREAM.CREATE.{s}";
    const DELETE_STREAM_T: []const u8 = "$JS.API.STREAM.DELETE.{s}";

    var rqtr: Core = .{};
    try rqtr.CONNECT(std.testing.allocator, .{});
    defer rqtr.DISCONNECT();

    var SUBJECT = try frmtr.sprintf(CREATE_STREAM_T, .{EXISTINGSTREAM});

    if (SUBJECT == null) {
        return error.EmptyString;
    }

    const EMPTY_JSON: []const u8 = "{}";

    const resp = try rqtr.REQUEST(SUBJECT.?, EMPTY_JSON, SECNS * 20);
    rqtr.REUSE(resp);

    SUBJECT = try frmtr.sprintf(DELETE_STREAM_T, .{EXISTINGSTREAM});

    if (SUBJECT == null) {
        return error.EmptyString;
    }

    return;
}
