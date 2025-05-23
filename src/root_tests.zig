// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test {
    if (builtin.target.os.tag == .windows) {
        _ = @import("net_tests.zig");
        _ = @import("core_tests.zig");
        std.testing.refAllDecls(@This());
    } else {
        _ = @import("net_tests.zig");
        _ = @import("parse_tests.zig");
        _ = @import("misc_tests.zig");
        _ = @import("core_tests.zig");
        _ = @import("jetstream_tests.zig");
        _ = @import("subscriber_tests.zig");
        _ = @import("consumer_tests.zig");
        @import("std").testing.refAllDecls(@This());
    }
}

const std = @import("std");
const builtin = @import("builtin");
