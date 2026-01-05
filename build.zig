pub fn build(b: *std.Build) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for.
    const target = b.standardTargetOptions(.{});

    // Standard optimization options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const optimize = b.standardOptimizeOption(.{});

    const mailbox = b.dependency("mailbox", .{
        .target = target,
        .optimize = optimize,
    });

    const zul = b.dependency("zul", .{
        .target = target,
        .optimize = optimize,
    });

    // 1. Create("addModule") the "nats" module once and configure its internal dependencies.
    // Fix [Jetstream-no module named 'mailbox' available within module 'nats'](https://github.com/g41797/nats/issues/20)
    const nats_module = b.addModule("nats", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .single_threaded = false,
    });

    nats_module.addImport("mailbox", mailbox.module("mailbox"));
    nats_module.addImport("zul", zul.module("zul"));

    // 2. Create the static library using the configured module.
    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "nats",
        .root_module = nats_module,
    });

    if (builtin.os.tag == .windows) {
        lib.linkLibC();
        lib.linkSystemLibrary("ws2_32");
    }

    // This declares intent for the library to be installed into the standard location.
    b.installArtifact(lib);

    // 3. Standalone utility modules
    _ = b.addModule("Appendable", .{
        .root_source_file = b.path("src/Appendable.zig"),
        .target = target,
        .optimize = optimize,
    });

    _ = b.addModule("Formatter", .{
        .root_source_file = b.path("src/Formatter.zig"),
        .target = target,
        .optimize = optimize,
    });

    // 4. Documentation step
    const install_docs = b.addInstallDirectory(.{
        .source_dir = lib.getEmittedDocs(),
        .install_dir = .prefix,
        .install_subdir = "docs",
    });
    const docs_step = b.step("docs", "Install docs into zig-out/docs");
    docs_step.dependOn(&install_docs.step);

    // 5. Unit Testing
    const test_module = b.createModule(.{
        .root_source_file = b.path("src/root_tests.zig"),
        .target = target,
        .optimize = optimize,
        .single_threaded = false,
    });
    test_module.addImport("mailbox", mailbox.module("mailbox"));
    test_module.addImport("zul", zul.module("zul"));

    const lib_unit_tests = b.addTest(.{
        .root_module = test_module,
    });

    if (builtin.os.tag == .windows) {
        lib_unit_tests.linkLibC();
        lib_unit_tests.linkSystemLibrary("ws2_32");
    }

    b.installArtifact(lib_unit_tests);
    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);

    // 6. Integration tests
    const integration_test_module = b.createModule(.{
        .root_source_file = b.path("src/integration_tests.zig"),
        .target = target,
        .optimize = optimize,
        .single_threaded = false,
    });
    integration_test_module.addImport("mailbox", mailbox.module("mailbox"));
    integration_test_module.addImport("zul", zul.module("zul"));

    const integration_tests = b.addTest(.{
        .root_module = integration_test_module,
    });

    if (builtin.os.tag == .windows) {
        integration_tests.linkLibC();
        integration_tests.linkSystemLibrary("ws2_32");
    }

    const run_integration_tests = b.addRunArtifact(integration_tests);
    const integration_test_step = b.step("integration-test", "Run integration tests (requires NATS server)");
    integration_test_step.dependOn(&run_integration_tests.step);

    // 7. TLS tests
    const tls_test_module = b.createModule(.{
        .root_source_file = b.path("src/tcp-tls.zig"),
        .target = target,
        .optimize = optimize,
        .single_threaded = false,
    });
    tls_test_module.addImport("mailbox", mailbox.module("mailbox"));
    tls_test_module.addImport("zul", zul.module("zul"));

    const tls_tests = b.addTest(.{
        .root_module = tls_test_module,
    });

    if (builtin.os.tag == .windows) {
        tls_tests.linkLibC();
        tls_tests.linkSystemLibrary("ws2_32");
    }

    const run_tls_tests = b.addRunArtifact(tls_tests);
    const tls_test_step = b.step("tls", "Run TLS demo tests with demo.nats.io");
    tls_test_step.dependOn(&run_tls_tests.step);
}

const std = @import("std");
const builtin = @import("builtin");
