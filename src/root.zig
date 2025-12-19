// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

//! NATS client library for Zig.
//! Provides types and functions for connecting to NATS servers and working with
//! JetStream for persistent messaging.

/// Dynamically growable byte buffer with efficient memory management.
pub const Appendable = @import("Appendable.zig");

/// String formatting utility with automatic buffer expansion.
pub const Formatter = @import("Formatter.zig");

/// Low-level TCP client for NATS protocol communication.
pub const Client = @import("Client.zig");

/// Parsing utilities for NATS protocol messages.
pub const parse = @import("parse.zig");

pub const protocol = @import("protocol.zig");
pub const Core = @import("Core.zig");
pub const Conn = @import("Conn.zig");
pub const JS = @import("JetStream.zig");
pub const pool = @import("messages.zig");
pub const Subscriber = @import("Subscriber.zig");
pub const Consumer = @import("Consumer.zig");

/// General utility functions for field copying and string operations.
pub const utils = @import("utils.zig");
