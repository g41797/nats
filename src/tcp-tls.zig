const std = @import("std");
const testing = std.testing;
const Conn = @import("Conn.zig");
const Core = @import("Core.zig");
const protocol = @import("protocol.zig");

// Use the public NATS demo server
const DEMO_HOST = "demo.nats.io";
const DEMO_PORT = 4222;

test "Integration: Connect to demo.nats.io with TLS" {
    // 1. Setup
    // Use the testing allocator to catch memory leaks
    const allocator = testing.allocator;

    var core = Core{};
    // We don't deinit conn here because disconnect() handles cleanup
    // but typically you'd have a deinit in your struct.
    // Assuming disconnect() does the job based on your code.

    // 2. Configure Options
    // We explicitly set tls_required = true to FORCE the upgrade logic
    const opts = protocol.ConnectOpts{
        .addr = DEMO_HOST,
        .port = DEMO_PORT,
        .tls_required = true, // <--- Triggers your upgradeTLS logic
        .verbose = true,
    };

    std.debug.print("[TLS] Connecting to {s}:{d}...\n", .{ DEMO_HOST, DEMO_PORT });

    // 3. Connect
    // This runs _connect, reads INFO, upgrades to TLS, then sends CONNECT
    try core.CONNECT(allocator, opts);

    std.debug.print("[TLS] Connected! TLS Handshake complete.\n", .{});

    // 4. Verify Functionality
    // Try to publish a message to ensure the encrypted stream works
    const subject = "zig.test.tls";
    const payload = "Hello Secure World";

    try core.PUB(subject, null, payload);
    try core.PING();
    std.debug.print("[TLS] Encrypted message published.\n", .{});

    // 5. Cleanup
    core.DISCONNECT();
    std.debug.print("[TLS] Disconnected.\n", .{});
}

test "Integration: Connect to demo.nats.io (Plaintext Control)" {
    const allocator = testing.allocator;
    var core = Core{};

    std.debug.print("[TLS] Connecting to {s}:{d}...\n", .{ DEMO_HOST, DEMO_PORT });

    try core.CONNECT(
        allocator,
        .{
            .addr = DEMO_HOST,
            .port = DEMO_PORT,
            .tls_required = false, // <--- Plaintext path
        },
    );
    std.debug.print("[TLS] Connected via Plain TCP.\n", .{});

    try core.PUB("zig.test.plain", null, "Hello Plain World");
    try core.PING();

    core.DISCONNECT();
    std.debug.print("[TLS] Disconnected.\n", .{});
}
