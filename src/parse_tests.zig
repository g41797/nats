// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const testing = std.testing;

const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");

test "parse errors" {
    try testing.expectError(ReturnedError.Unknown, parse.cut_tail_size(""));
    try testing.expectError(ReturnedError.Unknown, parse.cut_tail_size("TEXT"));
    try testing.expectError(std.fmt.ParseIntError.InvalidCharacter, parse.cut_tail_size("TEXT TEXT TEXT"));
}

// RESERVED <id> <bytes>\r\n
// FOUND <id> <bytes>\r\n
// KICKED <count>\r\n
// OK <bytes>\r\n
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
