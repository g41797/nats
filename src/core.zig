// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const net = std.net;
const http = std.http;
const atomic = std.atomic;
const Thread = std.Thread;
const Mutex = std.Thread.Mutex;
const Connection = http.Client.Connection;
const Allocator = std.mem.Allocator;

const err = @import("err.zig");
const parse = @import("parse.zig");
const protocol = @import("protocol.zig");
const client = @import("client.zig");

const ReturnedError = err.ReturnedError;
pub const Appendable = protocol.Appendable;
pub const MT = protocol.MessageType;
pub const Header = protocol.Header;
pub const Headers = protocol.Headers;
pub const HeaderIterator = protocol.HeaderIterator;
const Client = client.Client;
pub const ConnectOpts = client.ConnectOpts;

pub const Publisher = struct {
    mutex: Mutex = .{},
    client: Client = .{},
    attention: atomic.Value(u32).init(0),
    thread: Thread = undefined,
    disconnected: bool = false,

    /// Connects to NATS.
    /// Arguments:
    ///     allocator:
    ///     connection options:
    ///         addr: IPv4 address or host name, for null - DefaultAddr is used
    ///         port: TCP/IP port,  for null - DafaultPort is used
    ///
    /// Returns errors for:
    ///     - failed connection
    ///     - already existing connection
    pub fn connect(pb: *Publisher, allocator: Allocator, co: ConnectOpts) !void {
        try pb.client.connect(allocator, co);
        pb.thread = std.Thread.spawn(.{}, run, .{pb}) catch unreachable;
    }

    // =======================================
    //                  PUB [Client]
    // =======================================
    // PUB <subject> [reply-to] <#bytes>␍␊[payload]␍␊
    //
    // #bytes> - length of payload without ␍␊
    //
    // PUB FOO 11␍␊Hello NATS!␍␊
    //
    // PUB FRONT.DOOR JOKE.22 11␍␊Knock Knock␍␊
    //
    // PUB NOTIFY 0␍␊␍␊     #bytes == 0 => empty payload
    // =======================================

    // =======================================
    //                  HPUB [Client]
    // =======================================
    // HPUB SUBJECT REPLY 23 30␍␊NATS/1.0␍␊Header: X␍␊␍␊PAYLOAD␍␊
    // HPUB SUBJECT REPLY 23 23␍␊NATS/1.0␍␊Header: X␍␊␍␊␍␊
    // HPUB SUBJECT REPLY 48 55␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊PAYLOAD␍␊
    // HPUB SUBJECT REPLY 48 48␍␊NATS/1.0␍␊Header1: X␍␊Header1: Y␍␊Header2: Z␍␊␍␊␍␊
    //
    // HPUB <SUBJ> [REPLY] <HDR_LEN> <TOT_LEN>
    // <HEADER><PAYLOAD>
    //
    // HDR_LEN includes the entire serialized header,
    // from the start of the version string (NATS/1.0)
    // up to and including the ␍␊ before the payload
    //
    // TOT_LEN the payload length plus the HDR_LEN
    // =======================================

    pub fn publish(pb: *Publisher, subject: []const u8, reply2: ?[]const u8, headers: ?*Headers, payload: []const u8) !void {
        if (headers == null) {
            return pb._PUB(subject, reply2, payload);
        }
        return pb._HPUB(
            subject,
            reply2,
            headers.?,
        );
    }

    fn _PUB(pb: *Publisher, subject: []const u8, reply2: ?[]const u8, payload: []const u8) !void {
        _ = pb;
        _ = subject;
        _ = reply2;
        _ = payload;

        return;
    }

    fn _HPUB(pb: *Publisher, subject: []const u8, reply2: ?[]const u8, headers: *Headers, payload: []const u8) !void {
        _ = pb;
        _ = subject;
        _ = reply2;
        _ = headers;
        _ = payload;

        return;
    }

    pub fn disconnect(pb: *Publisher) void {
        pb.mutex.lock();
        defer pb.mutex.unlock();

        if (pb.disconnected) {
            return;
        }

        pb.raiseAttention();
        pb.waitFinish();

        pb.client.disconnect();
        pb.disconnected = true;
        return;
    }

    fn raiseAttention(pb: *Publisher) void {
        _ = pb.attention.fetchAdd(1, .SeqCst);
    }

    inline fn wasRaised(pb: *Publisher) bool {
        return (pb.attention.load(.SeqCst) > 0);
    }

    fn run(pb: *Publisher) void {
        while (!pb.wasRaised()) {
            pb.recv_next() catch {
                break;
            };
        }

        pb.raiseAttention();
        return;
    }

    fn recv_next(pb: *Publisher) !void {
        if (pb.client.read_mt()) |mt| switch (mt) {
            MT.PING => {
                try pb.client.pong();
            },
            MT.PONG => {
                return;
            },
            MT.OK => {
                return;
            },
            else => {
                return error.WrongFlow;
            },
        } else |rerr| {
            return rerr;
        }
    }

    fn waitFinish(pb: *Publisher) void {
        pb.thread.join();
    }
};
