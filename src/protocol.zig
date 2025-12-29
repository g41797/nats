// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

/// Default CONNECT command sent to the NATS server.
pub const ConnectString = "CONNECT {\"verbose\":false,\"pedantic\":false,\"tls_required\":false,\"lang\":\"Zig\",\"version\":\"T.B.D\",\"protocol\":1,\"echo\":true, \"no_responders\":true, \"headers\":true}\r\n";

/// Default INFO response format (for testing).
pub const InfoString = "INFO {\"server_id\":\"SID\",\"server_name\":\"SNAM\",\"proto\":1,\"headers\":true,\"max_payload\":1048576,\"jetstream\":true}\r\n";

/// One second in nanoseconds.
pub const SECNS = 1000000000;

/// Carriage return and line feed sequence.
pub const CRLF: []const u8 = "\r\n";

/// Default NATS server address.
pub const DefaultAddr = "127.0.0.1";

/// Default NATS server port.
pub const DefaultPort = 4222;

/// Connection options for establishing a NATS connection.
pub const ConnectOpts = struct {
    /// Server address (hostname or IP).
    verbose: bool = false,
    addr: ?[]const u8 = DefaultAddr,
    port: ?u16 = DefaultPort,
    jwt: ?[]const u8 = null,
    auth_token: ?[]const u8 = null,
    user: ?[]const u8 = null,
    pass: ?[]const u8 = null,
    /// NKey seed (private key) - used to generate public key and signature.
    /// Never sent to server. Public key and signature are derived from this.
    nkey_seed: ?[]const u8 = null,
    tls_required: bool = false,
    tls_enabled: bool = false,
    tls_ca_file: ?[]const u8 = null, // Path to CA bundle (null = system default)
    tls_verify: bool = true,
};

/// CONNECT message payload structure sent to the NATS server
/// This is an internal structure used only by buildConnectString() for JSON serialization.
const ConnectMessage = struct {
    verbose: bool = false,
    pedantic: bool = false,
    lang: []const u8 = "Zig",
    version: []const u8 = "T.B.D",
    protocol: u8 = 1,
    echo: bool = true,
    tls_required: bool = false,
    auth_token: ?[]const u8 = null,
    jwt: ?[]const u8 = null,
    /// NKey public key (base32-encoded, starts with "U").
    /// This is derived from the nkey seed and sent to server for identification.
    nkey_pub: ?[]const u8 = null,
    /// Signature of the server's nonce, signed with the nkey seed (base64url-encoded).
    /// Proves possession of the private key without revealing it.
    sig: ?[]const u8 = null,
    user: ?[]const u8 = null,
    pass: ?[]const u8 = null,
    no_responders: bool = true,
    headers: bool = true,
};

/// Build CONNECT string with optional NKey authentication
///
/// NKey Authentication Flow:
///   1. opts.nkey_seed contains the seed (private key) - NEVER sent to server
///   2. nkey_pubkey is derived from the seed - sent to server for identification
///   3. nkey_sig is the server's nonce signed with the seed - sent to prove ownership
///
/// The separation of nkey_pubkey and nkey_sig as parameters (instead of being in opts)
/// emphasizes that these are computed values, not input configuration.
///
/// Returns owned slice that caller must free
///
/// Errors:
///   - error.ConflictingAuthMethods: Multiple auth methods provided (nkey with token/user/pass, or token with user/pass)
///   - error.MissingPassword: User provided without password
///   - error.PasswordWithoutUser: Password provided without user
///   - error.OutOfMemory: Allocation failure during JSON serialization or string building
pub fn buildConnectString(
    allocator: std.mem.Allocator,
    opts: ConnectOpts,
    nkey_pubkey: ?[]const u8, // Base32-encoded public key derived from opts.nkey_seed (optional)
    nkey_sig: ?[]const u8,    // Base64url-encoded signature of server nonce (optional)
) ![]const u8 {
    const has_nkey = opts.nkey_seed != null;
    const has_token = opts.auth_token != null;
    const has_user = opts.user != null;
    const has_pass = opts.pass != null;

    // Validate auth method exclusivity
    if (has_nkey and (has_token or has_user or has_pass)) {
        return error.ConflictingAuthMethods;
    }
    if (has_token and (has_user or has_pass)) {
        return error.ConflictingAuthMethods;
    }

    if (has_user and !has_pass) {
        return error.MissingPassword;
    }

    if (has_pass and !has_user) {
        return error.PasswordWithoutUser;
    }

    // Build the message structure
    const message = ConnectMessage{
        .jwt = opts.jwt,
        // if JWT is used, NKey public key is not sent
        .nkey_pub = if (opts.jwt != null) null else nkey_pubkey,
        .sig = nkey_sig,
        .auth_token = opts.auth_token,
        .user = opts.user,
        .pass = opts.pass,
    };

    // Serialize to JSON using std.json.fmt (Zig 0.15.2 API)
    const fmt = std.json.fmt(message, .{
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    var writer = std.Io.Writer.Allocating.init(allocator);
    defer writer.deinit();

    try fmt.format(&writer.writer);

    const json_payload = try writer.toOwnedSlice();
    defer allocator.free(json_payload);

    // Build final CONNECT message
    // Cleanup strategy: json_payload freed by defer above, buf freed by errdefer or returned to caller
    var buf: std.ArrayList(u8) = .empty;
    errdefer buf.deinit(allocator);

    try buf.appendSlice(allocator, "CONNECT ");
    try buf.appendSlice(allocator, json_payload);
    try buf.appendSlice(allocator, "\r\n");

    const final_msg = try buf.toOwnedSlice(allocator);

    return final_msg;
}

/// Parse INFO message to extract nonce (simple string search)
///
/// Returns owned slice that caller must free
pub fn parseInfoNonce(allocator: std.mem.Allocator, info_payload: []const u8) !?[]const u8 {
    // Look for "nonce":"..." in the JSON
    const nonce_key = "\"nonce\":\"";
    const start_idx = std.mem.indexOf(u8, info_payload, nonce_key) orelse return null;
    const value_start = start_idx + nonce_key.len;

    // Find the closing quote
    const remaining = info_payload[value_start..];
    const end_idx = std.mem.indexOf(u8, remaining, "\"") orelse return error.InvalidInfoJson;

    // Extract and return the nonce value
    const nonce = remaining[0..end_idx];
    return try allocator.dupe(u8, nonce);
}

const Drain = fn (msg: *messages.MSG) void;

// https://docs.nats.io/nats-concepts/jetstream/streams

/// Retention policy: limits-based (default).
pub const RETENTION_LIMITS = "limits";
/// Retention policy: interest-based (messages kept while consumers exist).
pub const RETENTION_INTEREST = "interest";
/// Retention policy: work queue (messages removed after acknowledgment).
pub const RETENTION_WORKQUEUE = "workqueue";

/// Discard policy: discard old messages when limit reached.
pub const DISCARD_OLD = "old";
/// Discard policy: discard new messages when limit reached.
pub const DISCARD_NEW = "new";

/// Storage type: file-based persistence.
pub const STORAGE_FILE = "file";
/// Storage type: in-memory (faster but not persistent).
pub const STORAGE_MEMORY = "memory";

/// Alias for string type.
pub const String = []const u8;
/// Alias for string array type.
pub const Strings = []const String;

/// Configuration for a JetStream stream.
pub const StreamConfig = struct {
    name: String = undefined,
    subjects: ?Strings = null,
    retention: []const u8 = RETENTION_LIMITS,
    max_consumers: i32 = -1,
    max_msgs: i64 = -1, // Can be very large (e.g., 10000000), needs i64
    max_bytes: i64 = -1, // Can be very large (e.g., 8589934592 = 8GB), needs i64
    max_age: u64 = 0, // Nanoseconds - must be u64 to handle large values (e.g., 24h = 86400000000000)
    max_msgs_per_subject: i64 = -1, // Can be very large, needs i64
    max_msg_size: i32 = -1,
    discard: String = DISCARD_OLD,
    storage: String = STORAGE_FILE,
    num_replicas: i32 = 1,
    duplicate_window: u64 = 120000000000,
    compression: String = "none",
    allow_direct: bool = false,
    mirror_direct: bool = false,
    sealed: bool = false,
    deny_delete: bool = false,
    deny_purge: bool = false,
    allow_rollup_hdrs: bool = false,
};

/// Template for creating a durable consumer.
pub const CREATE_DURABLE_CONSUMER_T: []const u8 = "$JS.API.CONSUMER.DURABLE.CREATE.{s}.{s}";
/// Template for creating an ephemeral consumer.
pub const CREATE_EPHEMERAL_CONSUMER_T: []const u8 = "$JS.API.CONSUMER.CREATE.{s}";
/// Template for creating a consumer.
pub const CREATE_CONSUMER_T: []const u8 = "$JS.API.CONSUMER.CREATE.{s}.{s}";
/// Template for creating a filtered consumer.
pub const CREATE_CONSUMER_FLT_T: []const u8 = "$JS.API.CONSUMER.CREATE.{s}.{s}.{s}";
/// Template for deleting a consumer.
pub const DELETE_CONSUMER_T: []const u8 = "$JS.API.CONSUMER.DELETE.{s}.{s}";

/// Ack policy: acknowledge all messages up to the acked message.
pub const ACKPOLICY_ALL = "all";
/// Ack policy: acknowledge each message explicitly.
pub const ACKPOLICY_EXPLICIT = "explicit";
/// Ack policy: no acknowledgment required.
pub const ACKPOLICY_NONE = "none";

/// Deliver policy: deliver all messages.
pub const DELIVERPOLICY_ALL = "all";
/// Deliver policy: deliver starting from the last message.
pub const DELIVERPOLICY_LAST = "last";
/// Deliver policy: deliver the last message per subject.
pub const DELIVERPOLICY_LAST_PER_SUBJECT = "last_per_subject";
/// Deliver policy: deliver only new messages.
pub const DELIVERPOLICY_NEW = "new";

/// Replay policy: replay messages as fast as possible.
pub const REPLAYPOLICY_INSTANT = "instant";
/// Replay policy: replay messages at original rate.
pub const REPLAYPOLICY_ORIGINAL = "original";

/// Configuration for a JetStream consumer.
pub const ConsumerConfig = struct {
    durable_name: ?String = null,

    description: ?String = null,
    ack_policy: String = ACKPOLICY_EXPLICIT,
    ack_wait: u64 = 30 * SECNS,
    deliver_policy: String = DELIVERPOLICY_ALL,

    max_ack_pending: ?i32 = null,
    max_waiting: ?i32 = null,
    max_deliver: ?i32 = null,

    filter_subject: ?String = null,
    replay_policy: String = REPLAYPOLICY_INSTANT,
    headers_only: ?bool = false,
    num_replicas: i32 = 0,
    mem_storage: ?bool = null,
};

const std = @import("std");
const messages = @import("messages.zig");
