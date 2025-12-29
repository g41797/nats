//!  TLS Wrapper
//! Allcote a single contiguous buffer (arena) for the 4 required
//! TLS IO buffers (Socket read/write, TLS read/write).

pub const Box = struct {
    // The TLS State Machine
    client: tls.Client,
    // Certificate bundle (must outlive the TLS client)
    bundle: Bundle,
    // The underlying concrete wrappers around the socket
    // We must keep these alive because 'client' holds pointers to their interfaces
    stream_reader: net.Stream.Reader,
    stream_writer: net.Stream.Writer,
    // Arena to manage the buffers and this struct itself
    arena: std.heap.ArenaAllocator,

    /// Allocates all required buffers and initializes the TLS client.
    pub fn init(allocator: Allocator, stream: net.Stream, host: []const u8, bundle: Bundle) !*Box {
        var arena = std.heap.ArenaAllocator.init(allocator);
        errdefer arena.deinit();
        const aa = arena.allocator();

        // 1. Calculate Buffer Sizes
        // NATS/TLS requires enough space for the maximum ciphertext record length (~16KB + overhead)
        // We need 4 distinct buffers for the pipeline:
        //   [0]: Socket Read  (Encrypted input from network)
        //   [1]: Socket Write (Encrypted output to network)
        //   [2]: TLS Read     (Decrypted data waiting for app)
        //   [3]: TLS Write    (Plaintext data waiting to be encrypted)
        const rec_len = tls.max_ciphertext_record_len;
        const total_len = rec_len * 4;
        // Allocate one contiguous slab for cache locality
        const buf = try aa.alloc(u8, total_len);

        // Partition the slab
        const sock_r_buf = buf[0..rec_len];
        const sock_w_buf = buf[rec_len .. 2 * rec_len];
        const tls_r_buf = buf[2 * rec_len .. 3 * rec_len];
        const tls_w_buf = buf[3 * rec_len .. 4 * rec_len];

        // 2. Create the Box struct in the same arena
        const self = try aa.create(Box);
        self.* = .{
            .arena = arena,
            .client = undefined,
            .bundle = bundle,
            // Initialize the concrete stream wrappers with their specific buffers
            .stream_reader = stream.reader(sock_r_buf),
            .stream_writer = stream.writer(sock_w_buf),
        };

        // 3. Initialize TLS Client
        // We pass the .interface() of our concrete wrappers to the TLS state machine
        self.client = try tls.Client.init(self.stream_reader.interface(), &self.stream_writer.interface, .{
            .host = .{ .explicit = host },
            .ca = .{ .bundle = self.bundle },
            // Pass the remaining two buffers for internal crypto operations
            .read_buffer = tls_r_buf,
            .write_buffer = tls_w_buf,
            // Required for robust handling of partial records in non-blocking mode
            .allow_truncation_attacks = true,
        });

        return self;
    }

    pub fn deinit(self: *Box, allocator: Allocator) void {
        // Best-effort close notification to the server
        _ = self.client.end() catch {};
        // Clean up the certificate bundle & buffers & Box
        self.bundle.deinit(allocator);
        self.arena.deinit();
    }
};

const std = @import("std");
const net = std.net;
const tls = std.crypto.tls;
const Allocator = std.mem.Allocator;
const Bundle = std.crypto.Certificate.Bundle;
