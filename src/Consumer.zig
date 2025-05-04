// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

pub const Consumer = @This();

const ACTION_CREATE_CONSUMER: []const u8 = "create";
const ACTION_UPDATE_CONSUMER: []const u8 = "update";
const ACTION_CREATE_OR_UPDATE_CONSUMER: []const u8 = "";

pub const ACK_CONSUME_T: []const u8 = "$JS.ACK.{s}.{s}";

pub const CONSUME_NEXT_MSG_T: []const u8 = "$JS.API.CONSUMER.MSG.NEXT.{s}.{s}";

const CreateConsumerRequest = struct {
    stream_name: []const u8 = undefined,
    config: InternalConsumerConfig = undefined,
    action: String = undefined,
};

// type JSApiConsumerGetNextRequest struct {
//     Expires   time.Duration `json:"expires,omitempty"`
//     Batch     int           `json:"batch,omitempty"`
//     MaxBytes  int           `json:"max_bytes,omitempty"`
//     NoWait    bool          `json:"no_wait,omitempty"`
//     Heartbeat time.Duration `json:"idle_heartbeat,omitempty"`
//     PriorityGroup
// }

const ConsumerGetNextMsgRequest = struct {
    expires: ?u64 = null,
    batch: ?i32 = null,
    no_wait: ?bool = null,
};

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
    deliver_policy: String = undefined,

    ack_policy: String = undefined,
    ack_wait: u64 = undefined,

    max_ack_pending: ?i32 = null,
    max_waiting: ?i32 = null,
    max_deliver: ?i32 = null,

    filter_subject: ?String = null,
    replay_policy: String = undefined,

    headers_only: ?bool = null,

    num_replicas: i32 = undefined,
    mem_storage: ?bool = null,

    flow_control: ?bool = false,
    idle_heartbeat: ?u64 = null,
};

mutex: Mutex = .{},
allocator: Allocator = undefined,
co: protocol.ConnectOpts = undefined,
connection: ?*Conn = null,
stream: Appendable = .{},
consumer: Appendable = .{},
cmd: Formatter = .{},
jsn: Formatter = .{},
durable: bool = false,
inbox: [36]u8 = undefined,
sid: u64 = 0,
created: bool = false,
req_reply2: Formatter = .{},

pub fn START(allocator: Allocator, co: protocol.ConnectOpts, stream: []const u8, cscnf: *ConsumerConfig) !Consumer {
    var cs: Consumer = .{ .allocator = allocator };

    cs.connection = try JetStream.createConn(allocator, co);
    errdefer cs.deinit();

    _ = try cs.stream.init(cs.allocator, stream.len, null);
    try cs.stream.copy(stream);

    _ = try cs.consumer.init(cs.allocator, 256, null);

    cs.cmd = try Formatter.init(cs.allocator, 128);
    cs.jsn = try Formatter.init(cs.allocator, 256);
    cs.req_reply2 = try Formatter.init(allocator, 48);

    try cs.start(cscnf);

    return cs;
}

pub fn CONSUME(cs: *Consumer, timeout_ns: u64) !?*AllocatedMSG {
    cs.mutex.lock();
    defer cs.mutex.unlock();

    if (cs.connection == null) {
        return error.NotConnected;
    }

    const gnmresp = try cs.processNext(timeout_ns);

    return gnmresp;
}

pub fn STOP(cs: *Consumer, delete: ?bool) void {
    cs.mutex.lock();
    defer cs.mutex.unlock();

    if (cs.connection == null) {
        return;
    }

    cs.stop(delete) catch {};
    cs.deinit();

    return;
}

pub fn ACK(cs: *Consumer, msg: *AllocatedMSG, reuseMsg: bool) !void {
    cs.mutex.lock();
    defer cs.mutex.unlock();

    if (cs.connection != null) {
        try cs.ack(msg);
    }

    if (reuseMsg) {
        cs.reuse(msg);
    }
}

pub fn NACK(cs: *Consumer, msg: *AllocatedMSG, reuseMsg: bool) !void {
    cs.mutex.lock();
    defer cs.mutex.unlock();

    if (cs.connection != null) {
        try cs.nack(msg);
    }

    if (reuseMsg) {
        cs.reuse(msg);
    }
}

pub fn REUSE(cs: *Consumer, msg: *AllocatedMSG) void {
    cs.mutex.lock();
    defer cs.mutex.unlock();

    cs.reuse(msg);
}

fn start(cs: *Consumer, cscnf: *ConsumerConfig) !void {
    // try cs.subscribe();

    var icc: InternalConsumerConfig = .{};

    _ = utils.copyFields(cscnf.*, &icc);

    cs.durable = ((icc.durable_name != null) and (icc.durable_name.?.len > 0));

    if (cs.durable) {
        _ = try cs.cmd.sprintf(protocol.CREATE_DURABLE_CONSUMER_T, .{ cs.stream.body().?, icc.durable_name.? });
    } else {
        _ = try cs.cmd.sprintf(protocol.CREATE_EPHEMERAL_CONSUMER_T, .{cs.stream.body().?});
    }

    var ccr: CreateConsumerRequest = .{ .stream_name = cs.stream.body().?, .config = icc, .action = ACTION_CREATE_OR_UPDATE_CONSUMER };

    if (!cs.durable) {
        ccr.action = ACTION_CREATE_CONSUMER;
    }

    _ = try cs.jsn.stringify(ccr, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    const crresp = try cs.process(protocol.SECNS * 10);

    if (crresp == null) {
        return error.UnexpectedConsumeErrorEmptyResponse;
    }

    defer cs.connection.?.reuse(crresp.?);

    if (crresp.?.letter.getPayload() == null) {
        return error.ConsumerEmptyResponse;
    }

    if (parse.responseNameText(crresp.?.letter.getPayload().?)) |name| {
        try cs.consumer.copy(name);
    } else {
        return error.ConsumerNameDoesNotExistInResponse;
    }

    cs.created = true;
    return;
}

fn process(cs: *Consumer, timeout_ns: u64) !?*AllocatedMSG {
    const response = try cs.connection.?.requestNMT(cs.cmd.formatbuf.body().?, null, cs.jsn.formatbuf.body(), timeout_ns);
    errdefer cs.connection.?.reuse(response);

    if (response.letter.getPayload()) |payload| {
        if (parse.isFailed(payload)) {
            return error.JetStreamsRequestFailed;
        } else {
            return response;
        }
    } else { // headers only
        return response;
    }
}

fn processNext(cs: *Consumer, timeout_ns: u64) !?*AllocatedMSG {
    const response = try cs.getNext(timeout_ns);

    if (response == null) {
        return null;
    }

    errdefer cs.connection.?.reuse(response.?);

    if (response.?.letter.getPayload()) |payload| {
        if (parse.isFailed(payload)) {
            return error.JetStreamsRequestFailed;
        } else {
            return response;
        }
    } else { // headers only
        return response;
    }
}

fn getNext(cs: *Consumer, timeout_ns: u64) !?*AllocatedMSG {
    _ = try cs.cmd.sprintf(CONSUME_NEXT_MSG_T, .{
        cs.stream.body().?,
        cs.consumer.body().?,
    });

    const gnm: ConsumerGetNextMsgRequest = .{
        .expires = timeout_ns,
        .batch = 1,
        // .no_wait = true,
    };

    _ = try cs.jsn.stringify(gnm, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    const REPLY_TO = try cs.connection.?.nextReply2NMT();

    if (builtin.mode == .Debug) {
        try cs.connection.?.ping();
    }

    try cs.connection.?.@"pub"(cs.cmd.formatbuf.body().?, REPLY_TO, cs.jsn.formatbuf.body());

    var delay: u64 = protocol.SECNS * 1;

    if (builtin.mode == .Debug) {
        delay *= 10;
    }

    const recvMsg = try cs.connection.?.waitMessageNMT(timeout_ns + delay, null);

    if ((std.mem.eql(u8, REPLY_TO, recvMsg.*.letter.Subject().?)) and isNoMessages(recvMsg)) {
        cs.reuse(recvMsg);
        return null;
    }

    return recvMsg;
}

fn nextReply2NMT(cs: *Consumer) ![]const u8 {
    const REPLY_TO = try cs.req_reply2.sprintf("{0s}.{1d}", .{ cs.inbox[0..36], cs.connection.?.nextSidNMT() });
    return REPLY_TO.?;
}

fn ack(cs: *Consumer, msg: *AllocatedMSG) !void {
    _ = try cs.connection.?.@"pub"(msg.letter.ReplyTo().?, null, "+ACK");
}

fn nack(cs: *Consumer, msg: *AllocatedMSG) void {
    _ = try cs.connection.?.@"pub"(msg.letter.ReplyTo().?, null, "-NAK");
}

fn reuse(cs: *Consumer, msg: *AllocatedMSG) void {
    if (cs.connection == null) {
        messages.free(msg);
    }
    cs.connection.?.reuse(msg);
}

fn stop(cs: *Consumer, delete: ?bool) !void {
    if (!cs.created) {
        return;
    }

    if (cs.connection == null) {
        return;
    }

    // cs.unsubscribe();

    if (!cs.durable) {
        return;
    }

    if (delete == null) {
        return;
    }

    if (!delete.?) {
        return;
    }

    _ = try cs.cmd.sprintf(protocol.DELETE_CONSUMER_T, .{
        cs.stream.body().?,
        cs.consumer.body().?,
    });
    cs.jsn.reset();

    const delresp = try cs.process(protocol.SECNS * 10);
    if (delresp != null) {
        cs.connection.?.reuse(delresp.?);
    }

    return;
}

fn deinit(cs: *Consumer) void {
    if (cs.connection == null) {
        return;
    }

    cs.connection.?.interrupt() catch {};
    cs.connection.?.disconnect();
    cs.allocator.destroy(cs.connection.?);
    cs.connection = null;

    cs.stream.deinit();
    cs.consumer.deinit();
    cs.cmd.deinit();
    cs.jsn.deinit();
    cs.req_reply2.deinit();

    return;
}

const RequestTimeout = "NATS/1.0 408";
const NoMessages = "NATS/1.0 404";

fn isNoMessages(msg: *AllocatedMSG) bool {
    var result: bool = false;

    while (true) {
        if (msg.letter.mt != .HMSG) {
            break;
        }

        if (msg.letter.getPayload() != null) {
            break;
        }

        const startOfHeaders = msg.letter.headers.buffer.body().?;

        result = utils.startsWith(startOfHeaders, RequestTimeout) or utils.startsWith(startOfHeaders, NoMessages);
        break;
    }

    return result;
}

const std = @import("std");
const builtin = @import("builtin");
const Conn = @import("Conn.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const parse = @import("parse.zig");
const JetStream = @import("JetStream.zig");
const Appendable = @import("Appendable.zig");
const utils = @import("utils.zig");

const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const Headers = messages.Headers;
pub const AllocatedMSG = messages.AllocatedMSG;
const Formatter = @import("Formatter.zig");

const String = protocol.String;
const Strings = protocol.Strings;

const ConsumerConfig = protocol.ConsumerConfig;
