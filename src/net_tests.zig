// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

test "listen on a port, send bytes, receive bytes" {
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
            const socket = try net.tcpConnectToAddress(server_address);
            defer socket.close();

            _ = try socket.writer().writeAll("Hello world!");
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

fn setTimeOut(sock: *Socket) !void {
    if (builtin.target.os.tag == .windows) {
        var timeout_ms: std.os.windows.DWORD = 1000; // 1 second = 1000 ms
        try std.os.windows.setsockopt(
            sock.*,
            std.os.windows.SOL_SOCKET,
            std.os.windows.SO_RCVTIMEO,
            @ptrCast(&timeout_ms),
            @sizeOf(std.os.windows.DWORD),
        );    
    } else {
    const timeout = posix.timeval{ .sec = 1, .usec = 0 };
    try posix.setsockopt(sock.*, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout));}
}


const std = @import("std");
const testing = std.testing;
const builtin = @import("builtin");
const net = std.net;
const mem = std.mem;
const posix = std.posix;
const Stream = net.Stream;
const Socket = posix.socket_t;

