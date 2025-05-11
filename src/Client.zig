// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const SEC_TIMEOUT_MS = 1_000;
const MIN_TIMEOUT_MS = SEC_TIMEOUT_MS * 60;
const INFINITE_TIMEOUT_MS = -1;

pub const Client = @This();

stream: Stream = undefined,
connected: bool = false,
attention: Sema = .{},

pub fn connect(allocator: Allocator, co: protocol.ConnectOpts) !Client {
    var host: []const u8 = protocol.DefaultAddr;

    if (co.addr != null) {
        host = co.addr.?;
    }

    var prt: u16 = protocol.DefaultPort;

    if (co.port != null) {
        prt = co.port.?;
    }
    var client: Client = .{};

    client.stream = try net.tcpConnectToHost(allocator, host, prt);
    client.connected = true;
    errdefer client.close();
    try setSockNONBLOCK(client.stream.handle);

    return client;
}

pub fn close(cl: *Client) void {
    if (!cl.connected) {
        return;
    }

    cl.stream.close();
    cl.connected = false;
    return;
}

//
// Non MT write wrappers
//
pub fn writeAll(cl: *Client, bytes: []const u8) !void {
    if (!cl.connected) {
        return error.NotConnected;
    }

    var _poll: pollfd = .{
        .fd = cl.stream.handle,
        .events = POLL.OUT | POLL.HUP | POLL.NVAL,
        .revents = 0,
    };

    var wpoll: [*c]pollfd = &_poll;

    var index: usize = 0;
    while (index < bytes.len) {
        wpoll[0].revents = 0;

        const pollstatus = system.poll(wpoll, 1, INFINITE_TIMEOUT_MS);
        if (pollstatus == 0) {
            continue;
        }
        if (pollstatus < 0) {
            return error.WriteAllPollError;
        }

        if (wpoll[0].revents & POLL.OUT == POLL.OUT) {
            index += cl.stream.write(bytes[index..]) catch |err| switch (err) {
                error.WouldBlock => continue,
                else => return err,
            };
            continue;
        }

        if (wpoll[0].revents & POLL.HUP == POLL.HUP) {
            return error.WriteAllHUPError;
        }

        if (wpoll[0].revents & POLL.NVAL == POLL.NVAL) {
            return error.WriteAllNVALError;
        }
    }

    return;
}

pub fn writevAll(cl: *Client, iovecs: []posix.iovec_const) !void {
    if (!cl.connected) {
        return error.NotConnected;
    }
    // try cl.stream.writevAll(iovecs);

    if (iovecs.len == 0) {
        return;
    }

    var _poll: pollfd = .{
        .fd = cl.stream.handle,
        .events = POLL.OUT | POLL.HUP | POLL.NVAL,
        .revents = 0,
    };

    var wpoll: [*c]pollfd = &_poll;

    var i: usize = 0;
    while (true) {
        wpoll[0].revents = 0;

        const pollstatus = system.poll(wpoll, 1, INFINITE_TIMEOUT_MS);
        if (pollstatus == 0) {
            continue;
        }
        if (pollstatus < 0) {
            return error.WriteAllPollError;
        }

        if (wpoll[0].revents & POLL.HUP == POLL.HUP) {
            return error.WriteAllHUPError;
        }

        if (wpoll[0].revents & POLL.NVAL == POLL.NVAL) {
            return error.WriteAllNVALError;
        }

        var amt = cl.stream.writev(iovecs[i..]) catch |err| switch (err) {
            error.WouldBlock => continue,
            else => return err,
        };
        while (amt >= iovecs[i].len) {
            amt -= iovecs[i].len;
            i += 1;
            if (i >= iovecs.len) return;
        }
        iovecs[i].base += amt;
        iovecs[i].len -= amt;
    }
}

//
// Non MT read wrappers
//
pub fn readByte(cl: *Client) !u8 {
    if (!cl.connected) {
        return error.NotConnected;
    }

    var _poll: pollfd = .{
        .fd = cl.stream.handle,
        .events = POLL.IN,
        .revents = 0,
    };

    const rpoll: [*c]pollfd = &_poll;

    var byte: [1]u8 = undefined;

    while (true) {
        const pollstatus = system.poll(rpoll, 1, SEC_TIMEOUT_MS);

        switch (pollstatus) {
            1 => {
                byte[0] = 0;
                const rlen = try cl.stream.read(&byte);
                if (rlen == 0) {
                    return error.WouldBlock;
                }
                if (byte[0] == 0) {
                    return error.WouldBlock;
                }
                return byte[0];
            },
            0 => return error.WouldBlock,
            else => return error.ReadBytePollError,
        }
    }
}

pub fn readAll(cl: *Client, buffer: []u8) !usize {
    if (!cl.connected) {
        return error.NotConnected;
    }
    if (cl.wasRaised()) { // move to poll loop
        return error.WasCancelled;
    }

    var _poll: pollfd = .{
        .fd = cl.stream.handle,
        .events = POLL.IN,
        .revents = 0,
    };

    var rpoll: [*c]pollfd = &_poll;

    var index: usize = 0;

    while (index < buffer.len) {
        rpoll[0].revents = 0;

        const pollstatus = system.poll(rpoll, 1, INFINITE_TIMEOUT_MS);

        if (pollstatus == 0) { //strange for INFINITE_TIMEOUT_MS
            continue;
        }

        if (pollstatus == 1) {
            const amt = cl.stream.readAll(buffer[index..]) catch |err| {
                if (err == error.WouldBlock) {
                    continue;
                }
                return err;
            };
            if (amt == 0) { // end of the stream
                break;
            }
            index += amt;
            continue;
        }

        return error.ReadAllPollError;
    }

    return index;
}

pub fn raiseAttention(cl: *Client) void {
    _ = cl.attention.post();
}

pub fn wasRaised(cl: *Client) bool {
    if (cl.attention.timedWait(0)) |_| {
        return true;
    } else |_| {
        return false;
    }
}

pub fn setSockNONBLOCK(sock: posix.socket_t) !void {
    if (builtin.os.tag == .windows) {
        var mode: c_ulong = 1;
        if (windows.ws2_32.ioctlsocket(sock, windows.ws2_32.FIONBIO, &mode) == windows.ws2_32.SOCKET_ERROR) {
            switch (windows.ws2_32.WSAGetLastError()) {
                .WSANOTINITIALISED => unreachable,
                .WSAENETDOWN => return error.NetworkSubsystemFailed,
                .WSAENOTSOCK => return error.FileDescriptorNotASocket,
                // !!! handle more errors !!!
                else => |err| return windows.unexpectedWSAError(err),
            }
        }
    } else {
        var fl_flags = posix.fcntl(sock, posix.F.GETFL, 0) catch |err| switch (err) {
            error.FileBusy => unreachable,
            error.Locked => unreachable,
            error.PermissionDenied => unreachable,
            error.DeadLock => unreachable,
            error.LockedRegionLimitExceeded => unreachable,
            else => |e| return e,
        };
        fl_flags |= 1 << @bitOffsetOf(system.O, "NONBLOCK");
        _ = posix.fcntl(sock, posix.F.SETFL, fl_flags) catch |err| switch (err) {
            error.FileBusy => unreachable,
            error.Locked => unreachable,
            error.PermissionDenied => unreachable,
            error.DeadLock => unreachable,
            error.LockedRegionLimitExceeded => unreachable,
            else => |e| return e,
        };
    }
}

const std = @import("std");
const builtin = @import("builtin");
const protocol = @import("protocol.zig");
const net = std.net;
const posix = std.posix;
const io = std.io;
const Stream = net.Stream;
const Socket = posix.socket_t;
const Allocator = std.mem.Allocator;
const Sema = std.Thread.Semaphore;
const linux = std.os.linux;
const windows = std.os.windows;
const wasi = std.os.wasi;
const system = posix.system;
const pollfd = posix.pollfd;
const POLL = system.POLL;
