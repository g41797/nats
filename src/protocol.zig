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
    addr: ?[]const u8 = DefaultAddr,
    /// Server port.
    port: ?u16 = DefaultPort,
};

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
    max_msgs: i32 = -1,
    max_bytes: i32 = -1,
    max_age: i32 = 0,
    max_msgs_per_subject: i32 = -1,
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
