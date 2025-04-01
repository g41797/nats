// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Consumer = @This();

const CREATE_SUBJECT_CONSUMER: []const u8 = protocol.CREATE_CONSUMER_FLT_T;
const CREATE_ALL_CONSUMER: []const u8 = protocol.CREATE_CONSUMER_T;
const DELETE_CONSUMER: []const u8 = protocol.DELETE_CONSUMER_T;

const ACTION_CREATE_CONSUMER: []const u8 = "create";
const ACTION_UPDATE_CONSUMER: []const u8 = "update";
const ACTION_CREATE_OR_UPDATE_CONSUMER: []const u8 = "";

//------------------
// Go ConsumerConfig
//------------------
// type ConsumerConfig struct {
//     Durable         string          `json:"durable_name,omitempty"`
//     Name            string          `json:"name,omitempty"`
//     Description     string          `json:"description,omitempty"`
//     DeliverPolicy   DeliverPolicy   `json:"deliver_policy"`
//     OptStartSeq     uint64          `json:"opt_start_seq,omitempty"`
//     OptStartTime    *time.Time      `json:"opt_start_time,omitempty"`
//     AckPolicy       AckPolicy       `json:"ack_policy"`
//     AckWait         time.Duration   `json:"ack_wait,omitempty"`
//     MaxDeliver      int             `json:"max_deliver,omitempty"`
//     BackOff         []time.Duration `json:"backoff,omitempty"`
//     FilterSubject   string          `json:"filter_subject,omitempty"`
//     FilterSubjects  []string        `json:"filter_subjects,omitempty"`
//     ReplayPolicy    ReplayPolicy    `json:"replay_policy"`
//     RateLimit       uint64          `json:"rate_limit_bps,omitempty"` // Bits per sec
//     SampleFrequency string          `json:"sample_freq,omitempty"`
//     MaxWaiting      int             `json:"max_waiting,omitempty"`
//     MaxAckPending   int             `json:"max_ack_pending,omitempty"`
//     FlowControl     bool            `json:"flow_control,omitempty"`
//     Heartbeat       time.Duration   `json:"idle_heartbeat,omitempty"`
//     HeadersOnly     bool            `json:"headers_only,omitempty"`
//
//     // Pull based options.
//     MaxRequestBatch    int           `json:"max_batch,omitempty"`
//     MaxRequestExpires  time.Duration `json:"max_expires,omitempty"`
//     MaxRequestMaxBytes int           `json:"max_bytes,omitempty"`
//
//     // Push based consumers.
//     DeliverSubject string `json:"deliver_subject,omitempty"`
//     DeliverGroup   string `json:"deliver_group,omitempty"`
//
//     // Inactivity threshold.
//     InactiveThreshold time.Duration `json:"inactive_threshold,omitempty"`
//
//     // Generally inherited by parent stream and other markers, now can be configured directly.
//     Replicas int `json:"num_replicas"`
//     // Force memory storage.
//     MemoryStorage bool `json:"mem_storage,omitempty"`
//
//     // Metadata is additional metadata for the Consumer.
//     // Keys starting with `_nats` are reserved.
//     // NOTE: Metadata requires nats-server v2.10.0+
//     Metadata map[string]string `json:"metadata,omitempty"`
// }

pub const InternalConsumerConfig = struct {
    durable_name: ?String = null,
    name: ?String = null,

    description: ?String = null,
    ack_policy: String = undefined,
    ack_wait: u64 = undefined,
    deliver_policy: String = undefined,

    filter_subject: ?String = null,
    max_ack_pending: ?i32 = null,
    max_deliver: ?i32 = null,
    max_waiting: ?i32 = null,
    replay_policy: String = undefined,
    headers_only: ?bool = null,
    num_replicas: i32 = undefined,
    mem_storage: ?bool = null,
    inactive_threshold: ?u64 = null,

    flow_control: ?bool = null,
    idle_heartbeat: ?u64 = null,
};

const CreateConsumerRequest = struct {
    stream_name: []const u8 = undefined,
    config: ConsumerConfig = undefined,
    action: String = undefined,
};

const std = @import("std");
const Conn = @import("Conn.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const parse = @import("parse.zig");
const JetStream = @import("JetStream.zig");
const Appendable = @import("Appendable.zig");

const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const Headers = messages.Headers;
pub const AllocatedMSG = messages.AllocatedMSG;
const Formatter = @import("Formatter.zig");

const String = protocol.String;
const Strings = protocol.Strings;

const ConsumerConfig = protocol.ConsumerConfig;
