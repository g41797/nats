// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const Appendable = @This();

const std = @import("std");
const mailbox = @import("mailbox");
const ascii = std.ascii;
const EnumMap = std.enums.EnumMap;
const Allocator = std.mem.Allocator;
pub const Header = std.http.Header;
pub const HeaderIterator = std.http.HeaderIterator;
const err = @import("err.zig");
const ReturnedError = err.ReturnedError;
const parse = @import("parse.zig");

buffer: ?[]u8 = null,
actual_len: usize = 0,
allocator: Allocator = undefined,
round: usize = undefined,

pub fn init(apndbl: *Appendable, allocator: Allocator, len: usize, round: ?usize) !void {
    apndbl.allocator = allocator;
    if (round) |val| {
        apndbl.round = val;
    } else {
        apndbl.round = 256;
    }
    try apndbl.alloc(len);
    return;
}

pub fn reset(apndbl: *Appendable) !void {
    if (apndbl.buffer == null) {
        return error.WasNotAllocated;
    }
    apndbl.actual_len = 0;
    return;
}

pub fn deinit(apndbl: *Appendable) void {
    apndbl.free();
}

pub fn append(apndbl: *Appendable, buff: []const u8) !void {
    if (apndbl.buffer == null) {
        return error.WasNotAllocated;
    }
    if (buff.len == 0) {
        return;
    }

    const avail = apndbl.buffer.?.len - apndbl.actual_len;

    if (avail < buff.len) {
        try apndbl.alloc(@max(apndbl.roundlen(buff.len), apndbl.buffer.?.len * 2));
    }

    std.mem.copyForwards(u8, apndbl.*.buffer.?[apndbl.actual_len..], buff);

    apndbl.actual_len += buff.len;
    return;
}

pub inline fn shrink(apndbl: *Appendable, count: usize) !void {
    if (apndbl.buffer == null) {
        return error.WasNotAllocated;
    }
    if (apndbl.actual_len < count) {
        return error.NotEnoughMemory;
    }
    apndbl.actual_len -= count;
    return;
}

pub fn copy(apndbl: *Appendable, from: []const u8) !void {
    try apndbl.reset();
    try apndbl.append(from);

    return;
}

pub fn alloc(apndbl: *Appendable, len: usize) !void {
    if (apndbl.buffer == null) {
        apndbl.actual_len = 0;
        apndbl.buffer = try apndbl.allocator.alloc(u8, apndbl.roundlen(len));
        return;
    }

    const rlen = apndbl.roundlen(len);

    if (apndbl.buffer.?.len >= rlen) {
        return;
    }

    apndbl.buffer = try apndbl.allocator.realloc(apndbl.buffer.?, rlen);

    return;
}

fn free(apndbl: *Appendable) void {
    if (apndbl.buffer != null) {
        apndbl.allocator.free(apndbl.buffer.?);
        apndbl.buffer = null;
        apndbl.actual_len = 0;
    }
    return;
}

pub fn body(apndbl: *Appendable) ?[]const u8 {
    if (apndbl.buffer == null) {
        return null;
    }
    if (apndbl.actual_len == 0) {
        return null;
    }
    return apndbl.buffer.?[0..apndbl.actual_len];
}

inline fn roundlen(apndbl: *Appendable, len: usize) usize {
    if (len == 0) {
        return apndbl.round;
    }
    return (((len - 1) / apndbl.round) + 1) * apndbl.round;
}
