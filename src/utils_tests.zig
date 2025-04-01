// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test "copy fields" {
    const src: protocol.ConsumerConfig = .{};

    const count = comptime @typeInfo(protocol.ConsumerConfig).@"struct".fields.len;

    var dst: Consumer.InternalConsumerConfig = .{};

    try testing.expectEqual(count, utils.copyFields(protocol.ConsumerConfig, Consumer.InternalConsumerConfig, src, &dst));
}

const std = @import("std");
const testing = std.testing;

const protocol = @import("protocol.zig");
const Consumer = @import("Consumer.zig");
const utils = @import("utils.zig");
