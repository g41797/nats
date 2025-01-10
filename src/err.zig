// Copyright (c) 2025 g41797
// SPDX-License-Identifier: MIT

const std = @import("std");

pub const ReturnedError = error{
    UPO,
    ACRP,
    AV,
    AT,
    ICP,
    MCLE,
    PE,
    TR,
    SC,
    MCE,
    SCO,
    MPV,
    IS,
    PV,
    Unknown,
    CommunicationFailure,
};

const ReturnedErrorMap = std.StaticStringMap(ReturnedError).initComptime(.{
    .{ "Unknown Protocol Operation", ReturnedError.UPO },
    .{ "Attempted To Connect To Route Port", ReturnedError.ACRP },
    .{ "Authorization Violation", ReturnedError.AV },
    .{ "Authorization Timeout", ReturnedError.AT },
    .{ "Invalid Client Protocol", ReturnedError.ICP },
    .{ "Maximum Control Line Exceeded", ReturnedError.MCLE },
    .{ "Parser Error", ReturnedError.PE },
    .{ "Secure Connection - TLS Required", ReturnedError.TR },
    .{ "Stale Connection", ReturnedError.SC },
    .{ "Maximum Connections Exceeded", ReturnedError.MCE },
    .{ "Slow Consumer", ReturnedError.SCO },
    .{ "Maximum Payload Violation", ReturnedError.MPV },

    .{ "Invalid Subject", ReturnedError.IS },
    .{ "Permissions Violation", ReturnedError.PV },

    .{ "CommunicationFailure", ReturnedError.CommunicationFailure },
});

pub fn findError(text: []u8) ReturnedError {
    if (ReturnedErrorMap.get(text)) |reterr| {
        return reterr;
    }
    return ReturnedError.PV;
}
