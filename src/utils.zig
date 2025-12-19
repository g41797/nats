// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

//! General utility functions for field copying and string operations.

/// Copies matching fields from source struct to destination struct.
/// Returns the number of fields copied.
/// Only copies fields that exist in both structs with matching names.
pub fn copyFields(src: anytype, dest: anytype) usize {
    const Source = comptime @TypeOf(src);
    const Dest = comptime @TypeOf(dest.*);

    const fields1 = comptime @typeInfo(Source).@"struct".fields;

    var count: usize = 0;

    inline for (fields1) |field1| {
        if (@hasField(Dest, field1.name)) {
            @field(dest, field1.name) = @field(src, field1.name);
            count += 1;
        }
    }

    return count;
}

/// Returns true if the string starts with the given literal.
pub fn startsWith(str: String, literal: String) bool {
    var result: bool = false;

    while (true) {
        if (literal.len > str.len) {
            break;
        }

        const index = std.mem.indexOf(u8, str[0..literal.len], literal);

        result = index == 0;

        break;
    }

    return result;
}

const std = @import("std");
const protocol = @import("protocol.zig");
const String = protocol.String;
