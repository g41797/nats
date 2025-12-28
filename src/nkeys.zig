// Copyright (c) 2025
// SPDX-License-Identifier: MIT

//! NKeys implementation for NATS authentication.
//! Based on the NATS nkeys specification and ed25519 cryptography.
//!
//! Following the implementation from nats.c

const std = @import("std");
const base64 = std.base64;
const Ed25519 = std.crypto.sign.Ed25519;

// NKey prefix bytes (match nkeys.c)
const PREFIX_BYTE_SEED: u8 = 18 << 3; // 'S' in base32
const PREFIX_BYTE_USER: u8 = 20 << 3; // 'U' in base32
const PREFIX_BYTE_ACCOUNT: u8 = 0; // 'A' in base32
const PREFIX_BYTE_SERVER: u8 = 13 << 3; // 'N' in base32
const PREFIX_BYTE_CLUSTER: u8 = 2 << 3; // 'C' in base32

// Base32 alphabet for decoding
const base32_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";

// Base32 decode map (initialized at comptime)
const base32_decode_map = blk: {
    var map: [256]u8 = undefined;
    for (&map) |*c| c.* = 0xFF;
    for (base32_alphabet, 0..) |char, i| {
        map[char] = @intCast(i);
    }
    break :blk map;
};

/// CRC16 table for checksum validation (CCITT polynomial)
const crc16_table = blk: {
    @setEvalBranchQuota(10000); // Need more branches for 256x8 loop
    var table: [256]u16 = undefined;
    for (&table, 0..) |*entry, i| {
        var crc: u16 = @intCast(i << 8);
        for (0..8) |_| {
            if (crc & 0x8000 != 0) {
                crc = (crc << 1) ^ 0x1021;
            } else {
                crc = crc << 1;
            }
        }
        entry.* = crc;
    }
    break :blk table;
};

/// Computes CRC16 checksum
fn computeCRC16(data: []const u8) u16 {
    var crc: u16 = 0;
    for (data) |byte| {
        const table_idx = (crc >> 8) ^ byte;
        crc = ((crc << 8) & 0xFFFF) ^ crc16_table[table_idx];
    }
    return crc;
}

/// Validates CRC16 checksum
fn validateCRC16(data: []const u8, expected: u16) bool {
    return computeCRC16(data) == expected;
}

/// Encodes data to base32 (following nats.c implementation)
/// NKeys use unpadded base32 encoding
fn base32Encode(allocator: std.mem.Allocator, src: []const u8) ![]u8 {
    if (src.len == 0) return try allocator.alloc(u8, 0);

    // Calculate exact output size without padding
    // Each 5 input bytes → 8 output chars
    // Remaining bytes: 1→2, 2→4, 3→5, 4→7 chars
    const full_chunks = src.len / 5;
    const remaining = src.len % 5;
    const extra_chars: usize = switch (remaining) {
        0 => 0,
        1 => 2,
        2 => 4,
        3 => 5,
        4 => 7,
        else => unreachable,
    };
    const exact_len = full_chunks * 8 + extra_chars;

    var result = try allocator.alloc(u8, exact_len);
    var out_idx: usize = 0;

    var i: usize = 0;
    while (i < src.len) {
        var ebuf: [5]u8 = [_]u8{0} ** 5;
        const chunk_len = @min(5, src.len - i);
        @memcpy(ebuf[0..chunk_len], src[i .. i + chunk_len]);

        // Encode based on how many input bytes we have
        const chars_to_write: usize = if (chunk_len == 5) 8 else switch (chunk_len) {
            1 => 2,
            2 => 4,
            3 => 5,
            4 => 7,
            else => unreachable,
        };

        result[out_idx] = base32_alphabet[(ebuf[0] >> 3) & 0x1F];
        if (chars_to_write >= 2) result[out_idx + 1] = base32_alphabet[((ebuf[0] << 2) | (ebuf[1] >> 6)) & 0x1F];
        if (chars_to_write >= 3) result[out_idx + 2] = base32_alphabet[(ebuf[1] >> 1) & 0x1F];
        if (chars_to_write >= 4) result[out_idx + 3] = base32_alphabet[((ebuf[1] << 4) | (ebuf[2] >> 4)) & 0x1F];
        if (chars_to_write >= 5) result[out_idx + 4] = base32_alphabet[((ebuf[2] << 1) | (ebuf[3] >> 7)) & 0x1F];
        if (chars_to_write >= 6) result[out_idx + 5] = base32_alphabet[(ebuf[3] >> 2) & 0x1F];
        if (chars_to_write >= 7) result[out_idx + 6] = base32_alphabet[((ebuf[3] << 3) | (ebuf[4] >> 5)) & 0x1F];
        if (chars_to_write >= 8) result[out_idx + 7] = base32_alphabet[ebuf[4] & 0x1F];

        i += chunk_len;
        out_idx += chars_to_write;
    }

    return result;
}

/// Encodes a public key with NKey prefix and CRC16
/// Public keys use: 1 prefix byte + 32 pubkey bytes + 2 CRC bytes = 35 bytes (NOT like seeds!)
/// Seds use 2 prefix bytes because they encode both "seed" and "key type"
/// Public keys only encode the key type, so just 1 prefix byte
fn encodePublicKey(allocator: std.mem.Allocator, prefix: u8, raw_pubkey: []const u8) ![]const u8 {
    // Structure: 1 prefix byte + 32 pubkey bytes + 2 CRC bytes = 35 bytes
    var data = try allocator.alloc(u8, 1 + raw_pubkey.len + 2);
    defer allocator.free(data);

    // Set prefix byte (PREFIX_BYTE_USER = 20 << 3 = 160 = 0xA0)
    data[0] = prefix;

    // Copy public key
    @memcpy(data[1 .. 1 + raw_pubkey.len], raw_pubkey);

    // Compute and append CRC16 (little-endian)
    const crc = computeCRC16(data[0 .. 1 + raw_pubkey.len]);
    data[1 + raw_pubkey.len] = @truncate(crc & 0xFF);
    data[1 + raw_pubkey.len + 1] = @truncate((crc >> 8) & 0xFF);

    // Base32 encode the entire structure
    return base32Encode(allocator, data);
}

/// Decodes base32 string (following nats.c implementation)
fn base32Decode(allocator: std.mem.Allocator, src: []const u8) ![]u8 {
    var result: std.ArrayList(u8) = .empty;
    errdefer result.deinit(allocator);

    var i: usize = 0;
    while (i < src.len) {
        var dbuf: [8]u8 = [_]u8{0} ** 8; // Initialize with zeros
        var dlen: usize = 0;

        // Decode 8 base32 characters into 5 bytes
        while (dlen < 8 and i < src.len) : ({
            i += 1;
            dlen += 1;
        }) {
            const char = src[i];
            const decoded = base32_decode_map[char];
            if (decoded == 0xFF) {
                return error.InvalidBase32Character;
            }
            dbuf[dlen] = decoded;
        }

        // Convert to bytes
        const needs: usize = switch (dlen) {
            8 => 5,
            7 => 4,
            5 => 3,
            4 => 2,
            2 => 1,
            else => 0,
        };

        if (needs >= 1)
            try result.append(allocator, dbuf[0] << 3 | dbuf[1] >> 2);
        if (needs >= 2)
            try result.append(allocator, dbuf[1] << 6 | dbuf[2] << 1 | dbuf[3] >> 4);
        if (needs >= 3)
            try result.append(allocator, dbuf[3] << 4 | dbuf[4] >> 1);
        if (needs >= 4)
            try result.append(allocator, dbuf[4] << 7 | dbuf[5] << 2 | dbuf[6] >> 3);
        if (needs >= 5)
            try result.append(allocator, dbuf[6] << 5 | dbuf[7]);
    }

    return result.toOwnedSlice(allocator);
}

/// Decodes an NKey seed and validates its structure
/// Returns the 32-byte Ed25519 seed (private key material)
fn decodeSeed(allocator: std.mem.Allocator, encoded_seed: []const u8) ![]u8 {
    // Base32 decode the seed
    const raw = try base32Decode(allocator, encoded_seed);
    defer allocator.free(raw);

    if (raw.len < 4) {
        return error.InvalidEncodedKey;
    }

    // Read the CRC16 from the last 2 bytes (little-endian)
    const crc_offset = raw.len - 2;
    const crc: u16 = @as(u16, raw[crc_offset]) | (@as(u16, raw[crc_offset + 1]) << 8);

    // Validate CRC16
    if (!validateCRC16(raw[0..crc_offset], crc)) {
        return error.InvalidChecksum;
    }

    // Validate prefix bytes
    const b1 = raw[0] & 0xF8; // 248 = 11111000
    const b2 = (raw[0] & 7) << 5 | ((raw[1] & 0xF8) >> 3);

    if (b1 != PREFIX_BYTE_SEED) {
        return error.InvalidSeed;
    }

    // Check if it's a valid public key prefix
    if (b2 != PREFIX_BYTE_USER and b2 != PREFIX_BYTE_ACCOUNT and
        b2 != PREFIX_BYTE_SERVER and b2 != PREFIX_BYTE_CLUSTER)
    {
        return error.InvalidPrefix;
    }

    // Extract the 32-byte Ed25519 seed (skip first 2 prefix bytes, exclude 2 CRC bytes)
    const seed_start = 2;
    const seed_end = crc_offset;
    if (seed_end - seed_start != 32) { // Ed25519 seed is always 32 bytes
        return error.InvalidSeedLength;
    }

    return try allocator.dupe(u8, raw[seed_start..seed_end]);
}

/// Extracts the public key from an NKey seed
/// Returns the public key in base32-encoded format (e.g., "UABC...")
pub fn extractPublicKey(allocator: std.mem.Allocator, encoded_seed: []const u8) ![]const u8 {
    // Decode the seed to get the 32-byte Ed25519 seed
    const seed_bytes = try decodeSeed(allocator, encoded_seed);
    defer allocator.free(seed_bytes);

    // Validate seed length
    if (seed_bytes.len != 32) {
        return error.InvalidSeedLength;
    }

    // Create keypair deterministically from the 32-byte seed
    var seed_array: [32]u8 = undefined;
    @memcpy(&seed_array, seed_bytes[0..32]);

    // Catch any cryptographic errors and convert to InvalidSeed
    const key_pair = Ed25519.KeyPair.generateDeterministic(seed_array) catch {
        return error.InvalidSeed;
    };

    // Base32-encode the public key with USER prefix
    return encodePublicKey(allocator, PREFIX_BYTE_USER, &key_pair.public_key.bytes);
}

/// Signs a nonce using the NKey seed
/// Returns the Ed25519 signature (64 bytes)
pub fn signNonce(allocator: std.mem.Allocator, encoded_seed: []const u8, nonce: []const u8) ![]u8 {
    // Decode the seed to get the 32-byte Ed25519 seed
    const seed_bytes = try decodeSeed(allocator, encoded_seed);
    defer allocator.free(seed_bytes);

    // Validate seed length
    if (seed_bytes.len != 32) {
        return error.InvalidSeedLength;
    }

    // Create keypair deterministically from seed
    var seed_array: [32]u8 = undefined;
    @memcpy(&seed_array, seed_bytes[0..32]);

    // Catch any cryptographic errors and convert to InvalidSeed
    const key_pair = Ed25519.KeyPair.generateDeterministic(seed_array) catch {
        return error.InvalidSeed;
    };

    // Sign the nonce (deterministic signature, so noise is null)
    const signature = try key_pair.sign(nonce, null);

    // Return the signature as owned slice
    return try allocator.dupe(u8, &signature.toBytes());
}

/// Base64URL encodes data (no padding, URL-safe alphabet)
pub fn base64UrlEncode(allocator: std.mem.Allocator, data: []const u8) ![]const u8 {
    const encoder = base64.url_safe_no_pad;
    const encoded_len = encoder.Encoder.calcSize(data.len);
    const encoded = try allocator.alloc(u8, encoded_len);
    _ = encoder.Encoder.encode(encoded, data);
    return encoded;
}

test "base64url encode" {
    const allocator = std.testing.allocator;
    const data = "hello";
    const encoded = try base64UrlEncode(allocator, data);
    defer allocator.free(encoded);

    try std.testing.expectEqualStrings("aGVsbG8", encoded);
}

test "crc16 compute" {
    const data = "hello";
    const crc = computeCRC16(data);
    try std.testing.expect(crc != 0);
}

test "crc16 validate" {
    const data = "hello";
    const crc = computeCRC16(data);
    try std.testing.expect(validateCRC16(data, crc));
    try std.testing.expect(!validateCRC16(data, crc + 1));
}

test "base32 encode/decode roundtrip for fixed size" {
    const allocator = std.testing.allocator;
    // NKeys always use fixed-size data (multiples of 5 bytes for clean base32 encoding)
    const original = "hello"; // 5 bytes

    const encoded = try base32Encode(allocator, original);
    defer allocator.free(encoded);

    const decoded = try base32Decode(allocator, encoded);
    defer allocator.free(decoded);

    try std.testing.expectEqualStrings(original, decoded);
}

test "extractPublicKey returns base32 encoded key" {
    const allocator = std.testing.allocator;
    // Use a known-good seed that doesn't trigger Ed25519 edge cases
    const seed = "SUAA5NXASOB7VKY5KDN2XMOV6ZU5T6V5C2RWTGEFITZDNCMJGR2BTWQOQ4";

    const pubkey = try extractPublicKey(allocator, seed);
    defer allocator.free(pubkey);

    // Public key should start with 'U' for user
    try std.testing.expect(pubkey[0] == 'U');

    // Verify it matches the expected public key (generated with nk tool)
    try std.testing.expectEqualStrings("UAD46KBLJ5NVEPU3BGXQY75NTDWSZ6BEBMPQKMLS3BAX7PWYS2IIGCZF", pubkey);
}

test "extractPublicKey rejects invalid base32" {
    const allocator = std.testing.allocator;
    // Invalid base32 characters (contains '1' and '0' which aren't in base32 alphabet)
    const invalid_seed = "SUAEBVUWOAJRL5FSDXP3A7EEUC3ZU7GYILW6TMVK2J63RQAZQQ642MV1B0";

    const result = extractPublicKey(allocator, invalid_seed);
    try std.testing.expectError(error.InvalidBase32Character, result);
}

test "extractPublicKey rejects seed with invalid checksum" {
    const allocator = std.testing.allocator;
    // Valid base32 but wrong checksum (changed last 2 chars)
    const invalid_checksum = "SUAEBVUWOAJRL5FSDXP3A7EEUC3ZU7GYILW6TMVK2J63RQAZQQ642MVIAA";

    const result = extractPublicKey(allocator, invalid_checksum);
    try std.testing.expectError(error.InvalidChecksum, result);
}

test "extractPublicKey rejects empty string" {
    const allocator = std.testing.allocator;
    const empty_seed = "";

    const result = extractPublicKey(allocator, empty_seed);
    try std.testing.expectError(error.InvalidEncodedKey, result);
}

test "signNonce rejects empty string seed" {
    const allocator = std.testing.allocator;
    const empty_seed = "";
    const nonce = "test_nonce";

    const result = signNonce(allocator, empty_seed, nonce);
    try std.testing.expectError(error.InvalidEncodedKey, result);
}
