// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const zul = @import("zul");

// String representation of the default CONNECT
pub const ConnectString = "CONNECT {\"verbose\":false,\"pedantic\":false,\"tls_required\":false,\"lang\":\"Zig\",\"version\":\"T.B.D\",\"protocol\":0,\"echo\":true}\r\n";

// String representation of the default INFO
pub const InfoString = "INFO {\"server_id\":\"SID\",\"server_name\":\"SNAM\",\"proto\":1,\"headers\":true,\"max_payload\":1048576,\"jetstream\":true}\r\n";

pub const SECNS = 1000000000;

pub const CRLF: [2]u8 = .{
    '\r',
    '\n',
};

pub const DefaultAddr = "127.0.0.1";
pub const DefaultPort = 4222;

pub const ConnectOpts = struct {
    addr: ?[]const u8 = DefaultAddr,
    port: ?u16 = DefaultPort,
};

pub const UUID = zul.UUID;

/// Unique ID used as INBOX
/// in Request/Reply flow
pub fn newInbox() ![36]u8 {
    const uuid4 = UUID.v4();
    return UUID.binToHex(&uuid4.bin, .upper);
}

const ClientOpts = struct {
    verbose: bool = false,
    pedantic: bool = false,
    tls_required: bool = false,
    auth_token: ?[]const u8 = null,
    user: ?[]const u8 = null,
    pass: ?[]const u8 = null,
    lang: []const u8 = "Zig",
    version: []const u8 = "TBD",
    protocol: []const u8 = "0",
    echo: bool = false,
    sig: ?[]const u8 = null,
    headers: bool = true,
    nkey: ?[]const u8 = null,
};
