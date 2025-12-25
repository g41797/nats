// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

/// JetStream client for managing NATS JetStream streams.
/// Provides methods for creating, updating, purging, and deleting streams.
pub const JetStream = @This();

const CREATE_STREAM_T: []const u8 = "$JS.API.STREAM.CREATE.{s}";
const UPDATE_STREAM_T: []const u8 = "$JS.API.STREAM.UPDATE.{s}";
const PURGE_STREAM_T: []const u8 = "$JS.API.STREAM.PURGE.{s}";
const DELETE_STREAM_T: []const u8 = "$JS.API.STREAM.DELETE.{s}";
const INFO_STREAM_T: []const u8 = "$JS.API.STREAM.INFO.{s}";

mutex: Mutex = .{},
allocator: Allocator = undefined,
co: protocol.ConnectOpts = undefined,
connection: ?*Conn = null,
cmd: Formatter = .{},
jsn: Formatter = .{},

/// Connects to a NATS server with JetStream support.
/// Returns a JetStream client instance.
pub fn CONNECT(allocator: Allocator, co: protocol.ConnectOpts) !JetStream {
    var js: JetStream = .{ .allocator = allocator };

    js.connection = try createConn(allocator, co);

    js.cmd = try Formatter.init(js.allocator, 128);
    js.jsn = try Formatter.init(js.allocator, 256);

    js.co = co;
    return js;
}

/// Creates a new stream with the given configuration.
pub fn CREATE(js: *JetStream, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(CREATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    return js.process(protocol.SECNS * 5);
}

/// Updates an existing stream with the given configuration.
pub fn UPDATE(js: *JetStream, sc: *protocol.StreamConfig) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(UPDATE_STREAM_T, .{sc.name});
    _ = try js.jsn.stringify(sc.*, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    return js.process(protocol.SECNS * 5);
}

/// Purges all messages from the specified stream.
pub fn PURGE(js: *JetStream, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(PURGE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

/// Deletes the specified stream.
pub fn DELETE(js: *JetStream, sname: []const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    _ = try js.cmd.sprintf(DELETE_STREAM_T, .{sname});
    js.jsn.reset();

    return js.process(protocol.SECNS * 5);
}

/// Request options for stream info query.
/// All fields are optional - empty request returns basic stream info.
pub const StreamInfoRequest = struct {
    /// When true, returns full list of deleted message IDs.
    deleted_details: ?bool = null,
    /// Filter for subjects - returns message counts per matching subject.
    /// Supports NATS wildcard patterns.
    subjects_filter: ?[]const u8 = null,
    /// Paging offset when retrieving pages of subject details.
    offset: ?u64 = null,
};

/// State information for a stream.
pub const StreamState = struct {
    /// Number of messages stored in the Stream.
    messages: u64 = 0,
    /// Combined size of all messages in bytes.
    bytes: u64 = 0,
    /// Sequence number of the first message.
    first_seq: u64 = 0,
    /// Timestamp of the first message.
    first_ts: ?[]const u8 = null,
    /// Sequence number of the last message.
    last_seq: u64 = 0,
    /// Timestamp of the last message.
    last_ts: ?[]const u8 = null,
    /// Number of unique subjects in the stream.
    num_subjects: ?i64 = null,
    /// Number of deleted messages.
    num_deleted: ?i64 = null,
    /// Number of consumers attached to the stream.
    consumer_count: i64 = 0,
};

/// Response from stream info request.
pub const StreamInfoResponse = struct {
    /// Response type identifier.
    type: ?[]const u8 = null,
    /// Stream configuration (same as StreamConfig).
    config: ?protocol.StreamConfig = null,
    /// Current state of the stream.
    state: ?StreamState = null,
    /// Timestamp when the stream was created.
    created: ?[]const u8 = null,
    /// Server timestamp when info was generated.
    ts: ?[]const u8 = null,
    /// Cluster information (if clustered).
    cluster: ?ClusterInfo = null,
};

/// Cluster information for a stream.
pub const ClusterInfo = struct {
    /// Name of the cluster.
    name: ?[]const u8 = null,
    /// Leader node name.
    leader: ?[]const u8 = null,
};

/// Retrieves information about the specified stream.
/// Returns parsed StreamInfoResponse with config and state details.
pub fn INFO(js: *JetStream, sname: []const u8, request: *const StreamInfoRequest) !StreamInfoResponse {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    // Format the subject for stream info request
    _ = try js.cmd.sprintf(INFO_STREAM_T, .{sname});

    // Serialize the request struct to JSON
    _ = try js.jsn.stringify(request.*, .{
        .emit_strings_as_arrays = false,
        .whitespace = .minified,
        .emit_null_optional_fields = false,
    });

    // Use the generic request function to send and parse response
    return js.jsRequest(StreamInfoResponse, protocol.SECNS * 5);
}

/// Generic function for JetStream JSON request-response pattern.
/// Sends a request to the subject in js.cmd with payload from js.jsn,
/// receives response, parses JSON, and checks for JetStream errors.
pub fn jsRequest(js: *JetStream, comptime ResponseType: type, timeout_ns: u64) !ResponseType {
    // Step 1: Send request and receive response
    const response = try js.connection.?.requestNMT(
        js.cmd.formatbuf.body().?,
        null,
        js.jsn.formatbuf.body(),
        timeout_ns,
    );
    defer js.connection.?.reuse(response);

    // Step 2: Get the payload from the response
    const payload = response.letter.getPayload() orelse {
        // Empty response is an error for typed responses
        return error.EmptyResponse;
    };

    // Step 3: Check for JetStream-level errors in the response
    if (parse.isFailed(payload)) {
        return error.JetStreamsRequestFailed;
    }

    // Step 4: Parse JSON response into the expected type
    const parsed = json.parseFromSlice(
        ResponseType,
        js.allocator,
        payload,
        .{
            .ignore_unknown_fields = true,
            .allocate = .alloc_if_needed,
        },
    ) catch {
        return error.JsonParseError;
    };
    defer parsed.deinit();

    // Step 5: Return the parsed value
    return parsed.value;
}

/// Publishes a message to JetStream with optional headers and payload.
pub fn PUBLISH(js: *JetStream, subject: []const u8, headers: ?*Headers, payload: ?[]const u8) !void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return error.NotConnected;
    }

    const response = try js.connection.?.requestNMT(subject, headers, payload, protocol.SECNS * 10);
    defer js.connection.?.reuse(response);

    if (response.letter.getPayload()) |data| {
        if (parse.isFailed(data)) {
            return error.JetStreamsRequestFailed;
        } else {
            return;
        }
    } else {
        return;
    }
}

/// Disconnects from the NATS server and releases all resources.
pub fn DISCONNECT(js: *JetStream) void {
    js.mutex.lock();
    defer js.mutex.unlock();

    if (js.connection == null) {
        return;
    }

    js.connection.?.interrupt() catch {};
    js.connection.?.disconnect();
    js.allocator.destroy(js.connection.?);
    js.connection = null;

    js.cmd.deinit();
    js.jsn.deinit();

    return;
}

fn process(js: *JetStream, timeout_ns: u64) !void {
    const response = try js.connection.?.requestNMT(js.cmd.formatbuf.body().?, null, js.jsn.formatbuf.body(), timeout_ns);
    defer js.connection.?.reuse(response);
    if (response.letter.getPayload()) |payload| {
        if (parse.isFailed(payload)) {
            return error.JetStreamsRequestFailed;
        } else {
            return;
        }
    } else {
        return;
    }
}

/// Creates and connects a new connection to the NATS server.
pub fn createConn(allocator: Allocator, co: protocol.ConnectOpts) !*Conn {
    const conn = try allocator.create(Conn);
    conn.* = .{};
    errdefer allocator.destroy(conn);

    try conn.*.connect(allocator, co);

    return conn;
}

const std = @import("std");
const json = std.json;
const Conn = @import("Conn.zig");
const protocol = @import("protocol.zig");
const messages = @import("messages.zig");
const parse = @import("parse.zig");

const Allocator = std.mem.Allocator;
const Mutex = std.Thread.Mutex;

const Headers = messages.Headers;
/// Re-export of the allocated message type.
pub const AllocatedMSG = messages.AllocatedMSG;
const Formatter = @import("Formatter.zig");
