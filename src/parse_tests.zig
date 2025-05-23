// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test "parse MSG line for polled message" {
    // MSG <subject> <sid> [reply-to] <#bytes>␍␊[payload]␍␊
    // #bytes == payload length without ␍␊
    const MSG_line = "MSG orders.received 1 $JS.ACK.ORDERS.DurableConsumer.1.1.1.1746172895871384209.0 1";

    const args = parse.count_substrings(MSG_line);
    try testing.expectEqual(5, args);

    const parsed = try parse.cut_tail_size(MSG_line);
    const BYTES = parsed.size;
    try testing.expectEqual(1, BYTES);

    // reply-to
    var procstrs = try parse.cut_tail(parsed.shrinked);
    try testing.expectEqual(std.mem.eql(u8, "$JS.ACK.ORDERS.DurableConsumer.1.1.1.1746172895871384209.0", procstrs.tail), true);

    // sid
    procstrs = try parse.cut_tail(procstrs.shrinked);
    try testing.expectEqual(std.mem.eql(u8, "1", procstrs.tail), true);

    // subject
    procstrs = try parse.cut_tail(procstrs.shrinked);
    try testing.expectEqual(std.mem.eql(u8, "orders.received", procstrs.tail), true);
}

test "parse HMSG line without replyTo" {
    // HMSG <subject> <sid> [reply-to] <#header bytes> <#total bytes>␍␊
    const HMSG_line = "HMSG DB50B30E-266F-4F28-AF30-7F4B03ADB399.3 1 81 81\r\n";

    const args = parse.count_substrings(HMSG_line);
    try testing.expectEqual(5, args);

    var parsed = try parse.cut_tail_size(HMSG_line);
    const TOT_LEN = parsed.size;
    try testing.expectEqual(81, TOT_LEN);

    parsed = try parse.cut_tail_size(parsed.shrinked);
    const HDR_LEN = parsed.size;
    try testing.expectEqual(81, HDR_LEN);

    // sid
    var params = try parse.cut_tail(parsed.shrinked);
    try testing.expectEqual(std.mem.eql(u8, "1", params.tail), true);

    // subject
    params = try parse.cut_tail(params.shrinked);
    try testing.expectEqual(std.mem.eql(u8, "DB50B30E-266F-4F28-AF30-7F4B03ADB399.3", params.tail), true);
}

test "parse errors" {
    try testing.expectError(error.EmptyLine, parse.cut_tail_size(""));
    try testing.expectError(error.BadFormat, parse.cut_tail_size("TEXT"));
    try testing.expectError(std.fmt.ParseIntError.InvalidCharacter, parse.cut_tail_size("TEXT TEXT TEXT"));
}

test "cut_tail_size" {
    var result = try parse.cut_tail_size("RESERVED 101 234\r\n");
    try testing.expectEqual(std.mem.eql(u8, "RESERVED 101", result.shrinked), true);
    try testing.expectEqual(234, result.size);

    result = try parse.cut_tail_size(result.shrinked);
    try testing.expectEqual(std.mem.eql(u8, "RESERVED", result.shrinked), true);
    try testing.expectEqual(101, result.size);

    result = try parse.cut_tail_size("FOUND 101 234");
    try testing.expectEqual(std.mem.eql(u8, "FOUND 101", result.shrinked), true);
    try testing.expectEqual(234, result.size);

    result = try parse.cut_tail_size("KICKED 101");
    try testing.expectEqual(std.mem.eql(u8, "KICKED", result.shrinked), true);
    try testing.expectEqual(101, result.size);

    result = try parse.cut_tail_size("OK 101\n");
    try testing.expectEqual(std.mem.eql(u8, "OK", result.shrinked), true);
    try testing.expectEqual(101, result.size);
}

test "count_substrings" {
    var count = parse.count_substrings("\t\t  \r\n");
    try testing.expectEqual(count, 0);

    count = parse.count_substrings("HMSG SUBJECT 1   REPLY   48 48");
    try testing.expectEqual(count, 6);
}

test "parse response error" {
    const resp = "{\"type\":\"io.nats.jetstream.api.v1.stream_create_response\",\"error\":{\"code\":400,\"err_code\":10056,\"description\":\"stream name in subject does not match requestNMT\"}}";

    const text = parse.responseErrorText(resp);

    try testing.expectEqual(std.mem.eql(u8, "Bad Request", text.?), true);

    try testing.expect(parse.isFailed(resp));
}

const std = @import("std");
const testing = std.testing;

const parse = @import("parse.zig");
