// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const testing = std.testing;

const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");

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
    const resp = "{\"type\":\"io.nats.jetstream.api.v1.stream_create_response\",\"error\":{\"code\":400,\"err_code\":10056,\"description\":\"stream name in subject does not match request\"}}";

    const text = parse.responseErrorText(resp);

    try testing.expectEqual(std.mem.eql(u8, "Bad Request", text.?), true);

    try testing.expect(parse.isFailed(resp));
}
