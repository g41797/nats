// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test "setsockopt RCVTIMEO" {
    if (builtin.single_threaded) return error.SkipZigTest;
    if (builtin.os.tag == .wasi) return error.SkipZigTest;

    if (builtin.os.tag == .windows) {
        _ = try std.os.windows.WSAStartup(2, 2);
    }
    defer {
        if (builtin.os.tag == .windows) {
            std.os.windows.WSACleanup() catch unreachable;
        }
    }

    // Try only the IPv4 variant as some CI builders have no IPv6 localhost
    // configured.
    const localhost = try net.Address.parseIp("127.0.0.1", 0);

    var server = try localhost.listen(.{});
    defer server.deinit();

    const S = struct {
        fn clientFn(server_address: net.Address) !void {
            var stream = try net.tcpConnectToAddress(server_address);
            defer stream.close();

            try tryReadByte(&stream);

            try tryReadByte(&stream);

            _ = try stream.writer().writeAll("Hello world!");
        }
    };

    const t = try std.Thread.spawn(.{}, S.clientFn, .{server.listen_address});
    defer t.join();

    var client = try server.accept();
    defer client.stream.close();
    var buf: [16]u8 = undefined;
    const n = try client.stream.reader().read(&buf);

    try testing.expectEqual(@as(usize, 12), n);
    try testing.expectEqualSlices(u8, "Hello world!", buf[0..n]);
}

fn tryReadByte(stream: *Stream) !void {
    try setTimeOut(stream);
    var str: [1]u8 = undefined;
    _ = stream.read(&str) catch |er| {
        if (er != error.WouldBlock) {
            return er;
        }
    };
    return;
}

fn setTimeOut(stream: *Stream) !void {
    if (builtin.target.os.tag == .windows) {
        var timeout_ms: std.os.windows.DWORD = 1000 * 5; // 1 second = 1000 ms
        _ = std.os.windows.ws2_32.setsockopt(
            stream.*.handle,
            std.os.windows.ws2_32.SOL.SOCKET,
            std.os.windows.ws2_32.SO.RCVTIMEO,
            @ptrCast(&timeout_ms),
            @sizeOf(std.os.windows.DWORD)
        );
    } else {
        const timeout = posix.timeval{ .sec = 5, .usec = 0 };
        try posix.setsockopt(stream.*.handle, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout));
    }
}

const std = @import("std");
const testing = std.testing;
const builtin = @import("builtin");
const net = std.net;
const mem = std.mem;
const posix = std.posix;
const Stream = net.Stream;
const Socket = posix.socket_t;
