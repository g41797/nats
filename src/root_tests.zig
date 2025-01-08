// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test {
    _ = @import("parse_tests.zig");

    @import("std").testing.refAllDecls(@This());
}
