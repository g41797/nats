// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Appendable = @This();

const std = @import("std");
const Allocator = std.mem.Allocator;

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

pub fn change(apndbl: *Appendable, actual_len: usize) !void {
    if (apndbl.buffer == null) {
        return error.WasNotAllocated;
    }

    if (apndbl.buffer.?.len < actual_len) {
        return error.NotEnoughSpace;
    }

    apndbl.actual_len = actual_len;
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
