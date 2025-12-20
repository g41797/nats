// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

var byte: u8 = 69;

test "setsockopt RCVTIMEO does not work on Windows" {
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
        fn clientFn(server_address: net.Address, notify: *u8) !void {
            var stream = try net.tcpConnectToAddress(server_address);
            defer stream.close();

            if (builtin.os.tag != .windows) {
                tryReadByte(&stream) catch |er| {
                    if (er == error.WouldBlock) {
                        notify.* = 1; //"WouldBlock";
                    } else {
                        notify.* = 2; //"Unknown";
                    }
                };
            }

            try stream.writeAll("Hello world!");
        }
    };

    const t = try std.Thread.spawn(.{}, S.clientFn, .{ server.listen_address, &byte });
    defer t.join();

    var client = try server.accept();
    defer client.stream.close();
    var buf: [16]u8 = undefined;
    const n = try client.stream.read(&buf);

    const lc = byte;
    _ = lc;

    try testing.expectEqual(@as(usize, 12), n);
    try testing.expectEqualSlices(u8, "Hello world!", buf[0..n]);
}

fn tryReadByte(stream: *Stream) !void {
    // try setTimeOut(stream);

    try nclient.setSockNONBLOCK(stream.handle);

    var str: [1]u8 = undefined;
    str[0] = 0;
    const rl = try stream.read(&str);
    _ = rl;
    return;
}

fn setTimeOut(stream: *Stream) !void {
    if (builtin.target.os.tag == .windows) {
        var timeout_ms: std.os.windows.DWORD = 1000 * 5; // 1 second = 1000 ms
        _ = std.os.windows.ws2_32.setsockopt(stream.*.handle, std.os.windows.ws2_32.SOL.SOCKET, std.os.windows.ws2_32.SO.RCVTIMEO, @ptrCast(&timeout_ms), @sizeOf(std.os.windows.DWORD));
    } else {
        const timeout = posix.timeval{ .sec = 5, .usec = 0 };
        try posix.setsockopt(stream.*.handle, posix.SOL.SOCKET, posix.SO.RCVTIMEO, &std.mem.toBytes(timeout));
    }
}

const log = std.log.scoped(.tcp_demo);

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    var server = try Server.init(allocator, 4096);
    defer server.deinit();

    const address = try std.net.Address.parseIp("127.0.0.1", 5882);
    try server.run(address);
    std.debug.print("STOPPED\n", .{});
}

// 1 minute
const READ_TIMEOUT_MS = 60_000;

const ClientList = std.DoublyLinkedList(*Client);
const ClientNode = ClientList.Node;

const Server = struct {
    // creates our polls and clients slices and is passed to Client.init
    // for it to create our read buffer.
    allocator: Allocator,

    // The number of clients we currently have connected
    connected: usize,

    // polls[0] is always our listening socket
    polls: []posix.pollfd,

    // for creating client
    client_pool: std.heap.MemoryPool(Client),

    // list of clients, only client[0..connected] are valid
    clients: []*Client,

    // This is always polls[1..] and it's used to so that we can manipulate
    // clients and client_polls together. Necessary because polls[0] is the
    // listening socket, and we don't ever touch that.
    client_polls: []posix.pollfd,

    // clients ordered by when they will read-timeout
    read_timeout_list: ClientList,

    // for creating nodes for our read_timeout list
    client_node_pool: std.heap.MemoryPool(ClientList.Node),

    fn init(allocator: Allocator, max: usize) !Server {
        // + 1 for the listening socket
        const polls = try allocator.alloc(posix.pollfd, max + 1);
        errdefer allocator.free(polls);

        const clients = try allocator.alloc(*Client, max);
        errdefer allocator.free(clients);

        return .{
            .polls = polls,
            .clients = clients,
            .client_polls = polls[1..],
            .connected = 0,
            .allocator = allocator,
            .read_timeout_list = .{},
            .client_pool = std.heap.MemoryPool(Client).init(allocator),
            .client_node_pool = std.heap.MemoryPool(ClientNode).init(allocator),
        };
    }

    fn deinit(self: *Server) void {
        self.allocator.free(self.polls);
        self.allocator.free(self.clients);
        self.client_pool.deinit();
        self.client_node_pool.deinit();
    }

    fn run(self: *Server, address: std.net.Address) !void {
        const tpe: u32 = posix.SOCK.STREAM | posix.SOCK.NONBLOCK;
        const protocol = posix.IPPROTO.TCP;
        const listener = try posix.socket(address.any.family, tpe, protocol);
        defer posix.close(listener);

        try posix.setsockopt(listener, posix.SOL.SOCKET, posix.SO.REUSEADDR, &std.mem.toBytes(@as(c_int, 1)));
        try posix.bind(listener, &address.any, address.getOsSockLen());
        try posix.listen(listener, 128);

        // One of the polling slots (the first one) is reserved for our listening
        // socket.
        self.polls[0] = .{
            .fd = listener,
            .revents = 0,
            .events = posix.POLL.IN,
        };

        var read_timeout_list = &self.read_timeout_list;

        while (true) {
            const next_timeout = self.enforceTimeout();
            _ = try posix.poll(self.polls[0 .. self.connected + 1], next_timeout);

            if (self.polls[0].revents != 0) {
                // listening socket is ready
                self.accept(listener) catch |err| log.err("failed to accept: {}", .{err});
            }

            var i: usize = 0;
            while (i < self.connected) {
                const revents = self.client_polls[i].revents;
                if (revents == 0) {
                    // this socket isn't ready, move on to the next one
                    i += 1;
                    continue;
                }

                var client = self.clients[i];
                if (revents & posix.POLL.IN == posix.POLL.IN) {
                    // this socket is ready to be read
                    while (true) {
                        const msg = client.readMessage() catch {
                            // we don't increment `i` when we remove the client
                            // because removeClient does a swap and puts the last
                            // client at position i
                            self.removeClient(i);
                            break;
                        } orelse {
                            // no more messages, but this client is still connected
                            i += 1;
                            break;
                        };

                        client.read_timeout = std.time.milliTimestamp() + READ_TIMEOUT_MS;
                        read_timeout_list.remove(client.read_timeout_node);
                        read_timeout_list.append(client.read_timeout_node);

                        const written = client.writeMessage(msg) catch {
                            self.removeClient(i);
                            break;
                        };
                        if (written == false) {
                            self.client_polls[i].events = posix.POLL.OUT;
                            break;
                        }
                    }
                } else if (revents & posix.POLL.OUT == posix.POLL.OUT) {
                    const written = client.write() catch {
                        self.removeClient(i);
                        continue;
                    };
                    if (written) {
                        self.client_polls[i].events = posix.POLL.IN;
                    }
                }
            }
        }
    }

    fn enforceTimeout(self: *Server) i32 {
        const now = std.time.milliTimestamp();

        var node = self.read_timeout_list.first;
        while (node) |n| {
            const client = n.data;
            const diff = client.read_timeout - now;
            if (diff > 0) {
                // this client's timeout is the first one that's in the
                // future, so we now know the maximum time we can block on
                // poll before having to call enforceTimeout again
                return @intCast(diff);
            }

            // This client's timeout is in the past. Close the socket
            // Ideally, we'd call server.removeClient() and just remove the
            // client directly. But within this method, we don't know the
            // client_polls index. When we move to epoll / kqueue, this problem
            // will go away, since we won't need to maintain polls and client_polls
            // in sync by index.
            posix.shutdown(client.socket, .recv) catch {};
            node = n.next;
        } else {
            // We have no client that times out in the future (if we did
            // we would have hit the return above).
            return -1;
        }
    }

    fn accept(self: *Server, listener: posix.socket_t) !void {
        const space = self.client_polls.len - self.connected;
        for (0..space) |_| {
            var address: net.Address = undefined;
            var address_len: posix.socklen_t = @sizeOf(net.Address);
            const socket = posix.accept(listener, &address.any, &address_len, posix.SOCK.NONBLOCK) catch |err| switch (err) {
                error.WouldBlock => return,
                else => return err,
            };

            const client = try self.client_pool.create();
            errdefer self.client_pool.destroy(client);
            client.* = Client.init(self.allocator, socket, address) catch |err| {
                posix.close(socket);
                log.err("failed to initialize client: {}", .{err});
                return;
            };

            client.read_timeout = std.time.milliTimestamp() + READ_TIMEOUT_MS;
            client.read_timeout_node = try self.client_node_pool.create();
            errdefer self.client_node_pool.destroy(client.read_timeout_node);

            client.read_timeout_node.* = .{
                .next = null,
                .prev = null,
                .data = client,
            };
            self.read_timeout_list.append(client.read_timeout_node);

            const connected = self.connected;
            self.clients[connected] = client;
            self.client_polls[connected] = .{
                .fd = socket,
                .revents = 0,
                .events = posix.POLL.IN,
            };
            self.connected = connected + 1;
        } else {
            self.polls[0].events = 0;
        }
    }

    fn removeClient(self: *Server, at: usize) void {
        var client = self.clients[at];
        defer {
            posix.close(client.socket);
            self.client_node_pool.destroy(client.read_timeout_node);
            client.deinit(self.allocator);
            self.client_pool.destroy(client);
        }

        // Swap the client we're removing with the last one
        // So that when we set connected -= 1, it'll effectively "remove"
        // the client from our slices.
        const last_index = self.connected - 1;
        self.clients[at] = self.clients[last_index];
        self.client_polls[at] = self.client_polls[last_index];
        self.connected = last_index;

        // Maybe the listener was disabled because we were full,
        // but now we have a free slot.
        self.polls[0].events = posix.POLL.IN;

        self.read_timeout_list.remove(client.read_timeout_node);
    }
};

const Client = struct {
    socket: posix.socket_t,
    address: std.net.Address,

    // Used to read length-prefixed messages
    reader: Reader,

    // Bytes we still need to send. This is a slice of `write_buf`. When
    // empty, then we're in "read-mode" and are waiting for a message from the
    // client.
    to_write: []u8,

    // Buffer for storing our length-prefixed messaged
    write_buf: []u8,

    // absolute time, in millisecond, when this client should timeout if
    // a message isn't received
    read_timeout: i64,

    // Node containing this client in the server's read_timeout_list
    read_timeout_node: *ClientNode,

    fn init(allocator: Allocator, socket: posix.socket_t, address: std.net.Address) !Client {
        const reader = try Reader.init(allocator, 4096);
        errdefer reader.deinit(allocator);

        const write_buf = try allocator.alloc(u8, 4096);
        errdefer allocator.free(write_buf);

        return .{
            .reader = reader,
            .socket = socket,
            .address = address,
            .to_write = &.{},
            .write_buf = write_buf,
            .read_timeout = 0, // let the server set this
            .read_timeout_node = undefined, // hack/ugly, let the server set this when init returns
        };
    }

    fn deinit(self: *const Client, allocator: Allocator) void {
        self.reader.deinit(allocator);
        allocator.free(self.write_buf);
    }

    fn readMessage(self: *Client) !?[]const u8 {
        return self.reader.readMessage(self.socket) catch |err| switch (err) {
            error.WouldBlock => return null,
            else => return err,
        };
    }

    fn writeMessage(self: *Client, msg: []const u8) !bool {
        if (self.to_write.len > 0) {
            // Depending on how you structure your code, this might not be possible
            // For example, in an HTTP server, the application might not control
            // the actual "writeMessage" call, and thus it would not be possible
            // to make more than one writeMessage call per request.
            // For this demo, we'll just return an error.
            return error.PendingMessage;
        }

        if (msg.len + 4 > self.write_buf.len) {
            // Could allocate a dynamic buffer. Could use a large buffer pool.
            return error.MessageTooLarge;
        }

        // copy our length prefix + message to our buffer
        std.mem.writeInt(u32, self.write_buf[0..4], @intCast(msg.len), .little);
        const end = msg.len + 4;
        @memcpy(self.write_buf[4..end], msg);

        // setup our to_write slice
        self.to_write = self.write_buf[0..end];

        // immediately write what we can
        return self.write();
    }

    // Returns `false` if we didn't manage to write the whole mssage
    // Returns `true` if the message is fully written
    fn write(self: *Client) !bool {
        var buf = self.to_write;
        defer self.to_write = buf;
        while (buf.len > 0) {
            const n = posix.write(self.socket, buf) catch |err| switch (err) {
                error.WouldBlock => return false,
                else => return err,
            };

            if (n == 0) {
                return error.Closed;
            }
            buf = buf[n..];
        } else {
            return true;
        }
    }
};

const Reader = struct {
    buf: []u8,
    pos: usize = 0,
    start: usize = 0,

    fn init(allocator: Allocator, size: usize) !Reader {
        const buf = try allocator.alloc(u8, size);
        return .{
            .pos = 0,
            .start = 0,
            .buf = buf,
        };
    }

    fn deinit(self: *const Reader, allocator: Allocator) void {
        allocator.free(self.buf);
    }

    fn readMessage(self: *Reader, socket: posix.socket_t) ![]u8 {
        var buf = self.buf;

        while (true) {
            if (try self.bufferedMessage()) |msg| {
                return msg;
            }
            const pos = self.pos;
            const n = try posix.read(socket, buf[pos..]);
            if (n == 0) {
                return error.Closed;
            }
            self.pos = pos + n;
        }
    }

    fn bufferedMessage(self: *Reader) !?[]u8 {
        const buf = self.buf;
        const pos = self.pos;
        const start = self.start;

        std.debug.assert(pos >= start);
        const unprocessed = buf[start..pos];
        if (unprocessed.len < 4) {
            self.ensureSpace(4 - unprocessed.len) catch unreachable;
            return null;
        }

        const message_len = std.mem.readInt(u32, unprocessed[0..4], .little);

        // the length of our message + the length of our prefix
        const total_len = message_len + 4;

        if (unprocessed.len < total_len) {
            try self.ensureSpace(total_len);
            return null;
        }

        self.start += total_len;
        return unprocessed[4..total_len];
    }

    fn ensureSpace(self: *Reader, space: usize) error{BufferTooSmall}!void {
        const buf = self.buf;
        if (buf.len < space) {
            return error.BufferTooSmall;
        }

        const start = self.start;
        const spare = buf.len - start;
        if (spare >= space) {
            return;
        }

        const unprocessed = buf[start..self.pos];
        std.mem.copyForwards(u8, buf[0..unprocessed.len], unprocessed);
        self.start = 0;
        self.pos = unprocessed.len;
    }
};

const std = @import("std");
const testing = std.testing;
const builtin = @import("builtin");
const net = std.net;
const mem = std.mem;
const posix = std.posix;
const Stream = net.Stream;
const Socket = posix.socket_t;
const Allocator = std.mem.Allocator;
const nclient = @import("Client.zig");
