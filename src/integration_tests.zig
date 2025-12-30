// Integration tests for NATS authentication
// These tests are skipped unless the appropriate environment variables are set
// See test/run-integration-tests.sh for how to run these

const std = @import("std");
const testing = std.testing;
const protocol = @import("protocol.zig");
const Conn = @import("Conn.zig");
const Core = @import("Core.zig");

test "Auth: JWT Authentication" {
    const allocator = std.testing.allocator;

    // 1. Read Env Vars
    // Get environment variables
    var envs = try std.process.getEnvMap(allocator);
    defer envs.deinit();

    const jwt = envs.get("NATS_JWT") orelse return error.SkipZigTest;
    const seed = envs.get("NATS_NKEY_SEED") orelse return error.SkipZigTest;

    // 2. Connect using both JWT and Seed
    var core = Core{};
    try core.CONNECT(allocator, .{
        .addr = "127.0.0.1",
        .port = 4226,
        .jwt = jwt,
        .nkey_seed = seed, // The seed is needed to sign the nonce
    });
    defer core.DISCONNECT();
    // 3. Verify connection by pinging the server
    try core.PING();
}

test "Auth: Token Authentication" {
    const allocator = testing.allocator;

    // Get environment variables
    var envs = try std.process.getEnvMap(allocator);
    defer envs.deinit();

    // Only run if NATS_TOKEN env var is set
    const token = envs.get("NATS_TOKEN") orelse return error.SkipZigTest;

    // Test 1: Basic Core connection with PING
    {
        var core = Core{};
        try core.CONNECT(allocator, .{
            .addr = "127.0.0.1",
            .port = 4223,
            .auth_token = token,
        });
        defer core.DISCONNECT();

        try core.PING();
        std.debug.print("Token auth (Core): Successfully connected and verified with PING\n", .{});
    }

    // Test 2: JetStream operations
    {
        const JetStream = @import("JetStream.zig");

        const js_opts: protocol.ConnectOpts = .{
            .addr = "127.0.0.1",
            .port = 4223,
            .auth_token = token,
        };

        var js = try JetStream.CONNECT(allocator, js_opts);
        defer js.DISCONNECT();

        const test_stream_name = "TOKEN_AUTH_TEST";
        var stream_config: protocol.StreamConfig = .{
            .name = test_stream_name,
            .subjects = &.{"token.test.>"},
        };

        var stream_created = false;
        js.CREATE(&stream_config) catch |err| {
            if (err == error.StreamAlreadyExists) {
                std.debug.print("Token auth (JetStream): Stream already exists (OK)\n", .{});
                stream_created = true;
            } else {
                std.debug.print("Token auth (JetStream): CREATE failed with error: {}\n", .{err});
                return err;
            }
        };

        if (!stream_created) {
            stream_created = true;
        }

        const empty_request: JetStream.StreamInfoRequest = .{};
        const info = try js.INFO(test_stream_name, &empty_request);

        std.debug.print("Token auth (JetStream): ✅ Stream INFO succeeded - {d} messages\n", .{info.state.?.messages});

        js.DELETE(test_stream_name) catch |err| {
            std.debug.print("Token auth (JetStream): DELETE failed (OK): {}\n", .{err});
        };
    }

    std.debug.print("Token auth: ✅ All tests passed (Core + JetStream)\n", .{});
}

test "Auth: User/Pass Authentication" {
    const allocator = testing.allocator;

    // Get environment variables
    var envs = try std.process.getEnvMap(allocator);
    defer envs.deinit();

    // Only run if NATS_USER and NATS_PASS env vars are set
    const user = envs.get("NATS_USER") orelse return error.SkipZigTest;
    const pass = envs.get("NATS_PASS") orelse return error.SkipZigTest;

    // Test 1: Basic Core connection with PUB
    {
        var core = Core{};
        try core.CONNECT(allocator, .{
            .addr = "127.0.0.1",
            .port = 4224,
            .user = user,
            .pass = pass,
        });
        defer core.DISCONNECT();

        try core.PUB("test.userpass.auth", null, "test payload");
        std.debug.print("User/Pass auth (Core): Successfully connected and published\n", .{});
    }

    // Test 2: JetStream operations
    {
        const JetStream = @import("JetStream.zig");

        const js_opts: protocol.ConnectOpts = .{
            .addr = "127.0.0.1",
            .port = 4224,
            .user = user,
            .pass = pass,
        };

        var js = try JetStream.CONNECT(allocator, js_opts);
        defer js.DISCONNECT();

        const test_stream_name = "USERPASS_AUTH_TEST";
        var stream_config: protocol.StreamConfig = .{
            .name = test_stream_name,
            .subjects = &.{"userpass.test.>"},
        };

        var stream_created = false;
        js.CREATE(&stream_config) catch |err| {
            if (err == error.StreamAlreadyExists) {
                std.debug.print("User/Pass auth (JetStream): Stream already exists (OK)\n", .{});
                stream_created = true;
            } else {
                std.debug.print("User/Pass auth (JetStream): CREATE failed with error: {}\n", .{err});
                return err;
            }
        };

        if (!stream_created) {
            stream_created = true;
        }

        const empty_request: JetStream.StreamInfoRequest = .{};
        const info = try js.INFO(test_stream_name, &empty_request);

        std.debug.print("User/Pass auth (JetStream): ✅ Stream INFO succeeded - {d} messages\n", .{info.state.?.messages});

        js.DELETE(test_stream_name) catch |err| {
            std.debug.print("User/Pass auth (JetStream): DELETE failed (OK): {}\n", .{err});
        };
    }

    std.debug.print("User/Pass auth: ✅ All tests passed (Core + JetStream)\n", .{});
}

test "Auth: NKey Authentication" {
    const allocator = testing.allocator;

    // Get environment variables
    var envs = try std.process.getEnvMap(allocator);
    defer envs.deinit();

    // Only run if NATS_NKEY_SEED env var is set
    const seed = envs.get("NATS_NKEY_SEED") orelse return error.SkipZigTest;
    if (envs.get("NATS_JWT") != null) return error.SkipZigTest;

    // Test 1: Basic Core connection with PING/PUB
    {
        var core = Core{};
        try core.CONNECT(allocator, .{
            .addr = "127.0.0.1",
            .port = 4225,
            .nkey_seed = seed,
        });
        defer core.DISCONNECT();

        // Verify connection by doing a publish and ensuring no errors
        // If connection/auth failed, PUB would return an error
        try core.PUB("test.nkey.auth", null, "test payload");

        std.debug.print("NKey auth (Core): Successfully connected and published\n", .{});
    }

    // Test 2: JetStream operations (stream creation and INFO)
    // This is critical because the bridge uses JetStream, not just basic NATS
    {
        const JetStream = @import("JetStream.zig");

        const js_opts: protocol.ConnectOpts = .{
            .addr = "127.0.0.1",
            .port = 4225,
            .nkey_seed = seed,
        };

        var js = try JetStream.CONNECT(allocator, js_opts);
        defer js.DISCONNECT();

        // Create a test stream with minimal config (use NATS defaults)
        const test_stream_name = "NKEY_AUTH_TEST";
        var stream_config: protocol.StreamConfig = .{
            .name = test_stream_name,
            .subjects = &.{"nkey.test.>"},
        };

        // Try to create stream
        var stream_created = false;
        js.CREATE(&stream_config) catch |err| {
            // If stream already exists, that's fine - we can still test INFO
            if (err == error.StreamAlreadyExists) {
                std.debug.print("NKey auth (JetStream): Stream already exists (OK)\n", .{});
                stream_created = true;
            } else {
                // For any other error, this is a real failure
                std.debug.print("NKey auth (JetStream): CREATE failed with error: {}\n", .{err});
                return err;
            }
        };

        if (!stream_created) {
            stream_created = true;
        }

        // Verify we can get stream info (requires JetStream API access)
        const empty_request: JetStream.StreamInfoRequest = .{};
        const info = try js.INFO(test_stream_name, &empty_request);

        std.debug.print("NKey auth (JetStream): ✅ Stream INFO succeeded - {d} messages\n", .{info.state.?.messages});

        // Cleanup: Delete the test stream
        js.DELETE(test_stream_name) catch |err| {
            std.debug.print("NKey auth (JetStream): DELETE failed (OK): {}\n", .{err});
        };
    }

    std.debug.print("NKey auth: ✅ All tests passed (Core + JetStream)\n", .{});
}

test "Auth Validation: Conflicting auth methods (NKey + Token)" {
    const allocator = testing.allocator;

    // Test that providing both NKey and token is rejected
    const result = protocol.buildConnectString(
        allocator,
        .{
            .nkey_seed = "SUAA5NXASOB7VKY5KDN2XMOV6ZU5T6V5C2RWTGEFITZDNCMJGR2BTWQOQ4",
            .auth_token = "some_token",
        },
        null,
        null,
    );

    try testing.expectError(error.ConflictingAuthMethods, result);
}

test "Auth Validation: Conflicting auth methods (NKey + User/Pass)" {
    const allocator = testing.allocator;

    // Test that providing both NKey and user/pass is rejected
    const result = protocol.buildConnectString(
        allocator,
        .{
            .nkey_seed = "SUAA5NXASOB7VKY5KDN2XMOV6ZU5T6V5C2RWTGEFITZDNCMJGR2BTWQOQ4",
            .user = "testuser",
            .pass = "testpass",
        },
        null,
        null,
    );

    try testing.expectError(error.ConflictingAuthMethods, result);
}

test "Auth Validation: Conflicting auth methods (Token + User/Pass)" {
    const allocator = testing.allocator;

    // Test that providing both token and user/pass is rejected
    const result = protocol.buildConnectString(
        allocator,
        .{
            .auth_token = "some_token",
            .user = "testuser",
            .pass = "testpass",
        },
        null,
        null,
    );

    try testing.expectError(error.ConflictingAuthMethods, result);
}

test "Auth Validation: User without password" {
    const allocator = testing.allocator;

    // Test that providing user without password is rejected
    const result = protocol.buildConnectString(
        allocator,
        .{
            .user = "testuser",
        },
        null,
        null,
    );

    try testing.expectError(error.MissingPassword, result);
}

test "Auth Validation: Password without user" {
    const allocator = testing.allocator;

    // Test that providing password without user is rejected
    const result = protocol.buildConnectString(
        allocator,
        .{
            .pass = "testpass",
        },
        null,
        null,
    );

    try testing.expectError(error.PasswordWithoutUser, result);
}

test "Auth Validation: Valid auth methods work correctly" {
    const allocator = testing.allocator;

    // Test that each valid auth method works independently

    // Token auth
    {
        const result = try protocol.buildConnectString(
            allocator,
            .{ .auth_token = "test_token" },
            null,
            null,
        );
        defer allocator.free(result);
        try testing.expect(std.mem.indexOf(u8, result, "auth_token") != null);
    }

    // User/Pass auth
    {
        const result = try protocol.buildConnectString(
            allocator,
            .{
                .user = "testuser",
                .pass = "testpass",
            },
            null,
            null,
        );
        defer allocator.free(result);
        try testing.expect(std.mem.indexOf(u8, result, "testuser") != null);
        try testing.expect(std.mem.indexOf(u8, result, "testpass") != null);
    }

    // NKey auth (with pubkey and signature)
    {
        const result = try protocol.buildConnectString(
            allocator,
            .{ .nkey_seed = "SUAA5NXASOB7VKY5KDN2XMOV6ZU5T6V5C2RWTGEFITZDNCMJGR2BTWQOQ4" },
            "UAD46KBLJ5NVEPU3BGXQY75NTDWSZ6BEBMPQKMLS3BAX7PWYS2IIGCZF",
            "dGVzdF9zaWduYXR1cmU",
        );
        defer allocator.free(result);
        try testing.expect(std.mem.indexOf(u8, result, "nkey") != null);
        try testing.expect(std.mem.indexOf(u8, result, "sig") != null);
    }

    // No auth (valid - anonymous connection)
    {
        const result = try protocol.buildConnectString(
            allocator,
            .{},
            null,
            null,
        );
        defer allocator.free(result);
        try testing.expect(std.mem.indexOf(u8, result, "CONNECT") != null);
    }
}
