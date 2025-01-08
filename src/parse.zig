// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const ascii = std.ascii;
const err = @import("err.zig");
const ReturnedError = err.ReturnedError;

pub fn parseSize(line: []const u8) !struct { []const u8, usize } {
    if (line.len == 0) {
        return ReturnedError.Unknown;
    }

    var sizeIndex: usize = 0;
    if (std.mem.lastIndexOfScalar(u8, line, ' ')) |val| {
        sizeIndex = val;
    } else {
        return ReturnedError.Unknown;
    }

    var size: usize = 0;
    var lenOfsize = line.len - sizeIndex - 1;

    for (line[sizeIndex + 1 .. line.len], 0..) |char, indx| {
        if ((char == '\r') or (char == '\n')) {
            lenOfsize = indx;
            break;
        }
    }

    if (std.fmt.parseInt(usize, line[sizeIndex + 1 .. sizeIndex + 1 + lenOfsize], 10)) |parsed| {
        size = parsed;
    } else |parseErr| {
        return parseErr;
    }

    return .{ line[0..sizeIndex], size };
}
