// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const testing = std.testing;

const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");

test "parse errors" {
    try testing.expectError(ReturnedError.Unknown, parse.parseSize(""));
    try testing.expectError(ReturnedError.Unknown, parse.parseSize("TEXT"));
    try testing.expectError(std.fmt.ParseIntError.InvalidCharacter, parse.parseSize("TEXT TEXT TEXT"));
}

// RESERVED <id> <bytes>\r\n
// FOUND <id> <bytes>\r\n
// KICKED <count>\r\n
// OK <bytes>\r\n
test "parseSize" {
    var result = try parse.parseSize("RESERVED 101 234\r\n");
    try testing.expectEqual(std.mem.eql(u8, "RESERVED 101", result[0]), true);
    try testing.expectEqual(234, result[1]);

    result = try parse.parseSize(result[0]);
    try testing.expectEqual(std.mem.eql(u8, "RESERVED", result[0]), true);
    try testing.expectEqual(101, result[1]);

    result = try parse.parseSize("FOUND 101 234");
    try testing.expectEqual(std.mem.eql(u8, "FOUND 101", result[0]), true);
    try testing.expectEqual(234, result[1]);

    result = try parse.parseSize("KICKED 101");
    try testing.expectEqual(std.mem.eql(u8, "KICKED", result[0]), true);
    try testing.expectEqual(101, result[1]);

    result = try parse.parseSize("OK 101\n");
    try testing.expectEqual(std.mem.eql(u8, "OK", result[0]), true);
    try testing.expectEqual(101, result[1]);
}
