// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");
const mailbox = @import("mailbox");
const Allocator = std.mem.Allocator;
pub const Appendable = @import("Appendable.zig");
pub const protocol = @import("protocol.zig");
pub const MSG = protocol.MSG;

pub const MSGMailBox = mailbox.MailBox(MSG);

pub const AllocatedMSG = MSGMailBox.Envelope;

pub fn alloc(allocator: Allocator) ?*AllocatedMSG {
    if (allocator.create(AllocatedMSG)) |am| {
        errdefer allocator.destroy(am);
        am.*.letter.init(allocator) catch {
            return null;
        };
        return am;
    }
    return null;
}

pub fn free(amsg: *AllocatedMSG) void {
    const allocator = amsg.letter.subject.allocator;
    amsg.letter.deinit();
    allocator.destroy(amsg);
}

pub const Messages = struct {
    pool: MSGMailBox = .{},
    allocator: Allocator = undefined,

    pub fn init(msgs: *Messages, allocator: Allocator) void {
        msgs.allocator = allocator;
    }

    pub fn deinit(msgs: *Messages) void {
        const allocated = msgs.pool.close();
        if (allocated != null) {
            const next = allocated.?.next;
            free(allocated);
            allocated = next;
        }
    }

    pub fn get(msgs: *Messages, timeout_ns: u64) ?*AllocatedMSG {
        if (msgs.pool.receive(timeout_ns)) |amsg| {
            amsg.*.letter.reset();
            return amsg;
        } else |er| {
            if (er == error.Timeout) {
                return alloc(msgs.allocator);
            } else {
                return null;
            }
        }
    }

    pub fn receive(msgs: *Messages, timeout_ns: u64) !?*AllocatedMSG {
        if (msgs.pool.receive(timeout_ns)) |amsg| {
            return amsg;
        } else |rer| {
            if (rer == error.Timeout) {
                return null;
            } else {
                return rer;
            }
        }
    }

    pub fn put(msgs: *Messages, amsg: *AllocatedMSG) void {
        msgs.pool.send(amsg) catch {
            free(amsg);
        };
    }

    pub fn send(msgs: *Messages, amsg: *AllocatedMSG) !void {
        msgs.pool.send(amsg) catch |serr| {
            free(amsg);
            return serr;
        };
    }
};
