// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const messages = @import("messages.zig");

// String representation of the default CONNECT
pub const ConnectString = "CONNECT {\"verbose\":false,\"pedantic\":false,\"tls_required\":false,\"lang\":\"Zig\",\"version\":\"T.B.D\",\"protocol\":0,\"echo\":true}\r\n";

// String representation of the default INFO
pub const InfoString = "INFO {\"server_id\":\"SID\",\"server_name\":\"SNAM\",\"proto\":1,\"headers\":true,\"max_payload\":1048576,\"jetstream\":true}\r\n";

pub const SECNS = 1000000000;

pub const CRLF: []const u8 = "\r\n";

pub const DefaultAddr = "127.0.0.1";
pub const DefaultPort = 4222;

pub const ConnectOpts = struct {
    addr: ?[]const u8 = DefaultAddr,
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

pub const RETENTION_LIMITS = "limits";
pub const RETENTION_INTEREST = "interest";
pub const RETENTION_WORKQUEUE = "workqueue";

pub const DISCARD_OLD = "old";
pub const DISCARD_NEW = "new";

pub const STORAGE_FILE = "file";
pub const STORAGE_MEMORY = "memory";

const String = []const u8;
const Strings = []const String;

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

pub const CREATE_EPHEMERAL_T: []const u8 = "$JS.API.CONSUMER.CREATE.{s}";
pub const CREATE_CONSUMER_T: []const u8 = "$JS.API.CONSUMER.CREATE.{s}.{s}";
pub const CREATE_CONSUMER_FLT_T: []const u8 = "$JS.API.CONSUMER.CREATE.{s}.{s}.{s}";
pub const DELETE_CONSUMER_T: []const u8 = "$JS.API.CONSUMER.DELETE.{s}.{s}";

pub const ACKPOLICY_ALL = "all";
pub const ACKPOLICY_EXPLICIT = "explicit";
pub const ACKPOLICY_NONE = "none";

pub const DELIVERPOLICY_ALL = "all";
pub const DELIVERPOLICY_BY_START_SEQUENCE = "by_start_sequence";
pub const DELIVERPOLICY_BY_START_TIME = "by_start_time";
pub const DELIVERPOLICY_LAST = "last";
pub const DELIVERPOLICY_LAST_PER_SUBJECT = "last_per_subject";
pub const DELIVERPOLICY_NEW = "new";

pub const REPLAYPOLICY_INSTANT = "instant";
pub const REPLAYPOLICY_ORIGINAL = "original";

pub const ConsumerConfig = struct {
    description: ?String = null,
    ack_policy: String = ACKPOLICY_EXPLICIT,
    ack_wait: u64 = 30 * SECNS,
    deliver_policy: String = DELIVERPOLICY_ALL,

    // With a deliver subject, the server will PUSH messages
    // to clients subscribed to this subject.
    // !!! MUST for Subscriber !!!
    deliver_subject: ?String = null,

    deliver_group: ?String = null,
    name: ?String = null,
    filter_subject: ?String = null,
    filter_subjects: ?Strings = null,
    flow_control: ?bool = null,
    idle_heartbeat: ?u64 = null,
    max_ack_pending: ?i32 = null,
    max_deliver: ?i32 = null,
    max_waiting: ?i32 = null,
    replay_policy: String = REPLAYPOLICY_INSTANT,
    headers_only: ?bool = false,
    num_replicas: i32 = 1,
    mem_storage: ?bool = null,
    inactive_threshold: ?u64 = null,
};

// type createConsumerRequest struct {
// Stream string          `json:"stream_name"`
// Config *ConsumerConfig `json:"config"`
// }

pub const CreateConsumerRequest = struct {
    stream_name: []const u8 = undefined,
    config: ConsumerConfig = undefined,
};
