// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");

pub const ReturnedError = error{
    BadFormat,
    Buried,
    Deadline,
    Draining,
    Internal,
    JobTooBig,
    NoCRLF,
    NotFound,
    NotIgnored,
    OOM,
    Timeout,
    Unknown,
    CommunicationFailure,
};

const ReturnedErrorMap = std.StaticStringMap(ReturnedError).initComptime(.{
    .{ "BAD_FORMAT", ReturnedError.BadFormat },
    .{ "BURIED", ReturnedError.Buried },
    .{ "DEADLINE_SOON", ReturnedError.Deadline },
    .{ "DRAINING", ReturnedError.Draining },
    .{ "EXPECTED_CRLF", ReturnedError.NoCRLF },
    .{ "INTERNAL_ERROR", ReturnedError.Internal },
    .{ "JOB_TOO_BIG", ReturnedError.JobTooBig },
    .{ "NOT_FOUND", ReturnedError.NotFound },
    .{ "NOT_IGNORED", ReturnedError.NotIgnored },
    .{ "OUT_OF_MEMORY", ReturnedError.OOM },
    .{ "TIMED_OUT", ReturnedError.Timeout },
    .{ "UNKNOWN_COMMAND", ReturnedError.Unknown },
    .{ "CommunicationFailure", ReturnedError.CommunicationFailure },
});

pub fn findError(text: []u8) ReturnedError {
    if (ReturnedErrorMap.get(text)) |reterr| {
        return reterr;
    }
    return ReturnedError.Unknown;
}
