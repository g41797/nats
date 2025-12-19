// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

/// Dynamically growable byte buffer with efficient memory management.
/// Allocates memory in rounded chunks to minimize reallocations.
pub const Appendable = @This();

/// The underlying byte buffer, or null if not allocated.
buffer: ?[]u8 = null,
/// Number of bytes currently used in the buffer.
actual_len: usize = 0,
/// Allocator used for memory operations.
allocator: Allocator = undefined,
/// Allocation rounding size for efficient memory usage.
round: usize = undefined,

/// Initializes the appendable buffer with the given allocator and initial length.
/// The round parameter specifies the allocation rounding size (defaults to 256).
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

/// Resets the buffer length to zero without freeing memory.
pub fn reset(apndbl: *Appendable) void {
    apndbl.actual_len = 0;
    return;
}

/// Changes the actual length of the buffer.
/// Returns an error if the buffer is not allocated or if the new length exceeds capacity.
pub fn change(apndbl: *Appendable, actual_len: usize) !void {
    if (apndbl.buffer == null) {
        return error.WasNotAllocated;
    }

    if (apndbl.buffer.?.len < actual_len) {
        return error.NoSpaceLeft;
    }

    apndbl.actual_len = actual_len;
    return;
}

/// Releases all allocated memory and resets the buffer state.
pub fn deinit(apndbl: *Appendable) void {
    apndbl.free();
}

/// Appends bytes to the buffer, automatically expanding capacity if needed.
/// Returns an error if the buffer was not initialized.
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

/// Reduces the actual length by the specified count.
/// Returns an error if the buffer is not allocated or count exceeds actual length.
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

/// Replaces the buffer content with the given bytes.
/// Resets and then appends the source data.
pub fn copy(apndbl: *Appendable, from: []const u8) !void {
    apndbl.reset();
    try apndbl.append(from);

    return;
}

/// Ensures the buffer has at least the specified capacity.
/// Allocates or reallocates as needed, using rounded sizes.
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

/// Fills the entire buffer with zeros.
pub fn clean(apndbl: *Appendable) void {
    if (apndbl.buffer != null) {
        @memset(apndbl.buffer.?, 0);
    }
}

fn free(apndbl: *Appendable) void {
    if (apndbl.buffer != null) {
        apndbl.allocator.free(apndbl.buffer.?);
        apndbl.buffer = null;
        apndbl.actual_len = 0;
    }
    return;
}

/// Returns the currently used portion of the buffer as a slice.
/// Returns null if the buffer is not allocated or empty.
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

const std = @import("std");
const Allocator = std.mem.Allocator;
