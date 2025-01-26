// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test {
    _ = @import("parse_tests.zig");
    _ = @import("protocol_tests.zig");
    _ = @import("nats_tests.zig");
    @import("std").testing.refAllDecls(@This());
}
