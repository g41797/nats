// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

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

        if (recv.*.letter.mt == mt) {
            return recv;
        }

        const rmt = recv.*.letter.mt;

        cl.REUSE(recv);

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
                return error.CommunicationFailure;
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

test "requestNMT prototype" {
    var cl: Core = .{};
    try cl.CONNECT(std.testing.allocator, .{});
    defer cl.DISCONNECT();

    // Prepare for response
    const inbox = try Conn.newInbox();
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

test "requestNMT" {
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

const CREATE_STREAM_T: []const u8 = "$JS.API.STREAM.CREATE.{s}";
const DELETE_STREAM_T: []const u8 = "$JS.API.STREAM.DELETE.{s}";

test "create delete stream" {
    var cmd: Formatter = try Formatter.init(std.testing.allocator, 64);
    defer cmd.deinit();

    var jsn: Formatter = try Formatter.init(std.testing.allocator, 64);
    defer jsn.deinit();

    const EXISTINGSTREAM: []const u8 = "EXISTINGSTREAM";

    var rqtr: Core = .{};
    try rqtr.CONNECT(std.testing.allocator, .{});
    defer rqtr.DISCONNECT();

    var DELETE_STREAM = try cmd.sprintf(DELETE_STREAM_T, .{EXISTINGSTREAM});

    if (DELETE_STREAM == null) {
        return error.EmptyString;
    }

    var resp = try rqtr.REQUEST(DELETE_STREAM.?, null, SECNS * 20);
    rqtr.REUSE(resp);

    const CREATE_STREAM = try cmd.sprintf(CREATE_STREAM_T, .{EXISTINGSTREAM});

    if (CREATE_STREAM == null) {
        return error.EmptyString;
    }

    const config: StreamConfig = .{
        .name = EXISTINGSTREAM,
    };

    const stream_config_json = try jsn.stringify(config, .{ .emit_strings_as_arrays = false, .whitespace = .minified });

    resp = try rqtr.REQUEST(CREATE_STREAM.?, stream_config_json, SECNS * 20);
    rqtr.REUSE(resp);

    DELETE_STREAM = try cmd.sprintf(DELETE_STREAM_T, .{EXISTINGSTREAM});

    if (DELETE_STREAM == null) {
        return error.EmptyString;
    }

    resp = try rqtr.REQUEST(DELETE_STREAM.?, null, SECNS * 20);
    rqtr.REUSE(resp);

    return;
}

test "stream config to json" {
    var frmtr: Formatter = try Formatter.init(std.testing.allocator, 128);
    defer frmtr.deinit();

    const EXISTINGSTREAM: []const u8 = "EXISTINGSTREAM";

    const config: StreamConfig = .{
        .name = EXISTINGSTREAM,
    };

    _ = try frmtr.stringify(config, .{ .emit_strings_as_arrays = false, .whitespace = .indent_tab });
}

const std = @import("std");
const mailbox = @import("mailbox");

const testing = std.testing;
const Allocator = std.mem.Allocator;

const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const Appendable = @import("Appendable.zig");
const Formatter = @import("Formatter.zig");

const Core = @import("Core.zig");
const Conn = @import("Conn.zig");

const Messages = messages.Messages;
const AllocatedMSG = messages.AllocatedMSG;
const MT = messages.MessageType;
const Header = messages.Header;
const Headers = messages.Headers;
const HeaderIterator = messages.HeaderIterator;
const StreamConfig = protocol.StreamConfig;
