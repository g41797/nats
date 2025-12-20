// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

/// String formatting utility with automatic buffer expansion.
/// Wraps an Appendable buffer for formatted output operations.
pub const Formatter = @This();

/// The underlying buffer for formatted output.
formatbuf: Appendable = .{},
/// Current position in the buffer.
pos: usize = 0,

/// Creates a new formatter with the given allocator and initial buffer size.
pub fn init(allocator: Allocator, len: usize) !Formatter {
    var frmtr: Formatter = .{};

    try frmtr.formatbuf.init(allocator, len, 256);

    return frmtr;
}

/// Resets the formatter for reuse, clearing all buffered data.
pub fn reset(frmtr: *Formatter) void {
    frmtr.pos = 0;
    frmtr.formatbuf.reset();
}

/// Releases all allocated memory.
pub fn deinit(frmtr: *Formatter) void {
    frmtr.formatbuf.deinit();
}

/// Formats a string using the given format and arguments.
/// Automatically expands the buffer if needed.
/// Returns the formatted string or null on empty output.
pub fn sprintf(frmtr: *Formatter, comptime fmt: []const u8, args: anytype) !?[]const u8 {
    while (true) {
        if (frmtr.tryformat(fmt, args)) |_| {
            return frmtr.formatbuf.body();
        } else |ferr| switch (ferr) {
            error.NoSpaceLeft => {
                _ = try frmtr.formatbuf.alloc(frmtr.formatbuf.buffer.?.len + 256);
                continue;
            },
            else => {
                return ferr;
            },
        }
    }
}

fn tryformat(frmtr: *Formatter, comptime fmt: []const u8, args: anytype) !void {
    frmtr.pos = 0;
    const buffer = frmtr.formatbuf.buffer.?;
    const result = std.fmt.bufPrint(buffer, fmt, args) catch |err| switch (err) {
        error.NoSpaceLeft => return error.NoSpaceLeft,
    };
    frmtr.pos = result.len;
    try frmtr.formatbuf.change(frmtr.pos);
}

/// Converts a value to its JSON string representation.
/// Automatically expands the buffer if needed.
pub fn stringify(frmtr: *Formatter, value: anytype, options: StringifyOptions) !?[]const u8 {
    while (true) {
        if (frmtr.trystringify(value, options)) |_| {
            return frmtr.formatbuf.body();
        } else |ferr| switch (ferr) {
            error.NoSpaceLeft => {
                _ = try frmtr.formatbuf.alloc(frmtr.formatbuf.buffer.?.len + 256);
                continue;
            },
            else => {
                return ferr;
            },
        }
    }
}

fn trystringify(frmtr: *Formatter, value: anytype, options: StringifyOptions) !void {
    frmtr.pos = 0;
    const buffer = frmtr.formatbuf.buffer.?;
    var writer = Io.Writer.fixed(buffer);
    json.Stringify.value(value, options, &writer) catch |err| switch (err) {
        // WriteFailed indicates the fixed buffer ran out of space
        error.WriteFailed => return error.NoSpaceLeft,
    };
    frmtr.pos = writer.end;
    try frmtr.formatbuf.change(frmtr.pos);
}

const std = @import("std");
const json = std.json;
const Io = std.Io;
const StringifyOptions = json.Stringify.Options;

const Appendable = @import("Appendable.zig");

const Allocator = std.mem.Allocator;
