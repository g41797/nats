pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const int_least8_t = __int_least8_t;
pub const int_least16_t = __int_least16_t;
pub const int_least32_t = __int_least32_t;
pub const int_least64_t = __int_least64_t;
pub const uint_least8_t = __uint_least8_t;
pub const uint_least16_t = __uint_least16_t;
pub const uint_least32_t = __uint_least32_t;
pub const uint_least64_t = __uint_least64_t;
pub const int_fast8_t = i8;
pub const int_fast16_t = c_long;
pub const int_fast32_t = c_long;
pub const int_fast64_t = c_long;
pub const uint_fast8_t = u8;
pub const uint_fast16_t = c_ulong;
pub const uint_fast32_t = c_ulong;
pub const uint_fast64_t = c_ulong;
pub const intmax_t = __intmax_t;
pub const uintmax_t = __uintmax_t;
pub const time_t = __time_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_usec: __suseconds_t = @import("std").mem.zeroes(__suseconds_t),
};
pub const suseconds_t = __suseconds_t;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_nsec: __syscall_slong_t = @import("std").mem.zeroes(__syscall_slong_t),
};
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    fds_bits: [16]__fd_mask = @import("std").mem.zeroes([16]__fd_mask),
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub const struct_timezone = extern struct {
    tz_minuteswest: c_int = @import("std").mem.zeroes(c_int),
    tz_dsttime: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn gettimeofday(noalias __tv: [*c]struct_timeval, noalias __tz: ?*anyopaque) c_int;
pub extern fn settimeofday(__tv: [*c]const struct_timeval, __tz: [*c]const struct_timezone) c_int;
pub extern fn adjtime(__delta: [*c]const struct_timeval, __olddelta: [*c]struct_timeval) c_int;
pub const ITIMER_REAL: c_int = 0;
pub const ITIMER_VIRTUAL: c_int = 1;
pub const ITIMER_PROF: c_int = 2;
pub const enum___itimer_which = c_uint;
pub const struct_itimerval = extern struct {
    it_interval: struct_timeval = @import("std").mem.zeroes(struct_timeval),
    it_value: struct_timeval = @import("std").mem.zeroes(struct_timeval),
};
pub const __itimer_which_t = enum___itimer_which;
pub extern fn getitimer(__which: __itimer_which_t, __value: [*c]struct_itimerval) c_int;
pub extern fn setitimer(__which: __itimer_which_t, noalias __new: [*c]const struct_itimerval, noalias __old: [*c]struct_itimerval) c_int;
pub extern fn utimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn lutimes(__file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub extern fn futimes(__fd: c_int, __tvp: [*c]const struct_timeval) c_int;
pub extern fn futimesat(__fd: c_int, __file: [*c]const u8, __tvp: [*c]const struct_timeval) c_int;
pub const struct_flock = extern struct {
    l_type: c_short = @import("std").mem.zeroes(c_short),
    l_whence: c_short = @import("std").mem.zeroes(c_short),
    l_start: __off_t = @import("std").mem.zeroes(__off_t),
    l_len: __off_t = @import("std").mem.zeroes(__off_t),
    l_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
};
pub const struct_flock64 = extern struct {
    l_type: c_short = @import("std").mem.zeroes(c_short),
    l_whence: c_short = @import("std").mem.zeroes(c_short),
    l_start: __off64_t = @import("std").mem.zeroes(__off64_t),
    l_len: __off64_t = @import("std").mem.zeroes(__off64_t),
    l_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
};
pub const struct_iovec = extern struct {
    iov_base: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    iov_len: usize = @import("std").mem.zeroes(usize),
};
pub const F_OWNER_TID: c_int = 0;
pub const F_OWNER_PID: c_int = 1;
pub const F_OWNER_PGRP: c_int = 2;
pub const F_OWNER_GID: c_int = 2;
pub const enum___pid_type = c_uint;
pub const struct_f_owner_ex = extern struct {
    type: enum___pid_type = @import("std").mem.zeroes(enum___pid_type),
    pid: __pid_t = @import("std").mem.zeroes(__pid_t),
};
pub const struct_file_handle = extern struct {
    handle_bytes: c_uint align(4) = @import("std").mem.zeroes(c_uint),
    handle_type: c_int = @import("std").mem.zeroes(c_int),
    pub fn f_handle(self: anytype) @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8) {
        const Intermediate = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        const ReturnType = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        return @as(ReturnType, @ptrCast(@alignCast(@as(Intermediate, @ptrCast(self)) + 8)));
    }
};
pub extern fn readahead(__fd: c_int, __offset: __off64_t, __count: usize) __ssize_t;
pub extern fn sync_file_range(__fd: c_int, __offset: __off64_t, __count: __off64_t, __flags: c_uint) c_int;
pub extern fn vmsplice(__fdout: c_int, __iov: [*c]const struct_iovec, __count: usize, __flags: c_uint) __ssize_t;
pub extern fn splice(__fdin: c_int, __offin: [*c]__off64_t, __fdout: c_int, __offout: [*c]__off64_t, __len: usize, __flags: c_uint) __ssize_t;
pub extern fn tee(__fdin: c_int, __fdout: c_int, __len: usize, __flags: c_uint) __ssize_t;
pub extern fn fallocate(__fd: c_int, __mode: c_int, __offset: __off_t, __len: __off_t) c_int;
pub extern fn fallocate64(__fd: c_int, __mode: c_int, __offset: __off64_t, __len: __off64_t) c_int;
pub extern fn name_to_handle_at(__dfd: c_int, __name: [*c]const u8, __handle: [*c]struct_file_handle, __mnt_id: [*c]c_int, __flags: c_int) c_int;
pub extern fn open_by_handle_at(__mountdirfd: c_int, __handle: [*c]struct_file_handle, __flags: c_int) c_int;
pub const mode_t = __mode_t;
pub const off_t = __off_t;
pub const off64_t = __off64_t;
pub const pid_t = __pid_t;
pub const struct_stat = extern struct {
    st_dev: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_ino: __ino_t = @import("std").mem.zeroes(__ino_t),
    st_nlink: __nlink_t = @import("std").mem.zeroes(__nlink_t),
    st_mode: __mode_t = @import("std").mem.zeroes(__mode_t),
    st_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    st_gid: __gid_t = @import("std").mem.zeroes(__gid_t),
    __pad0: c_int = @import("std").mem.zeroes(c_int),
    st_rdev: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_size: __off_t = @import("std").mem.zeroes(__off_t),
    st_blksize: __blksize_t = @import("std").mem.zeroes(__blksize_t),
    st_blocks: __blkcnt_t = @import("std").mem.zeroes(__blkcnt_t),
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    __glibc_reserved: [3]__syscall_slong_t = @import("std").mem.zeroes([3]__syscall_slong_t),
};
pub const struct_stat64 = extern struct {
    st_dev: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_ino: __ino64_t = @import("std").mem.zeroes(__ino64_t),
    st_nlink: __nlink_t = @import("std").mem.zeroes(__nlink_t),
    st_mode: __mode_t = @import("std").mem.zeroes(__mode_t),
    st_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    st_gid: __gid_t = @import("std").mem.zeroes(__gid_t),
    __pad0: c_int = @import("std").mem.zeroes(c_int),
    st_rdev: __dev_t = @import("std").mem.zeroes(__dev_t),
    st_size: __off_t = @import("std").mem.zeroes(__off_t),
    st_blksize: __blksize_t = @import("std").mem.zeroes(__blksize_t),
    st_blocks: __blkcnt64_t = @import("std").mem.zeroes(__blkcnt64_t),
    st_atim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_mtim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    st_ctim: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    __glibc_reserved: [3]__syscall_slong_t = @import("std").mem.zeroes([3]__syscall_slong_t),
};
pub extern fn fcntl(__fd: c_int, __cmd: c_int, ...) c_int;
pub extern fn fcntl64(__fd: c_int, __cmd: c_int, ...) c_int;
pub extern fn open(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn open64(__file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn openat(__fd: c_int, __file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn openat64(__fd: c_int, __file: [*c]const u8, __oflag: c_int, ...) c_int;
pub extern fn creat(__file: [*c]const u8, __mode: mode_t) c_int;
pub extern fn creat64(__file: [*c]const u8, __mode: mode_t) c_int;
pub extern fn lockf(__fd: c_int, __cmd: c_int, __len: off_t) c_int;
pub extern fn lockf64(__fd: c_int, __cmd: c_int, __len: off64_t) c_int;
pub extern fn posix_fadvise(__fd: c_int, __offset: off_t, __len: off_t, __advise: c_int) c_int;
pub extern fn posix_fadvise64(__fd: c_int, __offset: off64_t, __len: off64_t, __advise: c_int) c_int;
pub extern fn posix_fallocate(__fd: c_int, __offset: off_t, __len: off_t) c_int;
pub extern fn posix_fallocate64(__fd: c_int, __offset: off64_t, __len: off64_t) c_int;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const ino64_t = __ino64_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const timer_t = __timer_t;
pub const useconds_t = __useconds_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.c) __uint16_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint16_t, @bitCast(@as(c_short, @truncate(((@as(c_int, @bitCast(@as(c_uint, __bsx))) >> @intCast(8)) & @as(c_int, 255)) | ((@as(c_int, @bitCast(@as(c_uint, __bsx))) & @as(c_int, 255)) << @intCast(8))))));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.c) __uint32_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return ((((__bsx & @as(c_uint, 4278190080)) >> @intCast(24)) | ((__bsx & @as(c_uint, 16711680)) >> @intCast(8))) | ((__bsx & @as(c_uint, 65280)) << @intCast(8))) | ((__bsx & @as(c_uint, 255)) << @intCast(24));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.c) __uint64_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint64_t, @bitCast(@as(c_ulong, @truncate(((((((((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 18374686479671623680)) >> @intCast(56)) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 71776119061217280)) >> @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 280375465082880)) >> @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 1095216660480)) >> @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 4278190080)) << @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 16711680)) << @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 65280)) << @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 255)) << @intCast(56))))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.c) __uint16_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.c) __uint32_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.c) __uint64_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
pub const blkcnt64_t = __blkcnt64_t;
pub const fsblkcnt64_t = __fsblkcnt64_t;
pub const fsfilcnt64_t = __fsfilcnt64_t;
const struct_unnamed_1 = extern struct {
    __low: c_uint = @import("std").mem.zeroes(c_uint),
    __high: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_1,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
    __next: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist = @import("std").mem.zeroes([*c]struct___pthread_internal_slist),
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int = @import("std").mem.zeroes(c_int),
    __count: c_uint = @import("std").mem.zeroes(c_uint),
    __owner: c_int = @import("std").mem.zeroes(c_int),
    __nusers: c_uint = @import("std").mem.zeroes(c_uint),
    __kind: c_int = @import("std").mem.zeroes(c_int),
    __spins: c_short = @import("std").mem.zeroes(c_short),
    __elision: c_short = @import("std").mem.zeroes(c_short),
    __list: __pthread_list_t = @import("std").mem.zeroes(__pthread_list_t),
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint = @import("std").mem.zeroes(c_uint),
    __writers: c_uint = @import("std").mem.zeroes(c_uint),
    __wrphase_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __writers_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __pad3: c_uint = @import("std").mem.zeroes(c_uint),
    __pad4: c_uint = @import("std").mem.zeroes(c_uint),
    __cur_writer: c_int = @import("std").mem.zeroes(c_int),
    __shared: c_int = @import("std").mem.zeroes(c_int),
    __rwelision: i8 = @import("std").mem.zeroes(i8),
    __pad1: [7]u8 = @import("std").mem.zeroes([7]u8),
    __pad2: c_ulong = @import("std").mem.zeroes(c_ulong),
    __flags: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g1_start: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g_refs: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g_size: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g1_orig_size: c_uint = @import("std").mem.zeroes(c_uint),
    __wrefs: c_uint = @import("std").mem.zeroes(c_uint),
    __g_signals: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int = @import("std").mem.zeroes(c_int),
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const socklen_t = __socklen_t;
pub const SOCK_STREAM: c_int = 1;
pub const SOCK_DGRAM: c_int = 2;
pub const SOCK_RAW: c_int = 3;
pub const SOCK_RDM: c_int = 4;
pub const SOCK_SEQPACKET: c_int = 5;
pub const SOCK_DCCP: c_int = 6;
pub const SOCK_PACKET: c_int = 10;
pub const SOCK_CLOEXEC: c_int = 524288;
pub const SOCK_NONBLOCK: c_int = 2048;
pub const enum___socket_type = c_uint;
pub const sa_family_t = c_ushort;
pub const struct_sockaddr = extern struct {
    sa_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const struct_sockaddr_storage = extern struct {
    ss_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    __ss_padding: [118]u8 = @import("std").mem.zeroes([118]u8),
    __ss_align: c_ulong = @import("std").mem.zeroes(c_ulong),
};
pub const MSG_OOB: c_int = 1;
pub const MSG_PEEK: c_int = 2;
pub const MSG_DONTROUTE: c_int = 4;
pub const MSG_TRYHARD: c_int = 4;
pub const MSG_CTRUNC: c_int = 8;
pub const MSG_PROXY: c_int = 16;
pub const MSG_TRUNC: c_int = 32;
pub const MSG_DONTWAIT: c_int = 64;
pub const MSG_EOR: c_int = 128;
pub const MSG_WAITALL: c_int = 256;
pub const MSG_FIN: c_int = 512;
pub const MSG_SYN: c_int = 1024;
pub const MSG_CONFIRM: c_int = 2048;
pub const MSG_RST: c_int = 4096;
pub const MSG_ERRQUEUE: c_int = 8192;
pub const MSG_NOSIGNAL: c_int = 16384;
pub const MSG_MORE: c_int = 32768;
pub const MSG_WAITFORONE: c_int = 65536;
pub const MSG_BATCH: c_int = 262144;
pub const MSG_ZEROCOPY: c_int = 67108864;
pub const MSG_FASTOPEN: c_int = 536870912;
pub const MSG_CMSG_CLOEXEC: c_int = 1073741824;
const enum_unnamed_2 = c_uint;
pub const struct_msghdr = extern struct {
    msg_name: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_namelen: socklen_t = @import("std").mem.zeroes(socklen_t),
    msg_iov: [*c]struct_iovec = @import("std").mem.zeroes([*c]struct_iovec),
    msg_iovlen: usize = @import("std").mem.zeroes(usize),
    msg_control: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    msg_controllen: usize = @import("std").mem.zeroes(usize),
    msg_flags: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_cmsghdr = extern struct {
    cmsg_len: usize align(8) = @import("std").mem.zeroes(usize),
    cmsg_level: c_int = @import("std").mem.zeroes(c_int),
    cmsg_type: c_int = @import("std").mem.zeroes(c_int),
    pub fn __cmsg_data(self: anytype) @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8) {
        const Intermediate = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        const ReturnType = @import("std").zig.c_translation.FlexibleArrayType(@TypeOf(self), u8);
        return @as(ReturnType, @ptrCast(@alignCast(@as(Intermediate, @ptrCast(self)) + 16)));
    }
};
pub extern fn __cmsg_nxthdr(__mhdr: [*c]struct_msghdr, __cmsg: [*c]struct_cmsghdr) [*c]struct_cmsghdr;
pub const SCM_RIGHTS: c_int = 1;
pub const SCM_CREDENTIALS: c_int = 2;
pub const SCM_SECURITY: c_int = 3;
pub const SCM_PIDFD: c_int = 4;
const enum_unnamed_3 = c_uint;
pub const struct_ucred = extern struct {
    pid: pid_t = @import("std").mem.zeroes(pid_t),
    uid: uid_t = @import("std").mem.zeroes(uid_t),
    gid: gid_t = @import("std").mem.zeroes(gid_t),
};
pub const __kernel_fd_set = extern struct {
    fds_bits: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const __kernel_sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub const __kernel_key_t = c_int;
pub const __kernel_mqd_t = c_int;
pub const __kernel_old_uid_t = c_ushort;
pub const __kernel_old_gid_t = c_ushort;
pub const __kernel_old_dev_t = c_ulong;
pub const __kernel_long_t = c_long;
pub const __kernel_ulong_t = c_ulong;
pub const __kernel_ino_t = __kernel_ulong_t;
pub const __kernel_mode_t = c_uint;
pub const __kernel_pid_t = c_int;
pub const __kernel_ipc_pid_t = c_int;
pub const __kernel_uid_t = c_uint;
pub const __kernel_gid_t = c_uint;
pub const __kernel_suseconds_t = __kernel_long_t;
pub const __kernel_daddr_t = c_int;
pub const __kernel_uid32_t = c_uint;
pub const __kernel_gid32_t = c_uint;
pub const __kernel_size_t = __kernel_ulong_t;
pub const __kernel_ssize_t = __kernel_long_t;
pub const __kernel_ptrdiff_t = __kernel_long_t;
pub const __kernel_fsid_t = extern struct {
    val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __kernel_off_t = __kernel_long_t;
pub const __kernel_loff_t = c_longlong;
pub const __kernel_old_time_t = __kernel_long_t;
pub const __kernel_time_t = __kernel_long_t;
pub const __kernel_time64_t = c_longlong;
pub const __kernel_clock_t = __kernel_long_t;
pub const __kernel_timer_t = c_int;
pub const __kernel_clockid_t = c_int;
pub const __kernel_caddr_t = [*c]u8;
pub const __kernel_uid16_t = c_ushort;
pub const __kernel_gid16_t = c_ushort;
pub const struct_linger = extern struct {
    l_onoff: c_int = @import("std").mem.zeroes(c_int),
    l_linger: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_osockaddr = extern struct {
    sa_family: c_ushort = @import("std").mem.zeroes(c_ushort),
    sa_data: [14]u8 = @import("std").mem.zeroes([14]u8),
};
pub const SHUT_RD: c_int = 0;
pub const SHUT_WR: c_int = 1;
pub const SHUT_RDWR: c_int = 2;
const enum_unnamed_4 = c_uint;
pub const struct_sockaddr_at_5 = opaque {};
pub const struct_sockaddr_ax25_6 = opaque {};
pub const struct_sockaddr_dl_7 = opaque {};
pub const struct_sockaddr_eon_8 = opaque {};
pub const in_port_t = u16;
pub const in_addr_t = u32;
pub const struct_in_addr = extern struct {
    s_addr: in_addr_t = @import("std").mem.zeroes(in_addr_t),
};
pub const struct_sockaddr_in = extern struct {
    sin_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    sin_zero: [8]u8 = @import("std").mem.zeroes([8]u8),
};
const union_unnamed_9 = extern union {
    __u6_addr8: [16]u8,
    __u6_addr16: [8]u16,
    __u6_addr32: [4]u32,
};
pub const struct_in6_addr = extern struct {
    __in6_u: union_unnamed_9 = @import("std").mem.zeroes(union_unnamed_9),
};
pub const struct_sockaddr_in6 = extern struct {
    sin6_family: sa_family_t = @import("std").mem.zeroes(sa_family_t),
    sin6_port: in_port_t = @import("std").mem.zeroes(in_port_t),
    sin6_flowinfo: u32 = @import("std").mem.zeroes(u32),
    sin6_addr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    sin6_scope_id: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_sockaddr_inarp_10 = opaque {};
pub const struct_sockaddr_ipx_11 = opaque {};
pub const struct_sockaddr_iso_12 = opaque {};
pub const struct_sockaddr_ns_13 = opaque {};
pub const struct_sockaddr_un_14 = opaque {};
pub const struct_sockaddr_x25_15 = opaque {};
pub const __SOCKADDR_ARG = extern union {
    __sockaddr__: [*c]struct_sockaddr,
    __sockaddr_at__: ?*struct_sockaddr_at_5,
    __sockaddr_ax25__: ?*struct_sockaddr_ax25_6,
    __sockaddr_dl__: ?*struct_sockaddr_dl_7,
    __sockaddr_eon__: ?*struct_sockaddr_eon_8,
    __sockaddr_in__: [*c]struct_sockaddr_in,
    __sockaddr_in6__: [*c]struct_sockaddr_in6,
    __sockaddr_inarp__: ?*struct_sockaddr_inarp_10,
    __sockaddr_ipx__: ?*struct_sockaddr_ipx_11,
    __sockaddr_iso__: ?*struct_sockaddr_iso_12,
    __sockaddr_ns__: ?*struct_sockaddr_ns_13,
    __sockaddr_un__: ?*struct_sockaddr_un_14,
    __sockaddr_x25__: ?*struct_sockaddr_x25_15,
};
pub const __CONST_SOCKADDR_ARG = extern union {
    __sockaddr__: [*c]const struct_sockaddr,
    __sockaddr_at__: ?*const struct_sockaddr_at_5,
    __sockaddr_ax25__: ?*const struct_sockaddr_ax25_6,
    __sockaddr_dl__: ?*const struct_sockaddr_dl_7,
    __sockaddr_eon__: ?*const struct_sockaddr_eon_8,
    __sockaddr_in__: [*c]const struct_sockaddr_in,
    __sockaddr_in6__: [*c]const struct_sockaddr_in6,
    __sockaddr_inarp__: ?*const struct_sockaddr_inarp_10,
    __sockaddr_ipx__: ?*const struct_sockaddr_ipx_11,
    __sockaddr_iso__: ?*const struct_sockaddr_iso_12,
    __sockaddr_ns__: ?*const struct_sockaddr_ns_13,
    __sockaddr_un__: ?*const struct_sockaddr_un_14,
    __sockaddr_x25__: ?*const struct_sockaddr_x25_15,
};
pub const struct_mmsghdr = extern struct {
    msg_hdr: struct_msghdr = @import("std").mem.zeroes(struct_msghdr),
    msg_len: c_uint = @import("std").mem.zeroes(c_uint),
};
pub extern fn socket(__domain: c_int, __type: c_int, __protocol: c_int) c_int;
pub extern fn socketpair(__domain: c_int, __type: c_int, __protocol: c_int, __fds: [*c]c_int) c_int;
pub extern fn bind(__fd: c_int, __addr: __CONST_SOCKADDR_ARG, __len: socklen_t) c_int;
pub extern fn getsockname(__fd: c_int, __addr: __SOCKADDR_ARG, noalias __len: [*c]socklen_t) c_int;
pub extern fn connect(__fd: c_int, __addr: __CONST_SOCKADDR_ARG, __len: socklen_t) c_int;
pub extern fn getpeername(__fd: c_int, __addr: __SOCKADDR_ARG, noalias __len: [*c]socklen_t) c_int;
pub extern fn send(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn recv(__fd: c_int, __buf: ?*anyopaque, __n: usize, __flags: c_int) isize;
pub extern fn sendto(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __flags: c_int, __addr: __CONST_SOCKADDR_ARG, __addr_len: socklen_t) isize;
pub extern fn recvfrom(__fd: c_int, noalias __buf: ?*anyopaque, __n: usize, __flags: c_int, __addr: __SOCKADDR_ARG, noalias __addr_len: [*c]socklen_t) isize;
pub extern fn sendmsg(__fd: c_int, __message: [*c]const struct_msghdr, __flags: c_int) isize;
pub extern fn sendmmsg(__fd: c_int, __vmessages: [*c]struct_mmsghdr, __vlen: c_uint, __flags: c_int) c_int;
pub extern fn recvmsg(__fd: c_int, __message: [*c]struct_msghdr, __flags: c_int) isize;
pub extern fn recvmmsg(__fd: c_int, __vmessages: [*c]struct_mmsghdr, __vlen: c_uint, __flags: c_int, __tmo: [*c]struct_timespec) c_int;
pub extern fn getsockopt(__fd: c_int, __level: c_int, __optname: c_int, noalias __optval: ?*anyopaque, noalias __optlen: [*c]socklen_t) c_int;
pub extern fn setsockopt(__fd: c_int, __level: c_int, __optname: c_int, __optval: ?*const anyopaque, __optlen: socklen_t) c_int;
pub extern fn listen(__fd: c_int, __n: c_int) c_int;
pub extern fn accept(__fd: c_int, __addr: __SOCKADDR_ARG, noalias __addr_len: [*c]socklen_t) c_int;
pub extern fn accept4(__fd: c_int, __addr: __SOCKADDR_ARG, noalias __addr_len: [*c]socklen_t, __flags: c_int) c_int;
pub extern fn shutdown(__fd: c_int, __how: c_int) c_int;
pub extern fn sockatmark(__fd: c_int) c_int;
pub extern fn isfdtype(__fd: c_int, __fdtype: c_int) c_int;
pub const tcp_seq = u32;
// /usr/include/netinet/tcp.h:109:10: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_17 = opaque {};
// /usr/include/netinet/tcp.h:134:11: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_18 = opaque {};
const union_unnamed_16 = extern union {
    unnamed_0: struct_unnamed_17,
    unnamed_1: struct_unnamed_18,
};
pub const struct_tcphdr = extern struct {
    unnamed_0: union_unnamed_16 = @import("std").mem.zeroes(union_unnamed_16),
};
pub const TCP_ESTABLISHED: c_int = 1;
pub const TCP_SYN_SENT: c_int = 2;
pub const TCP_SYN_RECV: c_int = 3;
pub const TCP_FIN_WAIT1: c_int = 4;
pub const TCP_FIN_WAIT2: c_int = 5;
pub const TCP_TIME_WAIT: c_int = 6;
pub const TCP_CLOSE: c_int = 7;
pub const TCP_CLOSE_WAIT: c_int = 8;
pub const TCP_LAST_ACK: c_int = 9;
pub const TCP_LISTEN: c_int = 10;
pub const TCP_CLOSING: c_int = 11;
const enum_unnamed_19 = c_uint;
pub const TCP_CA_Open: c_int = 0;
pub const TCP_CA_Disorder: c_int = 1;
pub const TCP_CA_CWR: c_int = 2;
pub const TCP_CA_Recovery: c_int = 3;
pub const TCP_CA_Loss: c_int = 4;
pub const enum_tcp_ca_state = c_uint;
// /usr/include/netinet/tcp.h:234:11: warning: struct demoted to opaque type - has bitfield
pub const struct_tcp_info = opaque {};
pub const struct_tcp_md5sig = extern struct {
    tcpm_addr: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    tcpm_flags: u8 = @import("std").mem.zeroes(u8),
    tcpm_prefixlen: u8 = @import("std").mem.zeroes(u8),
    tcpm_keylen: u16 = @import("std").mem.zeroes(u16),
    tcpm_ifindex: c_int = @import("std").mem.zeroes(c_int),
    tcpm_key: [80]u8 = @import("std").mem.zeroes([80]u8),
};
pub const struct_tcp_repair_opt = extern struct {
    opt_code: u32 = @import("std").mem.zeroes(u32),
    opt_val: u32 = @import("std").mem.zeroes(u32),
};
pub const TCP_NO_QUEUE: c_int = 0;
pub const TCP_RECV_QUEUE: c_int = 1;
pub const TCP_SEND_QUEUE: c_int = 2;
pub const TCP_QUEUES_NR: c_int = 3;
const enum_unnamed_20 = c_uint;
pub const struct_tcp_cookie_transactions = extern struct {
    tcpct_flags: u16 = @import("std").mem.zeroes(u16),
    __tcpct_pad1: u8 = @import("std").mem.zeroes(u8),
    tcpct_cookie_desired: u8 = @import("std").mem.zeroes(u8),
    tcpct_s_data_desired: u16 = @import("std").mem.zeroes(u16),
    tcpct_used: u16 = @import("std").mem.zeroes(u16),
    tcpct_value: [536]u8 = @import("std").mem.zeroes([536]u8),
};
pub const struct_tcp_repair_window = extern struct {
    snd_wl1: u32 = @import("std").mem.zeroes(u32),
    snd_wnd: u32 = @import("std").mem.zeroes(u32),
    max_window: u32 = @import("std").mem.zeroes(u32),
    rcv_wnd: u32 = @import("std").mem.zeroes(u32),
    rcv_wup: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_tcp_zerocopy_receive = extern struct {
    address: u64 = @import("std").mem.zeroes(u64),
    length: u32 = @import("std").mem.zeroes(u32),
    recv_skip_hint: u32 = @import("std").mem.zeroes(u32),
};
pub const struct_ip_opts = extern struct {
    ip_dst: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    ip_opts: [40]u8 = @import("std").mem.zeroes([40]u8),
};
pub const struct_in_pktinfo = extern struct {
    ipi_ifindex: c_int = @import("std").mem.zeroes(c_int),
    ipi_spec_dst: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    ipi_addr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const IPPROTO_IP: c_int = 0;
pub const IPPROTO_ICMP: c_int = 1;
pub const IPPROTO_IGMP: c_int = 2;
pub const IPPROTO_IPIP: c_int = 4;
pub const IPPROTO_TCP: c_int = 6;
pub const IPPROTO_EGP: c_int = 8;
pub const IPPROTO_PUP: c_int = 12;
pub const IPPROTO_UDP: c_int = 17;
pub const IPPROTO_IDP: c_int = 22;
pub const IPPROTO_TP: c_int = 29;
pub const IPPROTO_DCCP: c_int = 33;
pub const IPPROTO_IPV6: c_int = 41;
pub const IPPROTO_RSVP: c_int = 46;
pub const IPPROTO_GRE: c_int = 47;
pub const IPPROTO_ESP: c_int = 50;
pub const IPPROTO_AH: c_int = 51;
pub const IPPROTO_MTP: c_int = 92;
pub const IPPROTO_BEETPH: c_int = 94;
pub const IPPROTO_ENCAP: c_int = 98;
pub const IPPROTO_PIM: c_int = 103;
pub const IPPROTO_COMP: c_int = 108;
pub const IPPROTO_L2TP: c_int = 115;
pub const IPPROTO_SCTP: c_int = 132;
pub const IPPROTO_UDPLITE: c_int = 136;
pub const IPPROTO_MPLS: c_int = 137;
pub const IPPROTO_ETHERNET: c_int = 143;
pub const IPPROTO_RAW: c_int = 255;
pub const IPPROTO_MPTCP: c_int = 262;
pub const IPPROTO_MAX: c_int = 263;
const enum_unnamed_21 = c_uint;
pub const IPPROTO_HOPOPTS: c_int = 0;
pub const IPPROTO_ROUTING: c_int = 43;
pub const IPPROTO_FRAGMENT: c_int = 44;
pub const IPPROTO_ICMPV6: c_int = 58;
pub const IPPROTO_NONE: c_int = 59;
pub const IPPROTO_DSTOPTS: c_int = 60;
pub const IPPROTO_MH: c_int = 135;
const enum_unnamed_22 = c_uint;
pub const IPPORT_ECHO: c_int = 7;
pub const IPPORT_DISCARD: c_int = 9;
pub const IPPORT_SYSTAT: c_int = 11;
pub const IPPORT_DAYTIME: c_int = 13;
pub const IPPORT_NETSTAT: c_int = 15;
pub const IPPORT_FTP: c_int = 21;
pub const IPPORT_TELNET: c_int = 23;
pub const IPPORT_SMTP: c_int = 25;
pub const IPPORT_TIMESERVER: c_int = 37;
pub const IPPORT_NAMESERVER: c_int = 42;
pub const IPPORT_WHOIS: c_int = 43;
pub const IPPORT_MTP: c_int = 57;
pub const IPPORT_TFTP: c_int = 69;
pub const IPPORT_RJE: c_int = 77;
pub const IPPORT_FINGER: c_int = 79;
pub const IPPORT_TTYLINK: c_int = 87;
pub const IPPORT_SUPDUP: c_int = 95;
pub const IPPORT_EXECSERVER: c_int = 512;
pub const IPPORT_LOGINSERVER: c_int = 513;
pub const IPPORT_CMDSERVER: c_int = 514;
pub const IPPORT_EFSSERVER: c_int = 520;
pub const IPPORT_BIFFUDP: c_int = 512;
pub const IPPORT_WHOSERVER: c_int = 513;
pub const IPPORT_ROUTESERVER: c_int = 520;
pub const IPPORT_RESERVED: c_int = 1024;
pub const IPPORT_USERRESERVED: c_int = 5000;
const enum_unnamed_23 = c_uint;
pub extern const in6addr_any: struct_in6_addr;
pub extern const in6addr_loopback: struct_in6_addr;
pub const struct_ip_mreq = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const struct_ip_mreqn = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_address: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_ifindex: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct_ip_mreq_source = extern struct {
    imr_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imr_sourceaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
};
pub const struct_ipv6_mreq = extern struct {
    ipv6mr_multiaddr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    ipv6mr_interface: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct_group_req = extern struct {
    gr_interface: u32 = @import("std").mem.zeroes(u32),
    gr_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
};
pub const struct_group_source_req = extern struct {
    gsr_interface: u32 = @import("std").mem.zeroes(u32),
    gsr_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    gsr_source: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
};
pub const struct_ip_msfilter = extern struct {
    imsf_multiaddr: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imsf_interface: struct_in_addr = @import("std").mem.zeroes(struct_in_addr),
    imsf_fmode: u32 = @import("std").mem.zeroes(u32),
    imsf_numsrc: u32 = @import("std").mem.zeroes(u32),
    imsf_slist: [1]struct_in_addr = @import("std").mem.zeroes([1]struct_in_addr),
};
pub const struct_group_filter = extern struct {
    gf_interface: u32 = @import("std").mem.zeroes(u32),
    gf_group: struct_sockaddr_storage = @import("std").mem.zeroes(struct_sockaddr_storage),
    gf_fmode: u32 = @import("std").mem.zeroes(u32),
    gf_numsrc: u32 = @import("std").mem.zeroes(u32),
    gf_slist: [1]struct_sockaddr_storage = @import("std").mem.zeroes([1]struct_sockaddr_storage),
};
pub extern fn ntohl(__netlong: u32) u32;
pub extern fn ntohs(__netshort: u16) u16;
pub extern fn htonl(__hostlong: u32) u32;
pub extern fn htons(__hostshort: u16) u16;
pub extern fn bindresvport(__sockfd: c_int, __sock_in: [*c]struct_sockaddr_in) c_int;
pub extern fn bindresvport6(__sockfd: c_int, __sock_in: [*c]struct_sockaddr_in6) c_int;
pub const struct_in6_pktinfo = extern struct {
    ipi6_addr: struct_in6_addr = @import("std").mem.zeroes(struct_in6_addr),
    ipi6_ifindex: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct_ip6_mtuinfo = extern struct {
    ip6m_addr: struct_sockaddr_in6 = @import("std").mem.zeroes(struct_sockaddr_in6),
    ip6m_mtu: u32 = @import("std").mem.zeroes(u32),
};
pub extern fn inet6_option_space(__nbytes: c_int) c_int;
pub extern fn inet6_option_init(__bp: ?*anyopaque, __cmsgp: [*c][*c]struct_cmsghdr, __type: c_int) c_int;
pub extern fn inet6_option_append(__cmsg: [*c]struct_cmsghdr, __typep: [*c]const u8, __multx: c_int, __plusy: c_int) c_int;
pub extern fn inet6_option_alloc(__cmsg: [*c]struct_cmsghdr, __datalen: c_int, __multx: c_int, __plusy: c_int) [*c]u8;
pub extern fn inet6_option_next(__cmsg: [*c]const struct_cmsghdr, __tptrp: [*c][*c]u8) c_int;
pub extern fn inet6_option_find(__cmsg: [*c]const struct_cmsghdr, __tptrp: [*c][*c]u8, __type: c_int) c_int;
pub extern fn inet6_opt_init(__extbuf: ?*anyopaque, __extlen: socklen_t) c_int;
pub extern fn inet6_opt_append(__extbuf: ?*anyopaque, __extlen: socklen_t, __offset: c_int, __type: u8, __len: socklen_t, __align: u8, __databufp: [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_finish(__extbuf: ?*anyopaque, __extlen: socklen_t, __offset: c_int) c_int;
pub extern fn inet6_opt_set_val(__databuf: ?*anyopaque, __offset: c_int, __val: ?*anyopaque, __vallen: socklen_t) c_int;
pub extern fn inet6_opt_next(__extbuf: ?*anyopaque, __extlen: socklen_t, __offset: c_int, __typep: [*c]u8, __lenp: [*c]socklen_t, __databufp: [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_find(__extbuf: ?*anyopaque, __extlen: socklen_t, __offset: c_int, __type: u8, __lenp: [*c]socklen_t, __databufp: [*c]?*anyopaque) c_int;
pub extern fn inet6_opt_get_val(__databuf: ?*anyopaque, __offset: c_int, __val: ?*anyopaque, __vallen: socklen_t) c_int;
pub extern fn inet6_rth_space(__type: c_int, __segments: c_int) socklen_t;
pub extern fn inet6_rth_init(__bp: ?*anyopaque, __bp_len: socklen_t, __type: c_int, __segments: c_int) ?*anyopaque;
pub extern fn inet6_rth_add(__bp: ?*anyopaque, __addr: [*c]const struct_in6_addr) c_int;
pub extern fn inet6_rth_reverse(__in: ?*const anyopaque, __out: ?*anyopaque) c_int;
pub extern fn inet6_rth_segments(__bp: ?*const anyopaque) c_int;
pub extern fn inet6_rth_getaddr(__bp: ?*const anyopaque, __index: c_int) [*c]struct_in6_addr;
pub extern fn getipv4sourcefilter(__s: c_int, __interface_addr: struct_in_addr, __group: struct_in_addr, __fmode: [*c]u32, __numsrc: [*c]u32, __slist: [*c]struct_in_addr) c_int;
pub extern fn setipv4sourcefilter(__s: c_int, __interface_addr: struct_in_addr, __group: struct_in_addr, __fmode: u32, __numsrc: u32, __slist: [*c]const struct_in_addr) c_int;
pub extern fn getsourcefilter(__s: c_int, __interface_addr: u32, __group: [*c]const struct_sockaddr, __grouplen: socklen_t, __fmode: [*c]u32, __numsrc: [*c]u32, __slist: [*c]struct_sockaddr_storage) c_int;
pub extern fn setsourcefilter(__s: c_int, __interface_addr: u32, __group: [*c]const struct_sockaddr, __grouplen: socklen_t, __fmode: u32, __numsrc: u32, __slist: [*c]const struct_sockaddr_storage) c_int;
pub const struct_rpcent = extern struct {
    r_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    r_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    r_number: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn setrpcent(__stayopen: c_int) void;
pub extern fn endrpcent() void;
pub extern fn getrpcbyname(__name: [*c]const u8) [*c]struct_rpcent;
pub extern fn getrpcbynumber(__number: c_int) [*c]struct_rpcent;
pub extern fn getrpcent() [*c]struct_rpcent;
pub extern fn getrpcbyname_r(__name: [*c]const u8, __result_buf: [*c]struct_rpcent, __buffer: [*c]u8, __buflen: usize, __result: [*c][*c]struct_rpcent) c_int;
pub extern fn getrpcbynumber_r(__number: c_int, __result_buf: [*c]struct_rpcent, __buffer: [*c]u8, __buflen: usize, __result: [*c][*c]struct_rpcent) c_int;
pub extern fn getrpcent_r(__result_buf: [*c]struct_rpcent, __buffer: [*c]u8, __buflen: usize, __result: [*c][*c]struct_rpcent) c_int;
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*anyopaque,
};
pub const __sigval_t = union_sigval;
const struct_unnamed_25 = extern struct {
    _function: ?*const fn (__sigval_t) callconv(.c) void = @import("std").mem.zeroes(?*const fn (__sigval_t) callconv(.c) void),
    _attribute: [*c]pthread_attr_t = @import("std").mem.zeroes([*c]pthread_attr_t),
};
const union_unnamed_24 = extern union {
    _pad: [12]c_int,
    _tid: __pid_t,
    _sigev_thread: struct_unnamed_25,
};
pub const struct_sigevent = extern struct {
    sigev_value: __sigval_t = @import("std").mem.zeroes(__sigval_t),
    sigev_signo: c_int = @import("std").mem.zeroes(c_int),
    sigev_notify: c_int = @import("std").mem.zeroes(c_int),
    _sigev_un: union_unnamed_24 = @import("std").mem.zeroes(union_unnamed_24),
};
pub const sigevent_t = struct_sigevent;
pub const struct_netent = extern struct {
    n_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    n_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    n_addrtype: c_int = @import("std").mem.zeroes(c_int),
    n_net: u32 = @import("std").mem.zeroes(u32),
};
pub extern fn __h_errno_location() [*c]c_int;
pub extern fn herror(__str: [*c]const u8) void;
pub extern fn hstrerror(__err_num: c_int) [*c]const u8;
pub const struct_hostent = extern struct {
    h_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    h_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    h_addrtype: c_int = @import("std").mem.zeroes(c_int),
    h_length: c_int = @import("std").mem.zeroes(c_int),
    h_addr_list: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
};
pub extern fn sethostent(__stay_open: c_int) void;
pub extern fn endhostent() void;
pub extern fn gethostent() [*c]struct_hostent;
pub extern fn gethostbyaddr(__addr: ?*const anyopaque, __len: __socklen_t, __type: c_int) [*c]struct_hostent;
pub extern fn gethostbyname(__name: [*c]const u8) [*c]struct_hostent;
pub extern fn gethostbyname2(__name: [*c]const u8, __af: c_int) [*c]struct_hostent;
pub extern fn gethostent_r(noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn gethostbyaddr_r(noalias __addr: ?*const anyopaque, __len: __socklen_t, __type: c_int, noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn gethostbyname_r(noalias __name: [*c]const u8, noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn gethostbyname2_r(noalias __name: [*c]const u8, __af: c_int, noalias __result_buf: [*c]struct_hostent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_hostent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn setnetent(__stay_open: c_int) void;
pub extern fn endnetent() void;
pub extern fn getnetent() [*c]struct_netent;
pub extern fn getnetbyaddr(__net: u32, __type: c_int) [*c]struct_netent;
pub extern fn getnetbyname(__name: [*c]const u8) [*c]struct_netent;
pub extern fn getnetent_r(noalias __result_buf: [*c]struct_netent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_netent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn getnetbyaddr_r(__net: u32, __type: c_int, noalias __result_buf: [*c]struct_netent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_netent, noalias __h_errnop: [*c]c_int) c_int;
pub extern fn getnetbyname_r(noalias __name: [*c]const u8, noalias __result_buf: [*c]struct_netent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_netent, noalias __h_errnop: [*c]c_int) c_int;
pub const struct_servent = extern struct {
    s_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    s_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    s_port: c_int = @import("std").mem.zeroes(c_int),
    s_proto: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub extern fn setservent(__stay_open: c_int) void;
pub extern fn endservent() void;
pub extern fn getservent() [*c]struct_servent;
pub extern fn getservbyname(__name: [*c]const u8, __proto: [*c]const u8) [*c]struct_servent;
pub extern fn getservbyport(__port: c_int, __proto: [*c]const u8) [*c]struct_servent;
pub extern fn getservent_r(noalias __result_buf: [*c]struct_servent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_servent) c_int;
pub extern fn getservbyname_r(noalias __name: [*c]const u8, noalias __proto: [*c]const u8, noalias __result_buf: [*c]struct_servent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_servent) c_int;
pub extern fn getservbyport_r(__port: c_int, noalias __proto: [*c]const u8, noalias __result_buf: [*c]struct_servent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_servent) c_int;
pub const struct_protoent = extern struct {
    p_name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    p_aliases: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    p_proto: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn setprotoent(__stay_open: c_int) void;
pub extern fn endprotoent() void;
pub extern fn getprotoent() [*c]struct_protoent;
pub extern fn getprotobyname(__name: [*c]const u8) [*c]struct_protoent;
pub extern fn getprotobynumber(__proto: c_int) [*c]struct_protoent;
pub extern fn getprotoent_r(noalias __result_buf: [*c]struct_protoent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_protoent) c_int;
pub extern fn getprotobyname_r(noalias __name: [*c]const u8, noalias __result_buf: [*c]struct_protoent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_protoent) c_int;
pub extern fn getprotobynumber_r(__proto: c_int, noalias __result_buf: [*c]struct_protoent, noalias __buf: [*c]u8, __buflen: usize, noalias __result: [*c][*c]struct_protoent) c_int;
pub extern fn setnetgrent(__netgroup: [*c]const u8) c_int;
pub extern fn endnetgrent() void;
pub extern fn getnetgrent(noalias __hostp: [*c][*c]u8, noalias __userp: [*c][*c]u8, noalias __domainp: [*c][*c]u8) c_int;
pub extern fn innetgr(__netgroup: [*c]const u8, __host: [*c]const u8, __user: [*c]const u8, __domain: [*c]const u8) c_int;
pub extern fn getnetgrent_r(noalias __hostp: [*c][*c]u8, noalias __userp: [*c][*c]u8, noalias __domainp: [*c][*c]u8, noalias __buffer: [*c]u8, __buflen: usize) c_int;
pub extern fn rcmd(noalias __ahost: [*c][*c]u8, __rport: c_ushort, noalias __locuser: [*c]const u8, noalias __remuser: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int) c_int;
pub extern fn rcmd_af(noalias __ahost: [*c][*c]u8, __rport: c_ushort, noalias __locuser: [*c]const u8, noalias __remuser: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int, __af: sa_family_t) c_int;
pub extern fn rexec(noalias __ahost: [*c][*c]u8, __rport: c_int, noalias __name: [*c]const u8, noalias __pass: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int) c_int;
pub extern fn rexec_af(noalias __ahost: [*c][*c]u8, __rport: c_int, noalias __name: [*c]const u8, noalias __pass: [*c]const u8, noalias __cmd: [*c]const u8, noalias __fd2p: [*c]c_int, __af: sa_family_t) c_int;
pub extern fn ruserok(__rhost: [*c]const u8, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8) c_int;
pub extern fn ruserok_af(__rhost: [*c]const u8, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8, __af: sa_family_t) c_int;
pub extern fn iruserok(__raddr: u32, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8) c_int;
pub extern fn iruserok_af(__raddr: ?*const anyopaque, __suser: c_int, __remuser: [*c]const u8, __locuser: [*c]const u8, __af: sa_family_t) c_int;
pub extern fn rresvport(__alport: [*c]c_int) c_int;
pub extern fn rresvport_af(__alport: [*c]c_int, __af: sa_family_t) c_int;
pub const struct_addrinfo = extern struct {
    ai_flags: c_int = @import("std").mem.zeroes(c_int),
    ai_family: c_int = @import("std").mem.zeroes(c_int),
    ai_socktype: c_int = @import("std").mem.zeroes(c_int),
    ai_protocol: c_int = @import("std").mem.zeroes(c_int),
    ai_addrlen: socklen_t = @import("std").mem.zeroes(socklen_t),
    ai_addr: [*c]struct_sockaddr = @import("std").mem.zeroes([*c]struct_sockaddr),
    ai_canonname: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    ai_next: [*c]struct_addrinfo = @import("std").mem.zeroes([*c]struct_addrinfo),
};
pub const struct_gaicb = extern struct {
    ar_name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ar_service: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ar_request: [*c]const struct_addrinfo = @import("std").mem.zeroes([*c]const struct_addrinfo),
    ar_result: [*c]struct_addrinfo = @import("std").mem.zeroes([*c]struct_addrinfo),
    __return: c_int = @import("std").mem.zeroes(c_int),
    __glibc_reserved: [5]c_int = @import("std").mem.zeroes([5]c_int),
};
pub extern fn getaddrinfo(noalias __name: [*c]const u8, noalias __service: [*c]const u8, noalias __req: [*c]const struct_addrinfo, noalias __pai: [*c][*c]struct_addrinfo) c_int;
pub extern fn freeaddrinfo(__ai: [*c]struct_addrinfo) void;
pub extern fn gai_strerror(__ecode: c_int) [*c]const u8;
pub extern fn getnameinfo(noalias __sa: [*c]const struct_sockaddr, __salen: socklen_t, noalias __host: [*c]u8, __hostlen: socklen_t, noalias __serv: [*c]u8, __servlen: socklen_t, __flags: c_int) c_int;
pub extern fn getaddrinfo_a(__mode: c_int, noalias __list: [*c][*c]struct_gaicb, __ent: c_int, noalias __sig: [*c]struct_sigevent) c_int;
pub extern fn gai_suspend(__list: [*c]const [*c]const struct_gaicb, __ent: c_int, __timeout: [*c]const struct_timespec) c_int;
pub extern fn gai_error(__req: [*c]struct_gaicb) c_int;
pub extern fn gai_cancel(__gaicbp: [*c]struct_gaicb) c_int;
pub const struct_sched_param = extern struct {
    sched_priority: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn clone(__fn: ?*const fn (?*anyopaque) callconv(.c) c_int, __child_stack: ?*anyopaque, __flags: c_int, __arg: ?*anyopaque, ...) c_int;
pub extern fn unshare(__flags: c_int) c_int;
pub extern fn sched_getcpu() c_int;
pub extern fn getcpu([*c]c_uint, [*c]c_uint) c_int;
pub extern fn setns(__fd: c_int, __nstype: c_int) c_int;
pub const __cpu_mask = c_ulong;
pub const cpu_set_t = extern struct {
    __bits: [16]__cpu_mask = @import("std").mem.zeroes([16]__cpu_mask),
};
pub extern fn __sched_cpucount(__setsize: usize, __setp: [*c]const cpu_set_t) c_int;
pub extern fn __sched_cpualloc(__count: usize) [*c]cpu_set_t;
pub extern fn __sched_cpufree(__set: [*c]cpu_set_t) void;
pub extern fn sched_setparam(__pid: __pid_t, __param: [*c]const struct_sched_param) c_int;
pub extern fn sched_getparam(__pid: __pid_t, __param: [*c]struct_sched_param) c_int;
pub extern fn sched_setscheduler(__pid: __pid_t, __policy: c_int, __param: [*c]const struct_sched_param) c_int;
pub extern fn sched_getscheduler(__pid: __pid_t) c_int;
pub extern fn sched_yield() c_int;
pub extern fn sched_get_priority_max(__algorithm: c_int) c_int;
pub extern fn sched_get_priority_min(__algorithm: c_int) c_int;
pub extern fn sched_rr_get_interval(__pid: __pid_t, __t: [*c]struct_timespec) c_int;
pub extern fn sched_setaffinity(__pid: __pid_t, __cpusetsize: usize, __cpuset: [*c]const cpu_set_t) c_int;
pub extern fn sched_getaffinity(__pid: __pid_t, __cpusetsize: usize, __cpuset: [*c]cpu_set_t) c_int;
// /usr/include/bits/timex.h:81:3: warning: struct demoted to opaque type - has bitfield
pub const struct_timex = opaque {};
pub extern fn clock_adjtime(__clock_id: __clockid_t, __utx: ?*struct_timex) c_int;
pub const struct_tm = extern struct {
    tm_sec: c_int = @import("std").mem.zeroes(c_int),
    tm_min: c_int = @import("std").mem.zeroes(c_int),
    tm_hour: c_int = @import("std").mem.zeroes(c_int),
    tm_mday: c_int = @import("std").mem.zeroes(c_int),
    tm_mon: c_int = @import("std").mem.zeroes(c_int),
    tm_year: c_int = @import("std").mem.zeroes(c_int),
    tm_wday: c_int = @import("std").mem.zeroes(c_int),
    tm_yday: c_int = @import("std").mem.zeroes(c_int),
    tm_isdst: c_int = @import("std").mem.zeroes(c_int),
    tm_gmtoff: c_long = @import("std").mem.zeroes(c_long),
    tm_zone: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const struct_itimerspec = extern struct {
    it_interval: struct_timespec = @import("std").mem.zeroes(struct_timespec),
    it_value: struct_timespec = @import("std").mem.zeroes(struct_timespec),
};
pub const struct___locale_data_26 = opaque {};
pub const struct___locale_struct = extern struct {
    __locales: [13]?*struct___locale_data_26 = @import("std").mem.zeroes([13]?*struct___locale_data_26),
    __ctype_b: [*c]const c_ushort = @import("std").mem.zeroes([*c]const c_ushort),
    __ctype_tolower: [*c]const c_int = @import("std").mem.zeroes([*c]const c_int),
    __ctype_toupper: [*c]const c_int = @import("std").mem.zeroes([*c]const c_int),
    __names: [13][*c]const u8 = @import("std").mem.zeroes([13][*c]const u8),
};
pub const __locale_t = [*c]struct___locale_struct;
pub const locale_t = __locale_t;
pub extern fn clock() clock_t;
pub extern fn time(__timer: [*c]time_t) time_t;
pub extern fn difftime(__time1: time_t, __time0: time_t) f64;
pub extern fn mktime(__tp: [*c]struct_tm) time_t;
pub extern fn strftime(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm) usize;
pub extern fn strptime(noalias __s: [*c]const u8, noalias __fmt: [*c]const u8, __tp: [*c]struct_tm) [*c]u8;
pub extern fn strftime_l(noalias __s: [*c]u8, __maxsize: usize, noalias __format: [*c]const u8, noalias __tp: [*c]const struct_tm, __loc: locale_t) usize;
pub extern fn strptime_l(noalias __s: [*c]const u8, noalias __fmt: [*c]const u8, __tp: [*c]struct_tm, __loc: locale_t) [*c]u8;
pub extern fn gmtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn localtime(__timer: [*c]const time_t) [*c]struct_tm;
pub extern fn gmtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn localtime_r(noalias __timer: [*c]const time_t, noalias __tp: [*c]struct_tm) [*c]struct_tm;
pub extern fn asctime(__tp: [*c]const struct_tm) [*c]u8;
pub extern fn ctime(__timer: [*c]const time_t) [*c]u8;
pub extern fn asctime_r(noalias __tp: [*c]const struct_tm, noalias __buf: [*c]u8) [*c]u8;
pub extern fn ctime_r(noalias __timer: [*c]const time_t, noalias __buf: [*c]u8) [*c]u8;
pub extern var __tzname: [2][*c]u8;
pub extern var __daylight: c_int;
pub extern var __timezone: c_long;
pub extern var tzname: [2][*c]u8;
pub extern fn tzset() void;
pub extern var daylight: c_int;
pub extern var timezone: c_long;
pub extern fn timegm(__tp: [*c]struct_tm) time_t;
pub extern fn timelocal(__tp: [*c]struct_tm) time_t;
pub extern fn dysize(__year: c_int) c_int;
pub extern fn nanosleep(__requested_time: [*c]const struct_timespec, __remaining: [*c]struct_timespec) c_int;
pub extern fn clock_getres(__clock_id: clockid_t, __res: [*c]struct_timespec) c_int;
pub extern fn clock_gettime(__clock_id: clockid_t, __tp: [*c]struct_timespec) c_int;
pub extern fn clock_settime(__clock_id: clockid_t, __tp: [*c]const struct_timespec) c_int;
pub extern fn clock_nanosleep(__clock_id: clockid_t, __flags: c_int, __req: [*c]const struct_timespec, __rem: [*c]struct_timespec) c_int;
pub extern fn clock_getcpuclockid(__pid: pid_t, __clock_id: [*c]clockid_t) c_int;
pub extern fn timer_create(__clock_id: clockid_t, noalias __evp: [*c]struct_sigevent, noalias __timerid: [*c]timer_t) c_int;
pub extern fn timer_delete(__timerid: timer_t) c_int;
pub extern fn timer_settime(__timerid: timer_t, __flags: c_int, noalias __value: [*c]const struct_itimerspec, noalias __ovalue: [*c]struct_itimerspec) c_int;
pub extern fn timer_gettime(__timerid: timer_t, __value: [*c]struct_itimerspec) c_int;
pub extern fn timer_getoverrun(__timerid: timer_t) c_int;
pub extern fn timespec_get(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub extern fn timespec_getres(__ts: [*c]struct_timespec, __base: c_int) c_int;
pub extern var getdate_err: c_int;
pub extern fn getdate(__string: [*c]const u8) [*c]struct_tm;
pub extern fn getdate_r(noalias __string: [*c]const u8, noalias __resbufp: [*c]struct_tm) c_int;
pub const __jmp_buf = [8]c_long;
pub const struct___jmp_buf_tag = extern struct {
    __jmpbuf: __jmp_buf = @import("std").mem.zeroes(__jmp_buf),
    __mask_was_saved: c_int = @import("std").mem.zeroes(c_int),
    __saved_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
};
pub extern fn __sysconf(__name: c_int) c_long;
pub const PTHREAD_CREATE_JOINABLE: c_int = 0;
pub const PTHREAD_CREATE_DETACHED: c_int = 1;
const enum_unnamed_27 = c_uint;
pub const PTHREAD_MUTEX_TIMED_NP: c_int = 0;
pub const PTHREAD_MUTEX_RECURSIVE_NP: c_int = 1;
pub const PTHREAD_MUTEX_ERRORCHECK_NP: c_int = 2;
pub const PTHREAD_MUTEX_ADAPTIVE_NP: c_int = 3;
pub const PTHREAD_MUTEX_NORMAL: c_int = 0;
pub const PTHREAD_MUTEX_RECURSIVE: c_int = 1;
pub const PTHREAD_MUTEX_ERRORCHECK: c_int = 2;
pub const PTHREAD_MUTEX_DEFAULT: c_int = 0;
pub const PTHREAD_MUTEX_FAST_NP: c_int = 0;
const enum_unnamed_28 = c_uint;
pub const PTHREAD_MUTEX_STALLED: c_int = 0;
pub const PTHREAD_MUTEX_STALLED_NP: c_int = 0;
pub const PTHREAD_MUTEX_ROBUST: c_int = 1;
pub const PTHREAD_MUTEX_ROBUST_NP: c_int = 1;
const enum_unnamed_29 = c_uint;
pub const PTHREAD_PRIO_NONE: c_int = 0;
pub const PTHREAD_PRIO_INHERIT: c_int = 1;
pub const PTHREAD_PRIO_PROTECT: c_int = 2;
const enum_unnamed_30 = c_uint;
pub const PTHREAD_RWLOCK_PREFER_READER_NP: c_int = 0;
pub const PTHREAD_RWLOCK_PREFER_WRITER_NP: c_int = 1;
pub const PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP: c_int = 2;
pub const PTHREAD_RWLOCK_DEFAULT_NP: c_int = 0;
const enum_unnamed_31 = c_uint;
pub const PTHREAD_INHERIT_SCHED: c_int = 0;
pub const PTHREAD_EXPLICIT_SCHED: c_int = 1;
const enum_unnamed_32 = c_uint;
pub const PTHREAD_SCOPE_SYSTEM: c_int = 0;
pub const PTHREAD_SCOPE_PROCESS: c_int = 1;
const enum_unnamed_33 = c_uint;
pub const PTHREAD_PROCESS_PRIVATE: c_int = 0;
pub const PTHREAD_PROCESS_SHARED: c_int = 1;
const enum_unnamed_34 = c_uint;
pub const struct__pthread_cleanup_buffer = extern struct {
    __routine: ?*const fn (?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) void),
    __arg: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __canceltype: c_int = @import("std").mem.zeroes(c_int),
    __prev: [*c]struct__pthread_cleanup_buffer = @import("std").mem.zeroes([*c]struct__pthread_cleanup_buffer),
};
pub const PTHREAD_CANCEL_ENABLE: c_int = 0;
pub const PTHREAD_CANCEL_DISABLE: c_int = 1;
const enum_unnamed_35 = c_uint;
pub const PTHREAD_CANCEL_DEFERRED: c_int = 0;
pub const PTHREAD_CANCEL_ASYNCHRONOUS: c_int = 1;
const enum_unnamed_36 = c_uint;
pub extern fn pthread_create(noalias __newthread: [*c]pthread_t, noalias __attr: [*c]const pthread_attr_t, __start_routine: ?*const fn (?*anyopaque) callconv(.c) ?*anyopaque, noalias __arg: ?*anyopaque) c_int;
pub extern fn pthread_exit(__retval: ?*anyopaque) noreturn;
pub extern fn pthread_join(__th: pthread_t, __thread_return: [*c]?*anyopaque) c_int;
pub extern fn pthread_tryjoin_np(__th: pthread_t, __thread_return: [*c]?*anyopaque) c_int;
pub extern fn pthread_timedjoin_np(__th: pthread_t, __thread_return: [*c]?*anyopaque, __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_clockjoin_np(__th: pthread_t, __thread_return: [*c]?*anyopaque, __clockid: clockid_t, __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_detach(__th: pthread_t) c_int;
pub extern fn pthread_self() pthread_t;
pub extern fn pthread_equal(__thread1: pthread_t, __thread2: pthread_t) c_int;
pub extern fn pthread_attr_init(__attr: [*c]pthread_attr_t) c_int;
pub extern fn pthread_attr_destroy(__attr: [*c]pthread_attr_t) c_int;
pub extern fn pthread_attr_getdetachstate(__attr: [*c]const pthread_attr_t, __detachstate: [*c]c_int) c_int;
pub extern fn pthread_attr_setdetachstate(__attr: [*c]pthread_attr_t, __detachstate: c_int) c_int;
pub extern fn pthread_attr_getguardsize(__attr: [*c]const pthread_attr_t, __guardsize: [*c]usize) c_int;
pub extern fn pthread_attr_setguardsize(__attr: [*c]pthread_attr_t, __guardsize: usize) c_int;
pub extern fn pthread_attr_getschedparam(noalias __attr: [*c]const pthread_attr_t, noalias __param: [*c]struct_sched_param) c_int;
pub extern fn pthread_attr_setschedparam(noalias __attr: [*c]pthread_attr_t, noalias __param: [*c]const struct_sched_param) c_int;
pub extern fn pthread_attr_getschedpolicy(noalias __attr: [*c]const pthread_attr_t, noalias __policy: [*c]c_int) c_int;
pub extern fn pthread_attr_setschedpolicy(__attr: [*c]pthread_attr_t, __policy: c_int) c_int;
pub extern fn pthread_attr_getinheritsched(noalias __attr: [*c]const pthread_attr_t, noalias __inherit: [*c]c_int) c_int;
pub extern fn pthread_attr_setinheritsched(__attr: [*c]pthread_attr_t, __inherit: c_int) c_int;
pub extern fn pthread_attr_getscope(noalias __attr: [*c]const pthread_attr_t, noalias __scope: [*c]c_int) c_int;
pub extern fn pthread_attr_setscope(__attr: [*c]pthread_attr_t, __scope: c_int) c_int;
pub extern fn pthread_attr_getstackaddr(noalias __attr: [*c]const pthread_attr_t, noalias __stackaddr: [*c]?*anyopaque) c_int;
pub extern fn pthread_attr_setstackaddr(__attr: [*c]pthread_attr_t, __stackaddr: ?*anyopaque) c_int;
pub extern fn pthread_attr_getstacksize(noalias __attr: [*c]const pthread_attr_t, noalias __stacksize: [*c]usize) c_int;
pub extern fn pthread_attr_setstacksize(__attr: [*c]pthread_attr_t, __stacksize: usize) c_int;
pub extern fn pthread_attr_getstack(noalias __attr: [*c]const pthread_attr_t, noalias __stackaddr: [*c]?*anyopaque, noalias __stacksize: [*c]usize) c_int;
pub extern fn pthread_attr_setstack(__attr: [*c]pthread_attr_t, __stackaddr: ?*anyopaque, __stacksize: usize) c_int;
pub extern fn pthread_attr_setaffinity_np(__attr: [*c]pthread_attr_t, __cpusetsize: usize, __cpuset: [*c]const cpu_set_t) c_int;
pub extern fn pthread_attr_getaffinity_np(__attr: [*c]const pthread_attr_t, __cpusetsize: usize, __cpuset: [*c]cpu_set_t) c_int;
pub extern fn pthread_getattr_default_np(__attr: [*c]pthread_attr_t) c_int;
pub extern fn pthread_attr_setsigmask_np(__attr: [*c]pthread_attr_t, sigmask: [*c]const __sigset_t) c_int;
pub extern fn pthread_attr_getsigmask_np(__attr: [*c]const pthread_attr_t, sigmask: [*c]__sigset_t) c_int;
pub extern fn pthread_setattr_default_np(__attr: [*c]const pthread_attr_t) c_int;
pub extern fn pthread_getattr_np(__th: pthread_t, __attr: [*c]pthread_attr_t) c_int;
pub extern fn pthread_setschedparam(__target_thread: pthread_t, __policy: c_int, __param: [*c]const struct_sched_param) c_int;
pub extern fn pthread_getschedparam(__target_thread: pthread_t, noalias __policy: [*c]c_int, noalias __param: [*c]struct_sched_param) c_int;
pub extern fn pthread_setschedprio(__target_thread: pthread_t, __prio: c_int) c_int;
pub extern fn pthread_getname_np(__target_thread: pthread_t, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn pthread_setname_np(__target_thread: pthread_t, __name: [*c]const u8) c_int;
pub extern fn pthread_getconcurrency() c_int;
pub extern fn pthread_setconcurrency(__level: c_int) c_int;
pub extern fn pthread_yield() c_int;
pub extern fn pthread_setaffinity_np(__th: pthread_t, __cpusetsize: usize, __cpuset: [*c]const cpu_set_t) c_int;
pub extern fn pthread_getaffinity_np(__th: pthread_t, __cpusetsize: usize, __cpuset: [*c]cpu_set_t) c_int;
pub extern fn pthread_once(__once_control: [*c]pthread_once_t, __init_routine: ?*const fn () callconv(.c) void) c_int;
pub extern fn pthread_setcancelstate(__state: c_int, __oldstate: [*c]c_int) c_int;
pub extern fn pthread_setcanceltype(__type: c_int, __oldtype: [*c]c_int) c_int;
pub extern fn pthread_cancel(__th: pthread_t) c_int;
pub extern fn pthread_testcancel() void;
pub const struct___cancel_jmp_buf_tag = extern struct {
    __cancel_jmp_buf: __jmp_buf = @import("std").mem.zeroes(__jmp_buf),
    __mask_was_saved: c_int = @import("std").mem.zeroes(c_int),
};
pub const __pthread_unwind_buf_t = extern struct {
    __cancel_jmp_buf: [1]struct___cancel_jmp_buf_tag = @import("std").mem.zeroes([1]struct___cancel_jmp_buf_tag),
    __pad: [4]?*anyopaque = @import("std").mem.zeroes([4]?*anyopaque),
};
pub const struct___pthread_cleanup_frame = extern struct {
    __cancel_routine: ?*const fn (?*anyopaque) callconv(.c) void = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) void),
    __cancel_arg: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __do_it: c_int = @import("std").mem.zeroes(c_int),
    __cancel_type: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn __pthread_register_cancel(__buf: [*c]__pthread_unwind_buf_t) void;
pub extern fn __pthread_unregister_cancel(__buf: [*c]__pthread_unwind_buf_t) void;
pub extern fn __pthread_register_cancel_defer(__buf: [*c]__pthread_unwind_buf_t) void;
pub extern fn __pthread_unregister_cancel_restore(__buf: [*c]__pthread_unwind_buf_t) void;
pub extern fn __pthread_unwind_next(__buf: [*c]__pthread_unwind_buf_t) noreturn;
pub extern fn __sigsetjmp(__env: [*c]struct___jmp_buf_tag, __savemask: c_int) c_int;
pub extern fn pthread_mutex_init(__mutex: [*c]pthread_mutex_t, __mutexattr: [*c]const pthread_mutexattr_t) c_int;
pub extern fn pthread_mutex_destroy(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_trylock(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_lock(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_timedlock(noalias __mutex: [*c]pthread_mutex_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_mutex_clocklock(noalias __mutex: [*c]pthread_mutex_t, __clockid: clockid_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_mutex_unlock(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_getprioceiling(noalias __mutex: [*c]const pthread_mutex_t, noalias __prioceiling: [*c]c_int) c_int;
pub extern fn pthread_mutex_setprioceiling(noalias __mutex: [*c]pthread_mutex_t, __prioceiling: c_int, noalias __old_ceiling: [*c]c_int) c_int;
pub extern fn pthread_mutex_consistent(__mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutex_consistent_np([*c]pthread_mutex_t) c_int;
pub extern fn pthread_mutexattr_init(__attr: [*c]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_destroy(__attr: [*c]pthread_mutexattr_t) c_int;
pub extern fn pthread_mutexattr_getpshared(noalias __attr: [*c]const pthread_mutexattr_t, noalias __pshared: [*c]c_int) c_int;
pub extern fn pthread_mutexattr_setpshared(__attr: [*c]pthread_mutexattr_t, __pshared: c_int) c_int;
pub extern fn pthread_mutexattr_gettype(noalias __attr: [*c]const pthread_mutexattr_t, noalias __kind: [*c]c_int) c_int;
pub extern fn pthread_mutexattr_settype(__attr: [*c]pthread_mutexattr_t, __kind: c_int) c_int;
pub extern fn pthread_mutexattr_getprotocol(noalias __attr: [*c]const pthread_mutexattr_t, noalias __protocol: [*c]c_int) c_int;
pub extern fn pthread_mutexattr_setprotocol(__attr: [*c]pthread_mutexattr_t, __protocol: c_int) c_int;
pub extern fn pthread_mutexattr_getprioceiling(noalias __attr: [*c]const pthread_mutexattr_t, noalias __prioceiling: [*c]c_int) c_int;
pub extern fn pthread_mutexattr_setprioceiling(__attr: [*c]pthread_mutexattr_t, __prioceiling: c_int) c_int;
pub extern fn pthread_mutexattr_getrobust(__attr: [*c]const pthread_mutexattr_t, __robustness: [*c]c_int) c_int;
pub extern fn pthread_mutexattr_getrobust_np([*c]pthread_mutexattr_t, [*c]c_int) c_int;
pub extern fn pthread_mutexattr_setrobust(__attr: [*c]pthread_mutexattr_t, __robustness: c_int) c_int;
pub extern fn pthread_mutexattr_setrobust_np([*c]pthread_mutexattr_t, c_int) c_int;
pub extern fn pthread_rwlock_init(noalias __rwlock: [*c]pthread_rwlock_t, noalias __attr: [*c]const pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlock_destroy(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_rdlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_tryrdlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_timedrdlock(noalias __rwlock: [*c]pthread_rwlock_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_rwlock_clockrdlock(noalias __rwlock: [*c]pthread_rwlock_t, __clockid: clockid_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_rwlock_wrlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_trywrlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlock_timedwrlock(noalias __rwlock: [*c]pthread_rwlock_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_rwlock_clockwrlock(noalias __rwlock: [*c]pthread_rwlock_t, __clockid: clockid_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_rwlock_unlock(__rwlock: [*c]pthread_rwlock_t) c_int;
pub extern fn pthread_rwlockattr_init(__attr: [*c]pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlockattr_destroy(__attr: [*c]pthread_rwlockattr_t) c_int;
pub extern fn pthread_rwlockattr_getpshared(noalias __attr: [*c]const pthread_rwlockattr_t, noalias __pshared: [*c]c_int) c_int;
pub extern fn pthread_rwlockattr_setpshared(__attr: [*c]pthread_rwlockattr_t, __pshared: c_int) c_int;
pub extern fn pthread_rwlockattr_getkind_np(noalias __attr: [*c]const pthread_rwlockattr_t, noalias __pref: [*c]c_int) c_int;
pub extern fn pthread_rwlockattr_setkind_np(__attr: [*c]pthread_rwlockattr_t, __pref: c_int) c_int;
pub extern fn pthread_cond_init(noalias __cond: [*c]pthread_cond_t, noalias __cond_attr: [*c]const pthread_condattr_t) c_int;
pub extern fn pthread_cond_destroy(__cond: [*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_signal(__cond: [*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_broadcast(__cond: [*c]pthread_cond_t) c_int;
pub extern fn pthread_cond_wait(noalias __cond: [*c]pthread_cond_t, noalias __mutex: [*c]pthread_mutex_t) c_int;
pub extern fn pthread_cond_timedwait(noalias __cond: [*c]pthread_cond_t, noalias __mutex: [*c]pthread_mutex_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_cond_clockwait(noalias __cond: [*c]pthread_cond_t, noalias __mutex: [*c]pthread_mutex_t, __clock_id: __clockid_t, noalias __abstime: [*c]const struct_timespec) c_int;
pub extern fn pthread_condattr_init(__attr: [*c]pthread_condattr_t) c_int;
pub extern fn pthread_condattr_destroy(__attr: [*c]pthread_condattr_t) c_int;
pub extern fn pthread_condattr_getpshared(noalias __attr: [*c]const pthread_condattr_t, noalias __pshared: [*c]c_int) c_int;
pub extern fn pthread_condattr_setpshared(__attr: [*c]pthread_condattr_t, __pshared: c_int) c_int;
pub extern fn pthread_condattr_getclock(noalias __attr: [*c]const pthread_condattr_t, noalias __clock_id: [*c]__clockid_t) c_int;
pub extern fn pthread_condattr_setclock(__attr: [*c]pthread_condattr_t, __clock_id: __clockid_t) c_int;
pub extern fn pthread_spin_init(__lock: [*c]volatile pthread_spinlock_t, __pshared: c_int) c_int;
pub extern fn pthread_spin_destroy(__lock: [*c]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_spin_lock(__lock: [*c]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_spin_trylock(__lock: [*c]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_spin_unlock(__lock: [*c]volatile pthread_spinlock_t) c_int;
pub extern fn pthread_barrier_init(noalias __barrier: [*c]pthread_barrier_t, noalias __attr: [*c]const pthread_barrierattr_t, __count: c_uint) c_int;
pub extern fn pthread_barrier_destroy(__barrier: [*c]pthread_barrier_t) c_int;
pub extern fn pthread_barrier_wait(__barrier: [*c]pthread_barrier_t) c_int;
pub extern fn pthread_barrierattr_init(__attr: [*c]pthread_barrierattr_t) c_int;
pub extern fn pthread_barrierattr_destroy(__attr: [*c]pthread_barrierattr_t) c_int;
pub extern fn pthread_barrierattr_getpshared(noalias __attr: [*c]const pthread_barrierattr_t, noalias __pshared: [*c]c_int) c_int;
pub extern fn pthread_barrierattr_setpshared(__attr: [*c]pthread_barrierattr_t, __pshared: c_int) c_int;
pub extern fn pthread_key_create(__key: [*c]pthread_key_t, __destr_function: ?*const fn (?*anyopaque) callconv(.c) void) c_int;
pub extern fn pthread_key_delete(__key: pthread_key_t) c_int;
pub extern fn pthread_getspecific(__key: pthread_key_t) ?*anyopaque;
pub extern fn pthread_setspecific(__key: pthread_key_t, __pointer: ?*const anyopaque) c_int;
pub extern fn pthread_getcpuclockid(__thread_id: pthread_t, __clock_id: [*c]__clockid_t) c_int;
pub extern fn pthread_atfork(__prepare: ?*const fn () callconv(.c) void, __parent: ?*const fn () callconv(.c) void, __child: ?*const fn () callconv(.c) void) c_int;
pub extern fn access(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn euidaccess(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn eaccess(__name: [*c]const u8, __type: c_int) c_int;
pub extern fn execveat(__fd: c_int, __path: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8, __flags: c_int) c_int;
pub extern fn faccessat(__fd: c_int, __file: [*c]const u8, __type: c_int, __flag: c_int) c_int;
pub extern fn lseek(__fd: c_int, __offset: __off_t, __whence: c_int) __off_t;
pub extern fn lseek64(__fd: c_int, __offset: __off64_t, __whence: c_int) __off64_t;
pub extern fn close(__fd: c_int) c_int;
pub extern fn closefrom(__lowfd: c_int) void;
pub extern fn read(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize) isize;
pub extern fn write(__fd: c_int, __buf: ?*const anyopaque, __n: usize) isize;
pub extern fn pread(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize, __offset: __off_t) isize;
pub extern fn pwrite(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __offset: __off_t) isize;
pub extern fn pread64(__fd: c_int, __buf: ?*anyopaque, __nbytes: usize, __offset: __off64_t) isize;
pub extern fn pwrite64(__fd: c_int, __buf: ?*const anyopaque, __n: usize, __offset: __off64_t) isize;
pub extern fn pipe(__pipedes: [*c]c_int) c_int;
pub extern fn pipe2(__pipedes: [*c]c_int, __flags: c_int) c_int;
pub extern fn alarm(__seconds: c_uint) c_uint;
pub extern fn sleep(__seconds: c_uint) c_uint;
pub extern fn ualarm(__value: __useconds_t, __interval: __useconds_t) __useconds_t;
pub extern fn usleep(__useconds: __useconds_t) c_int;
pub extern fn pause() c_int;
pub extern fn chown(__file: [*c]const u8, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn fchown(__fd: c_int, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn lchown(__file: [*c]const u8, __owner: __uid_t, __group: __gid_t) c_int;
pub extern fn fchownat(__fd: c_int, __file: [*c]const u8, __owner: __uid_t, __group: __gid_t, __flag: c_int) c_int;
pub extern fn chdir(__path: [*c]const u8) c_int;
pub extern fn fchdir(__fd: c_int) c_int;
pub extern fn getcwd(__buf: [*c]u8, __size: usize) [*c]u8;
pub extern fn get_current_dir_name() [*c]u8;
pub extern fn getwd(__buf: [*c]u8) [*c]u8;
pub extern fn dup(__fd: c_int) c_int;
pub extern fn dup2(__fd: c_int, __fd2: c_int) c_int;
pub extern fn dup3(__fd: c_int, __fd2: c_int, __flags: c_int) c_int;
pub extern var __environ: [*c][*c]u8;
pub extern var environ: [*c][*c]u8;
pub extern fn execve(__path: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn fexecve(__fd: c_int, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn execv(__path: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execle(__path: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execl(__path: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execvp(__file: [*c]const u8, __argv: [*c]const [*c]u8) c_int;
pub extern fn execlp(__file: [*c]const u8, __arg: [*c]const u8, ...) c_int;
pub extern fn execvpe(__file: [*c]const u8, __argv: [*c]const [*c]u8, __envp: [*c]const [*c]u8) c_int;
pub extern fn nice(__inc: c_int) c_int;
pub extern fn _exit(__status: c_int) noreturn;
pub const _PC_LINK_MAX: c_int = 0;
pub const _PC_MAX_CANON: c_int = 1;
pub const _PC_MAX_INPUT: c_int = 2;
pub const _PC_NAME_MAX: c_int = 3;
pub const _PC_PATH_MAX: c_int = 4;
pub const _PC_PIPE_BUF: c_int = 5;
pub const _PC_CHOWN_RESTRICTED: c_int = 6;
pub const _PC_NO_TRUNC: c_int = 7;
pub const _PC_VDISABLE: c_int = 8;
pub const _PC_SYNC_IO: c_int = 9;
pub const _PC_ASYNC_IO: c_int = 10;
pub const _PC_PRIO_IO: c_int = 11;
pub const _PC_SOCK_MAXBUF: c_int = 12;
pub const _PC_FILESIZEBITS: c_int = 13;
pub const _PC_REC_INCR_XFER_SIZE: c_int = 14;
pub const _PC_REC_MAX_XFER_SIZE: c_int = 15;
pub const _PC_REC_MIN_XFER_SIZE: c_int = 16;
pub const _PC_REC_XFER_ALIGN: c_int = 17;
pub const _PC_ALLOC_SIZE_MIN: c_int = 18;
pub const _PC_SYMLINK_MAX: c_int = 19;
pub const _PC_2_SYMLINKS: c_int = 20;
const enum_unnamed_37 = c_uint;
pub const _SC_ARG_MAX: c_int = 0;
pub const _SC_CHILD_MAX: c_int = 1;
pub const _SC_CLK_TCK: c_int = 2;
pub const _SC_NGROUPS_MAX: c_int = 3;
pub const _SC_OPEN_MAX: c_int = 4;
pub const _SC_STREAM_MAX: c_int = 5;
pub const _SC_TZNAME_MAX: c_int = 6;
pub const _SC_JOB_CONTROL: c_int = 7;
pub const _SC_SAVED_IDS: c_int = 8;
pub const _SC_REALTIME_SIGNALS: c_int = 9;
pub const _SC_PRIORITY_SCHEDULING: c_int = 10;
pub const _SC_TIMERS: c_int = 11;
pub const _SC_ASYNCHRONOUS_IO: c_int = 12;
pub const _SC_PRIORITIZED_IO: c_int = 13;
pub const _SC_SYNCHRONIZED_IO: c_int = 14;
pub const _SC_FSYNC: c_int = 15;
pub const _SC_MAPPED_FILES: c_int = 16;
pub const _SC_MEMLOCK: c_int = 17;
pub const _SC_MEMLOCK_RANGE: c_int = 18;
pub const _SC_MEMORY_PROTECTION: c_int = 19;
pub const _SC_MESSAGE_PASSING: c_int = 20;
pub const _SC_SEMAPHORES: c_int = 21;
pub const _SC_SHARED_MEMORY_OBJECTS: c_int = 22;
pub const _SC_AIO_LISTIO_MAX: c_int = 23;
pub const _SC_AIO_MAX: c_int = 24;
pub const _SC_AIO_PRIO_DELTA_MAX: c_int = 25;
pub const _SC_DELAYTIMER_MAX: c_int = 26;
pub const _SC_MQ_OPEN_MAX: c_int = 27;
pub const _SC_MQ_PRIO_MAX: c_int = 28;
pub const _SC_VERSION: c_int = 29;
pub const _SC_PAGESIZE: c_int = 30;
pub const _SC_RTSIG_MAX: c_int = 31;
pub const _SC_SEM_NSEMS_MAX: c_int = 32;
pub const _SC_SEM_VALUE_MAX: c_int = 33;
pub const _SC_SIGQUEUE_MAX: c_int = 34;
pub const _SC_TIMER_MAX: c_int = 35;
pub const _SC_BC_BASE_MAX: c_int = 36;
pub const _SC_BC_DIM_MAX: c_int = 37;
pub const _SC_BC_SCALE_MAX: c_int = 38;
pub const _SC_BC_STRING_MAX: c_int = 39;
pub const _SC_COLL_WEIGHTS_MAX: c_int = 40;
pub const _SC_EQUIV_CLASS_MAX: c_int = 41;
pub const _SC_EXPR_NEST_MAX: c_int = 42;
pub const _SC_LINE_MAX: c_int = 43;
pub const _SC_RE_DUP_MAX: c_int = 44;
pub const _SC_CHARCLASS_NAME_MAX: c_int = 45;
pub const _SC_2_VERSION: c_int = 46;
pub const _SC_2_C_BIND: c_int = 47;
pub const _SC_2_C_DEV: c_int = 48;
pub const _SC_2_FORT_DEV: c_int = 49;
pub const _SC_2_FORT_RUN: c_int = 50;
pub const _SC_2_SW_DEV: c_int = 51;
pub const _SC_2_LOCALEDEF: c_int = 52;
pub const _SC_PII: c_int = 53;
pub const _SC_PII_XTI: c_int = 54;
pub const _SC_PII_SOCKET: c_int = 55;
pub const _SC_PII_INTERNET: c_int = 56;
pub const _SC_PII_OSI: c_int = 57;
pub const _SC_POLL: c_int = 58;
pub const _SC_SELECT: c_int = 59;
pub const _SC_UIO_MAXIOV: c_int = 60;
pub const _SC_IOV_MAX: c_int = 60;
pub const _SC_PII_INTERNET_STREAM: c_int = 61;
pub const _SC_PII_INTERNET_DGRAM: c_int = 62;
pub const _SC_PII_OSI_COTS: c_int = 63;
pub const _SC_PII_OSI_CLTS: c_int = 64;
pub const _SC_PII_OSI_M: c_int = 65;
pub const _SC_T_IOV_MAX: c_int = 66;
pub const _SC_THREADS: c_int = 67;
pub const _SC_THREAD_SAFE_FUNCTIONS: c_int = 68;
pub const _SC_GETGR_R_SIZE_MAX: c_int = 69;
pub const _SC_GETPW_R_SIZE_MAX: c_int = 70;
pub const _SC_LOGIN_NAME_MAX: c_int = 71;
pub const _SC_TTY_NAME_MAX: c_int = 72;
pub const _SC_THREAD_DESTRUCTOR_ITERATIONS: c_int = 73;
pub const _SC_THREAD_KEYS_MAX: c_int = 74;
pub const _SC_THREAD_STACK_MIN: c_int = 75;
pub const _SC_THREAD_THREADS_MAX: c_int = 76;
pub const _SC_THREAD_ATTR_STACKADDR: c_int = 77;
pub const _SC_THREAD_ATTR_STACKSIZE: c_int = 78;
pub const _SC_THREAD_PRIORITY_SCHEDULING: c_int = 79;
pub const _SC_THREAD_PRIO_INHERIT: c_int = 80;
pub const _SC_THREAD_PRIO_PROTECT: c_int = 81;
pub const _SC_THREAD_PROCESS_SHARED: c_int = 82;
pub const _SC_NPROCESSORS_CONF: c_int = 83;
pub const _SC_NPROCESSORS_ONLN: c_int = 84;
pub const _SC_PHYS_PAGES: c_int = 85;
pub const _SC_AVPHYS_PAGES: c_int = 86;
pub const _SC_ATEXIT_MAX: c_int = 87;
pub const _SC_PASS_MAX: c_int = 88;
pub const _SC_XOPEN_VERSION: c_int = 89;
pub const _SC_XOPEN_XCU_VERSION: c_int = 90;
pub const _SC_XOPEN_UNIX: c_int = 91;
pub const _SC_XOPEN_CRYPT: c_int = 92;
pub const _SC_XOPEN_ENH_I18N: c_int = 93;
pub const _SC_XOPEN_SHM: c_int = 94;
pub const _SC_2_CHAR_TERM: c_int = 95;
pub const _SC_2_C_VERSION: c_int = 96;
pub const _SC_2_UPE: c_int = 97;
pub const _SC_XOPEN_XPG2: c_int = 98;
pub const _SC_XOPEN_XPG3: c_int = 99;
pub const _SC_XOPEN_XPG4: c_int = 100;
pub const _SC_CHAR_BIT: c_int = 101;
pub const _SC_CHAR_MAX: c_int = 102;
pub const _SC_CHAR_MIN: c_int = 103;
pub const _SC_INT_MAX: c_int = 104;
pub const _SC_INT_MIN: c_int = 105;
pub const _SC_LONG_BIT: c_int = 106;
pub const _SC_WORD_BIT: c_int = 107;
pub const _SC_MB_LEN_MAX: c_int = 108;
pub const _SC_NZERO: c_int = 109;
pub const _SC_SSIZE_MAX: c_int = 110;
pub const _SC_SCHAR_MAX: c_int = 111;
pub const _SC_SCHAR_MIN: c_int = 112;
pub const _SC_SHRT_MAX: c_int = 113;
pub const _SC_SHRT_MIN: c_int = 114;
pub const _SC_UCHAR_MAX: c_int = 115;
pub const _SC_UINT_MAX: c_int = 116;
pub const _SC_ULONG_MAX: c_int = 117;
pub const _SC_USHRT_MAX: c_int = 118;
pub const _SC_NL_ARGMAX: c_int = 119;
pub const _SC_NL_LANGMAX: c_int = 120;
pub const _SC_NL_MSGMAX: c_int = 121;
pub const _SC_NL_NMAX: c_int = 122;
pub const _SC_NL_SETMAX: c_int = 123;
pub const _SC_NL_TEXTMAX: c_int = 124;
pub const _SC_XBS5_ILP32_OFF32: c_int = 125;
pub const _SC_XBS5_ILP32_OFFBIG: c_int = 126;
pub const _SC_XBS5_LP64_OFF64: c_int = 127;
pub const _SC_XBS5_LPBIG_OFFBIG: c_int = 128;
pub const _SC_XOPEN_LEGACY: c_int = 129;
pub const _SC_XOPEN_REALTIME: c_int = 130;
pub const _SC_XOPEN_REALTIME_THREADS: c_int = 131;
pub const _SC_ADVISORY_INFO: c_int = 132;
pub const _SC_BARRIERS: c_int = 133;
pub const _SC_BASE: c_int = 134;
pub const _SC_C_LANG_SUPPORT: c_int = 135;
pub const _SC_C_LANG_SUPPORT_R: c_int = 136;
pub const _SC_CLOCK_SELECTION: c_int = 137;
pub const _SC_CPUTIME: c_int = 138;
pub const _SC_THREAD_CPUTIME: c_int = 139;
pub const _SC_DEVICE_IO: c_int = 140;
pub const _SC_DEVICE_SPECIFIC: c_int = 141;
pub const _SC_DEVICE_SPECIFIC_R: c_int = 142;
pub const _SC_FD_MGMT: c_int = 143;
pub const _SC_FIFO: c_int = 144;
pub const _SC_PIPE: c_int = 145;
pub const _SC_FILE_ATTRIBUTES: c_int = 146;
pub const _SC_FILE_LOCKING: c_int = 147;
pub const _SC_FILE_SYSTEM: c_int = 148;
pub const _SC_MONOTONIC_CLOCK: c_int = 149;
pub const _SC_MULTI_PROCESS: c_int = 150;
pub const _SC_SINGLE_PROCESS: c_int = 151;
pub const _SC_NETWORKING: c_int = 152;
pub const _SC_READER_WRITER_LOCKS: c_int = 153;
pub const _SC_SPIN_LOCKS: c_int = 154;
pub const _SC_REGEXP: c_int = 155;
pub const _SC_REGEX_VERSION: c_int = 156;
pub const _SC_SHELL: c_int = 157;
pub const _SC_SIGNALS: c_int = 158;
pub const _SC_SPAWN: c_int = 159;
pub const _SC_SPORADIC_SERVER: c_int = 160;
pub const _SC_THREAD_SPORADIC_SERVER: c_int = 161;
pub const _SC_SYSTEM_DATABASE: c_int = 162;
pub const _SC_SYSTEM_DATABASE_R: c_int = 163;
pub const _SC_TIMEOUTS: c_int = 164;
pub const _SC_TYPED_MEMORY_OBJECTS: c_int = 165;
pub const _SC_USER_GROUPS: c_int = 166;
pub const _SC_USER_GROUPS_R: c_int = 167;
pub const _SC_2_PBS: c_int = 168;
pub const _SC_2_PBS_ACCOUNTING: c_int = 169;
pub const _SC_2_PBS_LOCATE: c_int = 170;
pub const _SC_2_PBS_MESSAGE: c_int = 171;
pub const _SC_2_PBS_TRACK: c_int = 172;
pub const _SC_SYMLOOP_MAX: c_int = 173;
pub const _SC_STREAMS: c_int = 174;
pub const _SC_2_PBS_CHECKPOINT: c_int = 175;
pub const _SC_V6_ILP32_OFF32: c_int = 176;
pub const _SC_V6_ILP32_OFFBIG: c_int = 177;
pub const _SC_V6_LP64_OFF64: c_int = 178;
pub const _SC_V6_LPBIG_OFFBIG: c_int = 179;
pub const _SC_HOST_NAME_MAX: c_int = 180;
pub const _SC_TRACE: c_int = 181;
pub const _SC_TRACE_EVENT_FILTER: c_int = 182;
pub const _SC_TRACE_INHERIT: c_int = 183;
pub const _SC_TRACE_LOG: c_int = 184;
pub const _SC_LEVEL1_ICACHE_SIZE: c_int = 185;
pub const _SC_LEVEL1_ICACHE_ASSOC: c_int = 186;
pub const _SC_LEVEL1_ICACHE_LINESIZE: c_int = 187;
pub const _SC_LEVEL1_DCACHE_SIZE: c_int = 188;
pub const _SC_LEVEL1_DCACHE_ASSOC: c_int = 189;
pub const _SC_LEVEL1_DCACHE_LINESIZE: c_int = 190;
pub const _SC_LEVEL2_CACHE_SIZE: c_int = 191;
pub const _SC_LEVEL2_CACHE_ASSOC: c_int = 192;
pub const _SC_LEVEL2_CACHE_LINESIZE: c_int = 193;
pub const _SC_LEVEL3_CACHE_SIZE: c_int = 194;
pub const _SC_LEVEL3_CACHE_ASSOC: c_int = 195;
pub const _SC_LEVEL3_CACHE_LINESIZE: c_int = 196;
pub const _SC_LEVEL4_CACHE_SIZE: c_int = 197;
pub const _SC_LEVEL4_CACHE_ASSOC: c_int = 198;
pub const _SC_LEVEL4_CACHE_LINESIZE: c_int = 199;
pub const _SC_IPV6: c_int = 235;
pub const _SC_RAW_SOCKETS: c_int = 236;
pub const _SC_V7_ILP32_OFF32: c_int = 237;
pub const _SC_V7_ILP32_OFFBIG: c_int = 238;
pub const _SC_V7_LP64_OFF64: c_int = 239;
pub const _SC_V7_LPBIG_OFFBIG: c_int = 240;
pub const _SC_SS_REPL_MAX: c_int = 241;
pub const _SC_TRACE_EVENT_NAME_MAX: c_int = 242;
pub const _SC_TRACE_NAME_MAX: c_int = 243;
pub const _SC_TRACE_SYS_MAX: c_int = 244;
pub const _SC_TRACE_USER_EVENT_MAX: c_int = 245;
pub const _SC_XOPEN_STREAMS: c_int = 246;
pub const _SC_THREAD_ROBUST_PRIO_INHERIT: c_int = 247;
pub const _SC_THREAD_ROBUST_PRIO_PROTECT: c_int = 248;
pub const _SC_MINSIGSTKSZ: c_int = 249;
pub const _SC_SIGSTKSZ: c_int = 250;
const enum_unnamed_38 = c_uint;
pub const _CS_PATH: c_int = 0;
pub const _CS_V6_WIDTH_RESTRICTED_ENVS: c_int = 1;
pub const _CS_GNU_LIBC_VERSION: c_int = 2;
pub const _CS_GNU_LIBPTHREAD_VERSION: c_int = 3;
pub const _CS_V5_WIDTH_RESTRICTED_ENVS: c_int = 4;
pub const _CS_V7_WIDTH_RESTRICTED_ENVS: c_int = 5;
pub const _CS_LFS_CFLAGS: c_int = 1000;
pub const _CS_LFS_LDFLAGS: c_int = 1001;
pub const _CS_LFS_LIBS: c_int = 1002;
pub const _CS_LFS_LINTFLAGS: c_int = 1003;
pub const _CS_LFS64_CFLAGS: c_int = 1004;
pub const _CS_LFS64_LDFLAGS: c_int = 1005;
pub const _CS_LFS64_LIBS: c_int = 1006;
pub const _CS_LFS64_LINTFLAGS: c_int = 1007;
pub const _CS_XBS5_ILP32_OFF32_CFLAGS: c_int = 1100;
pub const _CS_XBS5_ILP32_OFF32_LDFLAGS: c_int = 1101;
pub const _CS_XBS5_ILP32_OFF32_LIBS: c_int = 1102;
pub const _CS_XBS5_ILP32_OFF32_LINTFLAGS: c_int = 1103;
pub const _CS_XBS5_ILP32_OFFBIG_CFLAGS: c_int = 1104;
pub const _CS_XBS5_ILP32_OFFBIG_LDFLAGS: c_int = 1105;
pub const _CS_XBS5_ILP32_OFFBIG_LIBS: c_int = 1106;
pub const _CS_XBS5_ILP32_OFFBIG_LINTFLAGS: c_int = 1107;
pub const _CS_XBS5_LP64_OFF64_CFLAGS: c_int = 1108;
pub const _CS_XBS5_LP64_OFF64_LDFLAGS: c_int = 1109;
pub const _CS_XBS5_LP64_OFF64_LIBS: c_int = 1110;
pub const _CS_XBS5_LP64_OFF64_LINTFLAGS: c_int = 1111;
pub const _CS_XBS5_LPBIG_OFFBIG_CFLAGS: c_int = 1112;
pub const _CS_XBS5_LPBIG_OFFBIG_LDFLAGS: c_int = 1113;
pub const _CS_XBS5_LPBIG_OFFBIG_LIBS: c_int = 1114;
pub const _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS: c_int = 1115;
pub const _CS_POSIX_V6_ILP32_OFF32_CFLAGS: c_int = 1116;
pub const _CS_POSIX_V6_ILP32_OFF32_LDFLAGS: c_int = 1117;
pub const _CS_POSIX_V6_ILP32_OFF32_LIBS: c_int = 1118;
pub const _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS: c_int = 1119;
pub const _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS: c_int = 1120;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS: c_int = 1121;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LIBS: c_int = 1122;
pub const _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS: c_int = 1123;
pub const _CS_POSIX_V6_LP64_OFF64_CFLAGS: c_int = 1124;
pub const _CS_POSIX_V6_LP64_OFF64_LDFLAGS: c_int = 1125;
pub const _CS_POSIX_V6_LP64_OFF64_LIBS: c_int = 1126;
pub const _CS_POSIX_V6_LP64_OFF64_LINTFLAGS: c_int = 1127;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS: c_int = 1128;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS: c_int = 1129;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LIBS: c_int = 1130;
pub const _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS: c_int = 1131;
pub const _CS_POSIX_V7_ILP32_OFF32_CFLAGS: c_int = 1132;
pub const _CS_POSIX_V7_ILP32_OFF32_LDFLAGS: c_int = 1133;
pub const _CS_POSIX_V7_ILP32_OFF32_LIBS: c_int = 1134;
pub const _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS: c_int = 1135;
pub const _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS: c_int = 1136;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS: c_int = 1137;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LIBS: c_int = 1138;
pub const _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS: c_int = 1139;
pub const _CS_POSIX_V7_LP64_OFF64_CFLAGS: c_int = 1140;
pub const _CS_POSIX_V7_LP64_OFF64_LDFLAGS: c_int = 1141;
pub const _CS_POSIX_V7_LP64_OFF64_LIBS: c_int = 1142;
pub const _CS_POSIX_V7_LP64_OFF64_LINTFLAGS: c_int = 1143;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS: c_int = 1144;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS: c_int = 1145;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LIBS: c_int = 1146;
pub const _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS: c_int = 1147;
pub const _CS_V6_ENV: c_int = 1148;
pub const _CS_V7_ENV: c_int = 1149;
const enum_unnamed_39 = c_uint;
pub extern fn pathconf(__path: [*c]const u8, __name: c_int) c_long;
pub extern fn fpathconf(__fd: c_int, __name: c_int) c_long;
pub extern fn sysconf(__name: c_int) c_long;
pub extern fn confstr(__name: c_int, __buf: [*c]u8, __len: usize) usize;
pub extern fn getpid() __pid_t;
pub extern fn getppid() __pid_t;
pub extern fn getpgrp() __pid_t;
pub extern fn __getpgid(__pid: __pid_t) __pid_t;
pub extern fn getpgid(__pid: __pid_t) __pid_t;
pub extern fn setpgid(__pid: __pid_t, __pgid: __pid_t) c_int;
pub extern fn setpgrp() c_int;
pub extern fn setsid() __pid_t;
pub extern fn getsid(__pid: __pid_t) __pid_t;
pub extern fn getuid() __uid_t;
pub extern fn geteuid() __uid_t;
pub extern fn getgid() __gid_t;
pub extern fn getegid() __gid_t;
pub extern fn getgroups(__size: c_int, __list: [*c]__gid_t) c_int;
pub extern fn group_member(__gid: __gid_t) c_int;
pub extern fn setuid(__uid: __uid_t) c_int;
pub extern fn setreuid(__ruid: __uid_t, __euid: __uid_t) c_int;
pub extern fn seteuid(__uid: __uid_t) c_int;
pub extern fn setgid(__gid: __gid_t) c_int;
pub extern fn setregid(__rgid: __gid_t, __egid: __gid_t) c_int;
pub extern fn setegid(__gid: __gid_t) c_int;
pub extern fn getresuid(__ruid: [*c]__uid_t, __euid: [*c]__uid_t, __suid: [*c]__uid_t) c_int;
pub extern fn getresgid(__rgid: [*c]__gid_t, __egid: [*c]__gid_t, __sgid: [*c]__gid_t) c_int;
pub extern fn setresuid(__ruid: __uid_t, __euid: __uid_t, __suid: __uid_t) c_int;
pub extern fn setresgid(__rgid: __gid_t, __egid: __gid_t, __sgid: __gid_t) c_int;
pub extern fn fork() __pid_t;
pub extern fn vfork() c_int;
pub extern fn _Fork() __pid_t;
pub extern fn ttyname(__fd: c_int) [*c]u8;
pub extern fn ttyname_r(__fd: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn isatty(__fd: c_int) c_int;
pub extern fn ttyslot() c_int;
pub extern fn link(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn linkat(__fromfd: c_int, __from: [*c]const u8, __tofd: c_int, __to: [*c]const u8, __flags: c_int) c_int;
pub extern fn symlink(__from: [*c]const u8, __to: [*c]const u8) c_int;
pub extern fn readlink(noalias __path: [*c]const u8, noalias __buf: [*c]u8, __len: usize) isize;
pub extern fn symlinkat(__from: [*c]const u8, __tofd: c_int, __to: [*c]const u8) c_int;
pub extern fn readlinkat(__fd: c_int, noalias __path: [*c]const u8, noalias __buf: [*c]u8, __len: usize) isize;
pub extern fn unlink(__name: [*c]const u8) c_int;
pub extern fn unlinkat(__fd: c_int, __name: [*c]const u8, __flag: c_int) c_int;
pub extern fn rmdir(__path: [*c]const u8) c_int;
pub extern fn tcgetpgrp(__fd: c_int) __pid_t;
pub extern fn tcsetpgrp(__fd: c_int, __pgrp_id: __pid_t) c_int;
pub extern fn getlogin() [*c]u8;
pub extern fn getlogin_r(__name: [*c]u8, __name_len: usize) c_int;
pub extern fn setlogin(__name: [*c]const u8) c_int;
pub extern var optarg: [*c]u8;
pub extern var optind: c_int;
pub extern var opterr: c_int;
pub extern var optopt: c_int;
pub extern fn getopt(___argc: c_int, ___argv: [*c]const [*c]u8, __shortopts: [*c]const u8) c_int;
pub extern fn gethostname(__name: [*c]u8, __len: usize) c_int;
pub extern fn sethostname(__name: [*c]const u8, __len: usize) c_int;
pub extern fn sethostid(__id: c_long) c_int;
pub extern fn getdomainname(__name: [*c]u8, __len: usize) c_int;
pub extern fn setdomainname(__name: [*c]const u8, __len: usize) c_int;
pub extern fn vhangup() c_int;
pub extern fn revoke(__file: [*c]const u8) c_int;
pub extern fn profil(__sample_buffer: [*c]c_ushort, __size: usize, __offset: usize, __scale: c_uint) c_int;
pub extern fn acct(__name: [*c]const u8) c_int;
pub extern fn getusershell() [*c]u8;
pub extern fn endusershell() void;
pub extern fn setusershell() void;
pub extern fn daemon(__nochdir: c_int, __noclose: c_int) c_int;
pub extern fn chroot(__path: [*c]const u8) c_int;
pub extern fn getpass(__prompt: [*c]const u8) [*c]u8;
pub extern fn fsync(__fd: c_int) c_int;
pub extern fn syncfs(__fd: c_int) c_int;
pub extern fn gethostid() c_long;
pub extern fn sync() void;
pub extern fn getpagesize() c_int;
pub extern fn getdtablesize() c_int;
pub extern fn truncate(__file: [*c]const u8, __length: __off_t) c_int;
pub extern fn truncate64(__file: [*c]const u8, __length: __off64_t) c_int;
pub extern fn ftruncate(__fd: c_int, __length: __off_t) c_int;
pub extern fn ftruncate64(__fd: c_int, __length: __off64_t) c_int;
pub extern fn brk(__addr: ?*anyopaque) c_int;
pub extern fn sbrk(__delta: isize) ?*anyopaque;
pub extern fn syscall(__sysno: c_long, ...) c_long;
pub extern fn copy_file_range(__infd: c_int, __pinoff: [*c]__off64_t, __outfd: c_int, __poutoff: [*c]__off64_t, __length: usize, __flags: c_uint) isize;
pub extern fn fdatasync(__fildes: c_int) c_int;
pub extern fn crypt(__key: [*c]const u8, __salt: [*c]const u8) [*c]u8;
pub extern fn swab(noalias __from: ?*const anyopaque, noalias __to: ?*anyopaque, __n: isize) void;
pub extern fn getentropy(__buffer: ?*anyopaque, __length: usize) c_int;
pub extern fn close_range(__fd: c_uint, __max_fd: c_uint, __flags: c_int) c_int;
pub extern fn gettid() __pid_t;
pub const sig_atomic_t = __sig_atomic_t;
const struct_unnamed_41 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
};
const struct_unnamed_42 = extern struct {
    si_tid: c_int = @import("std").mem.zeroes(c_int),
    si_overrun: c_int = @import("std").mem.zeroes(c_int),
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_43 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    si_sigval: __sigval_t = @import("std").mem.zeroes(__sigval_t),
};
const struct_unnamed_44 = extern struct {
    si_pid: __pid_t = @import("std").mem.zeroes(__pid_t),
    si_uid: __uid_t = @import("std").mem.zeroes(__uid_t),
    si_status: c_int = @import("std").mem.zeroes(c_int),
    si_utime: __clock_t = @import("std").mem.zeroes(__clock_t),
    si_stime: __clock_t = @import("std").mem.zeroes(__clock_t),
};
const struct_unnamed_47 = extern struct {
    _lower: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _upper: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
const union_unnamed_46 = extern union {
    _addr_bnd: struct_unnamed_47,
    _pkey: __uint32_t,
};
const struct_unnamed_45 = extern struct {
    si_addr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    si_addr_lsb: c_short = @import("std").mem.zeroes(c_short),
    _bounds: union_unnamed_46 = @import("std").mem.zeroes(union_unnamed_46),
};
const struct_unnamed_48 = extern struct {
    si_band: c_long = @import("std").mem.zeroes(c_long),
    si_fd: c_int = @import("std").mem.zeroes(c_int),
};
const struct_unnamed_49 = extern struct {
    _call_addr: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _syscall: c_int = @import("std").mem.zeroes(c_int),
    _arch: c_uint = @import("std").mem.zeroes(c_uint),
};
const union_unnamed_40 = extern union {
    _pad: [28]c_int,
    _kill: struct_unnamed_41,
    _timer: struct_unnamed_42,
    _rt: struct_unnamed_43,
    _sigchld: struct_unnamed_44,
    _sigfault: struct_unnamed_45,
    _sigpoll: struct_unnamed_48,
    _sigsys: struct_unnamed_49,
};
pub const siginfo_t = extern struct {
    si_signo: c_int = @import("std").mem.zeroes(c_int),
    si_errno: c_int = @import("std").mem.zeroes(c_int),
    si_code: c_int = @import("std").mem.zeroes(c_int),
    __pad0: c_int = @import("std").mem.zeroes(c_int),
    _sifields: union_unnamed_40 = @import("std").mem.zeroes(union_unnamed_40),
};
pub const SI_ASYNCNL: c_int = -60;
pub const SI_DETHREAD: c_int = -7;
pub const SI_TKILL: c_int = -6;
pub const SI_SIGIO: c_int = -5;
pub const SI_ASYNCIO: c_int = -4;
pub const SI_MESGQ: c_int = -3;
pub const SI_TIMER: c_int = -2;
pub const SI_QUEUE: c_int = -1;
pub const SI_USER: c_int = 0;
pub const SI_KERNEL: c_int = 128;
const enum_unnamed_50 = c_int;
pub const ILL_ILLOPC: c_int = 1;
pub const ILL_ILLOPN: c_int = 2;
pub const ILL_ILLADR: c_int = 3;
pub const ILL_ILLTRP: c_int = 4;
pub const ILL_PRVOPC: c_int = 5;
pub const ILL_PRVREG: c_int = 6;
pub const ILL_COPROC: c_int = 7;
pub const ILL_BADSTK: c_int = 8;
pub const ILL_BADIADDR: c_int = 9;
const enum_unnamed_51 = c_uint;
pub const FPE_INTDIV: c_int = 1;
pub const FPE_INTOVF: c_int = 2;
pub const FPE_FLTDIV: c_int = 3;
pub const FPE_FLTOVF: c_int = 4;
pub const FPE_FLTUND: c_int = 5;
pub const FPE_FLTRES: c_int = 6;
pub const FPE_FLTINV: c_int = 7;
pub const FPE_FLTSUB: c_int = 8;
pub const FPE_FLTUNK: c_int = 14;
pub const FPE_CONDTRAP: c_int = 15;
const enum_unnamed_52 = c_uint;
pub const SEGV_MAPERR: c_int = 1;
pub const SEGV_ACCERR: c_int = 2;
pub const SEGV_BNDERR: c_int = 3;
pub const SEGV_PKUERR: c_int = 4;
pub const SEGV_ACCADI: c_int = 5;
pub const SEGV_ADIDERR: c_int = 6;
pub const SEGV_ADIPERR: c_int = 7;
pub const SEGV_MTEAERR: c_int = 8;
pub const SEGV_MTESERR: c_int = 9;
pub const SEGV_CPERR: c_int = 10;
const enum_unnamed_53 = c_uint;
pub const BUS_ADRALN: c_int = 1;
pub const BUS_ADRERR: c_int = 2;
pub const BUS_OBJERR: c_int = 3;
pub const BUS_MCEERR_AR: c_int = 4;
pub const BUS_MCEERR_AO: c_int = 5;
const enum_unnamed_54 = c_uint;
pub const TRAP_BRKPT: c_int = 1;
pub const TRAP_TRACE: c_int = 2;
pub const TRAP_BRANCH: c_int = 3;
pub const TRAP_HWBKPT: c_int = 4;
pub const TRAP_UNK: c_int = 5;
const enum_unnamed_55 = c_uint;
pub const CLD_EXITED: c_int = 1;
pub const CLD_KILLED: c_int = 2;
pub const CLD_DUMPED: c_int = 3;
pub const CLD_TRAPPED: c_int = 4;
pub const CLD_STOPPED: c_int = 5;
pub const CLD_CONTINUED: c_int = 6;
const enum_unnamed_56 = c_uint;
pub const POLL_IN: c_int = 1;
pub const POLL_OUT: c_int = 2;
pub const POLL_MSG: c_int = 3;
pub const POLL_ERR: c_int = 4;
pub const POLL_PRI: c_int = 5;
pub const POLL_HUP: c_int = 6;
const enum_unnamed_57 = c_uint;
pub const sigval_t = __sigval_t;
pub const SIGEV_SIGNAL: c_int = 0;
pub const SIGEV_NONE: c_int = 1;
pub const SIGEV_THREAD: c_int = 2;
pub const SIGEV_THREAD_ID: c_int = 4;
const enum_unnamed_58 = c_uint;
pub const __sighandler_t = ?*const fn (c_int) callconv(.c) void;
pub extern fn __sysv_signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn sysv_signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn kill(__pid: __pid_t, __sig: c_int) c_int;
pub extern fn killpg(__pgrp: __pid_t, __sig: c_int) c_int;
pub extern fn raise(__sig: c_int) c_int;
pub extern fn ssignal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn gsignal(__sig: c_int) c_int;
pub extern fn psignal(__sig: c_int, __s: [*c]const u8) void;
pub extern fn psiginfo(__pinfo: [*c]const siginfo_t, __s: [*c]const u8) void;
pub extern fn sigpause(__sig: c_int) c_int;
pub extern fn sigblock(__mask: c_int) c_int;
pub extern fn sigsetmask(__mask: c_int) c_int;
pub extern fn siggetmask() c_int;
pub const sighandler_t = __sighandler_t;
pub const sig_t = __sighandler_t;
pub extern fn sigemptyset(__set: [*c]sigset_t) c_int;
pub extern fn sigfillset(__set: [*c]sigset_t) c_int;
pub extern fn sigaddset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigdelset(__set: [*c]sigset_t, __signo: c_int) c_int;
pub extern fn sigismember(__set: [*c]const sigset_t, __signo: c_int) c_int;
pub extern fn sigisemptyset(__set: [*c]const sigset_t) c_int;
pub extern fn sigandset(__set: [*c]sigset_t, __left: [*c]const sigset_t, __right: [*c]const sigset_t) c_int;
pub extern fn sigorset(__set: [*c]sigset_t, __left: [*c]const sigset_t, __right: [*c]const sigset_t) c_int;
const union_unnamed_59 = extern union {
    sa_handler: __sighandler_t,
    sa_sigaction: ?*const fn (c_int, [*c]siginfo_t, ?*anyopaque) callconv(.c) void,
};
pub const struct_sigaction = extern struct {
    __sigaction_handler: union_unnamed_59 = @import("std").mem.zeroes(union_unnamed_59),
    sa_mask: __sigset_t = @import("std").mem.zeroes(__sigset_t),
    sa_flags: c_int = @import("std").mem.zeroes(c_int),
    sa_restorer: ?*const fn () callconv(.c) void = @import("std").mem.zeroes(?*const fn () callconv(.c) void),
};
pub extern fn sigprocmask(__how: c_int, noalias __set: [*c]const sigset_t, noalias __oset: [*c]sigset_t) c_int;
pub extern fn sigsuspend(__set: [*c]const sigset_t) c_int;
pub extern fn sigaction(__sig: c_int, noalias __act: [*c]const struct_sigaction, noalias __oact: [*c]struct_sigaction) c_int;
pub extern fn sigpending(__set: [*c]sigset_t) c_int;
pub extern fn sigwait(noalias __set: [*c]const sigset_t, noalias __sig: [*c]c_int) c_int;
pub extern fn sigwaitinfo(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t) c_int;
pub extern fn sigtimedwait(noalias __set: [*c]const sigset_t, noalias __info: [*c]siginfo_t, noalias __timeout: [*c]const struct_timespec) c_int;
pub extern fn sigqueue(__pid: __pid_t, __sig: c_int, __val: union_sigval) c_int;
pub const struct__fpx_sw_bytes = extern struct {
    magic1: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    extended_size: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    xstate_bv: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    xstate_size: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    __glibc_reserved1: [7]__uint32_t = @import("std").mem.zeroes([7]__uint32_t),
};
pub const struct__fpreg = extern struct {
    significand: [4]c_ushort = @import("std").mem.zeroes([4]c_ushort),
    exponent: c_ushort = @import("std").mem.zeroes(c_ushort),
};
pub const struct__fpxreg = extern struct {
    significand: [4]c_ushort = @import("std").mem.zeroes([4]c_ushort),
    exponent: c_ushort = @import("std").mem.zeroes(c_ushort),
    __glibc_reserved1: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
};
pub const struct__xmmreg = extern struct {
    element: [4]__uint32_t = @import("std").mem.zeroes([4]__uint32_t),
};
pub const struct__fpstate = extern struct {
    cwd: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    swd: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    ftw: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    fop: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    rip: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rdp: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    mxcsr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    mxcr_mask: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    _st: [8]struct__fpxreg = @import("std").mem.zeroes([8]struct__fpxreg),
    _xmm: [16]struct__xmmreg = @import("std").mem.zeroes([16]struct__xmmreg),
    __glibc_reserved1: [24]__uint32_t = @import("std").mem.zeroes([24]__uint32_t),
};
const union_unnamed_60 = extern union {
    fpstate: [*c]struct__fpstate,
    __fpstate_word: __uint64_t,
};
pub const struct_sigcontext = extern struct {
    r8: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    r9: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    r10: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    r11: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    r12: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    r13: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    r14: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    r15: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rdi: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rsi: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rbp: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rbx: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rdx: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rax: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rcx: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rsp: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rip: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    eflags: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    cs: c_ushort = @import("std").mem.zeroes(c_ushort),
    gs: c_ushort = @import("std").mem.zeroes(c_ushort),
    fs: c_ushort = @import("std").mem.zeroes(c_ushort),
    __pad0: c_ushort = @import("std").mem.zeroes(c_ushort),
    err: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    trapno: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    oldmask: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    cr2: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    unnamed_0: union_unnamed_60 = @import("std").mem.zeroes(union_unnamed_60),
    __reserved1: [8]__uint64_t = @import("std").mem.zeroes([8]__uint64_t),
};
pub const struct__xsave_hdr = extern struct {
    xstate_bv: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    __glibc_reserved1: [2]__uint64_t = @import("std").mem.zeroes([2]__uint64_t),
    __glibc_reserved2: [5]__uint64_t = @import("std").mem.zeroes([5]__uint64_t),
};
pub const struct__ymmh_state = extern struct {
    ymmh_space: [64]__uint32_t = @import("std").mem.zeroes([64]__uint32_t),
};
pub const struct__xstate = extern struct {
    fpstate: struct__fpstate = @import("std").mem.zeroes(struct__fpstate),
    xstate_hdr: struct__xsave_hdr = @import("std").mem.zeroes(struct__xsave_hdr),
    ymmh: struct__ymmh_state = @import("std").mem.zeroes(struct__ymmh_state),
};
pub extern fn sigreturn(__scp: [*c]struct_sigcontext) c_int;
pub const stack_t = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_flags: c_int = @import("std").mem.zeroes(c_int),
    ss_size: usize = @import("std").mem.zeroes(usize),
};
pub const greg_t = c_longlong;
pub const gregset_t = [23]greg_t;
pub const REG_R8: c_int = 0;
pub const REG_R9: c_int = 1;
pub const REG_R10: c_int = 2;
pub const REG_R11: c_int = 3;
pub const REG_R12: c_int = 4;
pub const REG_R13: c_int = 5;
pub const REG_R14: c_int = 6;
pub const REG_R15: c_int = 7;
pub const REG_RDI: c_int = 8;
pub const REG_RSI: c_int = 9;
pub const REG_RBP: c_int = 10;
pub const REG_RBX: c_int = 11;
pub const REG_RDX: c_int = 12;
pub const REG_RAX: c_int = 13;
pub const REG_RCX: c_int = 14;
pub const REG_RSP: c_int = 15;
pub const REG_RIP: c_int = 16;
pub const REG_EFL: c_int = 17;
pub const REG_CSGSFS: c_int = 18;
pub const REG_ERR: c_int = 19;
pub const REG_TRAPNO: c_int = 20;
pub const REG_OLDMASK: c_int = 21;
pub const REG_CR2: c_int = 22;
const enum_unnamed_61 = c_uint;
pub const struct__libc_fpxreg = extern struct {
    significand: [4]c_ushort = @import("std").mem.zeroes([4]c_ushort),
    exponent: c_ushort = @import("std").mem.zeroes(c_ushort),
    __glibc_reserved1: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
};
pub const struct__libc_xmmreg = extern struct {
    element: [4]__uint32_t = @import("std").mem.zeroes([4]__uint32_t),
};
pub const struct__libc_fpstate = extern struct {
    cwd: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    swd: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    ftw: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    fop: __uint16_t = @import("std").mem.zeroes(__uint16_t),
    rip: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    rdp: __uint64_t = @import("std").mem.zeroes(__uint64_t),
    mxcsr: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    mxcr_mask: __uint32_t = @import("std").mem.zeroes(__uint32_t),
    _st: [8]struct__libc_fpxreg = @import("std").mem.zeroes([8]struct__libc_fpxreg),
    _xmm: [16]struct__libc_xmmreg = @import("std").mem.zeroes([16]struct__libc_xmmreg),
    __glibc_reserved1: [24]__uint32_t = @import("std").mem.zeroes([24]__uint32_t),
};
pub const fpregset_t = [*c]struct__libc_fpstate;
pub const mcontext_t = extern struct {
    gregs: gregset_t = @import("std").mem.zeroes(gregset_t),
    fpregs: fpregset_t = @import("std").mem.zeroes(fpregset_t),
    __reserved1: [8]c_ulonglong = @import("std").mem.zeroes([8]c_ulonglong),
};
pub const struct_ucontext_t = extern struct {
    uc_flags: c_ulong = @import("std").mem.zeroes(c_ulong),
    uc_link: [*c]struct_ucontext_t = @import("std").mem.zeroes([*c]struct_ucontext_t),
    uc_stack: stack_t = @import("std").mem.zeroes(stack_t),
    uc_mcontext: mcontext_t = @import("std").mem.zeroes(mcontext_t),
    uc_sigmask: sigset_t = @import("std").mem.zeroes(sigset_t),
    __fpregs_mem: struct__libc_fpstate = @import("std").mem.zeroes(struct__libc_fpstate),
    __ssp: [4]c_ulonglong = @import("std").mem.zeroes([4]c_ulonglong),
};
pub const ucontext_t = struct_ucontext_t;
pub extern fn siginterrupt(__sig: c_int, __interrupt: c_int) c_int;
pub const SS_ONSTACK: c_int = 1;
pub const SS_DISABLE: c_int = 2;
const enum_unnamed_62 = c_uint;
pub extern fn sigaltstack(noalias __ss: [*c]const stack_t, noalias __oss: [*c]stack_t) c_int;
pub const struct_sigstack = extern struct {
    ss_sp: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ss_onstack: c_int = @import("std").mem.zeroes(c_int),
};
pub extern fn sigstack(__ss: [*c]struct_sigstack, __oss: [*c]struct_sigstack) c_int;
pub extern fn sighold(__sig: c_int) c_int;
pub extern fn sigrelse(__sig: c_int) c_int;
pub extern fn sigignore(__sig: c_int) c_int;
pub extern fn sigset(__sig: c_int, __disp: __sighandler_t) __sighandler_t;
pub extern fn pthread_sigmask(__how: c_int, noalias __newmask: [*c]const __sigset_t, noalias __oldmask: [*c]__sigset_t) c_int;
pub extern fn pthread_kill(__threadid: pthread_t, __signo: c_int) c_int;
pub extern fn pthread_sigqueue(__threadid: pthread_t, __signo: c_int, __value: union_sigval) c_int;
pub extern fn __libc_current_sigrtmin() c_int;
pub extern fn __libc_current_sigrtmax() c_int;
pub extern fn tgkill(__tgid: __pid_t, __tid: __pid_t, __signal: c_int) c_int;
pub const P_ALL: c_int = 0;
pub const P_PID: c_int = 1;
pub const P_PGID: c_int = 2;
pub const P_PIDFD: c_int = 3;
pub const idtype_t = c_uint;
pub extern fn wait(__stat_loc: [*c]c_int) __pid_t;
pub extern fn waitpid(__pid: __pid_t, __stat_loc: [*c]c_int, __options: c_int) __pid_t;
pub extern fn waitid(__idtype: idtype_t, __id: __id_t, __infop: [*c]siginfo_t, __options: c_int) c_int;
pub const struct_rusage = opaque {};
pub extern fn wait3(__stat_loc: [*c]c_int, __options: c_int, __usage: ?*struct_rusage) __pid_t;
pub extern fn wait4(__pid: __pid_t, __stat_loc: [*c]c_int, __options: c_int, __usage: ?*struct_rusage) __pid_t;
pub extern fn __errno_location() [*c]c_int;
pub extern var program_invocation_name: [*c]u8;
pub extern var program_invocation_short_name: [*c]u8;
pub const error_t = c_int;
pub extern fn memcpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn memmove(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn memccpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn memset(__s: ?*anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn memcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: c_ulong) c_int;
pub extern fn __memcmpeq(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: usize) c_int;
pub extern fn memchr(__s: ?*const anyopaque, __c: c_int, __n: c_ulong) ?*anyopaque;
pub extern fn rawmemchr(__s: ?*const anyopaque, __c: c_int) ?*anyopaque;
pub extern fn memrchr(__s: ?*const anyopaque, __c: c_int, __n: usize) ?*anyopaque;
pub extern fn strcpy(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strncpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strcat(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn strncat(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strcmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strcoll(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strxfrm(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strcoll_l(__s1: [*c]const u8, __s2: [*c]const u8, __l: locale_t) c_int;
pub extern fn strxfrm_l(__dest: [*c]u8, __src: [*c]const u8, __n: usize, __l: locale_t) usize;
pub extern fn strdup(__s: [*c]const u8) [*c]u8;
pub extern fn strndup(__string: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strrchr(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strchrnul(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn strcspn(__s: [*c]const u8, __reject: [*c]const u8) c_ulong;
pub extern fn strspn(__s: [*c]const u8, __accept: [*c]const u8) c_ulong;
pub extern fn strpbrk(__s: [*c]const u8, __accept: [*c]const u8) [*c]u8;
pub extern fn strstr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn strtok(__s: [*c]u8, __delim: [*c]const u8) [*c]u8;
pub extern fn __strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strtok_r(noalias __s: [*c]u8, noalias __delim: [*c]const u8, noalias __save_ptr: [*c][*c]u8) [*c]u8;
pub extern fn strcasestr(__haystack: [*c]const u8, __needle: [*c]const u8) [*c]u8;
pub extern fn memmem(__haystack: ?*const anyopaque, __haystacklen: usize, __needle: ?*const anyopaque, __needlelen: usize) ?*anyopaque;
pub extern fn __mempcpy(noalias __dest: ?*anyopaque, noalias __src: ?*const anyopaque, __n: usize) ?*anyopaque;
pub extern fn mempcpy(__dest: ?*anyopaque, __src: ?*const anyopaque, __n: c_ulong) ?*anyopaque;
pub extern fn strlen(__s: [*c]const u8) c_ulong;
pub extern fn strnlen(__string: [*c]const u8, __maxlen: usize) usize;
pub extern fn strerror(__errnum: c_int) [*c]u8;
pub extern fn strerror_r(__errnum: c_int, __buf: [*c]u8, __buflen: usize) [*c]u8;
pub extern fn strerrordesc_np(__err: c_int) [*c]const u8;
pub extern fn strerrorname_np(__err: c_int) [*c]const u8;
pub extern fn strerror_l(__errnum: c_int, __l: locale_t) [*c]u8;
pub extern fn bcmp(__s1: ?*const anyopaque, __s2: ?*const anyopaque, __n: c_ulong) c_int;
pub extern fn bcopy(__src: ?*const anyopaque, __dest: ?*anyopaque, __n: c_ulong) void;
pub extern fn bzero(__s: ?*anyopaque, __n: c_ulong) void;
pub extern fn index(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn rindex(__s: [*c]const u8, __c: c_int) [*c]u8;
pub extern fn ffs(__i: c_int) c_int;
pub extern fn ffsl(__l: c_long) c_int;
pub extern fn ffsll(__ll: c_longlong) c_int;
pub extern fn strcasecmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strncasecmp(__s1: [*c]const u8, __s2: [*c]const u8, __n: c_ulong) c_int;
pub extern fn strcasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __loc: locale_t) c_int;
pub extern fn strncasecmp_l(__s1: [*c]const u8, __s2: [*c]const u8, __n: usize, __loc: locale_t) c_int;
pub extern fn explicit_bzero(__s: ?*anyopaque, __n: usize) void;
pub extern fn strsep(noalias __stringp: [*c][*c]u8, noalias __delim: [*c]const u8) [*c]u8;
pub extern fn strsignal(__sig: c_int) [*c]u8;
pub extern fn sigabbrev_np(__sig: c_int) [*c]const u8;
pub extern fn sigdescr_np(__sig: c_int) [*c]const u8;
pub extern fn __stpcpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8) [*c]u8;
pub extern fn stpcpy(__dest: [*c]u8, __src: [*c]const u8) [*c]u8;
pub extern fn __stpncpy(noalias __dest: [*c]u8, noalias __src: [*c]const u8, __n: usize) [*c]u8;
pub extern fn stpncpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) [*c]u8;
pub extern fn strlcpy(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strlcat(__dest: [*c]u8, __src: [*c]const u8, __n: c_ulong) c_ulong;
pub extern fn strverscmp(__s1: [*c]const u8, __s2: [*c]const u8) c_int;
pub extern fn strfry(__string: [*c]u8) [*c]u8;
pub extern fn memfrob(__s: ?*anyopaque, __n: usize) ?*anyopaque;
pub extern fn basename(__filename: [*c]const u8) [*c]u8;
pub extern fn inet_addr(__cp: [*c]const u8) in_addr_t;
pub extern fn inet_lnaof(__in: struct_in_addr) in_addr_t;
pub extern fn inet_makeaddr(__net: in_addr_t, __host: in_addr_t) struct_in_addr;
pub extern fn inet_netof(__in: struct_in_addr) in_addr_t;
pub extern fn inet_network(__cp: [*c]const u8) in_addr_t;
pub extern fn inet_ntoa(__in: struct_in_addr) [*c]u8;
pub extern fn inet_pton(__af: c_int, noalias __cp: [*c]const u8, noalias __buf: ?*anyopaque) c_int;
pub extern fn inet_ntop(__af: c_int, noalias __cp: ?*const anyopaque, noalias __buf: [*c]u8, __len: socklen_t) [*c]const u8;
pub extern fn inet_aton(__cp: [*c]const u8, __inp: [*c]struct_in_addr) c_int;
pub extern fn inet_neta(__net: in_addr_t, __buf: [*c]u8, __len: usize) [*c]u8;
pub extern fn inet_net_ntop(__af: c_int, __cp: ?*const anyopaque, __bits: c_int, __buf: [*c]u8, __len: usize) [*c]u8;
pub extern fn inet_net_pton(__af: c_int, __cp: [*c]const u8, __buf: ?*anyopaque, __len: usize) c_int;
pub extern fn inet_nsap_addr(__cp: [*c]const u8, __buf: [*c]u8, __len: c_int) c_uint;
pub extern fn inet_nsap_ntoa(__len: c_int, __cp: [*c]const u8, __buf: [*c]u8) [*c]u8;
pub const nfds_t = c_ulong;
pub const struct_pollfd = extern struct {
    fd: c_int = @import("std").mem.zeroes(c_int),
    events: c_short = @import("std").mem.zeroes(c_short),
    revents: c_short = @import("std").mem.zeroes(c_short),
};
pub extern fn poll(__fds: [*c]struct_pollfd, __nfds: nfds_t, __timeout: c_int) c_int;
pub extern fn ppoll(__fds: [*c]struct_pollfd, __nfds: nfds_t, __timeout: [*c]const struct_timespec, __ss: [*c]const __sigset_t) c_int;
pub const natsThread = pthread_t;
pub const natsThreadLocal = pthread_key_t;
pub const natsMutex = pthread_mutex_t;
pub const natsCondition = pthread_cond_t;
pub const natsInitOnceType = pthread_once_t;
pub const natsSockLen = socklen_t;
pub const natsRecvLen = usize;
pub const NATS_CONN_STATUS_DISCONNECTED: c_int = 0;
pub const NATS_CONN_STATUS_CONNECTING: c_int = 1;
pub const NATS_CONN_STATUS_CONNECTED: c_int = 2;
pub const NATS_CONN_STATUS_CLOSED: c_int = 3;
pub const NATS_CONN_STATUS_RECONNECTING: c_int = 4;
pub const NATS_CONN_STATUS_DRAINING_SUBS: c_int = 5;
pub const NATS_CONN_STATUS_DRAINING_PUBS: c_int = 6;
pub const natsConnStatus = c_uint;
pub const NATS_OK: c_int = 0;
pub const NATS_ERR: c_int = 1;
pub const NATS_PROTOCOL_ERROR: c_int = 2;
pub const NATS_IO_ERROR: c_int = 3;
pub const NATS_LINE_TOO_LONG: c_int = 4;
pub const NATS_CONNECTION_CLOSED: c_int = 5;
pub const NATS_NO_SERVER: c_int = 6;
pub const NATS_STALE_CONNECTION: c_int = 7;
pub const NATS_SECURE_CONNECTION_WANTED: c_int = 8;
pub const NATS_SECURE_CONNECTION_REQUIRED: c_int = 9;
pub const NATS_CONNECTION_DISCONNECTED: c_int = 10;
pub const NATS_CONNECTION_AUTH_FAILED: c_int = 11;
pub const NATS_NOT_PERMITTED: c_int = 12;
pub const NATS_NOT_FOUND: c_int = 13;
pub const NATS_ADDRESS_MISSING: c_int = 14;
pub const NATS_INVALID_SUBJECT: c_int = 15;
pub const NATS_INVALID_ARG: c_int = 16;
pub const NATS_INVALID_SUBSCRIPTION: c_int = 17;
pub const NATS_INVALID_TIMEOUT: c_int = 18;
pub const NATS_ILLEGAL_STATE: c_int = 19;
pub const NATS_SLOW_CONSUMER: c_int = 20;
pub const NATS_MAX_PAYLOAD: c_int = 21;
pub const NATS_MAX_DELIVERED_MSGS: c_int = 22;
pub const NATS_INSUFFICIENT_BUFFER: c_int = 23;
pub const NATS_NO_MEMORY: c_int = 24;
pub const NATS_SYS_ERROR: c_int = 25;
pub const NATS_TIMEOUT: c_int = 26;
pub const NATS_FAILED_TO_INITIALIZE: c_int = 27;
pub const NATS_NOT_INITIALIZED: c_int = 28;
pub const NATS_SSL_ERROR: c_int = 29;
pub const NATS_NO_SERVER_SUPPORT: c_int = 30;
pub const NATS_NOT_YET_CONNECTED: c_int = 31;
pub const NATS_DRAINING: c_int = 32;
pub const NATS_INVALID_QUEUE_NAME: c_int = 33;
pub const NATS_NO_RESPONDERS: c_int = 34;
pub const NATS_MISMATCH: c_int = 35;
pub const NATS_MISSED_HEARTBEAT: c_int = 36;
pub const NATS_LIMIT_REACHED: c_int = 37;
pub const natsStatus = c_uint;
pub const JSAccountResourcesExceededErr: c_int = 10002;
pub const JSBadRequestErr: c_int = 10003;
pub const JSClusterIncompleteErr: c_int = 10004;
pub const JSClusterNoPeersErr: c_int = 10005;
pub const JSClusterNotActiveErr: c_int = 10006;
pub const JSClusterNotAssignedErr: c_int = 10007;
pub const JSClusterNotAvailErr: c_int = 10008;
pub const JSClusterNotLeaderErr: c_int = 10009;
pub const JSClusterRequiredErr: c_int = 10010;
pub const JSClusterTagsErr: c_int = 10011;
pub const JSConsumerCreateErr: c_int = 10012;
pub const JSConsumerNameExistErr: c_int = 10013;
pub const JSConsumerNotFoundErr: c_int = 10014;
pub const JSSnapshotDeliverSubjectInvalidErr: c_int = 10015;
pub const JSConsumerDurableNameNotInSubjectErr: c_int = 10016;
pub const JSConsumerDurableNameNotMatchSubjectErr: c_int = 10017;
pub const JSConsumerDurableNameNotSetErr: c_int = 10018;
pub const JSConsumerEphemeralWithDurableInSubjectErr: c_int = 10019;
pub const JSConsumerEphemeralWithDurableNameErr: c_int = 10020;
pub const JSStreamExternalApiOverlapErr: c_int = 10021;
pub const JSStreamExternalDelPrefixOverlapsErr: c_int = 10022;
pub const JSInsufficientResourcesErr: c_int = 10023;
pub const JSStreamInvalidExternalDeliverySubjErr: c_int = 10024;
pub const JSInvalidJSONErr: c_int = 10025;
pub const JSMaximumConsumersLimitErr: c_int = 10026;
pub const JSMaximumStreamsLimitErr: c_int = 10027;
pub const JSMemoryResourcesExceededErr: c_int = 10028;
pub const JSMirrorConsumerSetupFailedErr: c_int = 10029;
pub const JSMirrorMaxMessageSizeTooBigErr: c_int = 10030;
pub const JSMirrorWithSourcesErr: c_int = 10031;
pub const JSMirrorWithStartSeqAndTimeErr: c_int = 10032;
pub const JSMirrorWithSubjectFiltersErr: c_int = 10033;
pub const JSMirrorWithSubjectsErr: c_int = 10034;
pub const JSNoAccountErr: c_int = 10035;
pub const JSClusterUnSupportFeatureErr: c_int = 10036;
pub const JSNoMessageFoundErr: c_int = 10037;
pub const JSNotEmptyRequestErr: c_int = 10038;
pub const JSNotEnabledForAccountErr: c_int = 10039;
pub const JSClusterPeerNotMemberErr: c_int = 10040;
pub const JSRaftGeneralErr: c_int = 10041;
pub const JSRestoreSubscribeFailedErr: c_int = 10042;
pub const JSSequenceNotFoundErr: c_int = 10043;
pub const JSClusterServerNotMemberErr: c_int = 10044;
pub const JSSourceConsumerSetupFailedErr: c_int = 10045;
pub const JSSourceMaxMessageSizeTooBigErr: c_int = 10046;
pub const JSStorageResourcesExceededErr: c_int = 10047;
pub const JSStreamAssignmentErr: c_int = 10048;
pub const JSStreamCreateErr: c_int = 10049;
pub const JSStreamDeleteErr: c_int = 10050;
pub const JSStreamGeneralError: c_int = 10051;
pub const JSStreamInvalidConfig: c_int = 10052;
pub const JSStreamLimitsErr: c_int = 10053;
pub const JSStreamMessageExceedsMaximumErr: c_int = 10054;
pub const JSStreamMirrorNotUpdatableErr: c_int = 10055;
pub const JSStreamMismatchErr: c_int = 10056;
pub const JSStreamMsgDeleteFailed: c_int = 10057;
pub const JSStreamNameExistErr: c_int = 10058;
pub const JSStreamNotFoundErr: c_int = 10059;
pub const JSStreamNotMatchErr: c_int = 10060;
pub const JSStreamReplicasNotUpdatableErr: c_int = 10061;
pub const JSStreamRestoreErr: c_int = 10062;
pub const JSStreamSequenceNotMatchErr: c_int = 10063;
pub const JSStreamSnapshotErr: c_int = 10064;
pub const JSStreamSubjectOverlapErr: c_int = 10065;
pub const JSStreamTemplateCreateErr: c_int = 10066;
pub const JSStreamTemplateDeleteErr: c_int = 10067;
pub const JSStreamTemplateNotFoundErr: c_int = 10068;
pub const JSStreamUpdateErr: c_int = 10069;
pub const JSStreamWrongLastMsgIDErr: c_int = 10070;
pub const JSStreamWrongLastSequenceErr: c_int = 10071;
pub const JSTempStorageFailedErr: c_int = 10072;
pub const JSTemplateNameNotMatchSubjectErr: c_int = 10073;
pub const JSStreamReplicasNotSupportedErr: c_int = 10074;
pub const JSPeerRemapErr: c_int = 10075;
pub const JSNotEnabledErr: c_int = 10076;
pub const JSStreamStoreFailedErr: c_int = 10077;
pub const JSConsumerConfigRequiredErr: c_int = 10078;
pub const JSConsumerDeliverToWildcardsErr: c_int = 10079;
pub const JSConsumerPushMaxWaitingErr: c_int = 10080;
pub const JSConsumerDeliverCycleErr: c_int = 10081;
pub const JSConsumerMaxPendingAckPolicyRequiredErr: c_int = 10082;
pub const JSConsumerSmallHeartbeatErr: c_int = 10083;
pub const JSConsumerPullRequiresAckErr: c_int = 10084;
pub const JSConsumerPullNotDurableErr: c_int = 10085;
pub const JSConsumerPullWithRateLimitErr: c_int = 10086;
pub const JSConsumerMaxWaitingNegativeErr: c_int = 10087;
pub const JSConsumerHBRequiresPushErr: c_int = 10088;
pub const JSConsumerFCRequiresPushErr: c_int = 10089;
pub const JSConsumerDirectRequiresPushErr: c_int = 10090;
pub const JSConsumerDirectRequiresEphemeralErr: c_int = 10091;
pub const JSConsumerOnMappedErr: c_int = 10092;
pub const JSConsumerFilterNotSubsetErr: c_int = 10093;
pub const JSConsumerInvalidPolicyErr: c_int = 10094;
pub const JSConsumerInvalidSamplingErr: c_int = 10095;
pub const JSStreamInvalidErr: c_int = 10096;
pub const JSConsumerWQRequiresExplicitAckErr: c_int = 10098;
pub const JSConsumerWQMultipleUnfilteredErr: c_int = 10099;
pub const JSConsumerWQConsumerNotUniqueErr: c_int = 10100;
pub const JSConsumerWQConsumerNotDeliverAllErr: c_int = 10101;
pub const JSConsumerNameTooLongErr: c_int = 10102;
pub const JSConsumerBadDurableNameErr: c_int = 10103;
pub const JSConsumerStoreFailedErr: c_int = 10104;
pub const JSConsumerExistingActiveErr: c_int = 10105;
pub const JSConsumerReplacementWithDifferentNameErr: c_int = 10106;
pub const JSConsumerDescriptionTooLongErr: c_int = 10107;
pub const JSConsumerWithFlowControlNeedsHeartbeatsErr: c_int = 10108;
pub const JSStreamSealedErr: c_int = 10109;
pub const JSStreamPurgeFailedErr: c_int = 10110;
pub const JSStreamRollupFailedErr: c_int = 10111;
pub const JSConsumerInvalidDeliverSubjectErr: c_int = 10112;
pub const JSStreamMaxBytesRequiredErr: c_int = 10113;
pub const JSConsumerMaxRequestBatchNegativeErr: c_int = 10114;
pub const JSConsumerMaxRequestExpiresToSmallErr: c_int = 10115;
pub const JSConsumerMaxDeliverBackoffErr: c_int = 10116;
pub const JSStreamInfoMaxSubjectsErr: c_int = 10117;
pub const JSStreamOfflineErr: c_int = 10118;
pub const JSConsumerOfflineErr: c_int = 10119;
pub const JSNoLimitsErr: c_int = 10120;
pub const JSConsumerMaxPendingAckExcessErr: c_int = 10121;
pub const JSStreamMaxStreamBytesExceededErr: c_int = 10122;
pub const JSStreamMoveAndScaleErr: c_int = 10123;
pub const JSStreamMoveInProgressErr: c_int = 10124;
pub const JSConsumerMaxRequestBatchExceededErr: c_int = 10125;
pub const JSConsumerReplicasExceedsStreamErr: c_int = 10126;
pub const JSConsumerNameContainsPathSeparatorsErr: c_int = 10127;
pub const JSStreamNameContainsPathSeparatorsErr: c_int = 10128;
pub const JSStreamMoveNotInProgressErr: c_int = 10129;
pub const JSStreamNameExistRestoreFailedErr: c_int = 10130;
pub const JSConsumerCreateFilterSubjectMismatchErr: c_int = 10131;
pub const JSConsumerCreateDurableAndNameMismatchErr: c_int = 10132;
pub const JSReplicasCountCannotBeNegativeErr: c_int = 10133;
pub const jsErrCode = c_uint;
pub const wchar_t = c_int;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub const div_t = extern struct {
    quot: c_int = @import("std").mem.zeroes(c_int),
    rem: c_int = @import("std").mem.zeroes(c_int),
};
pub const ldiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub const lldiv_t = extern struct {
    quot: c_longlong = @import("std").mem.zeroes(c_longlong),
    rem: c_longlong = @import("std").mem.zeroes(c_longlong),
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub extern fn atof(__nptr: [*c]const u8) f64;
pub extern fn atoi(__nptr: [*c]const u8) c_int;
pub extern fn atol(__nptr: [*c]const u8) c_long;
pub extern fn atoll(__nptr: [*c]const u8) c_longlong;
pub extern fn strtod(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f64;
pub extern fn strtof(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f32;
pub extern fn strtold(__nptr: [*c]const u8, __endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtof32(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float32;
pub extern fn strtof64(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float64;
pub extern fn strtof32x(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float32x;
pub extern fn strtof64x(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8) _Float64x;
pub extern fn strtol(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strtoll(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strfromd(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: f64) c_int;
pub extern fn strfromf(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: f32) c_int;
pub extern fn strfroml(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: c_longdouble) c_int;
pub extern fn strfromf32(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float32) c_int;
pub extern fn strfromf64(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float64) c_int;
pub extern fn strfromf32x(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float32x) c_int;
pub extern fn strfromf64x(__dest: [*c]u8, __size: usize, __format: [*c]const u8, __f: _Float64x) c_int;
pub extern fn strtol_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_long;
pub extern fn strtoul_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_ulong;
pub extern fn strtoll_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_longlong;
pub extern fn strtoull_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int, __loc: locale_t) c_ulonglong;
pub extern fn strtod_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) f64;
pub extern fn strtof_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) f32;
pub extern fn strtold_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) c_longdouble;
pub extern fn strtof32_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float32;
pub extern fn strtof64_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float64;
pub extern fn strtof32x_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float32x;
pub extern fn strtof64x_l(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __loc: locale_t) _Float64x;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    state: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rand_type: c_int = @import("std").mem.zeroes(c_int),
    rand_deg: c_int = @import("std").mem.zeroes(c_int),
    rand_sep: c_int = @import("std").mem.zeroes(c_int),
    end_ptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __old_x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __c: c_ushort = @import("std").mem.zeroes(c_ushort),
    __init: c_ushort = @import("std").mem.zeroes(c_ushort),
    __a: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn arc4random() __uint32_t;
pub extern fn arc4random_buf(__buf: ?*anyopaque, __size: usize) void;
pub extern fn arc4random_uniform(__upper_bound: __uint32_t) __uint32_t;
pub extern fn malloc(__size: c_ulong) ?*anyopaque;
pub extern fn calloc(__nmemb: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: c_ulong) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn reallocarray(__ptr: ?*anyopaque, __nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn alloca(__size: c_ulong) ?*anyopaque;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn at_quick_exit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn on_exit(__func: ?*const fn (c_int, ?*anyopaque) callconv(.c) void, __arg: ?*anyopaque) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn secure_getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemp64(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkstemps64(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn mkostemp(__template: [*c]u8, __flags: c_int) c_int;
pub extern fn mkostemp64(__template: [*c]u8, __flags: c_int) c_int;
pub extern fn mkostemps(__template: [*c]u8, __suffixlen: c_int, __flags: c_int) c_int;
pub extern fn mkostemps64(__template: [*c]u8, __suffixlen: c_int, __flags: c_int) c_int;
pub extern fn system(__command: [*c]const u8) c_int;
pub extern fn canonicalize_file_name(__name: [*c]const u8) [*c]u8;
pub extern fn realpath(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub const comparison_fn_t = __compar_fn_t;
pub const __compar_d_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque, ?*anyopaque) callconv(.c) c_int;
pub extern fn bsearch(__key: ?*const anyopaque, __base: ?*const anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) ?*anyopaque;
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn qsort_r(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_d_fn_t, __arg: ?*anyopaque) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub extern fn wctomb(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn mbstowcs(noalias __pwcs: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) usize;
pub extern fn wcstombs(noalias __s: [*c]u8, noalias __pwcs: [*c]const wchar_t, __n: usize) usize;
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c][*c]u8, noalias __tokens: [*c]const [*c]u8, noalias __valuep: [*c][*c]u8) c_int;
pub extern fn posix_openpt(__oflag: c_int) c_int;
pub extern fn grantpt(__fd: c_int) c_int;
pub extern fn unlockpt(__fd: c_int) c_int;
pub extern fn ptsname(__fd: c_int) [*c]u8;
pub extern fn ptsname_r(__fd: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn getpt() c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub const __gwchar_t = c_int;
pub const imaxdiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub extern fn imaxabs(__n: intmax_t) intmax_t;
pub extern fn imaxdiv(__numer: intmax_t, __denom: intmax_t) imaxdiv_t;
pub extern fn strtoimax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) intmax_t;
pub extern fn strtoumax(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) uintmax_t;
pub extern fn wcstoimax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) intmax_t;
pub extern fn wcstoumax(noalias __nptr: [*c]const __gwchar_t, noalias __endptr: [*c][*c]__gwchar_t, __base: c_int) uintmax_t;
pub const struct___va_list_tag_63 = extern struct {
    gp_offset: c_uint = @import("std").mem.zeroes(c_uint),
    fp_offset: c_uint = @import("std").mem.zeroes(c_uint),
    overflow_arg_area: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reg_save_area: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const __builtin_va_list = [1]struct___va_list_tag_63;
pub const __gnuc_va_list = __builtin_va_list;
const union_unnamed_64 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int = @import("std").mem.zeroes(c_int),
    __value: union_unnamed_64 = @import("std").mem.zeroes(union_unnamed_64),
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t = @import("std").mem.zeroes(__off_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t = @import("std").mem.zeroes(__off64_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = opaque {};
pub const _IO_lock_t = anyopaque;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const struct__IO_FILE = extern struct {
    _flags: c_int = @import("std").mem.zeroes(c_int),
    _IO_read_ptr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_read_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_read_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_ptr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_buf_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_buf_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_save_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_backup_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_save_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _markers: ?*struct__IO_marker = @import("std").mem.zeroes(?*struct__IO_marker),
    _chain: [*c]struct__IO_FILE = @import("std").mem.zeroes([*c]struct__IO_FILE),
    _fileno: c_int = @import("std").mem.zeroes(c_int),
    _flags2: c_int = @import("std").mem.zeroes(c_int),
    _old_offset: __off_t = @import("std").mem.zeroes(__off_t),
    _cur_column: c_ushort = @import("std").mem.zeroes(c_ushort),
    _vtable_offset: i8 = @import("std").mem.zeroes(i8),
    _shortbuf: [1]u8 = @import("std").mem.zeroes([1]u8),
    _lock: ?*_IO_lock_t = @import("std").mem.zeroes(?*_IO_lock_t),
    _offset: __off64_t = @import("std").mem.zeroes(__off64_t),
    _codecvt: ?*struct__IO_codecvt = @import("std").mem.zeroes(?*struct__IO_codecvt),
    _wide_data: ?*struct__IO_wide_data = @import("std").mem.zeroes(?*struct__IO_wide_data),
    _freeres_list: [*c]struct__IO_FILE = @import("std").mem.zeroes([*c]struct__IO_FILE),
    _freeres_buf: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    _prevchain: [*c][*c]struct__IO_FILE = @import("std").mem.zeroes([*c][*c]struct__IO_FILE),
    _mode: c_int = @import("std").mem.zeroes(c_int),
    _unused2: [20]u8 = @import("std").mem.zeroes([20]u8),
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const cookie_read_function_t = fn (?*anyopaque, [*c]u8, usize) callconv(.c) __ssize_t;
pub const cookie_write_function_t = fn (?*anyopaque, [*c]const u8, usize) callconv(.c) __ssize_t;
pub const cookie_seek_function_t = fn (?*anyopaque, [*c]__off64_t, c_int) callconv(.c) c_int;
pub const cookie_close_function_t = fn (?*anyopaque) callconv(.c) c_int;
pub const struct__IO_cookie_io_functions_t = extern struct {
    read: ?*const cookie_read_function_t = @import("std").mem.zeroes(?*const cookie_read_function_t),
    write: ?*const cookie_write_function_t = @import("std").mem.zeroes(?*const cookie_write_function_t),
    seek: ?*const cookie_seek_function_t = @import("std").mem.zeroes(?*const cookie_seek_function_t),
    close: ?*const cookie_close_function_t = @import("std").mem.zeroes(?*const cookie_close_function_t),
};
pub const cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const va_list = __gnuc_va_list;
pub const fpos_t = __fpos_t;
pub const fpos64_t = __fpos64_t;
pub extern var stdin: [*c]FILE;
pub extern var stdout: [*c]FILE;
pub extern var stderr: [*c]FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn renameat2(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8, __flags: c_uint) c_int;
pub extern fn fclose(__stream: [*c]FILE) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpfile64() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: [*c]FILE) c_int;
pub extern fn fflush_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fcloseall() c_int;
pub extern fn fopen(__filename: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fopen64(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen64(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) [*c]FILE;
pub extern fn fopencookie(noalias __magic_cookie: ?*anyopaque, noalias __modes: [*c]const u8, __io_funcs: cookie_io_functions_t) [*c]FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) [*c]FILE;
pub extern fn setbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: [*c]FILE) void;
pub extern fn fprintf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn printf(__format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfprintf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn vprintf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn vsprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn snprintf(noalias __s: [*c]u8, __maxlen: c_ulong, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vsnprintf(noalias __s: [*c]u8, __maxlen: c_ulong, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn vasprintf(noalias __ptr: [*c][*c]u8, noalias __f: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn __asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn vdprintf(__fd: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub extern fn vfscanf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_63) c_int;
pub extern fn fgetc(__stream: [*c]FILE) c_int;
pub extern fn getc(__stream: [*c]FILE) c_int;
pub extern fn getchar() c_int;
pub extern fn getc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn getchar_unlocked() c_int;
pub extern fn fgetc_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fputc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar(__c: c_int) c_int;
pub extern fn fputc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc_unlocked(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putchar_unlocked(__c: c_int) c_int;
pub extern fn getw(__stream: [*c]FILE) c_int;
pub extern fn putw(__w: c_int, __stream: [*c]FILE) c_int;
pub extern fn fgets(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn fgets_unlocked(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn fread(__ptr: ?*anyopaque, __size: c_ulong, __n: c_ulong, __stream: [*c]FILE) c_ulong;
pub extern fn fwrite(__ptr: ?*const anyopaque, __size: c_ulong, __n: c_ulong, __s: [*c]FILE) c_ulong;
pub extern fn fputs_unlocked(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn fread_unlocked(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fseek(__stream: [*c]FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: [*c]FILE) c_long;
pub extern fn rewind(__stream: [*c]FILE) void;
pub extern fn fseeko(__stream: [*c]FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) __off_t;
pub extern fn fgetpos(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: [*c]FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn fseeko64(__stream: [*c]FILE, __off: __off64_t, __whence: c_int) c_int;
pub extern fn ftello64(__stream: [*c]FILE) __off64_t;
pub extern fn fgetpos64(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos64_t) c_int;
pub extern fn fsetpos64(__stream: [*c]FILE, __pos: [*c]const fpos64_t) c_int;
pub extern fn clearerr(__stream: [*c]FILE) void;
pub extern fn feof(__stream: [*c]FILE) c_int;
pub extern fn ferror(__stream: [*c]FILE) c_int;
pub extern fn clearerr_unlocked(__stream: [*c]FILE) void;
pub extern fn feof_unlocked(__stream: [*c]FILE) c_int;
pub extern fn ferror_unlocked(__stream: [*c]FILE) c_int;
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: [*c]FILE) c_int;
pub extern fn fileno_unlocked(__stream: [*c]FILE) c_int;
pub extern fn pclose(__stream: [*c]FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn cuserid(__s: [*c]u8) [*c]u8;
pub const struct_obstack = opaque {};
pub extern fn obstack_printf(noalias __obstack: ?*struct_obstack, noalias __format: [*c]const u8, ...) c_int;
pub extern fn obstack_vprintf(noalias __obstack: ?*struct_obstack, noalias __format: [*c]const u8, __args: [*c]struct___va_list_tag_63) c_int;
pub extern fn flockfile(__stream: [*c]FILE) void;
pub extern fn ftrylockfile(__stream: [*c]FILE) c_int;
pub extern fn funlockfile(__stream: [*c]FILE) void;
pub extern fn __uflow([*c]FILE) c_int;
pub extern fn __overflow([*c]FILE, c_int) c_int;
pub const natsSock = c_int;
pub const natsTokenHandler = ?*const fn (?*anyopaque) callconv(.c) [*c]const u8;
pub const natsConnection = struct___natsConnection;
pub const natsConnectionHandler = ?*const fn ([*c]natsConnection, ?*anyopaque) callconv(.c) void;
pub const nats_FreeObjectCb = ?*const fn (?*anyopaque) callconv(.c) void;
pub const struct___natsGCItem = extern struct {
    next: [*c]struct___natsGCItem = @import("std").mem.zeroes([*c]struct___natsGCItem),
    freeCb: nats_FreeObjectCb = @import("std").mem.zeroes(nats_FreeObjectCb),
};
pub const natsGCItem = struct___natsGCItem;
pub const struct___natsStrHashEntry = extern struct {
    hk: u32 = @import("std").mem.zeroes(u32),
    key: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    freeKey: bool = @import("std").mem.zeroes(bool),
    data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    next: [*c]struct___natsStrHashEntry = @import("std").mem.zeroes([*c]struct___natsStrHashEntry),
};
pub const natsStrHashEntry = struct___natsStrHashEntry;
pub const struct___natsStrHash = extern struct {
    bkts: [*c][*c]natsStrHashEntry = @import("std").mem.zeroes([*c][*c]natsStrHashEntry),
    numBkts: c_int = @import("std").mem.zeroes(c_int),
    mask: c_int = @import("std").mem.zeroes(c_int),
    used: c_int = @import("std").mem.zeroes(c_int),
    canResize: bool = @import("std").mem.zeroes(bool),
};
pub const natsStrHash = struct___natsStrHash;
pub const struct___natsMsg = extern struct {
    gc: natsGCItem = @import("std").mem.zeroes(natsGCItem),
    subject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    reply: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    hdr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    headers: [*c]natsStrHash = @import("std").mem.zeroes([*c]natsStrHash),
    data: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    dataLen: c_int = @import("std").mem.zeroes(c_int),
    hdrLen: c_int = @import("std").mem.zeroes(c_int),
    wsz: c_int = @import("std").mem.zeroes(c_int),
    flags: c_int = @import("std").mem.zeroes(c_int),
    seq: u64 = @import("std").mem.zeroes(u64),
    time: i64 = @import("std").mem.zeroes(i64),
    sub: [*c]struct___natsSubscription = @import("std").mem.zeroes([*c]struct___natsSubscription),
    next: [*c]struct___natsMsg = @import("std").mem.zeroes([*c]struct___natsMsg),
};
pub const natsMsg = struct___natsMsg;
pub const struct___natsDispatchQueue_s = extern struct {
    head: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    tail: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    msgs: c_int = @import("std").mem.zeroes(c_int),
    bytes: c_int = @import("std").mem.zeroes(c_int),
};
pub const natsDispatchQueue = struct___natsDispatchQueue_s;
pub const struct___natsDispatcher_s = extern struct {
    ownedBy: [*c]natsSubscription = @import("std").mem.zeroes([*c]natsSubscription),
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    thread: [*c]natsThread = @import("std").mem.zeroes([*c]natsThread),
    cond: [*c]natsCondition = @import("std").mem.zeroes([*c]natsCondition),
    queue: natsDispatchQueue = @import("std").mem.zeroes(natsDispatchQueue),
    running: bool = @import("std").mem.zeroes(bool),
    shutdown: bool = @import("std").mem.zeroes(bool),
};
pub const natsDispatcher = struct___natsDispatcher_s;
const struct_unnamed_65 = extern struct {
    timeout: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    close: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    drain: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
};
const struct_unnamed_66 = extern struct {
    expired: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    missedHeartbeat: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
};
pub const struct___natsSubscriptionControlMessages = extern struct {
    sub: struct_unnamed_65 = @import("std").mem.zeroes(struct_unnamed_65),
    fetch: struct_unnamed_66 = @import("std").mem.zeroes(struct_unnamed_66),
};
pub const natsSubscriptionControlMessages = struct___natsSubscriptionControlMessages;
pub const natsMsgHandler = ?*const fn ([*c]natsConnection, [*c]natsSubscription, [*c]natsMsg, ?*anyopaque) callconv(.c) void;
pub const natsTimerCb = ?*const fn ([*c]struct___natsTimer, ?*anyopaque) callconv(.c) void;
pub const natsTimerStopCb = ?*const fn ([*c]struct___natsTimer, ?*anyopaque) callconv(.c) void;
pub const struct___natsTimer = extern struct {
    prev: [*c]struct___natsTimer = @import("std").mem.zeroes([*c]struct___natsTimer),
    next: [*c]struct___natsTimer = @import("std").mem.zeroes([*c]struct___natsTimer),
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    refs: c_int = @import("std").mem.zeroes(c_int),
    cb: natsTimerCb = @import("std").mem.zeroes(natsTimerCb),
    stopCb: natsTimerStopCb = @import("std").mem.zeroes(natsTimerStopCb),
    closure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    interval: i64 = @import("std").mem.zeroes(i64),
    absoluteTime: i64 = @import("std").mem.zeroes(i64),
    stopped: bool = @import("std").mem.zeroes(bool),
    inCallback: bool = @import("std").mem.zeroes(bool),
};
pub const natsTimer = struct___natsTimer;
pub const natsOnCompleteCB = ?*const fn (?*anyopaque) callconv(.c) void;
pub const struct_jsPubAck = extern struct {
    Stream: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Sequence: u64 = @import("std").mem.zeroes(u64),
    Domain: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Duplicate: bool = @import("std").mem.zeroes(bool),
};
pub const jsPubAck = struct_jsPubAck;
pub const struct_jsPubAckErr = extern struct {
    Msg: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    Err: natsStatus = @import("std").mem.zeroes(natsStatus),
    ErrCode: jsErrCode = @import("std").mem.zeroes(jsErrCode),
    ErrText: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const jsPubAckErr = struct_jsPubAckErr;
pub const jsPubAckHandler = ?*const fn ([*c]jsCtx, [*c]natsMsg, [*c]jsPubAck, [*c]jsPubAckErr, ?*anyopaque) callconv(.c) void;
pub const jsPubAckErrHandler = ?*const fn ([*c]jsCtx, [*c]jsPubAckErr, ?*anyopaque) callconv(.c) void;
pub const struct_jsOptionsPublishAsync_67 = extern struct {
    MaxPending: i64 = @import("std").mem.zeroes(i64),
    AckHandler: jsPubAckHandler = @import("std").mem.zeroes(jsPubAckHandler),
    AckHandlerClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ErrHandler: jsPubAckErrHandler = @import("std").mem.zeroes(jsPubAckErrHandler),
    ErrHandlerClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    StallWait: i64 = @import("std").mem.zeroes(i64),
};
pub const jsFetchCompleteHandler = ?*const fn ([*c]natsConnection, [*c]natsSubscription, natsStatus, ?*anyopaque) callconv(.c) void;
pub const jsFetchNextHandler = ?*const fn ([*c]c_int, [*c]i64, [*c]natsSubscription, ?*anyopaque) callconv(.c) bool;
pub const struct_jsOptionsPullSubscribeAsync_68 = extern struct {
    Timeout: i64 = @import("std").mem.zeroes(i64),
    MaxMessages: c_int = @import("std").mem.zeroes(c_int),
    MaxBytes: i64 = @import("std").mem.zeroes(i64),
    NoWait: bool = @import("std").mem.zeroes(bool),
    CompleteHandler: jsFetchCompleteHandler = @import("std").mem.zeroes(jsFetchCompleteHandler),
    CompleteHandlerClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    Heartbeat: i64 = @import("std").mem.zeroes(i64),
    FetchSize: c_int = @import("std").mem.zeroes(c_int),
    KeepAhead: c_int = @import("std").mem.zeroes(c_int),
    NextHandler: jsFetchNextHandler = @import("std").mem.zeroes(jsFetchNextHandler),
    NextHandlerClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const struct_jsOptionsStreamPurge_70 = extern struct {
    Subject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Sequence: u64 = @import("std").mem.zeroes(u64),
    Keep: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_jsOptionsStreamInfo_71 = extern struct {
    DeletedDetails: bool = @import("std").mem.zeroes(bool),
    SubjectsFilter: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const struct_jsOptionsStream_69 = extern struct {
    Purge: struct_jsOptionsStreamPurge_70 = @import("std").mem.zeroes(struct_jsOptionsStreamPurge_70),
    Info: struct_jsOptionsStreamInfo_71 = @import("std").mem.zeroes(struct_jsOptionsStreamInfo_71),
};
pub const struct_jsOptions = extern struct {
    Prefix: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Domain: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Wait: i64 = @import("std").mem.zeroes(i64),
    PublishAsync: struct_jsOptionsPublishAsync_67 = @import("std").mem.zeroes(struct_jsOptionsPublishAsync_67),
    PullSubscribeAsync: struct_jsOptionsPullSubscribeAsync_68 = @import("std").mem.zeroes(struct_jsOptionsPullSubscribeAsync_68),
    Stream: struct_jsOptionsStream_69 = @import("std").mem.zeroes(struct_jsOptionsStream_69),
};
pub const jsOptions = struct_jsOptions;
pub const struct___pmInfo = extern struct {
    subject: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    deadline: i64 = @import("std").mem.zeroes(i64),
    next: [*c]struct___pmInfo = @import("std").mem.zeroes([*c]struct___pmInfo),
};
pub const pmInfo = struct___pmInfo;
pub const struct___jsCtx = extern struct {
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    nc: [*c]natsConnection = @import("std").mem.zeroes([*c]natsConnection),
    opts: jsOptions = @import("std").mem.zeroes(jsOptions),
    refs: c_int = @import("std").mem.zeroes(c_int),
    cond: [*c]natsCondition = @import("std").mem.zeroes([*c]natsCondition),
    pm: [*c]natsStrHash = @import("std").mem.zeroes([*c]natsStrHash),
    pmtmr: [*c]natsTimer = @import("std").mem.zeroes([*c]natsTimer),
    pmHead: [*c]pmInfo = @import("std").mem.zeroes([*c]pmInfo),
    pmTail: [*c]pmInfo = @import("std").mem.zeroes([*c]pmInfo),
    rsub: [*c]natsSubscription = @import("std").mem.zeroes([*c]natsSubscription),
    rpre: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    rpreLen: c_int = @import("std").mem.zeroes(c_int),
    pacw: c_int = @import("std").mem.zeroes(c_int),
    pmcount: i64 = @import("std").mem.zeroes(i64),
    stalled: c_int = @import("std").mem.zeroes(c_int),
    closed: bool = @import("std").mem.zeroes(bool),
};
pub const jsCtx = struct___jsCtx;
pub const struct___jsFetch = extern struct {
    opts: struct_jsOptionsPullSubscribeAsync_68 = @import("std").mem.zeroes(struct_jsOptionsPullSubscribeAsync_68),
    status: natsStatus = @import("std").mem.zeroes(natsStatus),
    startTimeMillis: i64 = @import("std").mem.zeroes(i64),
    receivedMsgs: c_int = @import("std").mem.zeroes(c_int),
    receivedBytes: i64 = @import("std").mem.zeroes(i64),
    deliveredMsgs: c_int = @import("std").mem.zeroes(c_int),
    deliveredBytes: i64 = @import("std").mem.zeroes(i64),
    requestedMsgs: c_int = @import("std").mem.zeroes(c_int),
    expiresTimer: [*c]natsTimer = @import("std").mem.zeroes([*c]natsTimer),
    replySubject: [61]u8 = @import("std").mem.zeroes([61]u8),
};
pub const jsFetch = struct___jsFetch;
pub const struct_mismatch_72 = extern struct {
    sseq: u64 = @import("std").mem.zeroes(u64),
    dseq: u64 = @import("std").mem.zeroes(u64),
    ldseq: u64 = @import("std").mem.zeroes(u64),
};
pub const struct_natsMetadata = extern struct {
    List: [*c][*c]const u8 = @import("std").mem.zeroes([*c][*c]const u8),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const natsMetadata = struct_natsMetadata;
pub const struct_jsConsumerConfig = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Durable: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Description: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    DeliverPolicy: jsDeliverPolicy = @import("std").mem.zeroes(jsDeliverPolicy),
    OptStartSeq: u64 = @import("std").mem.zeroes(u64),
    OptStartTime: i64 = @import("std").mem.zeroes(i64),
    AckPolicy: jsAckPolicy = @import("std").mem.zeroes(jsAckPolicy),
    AckWait: i64 = @import("std").mem.zeroes(i64),
    MaxDeliver: i64 = @import("std").mem.zeroes(i64),
    BackOff: [*c]i64 = @import("std").mem.zeroes([*c]i64),
    BackOffLen: c_int = @import("std").mem.zeroes(c_int),
    FilterSubject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ReplayPolicy: jsReplayPolicy = @import("std").mem.zeroes(jsReplayPolicy),
    RateLimit: u64 = @import("std").mem.zeroes(u64),
    SampleFrequency: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    MaxWaiting: i64 = @import("std").mem.zeroes(i64),
    MaxAckPending: i64 = @import("std").mem.zeroes(i64),
    FlowControl: bool = @import("std").mem.zeroes(bool),
    Heartbeat: i64 = @import("std").mem.zeroes(i64),
    HeadersOnly: bool = @import("std").mem.zeroes(bool),
    MaxRequestBatch: i64 = @import("std").mem.zeroes(i64),
    MaxRequestExpires: i64 = @import("std").mem.zeroes(i64),
    MaxRequestMaxBytes: i64 = @import("std").mem.zeroes(i64),
    DeliverSubject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    DeliverGroup: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    InactiveThreshold: i64 = @import("std").mem.zeroes(i64),
    Replicas: i64 = @import("std").mem.zeroes(i64),
    MemoryStorage: bool = @import("std").mem.zeroes(bool),
    FilterSubjects: [*c][*c]const u8 = @import("std").mem.zeroes([*c][*c]const u8),
    FilterSubjectsLen: c_int = @import("std").mem.zeroes(c_int),
    Metadata: natsMetadata = @import("std").mem.zeroes(natsMetadata),
    PauseUntil: i64 = @import("std").mem.zeroes(i64),
};
pub const jsConsumerConfig = struct_jsConsumerConfig;
pub const struct___jsSub = extern struct {
    js: [*c]jsCtx = @import("std").mem.zeroes([*c]jsCtx),
    stream: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    consumer: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    psubj: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    nxtMsgSubj: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    pull: bool = @import("std").mem.zeroes(bool),
    inFetch: bool = @import("std").mem.zeroes(bool),
    ordered: bool = @import("std").mem.zeroes(bool),
    dc: bool = @import("std").mem.zeroes(bool),
    ackNone: bool = @import("std").mem.zeroes(bool),
    fetchID: u64 = @import("std").mem.zeroes(u64),
    fetch: [*c]jsFetch = @import("std").mem.zeroes([*c]jsFetch),
    pending: u64 = @import("std").mem.zeroes(u64),
    hbi: i64 = @import("std").mem.zeroes(i64),
    active: bool = @import("std").mem.zeroes(bool),
    hbTimer: [*c]natsTimer = @import("std").mem.zeroes([*c]natsTimer),
    cmeta: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    sseq: u64 = @import("std").mem.zeroes(u64),
    dseq: u64 = @import("std").mem.zeroes(u64),
    ssmn: bool = @import("std").mem.zeroes(bool),
    sm: bool = @import("std").mem.zeroes(bool),
    mismatch: struct_mismatch_72 = @import("std").mem.zeroes(struct_mismatch_72),
    usrCb: natsMsgHandler = @import("std").mem.zeroes(natsMsgHandler),
    usrCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    fcDelivered: u64 = @import("std").mem.zeroes(u64),
    fciseq: u64 = @import("std").mem.zeroes(u64),
    fcReply: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    ocCfg: [*c]jsConsumerConfig = @import("std").mem.zeroes([*c]jsConsumerConfig),
};
pub const jsSub = struct___jsSub;
pub const struct___natsSubscription = extern struct {
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    refs: c_int = @import("std").mem.zeroes(c_int),
    max: u64 = @import("std").mem.zeroes(u64),
    dispatcher: [*c]natsDispatcher = @import("std").mem.zeroes([*c]natsDispatcher),
    ownDispatcher: natsDispatcher = @import("std").mem.zeroes(natsDispatcher),
    control: [*c]natsSubscriptionControlMessages = @import("std").mem.zeroes([*c]natsSubscriptionControlMessages),
    delivered: u64 = @import("std").mem.zeroes(u64),
    slowConsumer: bool = @import("std").mem.zeroes(bool),
    closed: bool = @import("std").mem.zeroes(bool),
    draining: bool = @import("std").mem.zeroes(bool),
    drainState: u8 = @import("std").mem.zeroes(u8),
    drainThread: [*c]natsThread = @import("std").mem.zeroes([*c]natsThread),
    drainStatus: natsStatus = @import("std").mem.zeroes(natsStatus),
    drainTimeout: i64 = @import("std").mem.zeroes(i64),
    drainSkip: bool = @import("std").mem.zeroes(bool),
    drainCond: [*c]natsCondition = @import("std").mem.zeroes([*c]natsCondition),
    connClosed: bool = @import("std").mem.zeroes(bool),
    sid: i64 = @import("std").mem.zeroes(i64),
    subject: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    queue: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    conn: [*c]struct___natsConnection = @import("std").mem.zeroes([*c]struct___natsConnection),
    msgCb: natsMsgHandler = @import("std").mem.zeroes(natsMsgHandler),
    msgCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    timeout: i64 = @import("std").mem.zeroes(i64),
    timeoutTimer: [*c]natsTimer = @import("std").mem.zeroes([*c]natsTimer),
    timedOut: bool = @import("std").mem.zeroes(bool),
    timeoutSuspended: bool = @import("std").mem.zeroes(bool),
    msgsMax: c_int = @import("std").mem.zeroes(c_int),
    bytesMax: c_int = @import("std").mem.zeroes(c_int),
    msgsLimit: c_int = @import("std").mem.zeroes(c_int),
    bytesLimit: c_int = @import("std").mem.zeroes(c_int),
    dropped: i64 = @import("std").mem.zeroes(i64),
    onCompleteCB: natsOnCompleteCB = @import("std").mem.zeroes(natsOnCompleteCB),
    onCompleteCBClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    jsi: [*c]jsSub = @import("std").mem.zeroes([*c]jsSub),
};
pub const natsSubscription = struct___natsSubscription;
pub const natsErrHandler = ?*const fn ([*c]natsConnection, [*c]natsSubscription, natsStatus, ?*anyopaque) callconv(.c) void;
pub const struct___natsSSLCtx = extern struct {
    lock: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    refs: c_int = @import("std").mem.zeroes(c_int),
    ctx: [*c]?*anyopaque = @import("std").mem.zeroes([*c]?*anyopaque),
    expectedHostname: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    skipVerify: bool = @import("std").mem.zeroes(bool),
};
pub const natsSSLCtx = struct___natsSSLCtx;
pub const natsUserJWTHandler = ?*const fn ([*c][*c]u8, [*c][*c]u8, ?*anyopaque) callconv(.c) natsStatus;
pub const natsSignatureHandler = ?*const fn ([*c][*c]u8, [*c][*c]u8, [*c]c_int, [*c]const u8, ?*anyopaque) callconv(.c) natsStatus;
pub const struct___userCreds = extern struct {
    userOrChainedFile: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    seedFile: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    jwtAndSeedContent: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const natsCustomReconnectDelayHandler = ?*const fn ([*c]natsConnection, c_int, ?*anyopaque) callconv(.c) i64;
pub const struct___natsOptions = extern struct {
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    url: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    servers: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    serversCount: c_int = @import("std").mem.zeroes(c_int),
    noRandomize: bool = @import("std").mem.zeroes(bool),
    timeout: i64 = @import("std").mem.zeroes(i64),
    name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    verbose: bool = @import("std").mem.zeroes(bool),
    pedantic: bool = @import("std").mem.zeroes(bool),
    allowReconnect: bool = @import("std").mem.zeroes(bool),
    secure: bool = @import("std").mem.zeroes(bool),
    tlsHandshakeFirst: bool = @import("std").mem.zeroes(bool),
    ioBufSize: c_int = @import("std").mem.zeroes(c_int),
    maxReconnect: c_int = @import("std").mem.zeroes(c_int),
    reconnectWait: i64 = @import("std").mem.zeroes(i64),
    reconnectBufSize: c_int = @import("std").mem.zeroes(c_int),
    writeDeadline: i64 = @import("std").mem.zeroes(i64),
    user: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    password: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    token: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    tokenCb: natsTokenHandler = @import("std").mem.zeroes(natsTokenHandler),
    tokenCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    closedCb: natsConnectionHandler = @import("std").mem.zeroes(natsConnectionHandler),
    closedCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    disconnectedCb: natsConnectionHandler = @import("std").mem.zeroes(natsConnectionHandler),
    disconnectedCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reconnectedCb: natsConnectionHandler = @import("std").mem.zeroes(natsConnectionHandler),
    reconnectedCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    discoveredServersCb: natsConnectionHandler = @import("std").mem.zeroes(natsConnectionHandler),
    discoveredServersClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ignoreDiscoveredServers: bool = @import("std").mem.zeroes(bool),
    connectedCb: natsConnectionHandler = @import("std").mem.zeroes(natsConnectionHandler),
    connectedCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    lameDuckCb: natsConnectionHandler = @import("std").mem.zeroes(natsConnectionHandler),
    lameDuckClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    asyncErrCb: natsErrHandler = @import("std").mem.zeroes(natsErrHandler),
    asyncErrCbClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    microClosedCb: natsConnectionHandler = @import("std").mem.zeroes(natsConnectionHandler),
    microAsyncErrCb: natsErrHandler = @import("std").mem.zeroes(natsErrHandler),
    pingInterval: i64 = @import("std").mem.zeroes(i64),
    maxPingsOut: c_int = @import("std").mem.zeroes(c_int),
    maxPendingMsgs: c_int = @import("std").mem.zeroes(c_int),
    maxPendingBytes: i64 = @import("std").mem.zeroes(i64),
    sslCtx: [*c]natsSSLCtx = @import("std").mem.zeroes([*c]natsSSLCtx),
    evLoop: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    evCbs: natsEvLoopCallbacks = @import("std").mem.zeroes(natsEvLoopCallbacks),
    useSharedDispatcher: bool = @import("std").mem.zeroes(bool),
    useSharedReplyDispatcher: bool = @import("std").mem.zeroes(bool),
    orderIP: c_int = @import("std").mem.zeroes(c_int),
    useOldRequestStyle: bool = @import("std").mem.zeroes(bool),
    sendAsap: bool = @import("std").mem.zeroes(bool),
    failRequestsOnDisconnect: bool = @import("std").mem.zeroes(bool),
    noEcho: bool = @import("std").mem.zeroes(bool),
    retryOnFailedConnect: bool = @import("std").mem.zeroes(bool),
    userJWTHandler: natsUserJWTHandler = @import("std").mem.zeroes(natsUserJWTHandler),
    userJWTClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    sigHandler: natsSignatureHandler = @import("std").mem.zeroes(natsSignatureHandler),
    sigClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    nkey: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    userCreds: [*c]struct___userCreds = @import("std").mem.zeroes([*c]struct___userCreds),
    reconnectJitter: i64 = @import("std").mem.zeroes(i64),
    reconnectJitterTLS: i64 = @import("std").mem.zeroes(i64),
    customReconnectDelayCB: natsCustomReconnectDelayHandler = @import("std").mem.zeroes(natsCustomReconnectDelayHandler),
    customReconnectDelayCBClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    disableNoResponders: bool = @import("std").mem.zeroes(bool),
    inboxPfx: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    payloadPaddingSize: c_int = @import("std").mem.zeroes(c_int),
};
pub const natsOptions = struct___natsOptions;
pub const struct___natsUrl = extern struct {
    fullUrl: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    host: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    port: c_int = @import("std").mem.zeroes(c_int),
    username: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    password: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const natsUrl = struct___natsUrl;
pub const struct___natsSrv = extern struct {
    url: [*c]natsUrl = @import("std").mem.zeroes([*c]natsUrl),
    didConnect: bool = @import("std").mem.zeroes(bool),
    isImplicit: bool = @import("std").mem.zeroes(bool),
    reconnects: c_int = @import("std").mem.zeroes(c_int),
    tlsName: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    lastAuthErrCode: c_int = @import("std").mem.zeroes(c_int),
};
pub const natsSrv = struct___natsSrv;
pub const struct___natsDeadline = extern struct {
    absoluteTime: i64 = @import("std").mem.zeroes(i64),
    active: bool = @import("std").mem.zeroes(bool),
};
pub const natsDeadline = struct___natsDeadline;
pub const struct___natsSockCtx = extern struct {
    fd: natsSock = @import("std").mem.zeroes(natsSock),
    fdActive: bool = @import("std").mem.zeroes(bool),
    readDeadline: natsDeadline = @import("std").mem.zeroes(natsDeadline),
    writeDeadline: natsDeadline = @import("std").mem.zeroes(natsDeadline),
    ssl: [*c]?*anyopaque = @import("std").mem.zeroes([*c]?*anyopaque),
    useEventLoop: bool = @import("std").mem.zeroes(bool),
    orderIP: c_int = @import("std").mem.zeroes(c_int),
    noRandomize: bool = @import("std").mem.zeroes(bool),
};
pub const natsSockCtx = struct___natsSockCtx;
pub const struct___natsSrvPool = extern struct {
    srvrs: [*c][*c]natsSrv = @import("std").mem.zeroes([*c][*c]natsSrv),
    urls: [*c]natsStrHash = @import("std").mem.zeroes([*c]natsStrHash),
    size: c_int = @import("std").mem.zeroes(c_int),
    cap: c_int = @import("std").mem.zeroes(c_int),
    randomize: bool = @import("std").mem.zeroes(bool),
    user: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    pwd: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const natsSrvPool = struct___natsSrvPool;
pub const struct___natsBuffer = extern struct {
    data: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    pos: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    len: c_int = @import("std").mem.zeroes(c_int),
    capacity: c_int = @import("std").mem.zeroes(c_int),
    ownData: bool = @import("std").mem.zeroes(bool),
    doFree: bool = @import("std").mem.zeroes(bool),
};
pub const natsBuffer = struct___natsBuffer;
pub const struct___natsServerInfo = extern struct {
    id: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    host: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    port: c_int = @import("std").mem.zeroes(c_int),
    version: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    authRequired: bool = @import("std").mem.zeroes(bool),
    tlsRequired: bool = @import("std").mem.zeroes(bool),
    tlsAvailable: bool = @import("std").mem.zeroes(bool),
    maxPayload: i64 = @import("std").mem.zeroes(i64),
    connectURLs: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    connectURLsCount: c_int = @import("std").mem.zeroes(c_int),
    proto: c_int = @import("std").mem.zeroes(c_int),
    CID: u64 = @import("std").mem.zeroes(u64),
    nonce: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    clientIP: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    lameDuckMode: bool = @import("std").mem.zeroes(bool),
    headers: bool = @import("std").mem.zeroes(bool),
};
pub const natsServerInfo = struct___natsServerInfo;
pub const struct___natsHashEntry = extern struct {
    key: i64 = @import("std").mem.zeroes(i64),
    data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    next: [*c]struct___natsHashEntry = @import("std").mem.zeroes([*c]struct___natsHashEntry),
};
pub const natsHashEntry = struct___natsHashEntry;
pub const struct___natsHash = extern struct {
    bkts: [*c][*c]natsHashEntry = @import("std").mem.zeroes([*c][*c]natsHashEntry),
    numBkts: c_int = @import("std").mem.zeroes(c_int),
    mask: c_int = @import("std").mem.zeroes(c_int),
    used: c_int = @import("std").mem.zeroes(c_int),
    canResize: bool = @import("std").mem.zeroes(bool),
};
pub const natsHash = struct___natsHash;
pub const struct_micro_service_s = opaque {};
pub const microService = struct_micro_service_s;
pub const struct___natsMsgArg = extern struct {
    subjectRec: natsBuffer = @import("std").mem.zeroes(natsBuffer),
    subject: [*c]natsBuffer = @import("std").mem.zeroes([*c]natsBuffer),
    replyRec: natsBuffer = @import("std").mem.zeroes(natsBuffer),
    reply: [*c]natsBuffer = @import("std").mem.zeroes([*c]natsBuffer),
    sid: i64 = @import("std").mem.zeroes(i64),
    hdr: c_int = @import("std").mem.zeroes(c_int),
    size: c_int = @import("std").mem.zeroes(c_int),
};
pub const natsMsgArg = struct___natsMsgArg;
pub const struct___natsParser = extern struct {
    state: natsOp = @import("std").mem.zeroes(natsOp),
    afterSpace: c_int = @import("std").mem.zeroes(c_int),
    drop: c_int = @import("std").mem.zeroes(c_int),
    hdr: c_int = @import("std").mem.zeroes(c_int),
    ma: natsMsgArg = @import("std").mem.zeroes(natsMsgArg),
    argBufRec: natsBuffer = @import("std").mem.zeroes(natsBuffer),
    argBuf: [*c]natsBuffer = @import("std").mem.zeroes([*c]natsBuffer),
    msgBufRec: natsBuffer = @import("std").mem.zeroes(natsBuffer),
    msgBuf: [*c]natsBuffer = @import("std").mem.zeroes([*c]natsBuffer),
    scratch: [4096]u8 = @import("std").mem.zeroes([4096]u8),
};
pub const natsParser = struct___natsParser;
pub const struct___natsPong = extern struct {
    id: i64 = @import("std").mem.zeroes(i64),
    prev: [*c]struct___natsPong = @import("std").mem.zeroes([*c]struct___natsPong),
    next: [*c]struct___natsPong = @import("std").mem.zeroes([*c]struct___natsPong),
};
pub const natsPong = struct___natsPong;
pub const struct___natsPongList = extern struct {
    head: [*c]natsPong = @import("std").mem.zeroes([*c]natsPong),
    tail: [*c]natsPong = @import("std").mem.zeroes([*c]natsPong),
    incoming: i64 = @import("std").mem.zeroes(i64),
    outgoingPings: i64 = @import("std").mem.zeroes(i64),
    cached: natsPong = @import("std").mem.zeroes(natsPong),
    cond: [*c]natsCondition = @import("std").mem.zeroes([*c]natsCondition),
};
pub const natsPongList = struct___natsPongList;
pub const struct___natsStatistics = extern struct {
    inMsgs: u64 = @import("std").mem.zeroes(u64),
    outMsgs: u64 = @import("std").mem.zeroes(u64),
    inBytes: u64 = @import("std").mem.zeroes(u64),
    outBytes: u64 = @import("std").mem.zeroes(u64),
    reconnects: u64 = @import("std").mem.zeroes(u64),
};
pub const natsStatistics = struct___natsStatistics;
pub const struct___respInfo = extern struct {
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    cond: [*c]natsCondition = @import("std").mem.zeroes([*c]natsCondition),
    msg: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    closed: bool = @import("std").mem.zeroes(bool),
    closedSts: natsStatus = @import("std").mem.zeroes(natsStatus),
    removed: bool = @import("std").mem.zeroes(bool),
    pooled: bool = @import("std").mem.zeroes(bool),
};
pub const respInfo = struct___respInfo;
const struct_unnamed_73 = extern struct {
    attached: bool = @import("std").mem.zeroes(bool),
    writeAdded: bool = @import("std").mem.zeroes(bool),
    buffer: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    data: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const natsMsgFilter = ?*const fn ([*c]natsConnection, [*c][*c]natsMsg, ?*anyopaque) callconv(.c) void;
const struct_unnamed_74 = extern struct {
    ma: c_int = @import("std").mem.zeroes(c_int),
    mi: c_int = @import("std").mem.zeroes(c_int),
    up: c_int = @import("std").mem.zeroes(c_int),
};
pub const struct___natsConnection = extern struct {
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    opts: [*c]natsOptions = @import("std").mem.zeroes([*c]natsOptions),
    cur: [*c]natsSrv = @import("std").mem.zeroes([*c]natsSrv),
    tlsName: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    refs: c_int = @import("std").mem.zeroes(c_int),
    sockCtx: natsSockCtx = @import("std").mem.zeroes(natsSockCtx),
    srvPool: [*c]natsSrvPool = @import("std").mem.zeroes([*c]natsSrvPool),
    pending: [*c]natsBuffer = @import("std").mem.zeroes([*c]natsBuffer),
    usePending: bool = @import("std").mem.zeroes(bool),
    bw: [*c]natsBuffer = @import("std").mem.zeroes([*c]natsBuffer),
    scratch: [*c]natsBuffer = @import("std").mem.zeroes([*c]natsBuffer),
    info: natsServerInfo = @import("std").mem.zeroes(natsServerInfo),
    ssid: i64 = @import("std").mem.zeroes(i64),
    subs: [*c]natsHash = @import("std").mem.zeroes([*c]natsHash),
    subsMu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    services: [*c]?*microService = @import("std").mem.zeroes([*c]?*microService),
    numServices: c_int = @import("std").mem.zeroes(c_int),
    servicesMu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    status: natsConnStatus = @import("std").mem.zeroes(natsConnStatus),
    initc: bool = @import("std").mem.zeroes(bool),
    ar: bool = @import("std").mem.zeroes(bool),
    rle: bool = @import("std").mem.zeroes(bool),
    err: natsStatus = @import("std").mem.zeroes(natsStatus),
    errStr: [256]u8 = @import("std").mem.zeroes([256]u8),
    ps: [*c]natsParser = @import("std").mem.zeroes([*c]natsParser),
    ptmr: [*c]natsTimer = @import("std").mem.zeroes([*c]natsTimer),
    pout: c_int = @import("std").mem.zeroes(c_int),
    pongs: natsPongList = @import("std").mem.zeroes(natsPongList),
    readLoopThread: [*c]natsThread = @import("std").mem.zeroes([*c]natsThread),
    flusherThread: [*c]natsThread = @import("std").mem.zeroes([*c]natsThread),
    flusherCond: [*c]natsCondition = @import("std").mem.zeroes([*c]natsCondition),
    flusherSignaled: bool = @import("std").mem.zeroes(bool),
    flusherStop: bool = @import("std").mem.zeroes(bool),
    reconnectThread: [*c]natsThread = @import("std").mem.zeroes([*c]natsThread),
    inReconnect: c_int = @import("std").mem.zeroes(c_int),
    reconnectCond: [*c]natsCondition = @import("std").mem.zeroes([*c]natsCondition),
    stats: natsStatistics = @import("std").mem.zeroes(natsStatistics),
    drainThread: [*c]natsThread = @import("std").mem.zeroes([*c]natsThread),
    drainTimeout: i64 = @import("std").mem.zeroes(i64),
    dontSendInPlace: bool = @import("std").mem.zeroes(bool),
    stanOwned: bool = @import("std").mem.zeroes(bool),
    respId: [20]u8 = @import("std").mem.zeroes([20]u8),
    respIdPos: c_int = @import("std").mem.zeroes(c_int),
    respIdVal: u8 = @import("std").mem.zeroes(u8),
    respSub: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    respMux: [*c]natsSubscription = @import("std").mem.zeroes([*c]natsSubscription),
    respMap: [*c]natsStrHash = @import("std").mem.zeroes([*c]natsStrHash),
    respPool: [*c][*c]respInfo = @import("std").mem.zeroes([*c][*c]respInfo),
    respPoolSize: c_int = @import("std").mem.zeroes(c_int),
    respPoolIdx: c_int = @import("std").mem.zeroes(c_int),
    inboxPfx: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    inboxPfxLen: c_int = @import("std").mem.zeroes(c_int),
    reqIdOffset: c_int = @import("std").mem.zeroes(c_int),
    el: struct_unnamed_73 = @import("std").mem.zeroes(struct_unnamed_73),
    filter: natsMsgFilter = @import("std").mem.zeroes(natsMsgFilter),
    filterClosure: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    srvVersion: struct_unnamed_74 = @import("std").mem.zeroes(struct_unnamed_74),
};
pub const natsInbox = u8;
pub const struct___natsClientConfig = extern struct {
    DefaultWriteDeadline: i64 = @import("std").mem.zeroes(i64),
    LockSpinCount: i64 = @import("std").mem.zeroes(i64),
    DefaultToThreadPool: bool = @import("std").mem.zeroes(bool),
    ThreadPoolMax: c_int = @import("std").mem.zeroes(c_int),
    DefaultRepliesToThreadPool: bool = @import("std").mem.zeroes(bool),
    UseSeparatePoolForReplies: bool = @import("std").mem.zeroes(bool),
    ReplyThreadPoolMax: c_int = @import("std").mem.zeroes(c_int),
};
pub const natsClientConfig = struct___natsClientConfig;
pub const struct_natsMsgList = extern struct {
    Msgs: [*c][*c]natsMsg = @import("std").mem.zeroes([*c][*c]natsMsg),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const natsMsgList = struct_natsMsgList;
pub const struct_jsPubOptions = extern struct {
    MaxWait: i64 = @import("std").mem.zeroes(i64),
    MsgId: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ExpectStream: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ExpectLastMsgId: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ExpectLastSeq: u64 = @import("std").mem.zeroes(u64),
    ExpectLastSubjectSeq: u64 = @import("std").mem.zeroes(u64),
    ExpectNoMessage: bool = @import("std").mem.zeroes(bool),
};
pub const jsPubOptions = struct_jsPubOptions;
pub const js_LimitsPolicy: c_int = 0;
pub const js_InterestPolicy: c_int = 1;
pub const js_WorkQueuePolicy: c_int = 2;
pub const jsRetentionPolicy = c_uint;
pub const js_DiscardOld: c_int = 0;
pub const js_DiscardNew: c_int = 1;
pub const jsDiscardPolicy = c_uint;
pub const js_FileStorage: c_int = 0;
pub const js_MemoryStorage: c_int = 1;
pub const jsStorageType = c_uint;
pub const js_StorageCompressionNone: c_int = 0;
pub const js_StorageCompressionS2: c_int = 1;
pub const jsStorageCompression = c_uint;
pub const js_DeliverAll: c_int = 0;
pub const js_DeliverLast: c_int = 1;
pub const js_DeliverNew: c_int = 2;
pub const js_DeliverByStartSequence: c_int = 3;
pub const js_DeliverByStartTime: c_int = 4;
pub const js_DeliverLastPerSubject: c_int = 5;
pub const jsDeliverPolicy = c_uint;
pub const js_AckExplicit: c_int = 0;
pub const js_AckNone: c_int = 1;
pub const js_AckAll: c_int = 2;
pub const jsAckPolicy = c_uint;
pub const js_ReplayInstant: c_int = 0;
pub const js_ReplayOriginal: c_int = 1;
pub const jsReplayPolicy = c_uint;
pub const struct_jsPlacement = extern struct {
    Cluster: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Tags: [*c][*c]const u8 = @import("std").mem.zeroes([*c][*c]const u8),
    TagsLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsPlacement = struct_jsPlacement;
pub const struct_jsExternalStream = extern struct {
    APIPrefix: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    DeliverPrefix: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const jsExternalStream = struct_jsExternalStream;
pub const struct_jsStreamSource = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    OptStartSeq: u64 = @import("std").mem.zeroes(u64),
    OptStartTime: i64 = @import("std").mem.zeroes(i64),
    FilterSubject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    External: [*c]jsExternalStream = @import("std").mem.zeroes([*c]jsExternalStream),
    Domain: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const jsStreamSource = struct_jsStreamSource;
pub const struct_jsRePublish = extern struct {
    Source: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Destination: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    HeadersOnly: bool = @import("std").mem.zeroes(bool),
};
pub const jsRePublish = struct_jsRePublish;
pub const struct_jsSubjectTransformConfig = extern struct {
    Source: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Destination: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const jsSubjectTransformConfig = struct_jsSubjectTransformConfig;
pub const struct_jsStreamConsumerLimits = extern struct {
    InactiveThreshold: i64 = @import("std").mem.zeroes(i64),
    MaxAckPending: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsStreamConsumerLimits = struct_jsStreamConsumerLimits;
pub const struct_jsStreamConfig = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Description: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Subjects: [*c][*c]const u8 = @import("std").mem.zeroes([*c][*c]const u8),
    SubjectsLen: c_int = @import("std").mem.zeroes(c_int),
    Retention: jsRetentionPolicy = @import("std").mem.zeroes(jsRetentionPolicy),
    MaxConsumers: i64 = @import("std").mem.zeroes(i64),
    MaxMsgs: i64 = @import("std").mem.zeroes(i64),
    MaxBytes: i64 = @import("std").mem.zeroes(i64),
    MaxAge: i64 = @import("std").mem.zeroes(i64),
    MaxMsgsPerSubject: i64 = @import("std").mem.zeroes(i64),
    MaxMsgSize: i32 = @import("std").mem.zeroes(i32),
    Discard: jsDiscardPolicy = @import("std").mem.zeroes(jsDiscardPolicy),
    Storage: jsStorageType = @import("std").mem.zeroes(jsStorageType),
    Replicas: i64 = @import("std").mem.zeroes(i64),
    NoAck: bool = @import("std").mem.zeroes(bool),
    Template: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Duplicates: i64 = @import("std").mem.zeroes(i64),
    Placement: [*c]jsPlacement = @import("std").mem.zeroes([*c]jsPlacement),
    Mirror: [*c]jsStreamSource = @import("std").mem.zeroes([*c]jsStreamSource),
    Sources: [*c][*c]jsStreamSource = @import("std").mem.zeroes([*c][*c]jsStreamSource),
    SourcesLen: c_int = @import("std").mem.zeroes(c_int),
    Sealed: bool = @import("std").mem.zeroes(bool),
    DenyDelete: bool = @import("std").mem.zeroes(bool),
    DenyPurge: bool = @import("std").mem.zeroes(bool),
    AllowRollup: bool = @import("std").mem.zeroes(bool),
    RePublish: [*c]jsRePublish = @import("std").mem.zeroes([*c]jsRePublish),
    AllowDirect: bool = @import("std").mem.zeroes(bool),
    MirrorDirect: bool = @import("std").mem.zeroes(bool),
    DiscardNewPerSubject: bool = @import("std").mem.zeroes(bool),
    Metadata: natsMetadata = @import("std").mem.zeroes(natsMetadata),
    Compression: jsStorageCompression = @import("std").mem.zeroes(jsStorageCompression),
    FirstSeq: u64 = @import("std").mem.zeroes(u64),
    SubjectTransform: jsSubjectTransformConfig = @import("std").mem.zeroes(jsSubjectTransformConfig),
    ConsumerLimits: jsStreamConsumerLimits = @import("std").mem.zeroes(jsStreamConsumerLimits),
};
pub const jsStreamConfig = struct_jsStreamConfig;
pub const struct_jsLostStreamData = extern struct {
    Msgs: [*c]u64 = @import("std").mem.zeroes([*c]u64),
    MsgsLen: c_int = @import("std").mem.zeroes(c_int),
    Bytes: u64 = @import("std").mem.zeroes(u64),
};
pub const jsLostStreamData = struct_jsLostStreamData;
pub const struct_jsStreamStateSubject = extern struct {
    Subject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Msgs: u64 = @import("std").mem.zeroes(u64),
};
pub const jsStreamStateSubject = struct_jsStreamStateSubject;
pub const struct_jsStreamStateSubjects = extern struct {
    List: [*c]jsStreamStateSubject = @import("std").mem.zeroes([*c]jsStreamStateSubject),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsStreamStateSubjects = struct_jsStreamStateSubjects;
pub const struct_jsStreamState = extern struct {
    Msgs: u64 = @import("std").mem.zeroes(u64),
    Bytes: u64 = @import("std").mem.zeroes(u64),
    FirstSeq: u64 = @import("std").mem.zeroes(u64),
    FirstTime: i64 = @import("std").mem.zeroes(i64),
    LastSeq: u64 = @import("std").mem.zeroes(u64),
    LastTime: i64 = @import("std").mem.zeroes(i64),
    NumSubjects: i64 = @import("std").mem.zeroes(i64),
    Subjects: [*c]jsStreamStateSubjects = @import("std").mem.zeroes([*c]jsStreamStateSubjects),
    NumDeleted: u64 = @import("std").mem.zeroes(u64),
    Deleted: [*c]u64 = @import("std").mem.zeroes([*c]u64),
    DeletedLen: c_int = @import("std").mem.zeroes(c_int),
    Lost: [*c]jsLostStreamData = @import("std").mem.zeroes([*c]jsLostStreamData),
    Consumers: i64 = @import("std").mem.zeroes(i64),
};
pub const jsStreamState = struct_jsStreamState;
pub const struct_jsPeerInfo = extern struct {
    Name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Current: bool = @import("std").mem.zeroes(bool),
    Offline: bool = @import("std").mem.zeroes(bool),
    Active: i64 = @import("std").mem.zeroes(i64),
    Lag: u64 = @import("std").mem.zeroes(u64),
};
pub const jsPeerInfo = struct_jsPeerInfo;
pub const struct_jsClusterInfo = extern struct {
    Name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Leader: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Replicas: [*c][*c]jsPeerInfo = @import("std").mem.zeroes([*c][*c]jsPeerInfo),
    ReplicasLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsClusterInfo = struct_jsClusterInfo;
pub const struct_jsStreamSourceInfo = extern struct {
    Name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    External: [*c]jsExternalStream = @import("std").mem.zeroes([*c]jsExternalStream),
    Lag: u64 = @import("std").mem.zeroes(u64),
    Active: i64 = @import("std").mem.zeroes(i64),
    FilterSubject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    SubjectTransforms: [*c]jsSubjectTransformConfig = @import("std").mem.zeroes([*c]jsSubjectTransformConfig),
    SubjectTransformsLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsStreamSourceInfo = struct_jsStreamSourceInfo;
pub const struct_jsStreamAlternate = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Domain: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Cluster: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const jsStreamAlternate = struct_jsStreamAlternate;
pub const struct_jsStreamInfo = extern struct {
    Config: [*c]jsStreamConfig = @import("std").mem.zeroes([*c]jsStreamConfig),
    Created: i64 = @import("std").mem.zeroes(i64),
    State: jsStreamState = @import("std").mem.zeroes(jsStreamState),
    Cluster: [*c]jsClusterInfo = @import("std").mem.zeroes([*c]jsClusterInfo),
    Mirror: [*c]jsStreamSourceInfo = @import("std").mem.zeroes([*c]jsStreamSourceInfo),
    Sources: [*c][*c]jsStreamSourceInfo = @import("std").mem.zeroes([*c][*c]jsStreamSourceInfo),
    SourcesLen: c_int = @import("std").mem.zeroes(c_int),
    Alternates: [*c][*c]jsStreamAlternate = @import("std").mem.zeroes([*c][*c]jsStreamAlternate),
    AlternatesLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsStreamInfo = struct_jsStreamInfo;
pub const struct_jsStreamInfoList = extern struct {
    List: [*c][*c]jsStreamInfo = @import("std").mem.zeroes([*c][*c]jsStreamInfo),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsStreamInfoList = struct_jsStreamInfoList;
pub const struct_jsStreamNamesList = extern struct {
    List: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsStreamNamesList = struct_jsStreamNamesList;
pub const struct_jsConsumerSequenceMismatch = extern struct {
    Stream: u64 = @import("std").mem.zeroes(u64),
    ConsumerClient: u64 = @import("std").mem.zeroes(u64),
    ConsumerServer: u64 = @import("std").mem.zeroes(u64),
};
pub const jsConsumerSequenceMismatch = struct_jsConsumerSequenceMismatch;
pub const struct_jsSubOptions = extern struct {
    Stream: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Consumer: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Queue: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    ManualAck: bool = @import("std").mem.zeroes(bool),
    Config: jsConsumerConfig = @import("std").mem.zeroes(jsConsumerConfig),
    Ordered: bool = @import("std").mem.zeroes(bool),
};
pub const jsSubOptions = struct_jsSubOptions;
pub const struct_jsSequencePair = extern struct {
    Consumer: u64 = @import("std").mem.zeroes(u64),
    Stream: u64 = @import("std").mem.zeroes(u64),
};
pub const jsSequencePair = struct_jsSequencePair;
pub const struct_jsSequenceInfo = extern struct {
    Consumer: u64 = @import("std").mem.zeroes(u64),
    Stream: u64 = @import("std").mem.zeroes(u64),
    Last: i64 = @import("std").mem.zeroes(i64),
};
pub const jsSequenceInfo = struct_jsSequenceInfo;
pub const struct_jsConsumerInfo = extern struct {
    Stream: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Created: i64 = @import("std").mem.zeroes(i64),
    Config: [*c]jsConsumerConfig = @import("std").mem.zeroes([*c]jsConsumerConfig),
    Delivered: jsSequenceInfo = @import("std").mem.zeroes(jsSequenceInfo),
    AckFloor: jsSequenceInfo = @import("std").mem.zeroes(jsSequenceInfo),
    NumAckPending: i64 = @import("std").mem.zeroes(i64),
    NumRedelivered: i64 = @import("std").mem.zeroes(i64),
    NumWaiting: i64 = @import("std").mem.zeroes(i64),
    NumPending: u64 = @import("std").mem.zeroes(u64),
    Cluster: [*c]jsClusterInfo = @import("std").mem.zeroes([*c]jsClusterInfo),
    PushBound: bool = @import("std").mem.zeroes(bool),
    Paused: bool = @import("std").mem.zeroes(bool),
    PauseRemaining: i64 = @import("std").mem.zeroes(i64),
};
pub const jsConsumerInfo = struct_jsConsumerInfo;
pub const struct_jsConsumerInfoList = extern struct {
    List: [*c][*c]jsConsumerInfo = @import("std").mem.zeroes([*c][*c]jsConsumerInfo),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsConsumerInfoList = struct_jsConsumerInfoList;
pub const struct_jsConsumerNamesList = extern struct {
    List: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsConsumerNamesList = struct_jsConsumerNamesList;
pub const struct_jsConsumerPauseResponse = extern struct {
    Paused: bool = @import("std").mem.zeroes(bool),
    PauseUntil: i64 = @import("std").mem.zeroes(i64),
    PauseRemaining: i64 = @import("std").mem.zeroes(i64),
};
pub const jsConsumerPauseResponse = struct_jsConsumerPauseResponse;
pub const struct_jsAPIStats = extern struct {
    Total: u64 = @import("std").mem.zeroes(u64),
    Errors: u64 = @import("std").mem.zeroes(u64),
};
pub const jsAPIStats = struct_jsAPIStats;
pub const struct_jsAccountLimits = extern struct {
    MaxMemory: i64 = @import("std").mem.zeroes(i64),
    MaxStore: i64 = @import("std").mem.zeroes(i64),
    MaxStreams: i64 = @import("std").mem.zeroes(i64),
    MaxConsumers: i64 = @import("std").mem.zeroes(i64),
    MaxAckPending: i64 = @import("std").mem.zeroes(i64),
    MemoryMaxStreamBytes: i64 = @import("std").mem.zeroes(i64),
    StoreMaxStreamBytes: i64 = @import("std").mem.zeroes(i64),
    MaxBytesRequired: bool = @import("std").mem.zeroes(bool),
};
pub const jsAccountLimits = struct_jsAccountLimits;
pub const struct_jsTier = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Memory: u64 = @import("std").mem.zeroes(u64),
    Store: u64 = @import("std").mem.zeroes(u64),
    Streams: i64 = @import("std").mem.zeroes(i64),
    Consumers: i64 = @import("std").mem.zeroes(i64),
    Limits: jsAccountLimits = @import("std").mem.zeroes(jsAccountLimits),
};
pub const jsTier = struct_jsTier;
pub const struct_jsAccountInfo = extern struct {
    Memory: u64 = @import("std").mem.zeroes(u64),
    Store: u64 = @import("std").mem.zeroes(u64),
    Streams: i64 = @import("std").mem.zeroes(i64),
    Consumers: i64 = @import("std").mem.zeroes(i64),
    Domain: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    API: jsAPIStats = @import("std").mem.zeroes(jsAPIStats),
    Limits: jsAccountLimits = @import("std").mem.zeroes(jsAccountLimits),
    Tiers: [*c][*c]jsTier = @import("std").mem.zeroes([*c][*c]jsTier),
    TiersLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsAccountInfo = struct_jsAccountInfo;
pub const struct_jsMsgMetaData = extern struct {
    Sequence: jsSequencePair = @import("std").mem.zeroes(jsSequencePair),
    NumDelivered: u64 = @import("std").mem.zeroes(u64),
    NumPending: u64 = @import("std").mem.zeroes(u64),
    Timestamp: i64 = @import("std").mem.zeroes(i64),
    Stream: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Consumer: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Domain: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const jsMsgMetaData = struct_jsMsgMetaData;
pub const struct_jsDirectGetMsgOptions = extern struct {
    Sequence: u64 = @import("std").mem.zeroes(u64),
    NextBySubject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    LastBySubject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
};
pub const jsDirectGetMsgOptions = struct_jsDirectGetMsgOptions;
pub const struct_jsFetchRequest = extern struct {
    Expires: i64 = @import("std").mem.zeroes(i64),
    Batch: c_int = @import("std").mem.zeroes(c_int),
    MaxBytes: i64 = @import("std").mem.zeroes(i64),
    NoWait: bool = @import("std").mem.zeroes(bool),
    Heartbeat: i64 = @import("std").mem.zeroes(i64),
};
pub const jsFetchRequest = struct_jsFetchRequest;
pub const struct___kvStore = extern struct {
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    refs: c_int = @import("std").mem.zeroes(c_int),
    js: [*c]jsCtx = @import("std").mem.zeroes([*c]jsCtx),
    bucket: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    stream: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    pre: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    putPre: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    usePutPre: bool = @import("std").mem.zeroes(bool),
    useJSPrefix: bool = @import("std").mem.zeroes(bool),
    useDirect: bool = @import("std").mem.zeroes(bool),
};
pub const kvStore = struct___kvStore;
pub const struct___kvEntry = extern struct {
    kv: [*c]kvStore = @import("std").mem.zeroes([*c]kvStore),
    key: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    msg: [*c]natsMsg = @import("std").mem.zeroes([*c]natsMsg),
    delta: u64 = @import("std").mem.zeroes(u64),
    op: kvOperation = @import("std").mem.zeroes(kvOperation),
    next: [*c]struct___kvEntry = @import("std").mem.zeroes([*c]struct___kvEntry),
};
pub const kvEntry = struct___kvEntry;
pub const struct___kvStatus = extern struct {
    kv: [*c]kvStore = @import("std").mem.zeroes([*c]kvStore),
    si: [*c]jsStreamInfo = @import("std").mem.zeroes([*c]jsStreamInfo),
};
pub const kvStatus = struct___kvStatus;
pub const struct___kvWatcher = extern struct {
    mu: [*c]natsMutex = @import("std").mem.zeroes([*c]natsMutex),
    refs: c_int = @import("std").mem.zeroes(c_int),
    kv: [*c]kvStore = @import("std").mem.zeroes([*c]kvStore),
    sub: [*c]natsSubscription = @import("std").mem.zeroes([*c]natsSubscription),
    initPending: u64 = @import("std").mem.zeroes(u64),
    received: u64 = @import("std").mem.zeroes(u64),
    ignoreDel: bool = @import("std").mem.zeroes(bool),
    initDone: bool = @import("std").mem.zeroes(bool),
    retMarker: bool = @import("std").mem.zeroes(bool),
    stopped: bool = @import("std").mem.zeroes(bool),
};
pub const kvWatcher = struct___kvWatcher;
pub const kvOp_Unknown: c_int = 0;
pub const kvOp_Put: c_int = 1;
pub const kvOp_Delete: c_int = 2;
pub const kvOp_Purge: c_int = 3;
pub const kvOperation = c_uint;
pub const struct_kvConfig = extern struct {
    Bucket: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Description: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    MaxValueSize: i32 = @import("std").mem.zeroes(i32),
    History: u8 = @import("std").mem.zeroes(u8),
    TTL: i64 = @import("std").mem.zeroes(i64),
    MaxBytes: i64 = @import("std").mem.zeroes(i64),
    StorageType: jsStorageType = @import("std").mem.zeroes(jsStorageType),
    Replicas: c_int = @import("std").mem.zeroes(c_int),
    RePublish: [*c]jsRePublish = @import("std").mem.zeroes([*c]jsRePublish),
    Mirror: [*c]jsStreamSource = @import("std").mem.zeroes([*c]jsStreamSource),
    Sources: [*c][*c]jsStreamSource = @import("std").mem.zeroes([*c][*c]jsStreamSource),
    SourcesLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const kvConfig = struct_kvConfig;
pub const struct_kvWatchOptions = extern struct {
    IgnoreDeletes: bool = @import("std").mem.zeroes(bool),
    IncludeHistory: bool = @import("std").mem.zeroes(bool),
    MetaOnly: bool = @import("std").mem.zeroes(bool),
    Timeout: i64 = @import("std").mem.zeroes(i64),
    UpdatesOnly: bool = @import("std").mem.zeroes(bool),
};
pub const kvWatchOptions = struct_kvWatchOptions;
pub const struct_kvPurgeOptions = extern struct {
    Timeout: i64 = @import("std").mem.zeroes(i64),
    DeleteMarkersOlderThan: i64 = @import("std").mem.zeroes(i64),
};
pub const kvPurgeOptions = struct_kvPurgeOptions;
pub const struct_kvEntryList = extern struct {
    Entries: [*c][*c]kvEntry = @import("std").mem.zeroes([*c][*c]kvEntry),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const kvEntryList = struct_kvEntryList;
pub const struct_kvKeysList = extern struct {
    Keys: [*c][*c]u8 = @import("std").mem.zeroes([*c][*c]u8),
    Count: c_int = @import("std").mem.zeroes(c_int),
};
pub const kvKeysList = struct_kvKeysList;
pub const natsEvLoop_Attach = ?*const fn ([*c]?*anyopaque, ?*anyopaque, [*c]natsConnection, natsSock) callconv(.c) natsStatus;
pub const natsEvLoop_ReadAddRemove = ?*const fn (?*anyopaque, bool) callconv(.c) natsStatus;
pub const natsEvLoop_WriteAddRemove = ?*const fn (?*anyopaque, bool) callconv(.c) natsStatus;
pub const natsEvLoop_Detach = ?*const fn (?*anyopaque) callconv(.c) natsStatus;
pub extern fn nats_OpenWithConfig(config: [*c]natsClientConfig) natsStatus;
pub extern fn nats_Open(lockSpinCount: i64) natsStatus;
pub extern fn nats_GetVersion() [*c]const u8;
pub extern fn nats_GetVersionNumber() u32;
pub extern fn nats_CheckCompatibilityImpl(reqVerNumber: u32, verNumber: u32, verString: [*c]const u8) bool;
pub extern fn nats_Now() i64;
pub extern fn nats_NowInNanoSeconds() i64;
pub extern fn nats_Sleep(sleepTime: i64) void;
pub extern fn nats_GetLastError(status: [*c]natsStatus) [*c]const u8;
pub extern fn nats_GetLastErrorStack(buffer: [*c]u8, bufLen: usize) natsStatus;
pub extern fn nats_PrintLastErrorStack(file: [*c]FILE) void;
pub extern fn nats_SetMessageDeliveryPoolSize(max: c_int) natsStatus;
pub extern fn nats_ReleaseThreadMemory() void;
pub extern fn nats_Sign(encodedSeed: [*c]const u8, input: [*c]const u8, signature: [*c][*c]u8, signatureLength: [*c]c_int) natsStatus;
pub extern fn nats_Close() void;
pub extern fn nats_CloseAndWait(timeout: i64) natsStatus;
pub extern fn natsStatus_GetText(s: natsStatus) [*c]const u8;
pub extern fn natsStatistics_Create(newStats: [*c][*c]natsStatistics) natsStatus;
pub extern fn natsStatistics_GetCounts(stats: [*c]const natsStatistics, inMsgs: [*c]u64, inBytes: [*c]u64, outMsgs: [*c]u64, outBytes: [*c]u64, reconnects: [*c]u64) natsStatus;
pub extern fn natsStatistics_Destroy(stats: [*c]natsStatistics) void;
pub extern fn natsOptions_Create(newOpts: [*c][*c]natsOptions) natsStatus;
pub extern fn natsOptions_SetURL(opts: [*c]natsOptions, url: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetServers(opts: [*c]natsOptions, servers: [*c][*c]const u8, serversCount: c_int) natsStatus;
pub extern fn natsOptions_SetUserInfo(opts: [*c]natsOptions, user: [*c]const u8, password: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetToken(opts: [*c]natsOptions, token: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetTokenHandler(opts: [*c]natsOptions, tokenCb: natsTokenHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetNoRandomize(opts: [*c]natsOptions, noRandomize: bool) natsStatus;
pub extern fn natsOptions_SetTimeout(opts: [*c]natsOptions, timeout: i64) natsStatus;
pub extern fn natsOptions_SetName(opts: [*c]natsOptions, name: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetSecure(opts: [*c]natsOptions, secure: bool) natsStatus;
pub extern fn natsOptions_TLSHandshakeFirst(opts: [*c]natsOptions) natsStatus;
pub extern fn natsOptions_LoadCATrustedCertificates(opts: [*c]natsOptions, fileName: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCATrustedCertificates(opts: [*c]natsOptions, certificates: [*c]const u8) natsStatus;
pub extern fn natsOptions_LoadCertificatesChain(opts: [*c]natsOptions, certsFileName: [*c]const u8, keyFileName: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCertificatesChain(opts: [*c]natsOptions, cert: [*c]const u8, key: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCiphers(opts: [*c]natsOptions, ciphers: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetCipherSuites(opts: [*c]natsOptions, ciphers: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetExpectedHostname(opts: [*c]natsOptions, hostname: [*c]const u8) natsStatus;
pub extern fn natsOptions_SkipServerVerification(opts: [*c]natsOptions, skip: bool) natsStatus;
pub extern fn natsOptions_SetVerbose(opts: [*c]natsOptions, verbose: bool) natsStatus;
pub extern fn natsOptions_SetPedantic(opts: [*c]natsOptions, pedantic: bool) natsStatus;
pub extern fn natsOptions_SetPingInterval(opts: [*c]natsOptions, interval: i64) natsStatus;
pub extern fn natsOptions_SetMaxPingsOut(opts: [*c]natsOptions, maxPingsOut: c_int) natsStatus;
pub extern fn natsOptions_SetIOBufSize(opts: [*c]natsOptions, ioBufSize: c_int) natsStatus;
pub extern fn natsOptions_SetAllowReconnect(opts: [*c]natsOptions, allow: bool) natsStatus;
pub extern fn natsOptions_SetMaxReconnect(opts: [*c]natsOptions, maxReconnect: c_int) natsStatus;
pub extern fn natsOptions_SetReconnectWait(opts: [*c]natsOptions, reconnectWait: i64) natsStatus;
pub extern fn natsOptions_SetReconnectJitter(opts: [*c]natsOptions, jitter: i64, jitterTLS: i64) natsStatus;
pub extern fn natsOptions_SetCustomReconnectDelay(opts: [*c]natsOptions, cb: natsCustomReconnectDelayHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetReconnectBufSize(opts: [*c]natsOptions, reconnectBufSize: c_int) natsStatus;
pub extern fn natsOptions_SetMaxPendingMsgs(opts: [*c]natsOptions, maxPending: c_int) natsStatus;
pub extern fn natsOptions_SetMaxPendingBytes(opts: [*c]natsOptions, maxPending: i64) natsStatus;
pub extern fn natsOptions_SetErrorHandler(opts: [*c]natsOptions, errHandler: natsErrHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetClosedCB(opts: [*c]natsOptions, closedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetDisconnectedCB(opts: [*c]natsOptions, disconnectedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetReconnectedCB(opts: [*c]natsOptions, reconnectedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetDiscoveredServersCB(opts: [*c]natsOptions, discoveredServersCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetIgnoreDiscoveredServers(opts: [*c]natsOptions, ignore: bool) natsStatus;
pub extern fn natsOptions_SetLameDuckModeCB(opts: [*c]natsOptions, lameDuckCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetEventLoop(opts: [*c]natsOptions, loop: ?*anyopaque, attachCb: natsEvLoop_Attach, readCb: natsEvLoop_ReadAddRemove, writeCb: natsEvLoop_WriteAddRemove, detachCb: natsEvLoop_Detach) natsStatus;
pub extern fn natsOptions_UseGlobalMessageDelivery(opts: [*c]natsOptions, global: bool) natsStatus;
pub extern fn natsOptions_IPResolutionOrder(opts: [*c]natsOptions, order: c_int) natsStatus;
pub extern fn natsOptions_SetSendAsap(opts: [*c]natsOptions, sendAsap: bool) natsStatus;
pub extern fn natsOptions_UseOldRequestStyle(opts: [*c]natsOptions, useOldStyle: bool) natsStatus;
pub extern fn natsOptions_SetFailRequestsOnDisconnect(opts: [*c]natsOptions, failRequests: bool) natsStatus;
pub extern fn natsOptions_SetNoEcho(opts: [*c]natsOptions, noEcho: bool) natsStatus;
pub extern fn natsOptions_SetRetryOnFailedConnect(opts: [*c]natsOptions, retry: bool, connectedCb: natsConnectionHandler, closure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetUserCredentialsCallbacks(opts: [*c]natsOptions, ujwtCB: natsUserJWTHandler, ujwtClosure: ?*anyopaque, sigCB: natsSignatureHandler, sigClosure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetUserCredentialsFromFiles(opts: [*c]natsOptions, userOrChainedFile: [*c]const u8, seedFile: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetUserCredentialsFromMemory(opts: [*c]natsOptions, jwtAndSeedContent: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetNKey(opts: [*c]natsOptions, pubKey: [*c]const u8, sigCB: natsSignatureHandler, sigClosure: ?*anyopaque) natsStatus;
pub extern fn natsOptions_SetNKeyFromSeed(opts: [*c]natsOptions, pubKey: [*c]const u8, seedFile: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetWriteDeadline(opts: [*c]natsOptions, deadline: i64) natsStatus;
pub extern fn natsOptions_DisableNoResponders(opts: [*c]natsOptions, disabled: bool) natsStatus;
pub extern fn natsOptions_SetCustomInboxPrefix(opts: [*c]natsOptions, inboxPrefix: [*c]const u8) natsStatus;
pub extern fn natsOptions_SetMessageBufferPadding(opts: [*c]natsOptions, paddingSize: c_int) natsStatus;
pub extern fn natsOptions_Destroy(opts: [*c]natsOptions) void;
pub extern fn natsInbox_Create(newInbox: [*c][*c]natsInbox) natsStatus;
pub extern fn natsInbox_Destroy(inbox: [*c]natsInbox) void;
pub extern fn natsMsgList_Destroy(list: [*c]natsMsgList) void;
pub extern fn natsMsg_Create(newMsg: [*c][*c]natsMsg, subj: [*c]const u8, reply: [*c]const u8, data: [*c]const u8, dataLen: c_int) natsStatus;
pub extern fn natsMsg_GetSubject(msg: [*c]const natsMsg) [*c]const u8;
pub extern fn natsMsg_GetReply(msg: [*c]const natsMsg) [*c]const u8;
pub extern fn natsMsg_GetData(msg: [*c]const natsMsg) [*c]const u8;
pub extern fn natsMsg_GetDataLength(msg: [*c]const natsMsg) c_int;
pub extern fn natsMsgHeader_Set(msg: [*c]natsMsg, key: [*c]const u8, value: [*c]const u8) natsStatus;
pub extern fn natsMsgHeader_Add(msg: [*c]natsMsg, key: [*c]const u8, value: [*c]const u8) natsStatus;
pub extern fn natsMsgHeader_Get(msg: [*c]natsMsg, key: [*c]const u8, value: [*c][*c]const u8) natsStatus;
pub extern fn natsMsgHeader_Values(msg: [*c]natsMsg, key: [*c]const u8, values: [*c][*c][*c]const u8, count: [*c]c_int) natsStatus;
pub extern fn natsMsgHeader_Keys(msg: [*c]natsMsg, keys: [*c][*c][*c]const u8, count: [*c]c_int) natsStatus;
pub extern fn natsMsgHeader_Delete(msg: [*c]natsMsg, key: [*c]const u8) natsStatus;
pub extern fn natsMsg_IsNoResponders(msg: [*c]natsMsg) bool;
pub extern fn natsMsg_Destroy(msg: [*c]natsMsg) void;
pub extern fn natsConnection_Connect(nc: [*c][*c]natsConnection, options: [*c]natsOptions) natsStatus;
pub extern fn natsConnection_Reconnect(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConnection_ProcessReadEvent(nc: [*c]natsConnection) void;
pub extern fn natsConnection_ProcessCloseEvent(socket: [*c]natsSock) void;
pub extern fn natsConnection_ProcessWriteEvent(nc: [*c]natsConnection) void;
pub extern fn natsConnection_ConnectTo(nc: [*c][*c]natsConnection, urls: [*c]const u8) natsStatus;
pub extern fn natsConnection_IsClosed(nc: [*c]natsConnection) bool;
pub extern fn natsConnection_IsReconnecting(nc: [*c]natsConnection) bool;
pub extern fn natsConnection_IsDraining(nc: [*c]natsConnection) bool;
pub extern fn natsConnection_Status(nc: [*c]natsConnection) natsConnStatus;
pub extern fn natsConnection_Buffered(nc: [*c]natsConnection) c_int;
pub extern fn natsConnection_Flush(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConnection_FlushTimeout(nc: [*c]natsConnection, timeout: i64) natsStatus;
pub extern fn natsConnection_GetMaxPayload(nc: [*c]natsConnection) i64;
pub extern fn natsConnection_GetStats(nc: [*c]natsConnection, stats: [*c]natsStatistics) natsStatus;
pub extern fn natsConnection_GetConnectedUrl(nc: [*c]natsConnection, buffer: [*c]u8, bufferSize: usize) natsStatus;
pub extern fn natsConnection_GetConnectedServerId(nc: [*c]natsConnection, buffer: [*c]u8, bufferSize: usize) natsStatus;
pub extern fn natsConnection_GetServers(nc: [*c]natsConnection, servers: [*c][*c][*c]u8, count: [*c]c_int) natsStatus;
pub extern fn natsConnection_GetDiscoveredServers(nc: [*c]natsConnection, servers: [*c][*c][*c]u8, count: [*c]c_int) natsStatus;
pub extern fn natsConnection_GetLastError(nc: [*c]natsConnection, lastError: [*c][*c]const u8) natsStatus;
pub extern fn natsConnection_GetClientID(nc: [*c]natsConnection, cid: [*c]u64) natsStatus;
pub extern fn natsConnection_Drain(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConnection_DrainTimeout(nc: [*c]natsConnection, timeout: i64) natsStatus;
pub extern fn natsConnection_Sign(nc: [*c]natsConnection, message: [*c]const u8, messageLen: c_int, sig: [*c]u8) natsStatus;
pub extern fn natsConnection_GetClientIP(nc: [*c]natsConnection, ip: [*c][*c]u8) natsStatus;
pub extern fn natsConnection_GetRTT(nc: [*c]natsConnection, rtt: [*c]i64) natsStatus;
pub extern fn natsConnection_HasHeaderSupport(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConnection_GetLocalIPAndPort(nc: [*c]natsConnection, ip: [*c][*c]u8, port: [*c]c_int) natsStatus;
pub extern fn natsConnection_Close(nc: [*c]natsConnection) void;
pub extern fn natsConnection_Destroy(nc: [*c]natsConnection) void;
pub extern fn natsConnection_Publish(nc: [*c]natsConnection, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int) natsStatus;
pub extern fn natsConnection_PublishString(nc: [*c]natsConnection, subj: [*c]const u8, str: [*c]const u8) natsStatus;
pub extern fn natsConnection_PublishMsg(nc: [*c]natsConnection, msg: [*c]natsMsg) natsStatus;
pub extern fn natsConnection_PublishRequest(nc: [*c]natsConnection, subj: [*c]const u8, reply: [*c]const u8, data: ?*const anyopaque, dataLen: c_int) natsStatus;
pub extern fn natsConnection_PublishRequestString(nc: [*c]natsConnection, subj: [*c]const u8, reply: [*c]const u8, str: [*c]const u8) natsStatus;
pub extern fn natsConnection_Request(replyMsg: [*c][*c]natsMsg, nc: [*c]natsConnection, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int, timeout: i64) natsStatus;
pub extern fn natsConnection_RequestString(replyMsg: [*c][*c]natsMsg, nc: [*c]natsConnection, subj: [*c]const u8, str: [*c]const u8, timeout: i64) natsStatus;
pub extern fn natsConnection_RequestMsg(replyMsg: [*c][*c]natsMsg, nc: [*c]natsConnection, requestMsg: [*c]natsMsg, timeout: i64) natsStatus;
pub extern fn natsConnection_Subscribe(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_SubscribeTimeout(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, timeout: i64, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_SubscribeSync(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8) natsStatus;
pub extern fn natsConnection_QueueSubscribe(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, queueGroup: [*c]const u8, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_QueueSubscribeTimeout(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, queueGroup: [*c]const u8, timeout: i64, cb: natsMsgHandler, cbClosure: ?*anyopaque) natsStatus;
pub extern fn natsConnection_QueueSubscribeSync(sub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subject: [*c]const u8, queueGroup: [*c]const u8) natsStatus;
pub extern fn natsSubscription_NoDeliveryDelay(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_NextMsg(nextMsg: [*c][*c]natsMsg, sub: [*c]natsSubscription, timeout: i64) natsStatus;
pub extern fn natsSubscription_Unsubscribe(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_AutoUnsubscribe(sub: [*c]natsSubscription, max: c_int) natsStatus;
pub extern fn natsSubscription_QueuedMsgs(sub: [*c]natsSubscription, queuedMsgs: [*c]u64) natsStatus;
pub extern fn natsSubscription_GetID(sub: [*c]natsSubscription) i64;
pub extern fn natsSubscription_GetSubject(sub: [*c]natsSubscription) [*c]const u8;
pub extern fn natsSubscription_SetPendingLimits(sub: [*c]natsSubscription, msgLimit: c_int, bytesLimit: c_int) natsStatus;
pub extern fn natsSubscription_GetPendingLimits(sub: [*c]natsSubscription, msgLimit: [*c]c_int, bytesLimit: [*c]c_int) natsStatus;
pub extern fn natsSubscription_GetPending(sub: [*c]natsSubscription, msgs: [*c]c_int, bytes: [*c]c_int) natsStatus;
pub extern fn natsSubscription_GetDelivered(sub: [*c]natsSubscription, msgs: [*c]i64) natsStatus;
pub extern fn natsSubscription_GetDropped(sub: [*c]natsSubscription, msgs: [*c]i64) natsStatus;
pub extern fn natsSubscription_GetMaxPending(sub: [*c]natsSubscription, msgs: [*c]c_int, bytes: [*c]c_int) natsStatus;
pub extern fn natsSubscription_ClearMaxPending(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_GetStats(sub: [*c]natsSubscription, pendingMsgs: [*c]c_int, pendingBytes: [*c]c_int, maxPendingMsgs: [*c]c_int, maxPendingBytes: [*c]c_int, deliveredMsgs: [*c]i64, droppedMsgs: [*c]i64) natsStatus;
pub extern fn natsSubscription_IsValid(sub: [*c]natsSubscription) bool;
pub extern fn natsSubscription_Drain(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_DrainTimeout(sub: [*c]natsSubscription, timeout: i64) natsStatus;
pub extern fn natsSubscription_WaitForDrainCompletion(sub: [*c]natsSubscription, timeout: i64) natsStatus;
pub extern fn natsSubscription_DrainCompletionStatus(sub: [*c]natsSubscription) natsStatus;
pub extern fn natsSubscription_SetOnCompleteCB(sub: [*c]natsSubscription, cb: natsOnCompleteCB, closure: ?*anyopaque) natsStatus;
pub extern fn natsSubscription_Destroy(sub: [*c]natsSubscription) void;
pub extern fn jsOptions_Init(opts: [*c]jsOptions) natsStatus;
pub extern fn natsConnection_JetStream(js: [*c][*c]jsCtx, nc: [*c]natsConnection, opts: [*c]jsOptions) natsStatus;
pub extern fn jsCtx_Destroy(js: [*c]jsCtx) void;
pub extern fn jsStreamConfig_Init(cfg: [*c]jsStreamConfig) natsStatus;
pub extern fn jsPlacement_Init(placement: [*c]jsPlacement) natsStatus;
pub extern fn jsStreamSource_Init(source: [*c]jsStreamSource) natsStatus;
pub extern fn jsExternalStream_Init(external: [*c]jsExternalStream) natsStatus;
pub extern fn jsRePublish_Init(rp: [*c]jsRePublish) natsStatus;
pub extern fn js_AddStream(si: [*c][*c]jsStreamInfo, js: [*c]jsCtx, cfg: [*c]jsStreamConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_UpdateStream(si: [*c][*c]jsStreamInfo, js: [*c]jsCtx, cfg: [*c]jsStreamConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_PurgeStream(js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_DeleteStream(js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetMsg(msg: [*c][*c]natsMsg, js: [*c]jsCtx, stream: [*c]const u8, seq: u64, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetLastMsg(msg: [*c][*c]natsMsg, js: [*c]jsCtx, stream: [*c]const u8, subject: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsDirectGetMsgOptions_Init(opts: [*c]jsDirectGetMsgOptions) natsStatus;
pub extern fn js_DirectGetMsg(msg: [*c][*c]natsMsg, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, dgOpts: [*c]jsDirectGetMsgOptions) natsStatus;
pub extern fn js_DeleteMsg(js: [*c]jsCtx, stream: [*c]const u8, seq: u64, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_EraseMsg(js: [*c]jsCtx, stream: [*c]const u8, seq: u64, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetStreamInfo(si: [*c][*c]jsStreamInfo, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsStreamInfo_Destroy(si: [*c]jsStreamInfo) void;
pub extern fn js_Streams(list: [*c][*c]jsStreamInfoList, js: [*c]jsCtx, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsStreamInfoList_Destroy(list: [*c]jsStreamInfoList) void;
pub extern fn js_StreamNames(list: [*c][*c]jsStreamNamesList, js: [*c]jsCtx, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsStreamNamesList_Destroy(list: [*c]jsStreamNamesList) void;
pub extern fn jsConsumerConfig_Init(cc: [*c]jsConsumerConfig) natsStatus;
pub extern fn js_AddConsumer(ci: [*c][*c]jsConsumerInfo, js: [*c]jsCtx, stream: [*c]const u8, cfg: [*c]jsConsumerConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_UpdateConsumer(ci: [*c][*c]jsConsumerInfo, js: [*c]jsCtx, stream: [*c]const u8, cfg: [*c]jsConsumerConfig, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_GetConsumerInfo(ci: [*c][*c]jsConsumerInfo, js: [*c]jsCtx, stream: [*c]const u8, consumer: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_DeleteConsumer(js: [*c]jsCtx, stream: [*c]const u8, consumer: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_PauseConsumer(new_cpr: [*c][*c]jsConsumerPauseResponse, js: [*c]jsCtx, stream: [*c]const u8, consumer: [*c]const u8, pauseUntil: u64, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsConsumerPauseResponse_Destroy(cpr: [*c]jsConsumerPauseResponse) void;
pub extern fn jsConsumerInfo_Destroy(ci: [*c]jsConsumerInfo) void;
pub extern fn js_Consumers(list: [*c][*c]jsConsumerInfoList, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsConsumerInfoList_Destroy(list: [*c]jsConsumerInfoList) void;
pub extern fn js_ConsumerNames(list: [*c][*c]jsConsumerNamesList, js: [*c]jsCtx, stream: [*c]const u8, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsConsumerNamesList_Destroy(list: [*c]jsConsumerNamesList) void;
pub extern fn js_GetAccountInfo(ai: [*c][*c]jsAccountInfo, js: [*c]jsCtx, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsAccountInfo_Destroy(ai: [*c]jsAccountInfo) void;
pub extern fn jsPubOptions_Init(opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_Publish(pubAck: [*c][*c]jsPubAck, js: [*c]jsCtx, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int, opts: [*c]jsPubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_PublishMsg(pubAck: [*c][*c]jsPubAck, js: [*c]jsCtx, msg: [*c]natsMsg, opts: [*c]jsPubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsPubAck_Destroy(pubAck: [*c]jsPubAck) void;
pub extern fn js_PublishAsync(js: [*c]jsCtx, subj: [*c]const u8, data: ?*const anyopaque, dataLen: c_int, opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_PublishMsgAsync(js: [*c]jsCtx, msg: [*c][*c]natsMsg, opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_PublishAsyncComplete(js: [*c]jsCtx, opts: [*c]jsPubOptions) natsStatus;
pub extern fn js_PublishAsyncGetPendingList(pending: [*c]natsMsgList, js: [*c]jsCtx) natsStatus;
pub extern fn jsSubOptions_Init(opts: [*c]jsSubOptions) natsStatus;
pub extern fn js_Subscribe(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subject: [*c]const u8, cb: natsMsgHandler, cbClosure: ?*anyopaque, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_SubscribeMulti(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subjects: [*c][*c]const u8, numSubjects: c_int, cb: natsMsgHandler, cbClosure: ?*anyopaque, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_SubscribeSync(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subject: [*c]const u8, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_SubscribeSyncMulti(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subjects: [*c][*c]const u8, numSubjects: c_int, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn js_PullSubscribe(sub: [*c][*c]natsSubscription, js: [*c]jsCtx, subject: [*c]const u8, durable: [*c]const u8, opts: [*c]jsOptions, subOpts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn natsSubscription_Fetch(list: [*c]natsMsgList, sub: [*c]natsSubscription, batch: c_int, timeout: i64, errCode: [*c]jsErrCode) natsStatus;
pub extern fn jsFetchRequest_Init(request: [*c]jsFetchRequest) natsStatus;
pub extern fn js_PullSubscribeAsync(newsub: [*c][*c]natsSubscription, js: [*c]jsCtx, subject: [*c]const u8, durable: [*c]const u8, msgCB: natsMsgHandler, msgCBClosure: ?*anyopaque, jsOpts: [*c]jsOptions, opts: [*c]jsSubOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn natsSubscription_FetchRequest(list: [*c]natsMsgList, sub: [*c]natsSubscription, request: [*c]jsFetchRequest) natsStatus;
pub extern fn natsSubscription_GetConsumerInfo(ci: [*c][*c]jsConsumerInfo, sub: [*c]natsSubscription, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn natsSubscription_GetSequenceMismatch(csm: [*c]jsConsumerSequenceMismatch, sub: [*c]natsSubscription) natsStatus;
pub extern fn natsMsg_GetMetaData(new_meta: [*c][*c]jsMsgMetaData, msg: [*c]natsMsg) natsStatus;
pub extern fn jsMsgMetaData_Destroy(meta: [*c]jsMsgMetaData) void;
pub extern fn natsMsg_Ack(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_AckSync(msg: [*c]natsMsg, opts: [*c]jsOptions, errCode: [*c]jsErrCode) natsStatus;
pub extern fn natsMsg_Nak(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_NakWithDelay(msg: [*c]natsMsg, delay: i64, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_InProgress(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_Term(msg: [*c]natsMsg, opts: [*c]jsOptions) natsStatus;
pub extern fn natsMsg_GetSequence(msg: [*c]natsMsg) u64;
pub extern fn natsMsg_GetTime(msg: [*c]natsMsg) i64;
pub extern fn kvConfig_Init(cfg: [*c]kvConfig) natsStatus;
pub extern fn js_CreateKeyValue(new_kv: [*c][*c]kvStore, js: [*c]jsCtx, cfg: [*c]kvConfig) natsStatus;
pub extern fn js_KeyValue(new_kv: [*c][*c]kvStore, js: [*c]jsCtx, bucket: [*c]const u8) natsStatus;
pub extern fn js_DeleteKeyValue(js: [*c]jsCtx, bucket: [*c]const u8) natsStatus;
pub extern fn kvStore_Destroy(kv: [*c]kvStore) void;
pub extern fn kvEntry_Bucket(e: [*c]kvEntry) [*c]const u8;
pub extern fn kvEntry_Key(e: [*c]kvEntry) [*c]const u8;
pub extern fn kvEntry_Value(e: [*c]kvEntry) ?*const anyopaque;
pub extern fn kvEntry_ValueLen(e: [*c]kvEntry) c_int;
pub extern fn kvEntry_ValueString(e: [*c]kvEntry) [*c]const u8;
pub extern fn kvEntry_Revision(e: [*c]kvEntry) u64;
pub extern fn kvEntry_Created(e: [*c]kvEntry) i64;
pub extern fn kvEntry_Delta(e: [*c]kvEntry) u64;
pub extern fn kvEntry_Operation(e: [*c]kvEntry) kvOperation;
pub extern fn kvEntry_Destroy(e: [*c]kvEntry) void;
pub extern fn kvStore_Get(new_entry: [*c][*c]kvEntry, kv: [*c]kvStore, key: [*c]const u8) natsStatus;
pub extern fn kvStore_GetRevision(new_entry: [*c][*c]kvEntry, kv: [*c]kvStore, key: [*c]const u8, revision: u64) natsStatus;
pub extern fn kvStore_Put(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: ?*const anyopaque, len: c_int) natsStatus;
pub extern fn kvStore_PutString(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: [*c]const u8) natsStatus;
pub extern fn kvStore_Create(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: ?*const anyopaque, len: c_int) natsStatus;
pub extern fn kvStore_CreateString(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: [*c]const u8) natsStatus;
pub extern fn kvStore_Update(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: ?*const anyopaque, len: c_int, last: u64) natsStatus;
pub extern fn kvStore_UpdateString(rev: [*c]u64, kv: [*c]kvStore, key: [*c]const u8, data: [*c]const u8, last: u64) natsStatus;
pub extern fn kvStore_Delete(kv: [*c]kvStore, key: [*c]const u8) natsStatus;
pub extern fn kvStore_Purge(kv: [*c]kvStore, key: [*c]const u8, opts: [*c]kvPurgeOptions) natsStatus;
pub extern fn kvWatchOptions_Init(opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvPurgeOptions_Init(opts: [*c]kvPurgeOptions) natsStatus;
pub extern fn kvStore_PurgeDeletes(kv: [*c]kvStore, opts: [*c]kvPurgeOptions) natsStatus;
pub extern fn kvStore_Watch(new_watcher: [*c][*c]kvWatcher, kv: [*c]kvStore, keys: [*c]const u8, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvStore_WatchMulti(new_watcher: [*c][*c]kvWatcher, kv: [*c]kvStore, keys: [*c][*c]const u8, numKeys: c_int, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvStore_WatchAll(new_watcher: [*c][*c]kvWatcher, kv: [*c]kvStore, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvStore_Keys(list: [*c]kvKeysList, kv: [*c]kvStore, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvStore_KeysWithFilters(list: [*c]kvKeysList, kv: [*c]kvStore, filters: [*c][*c]const u8, numFilters: c_int, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvKeysList_Destroy(list: [*c]kvKeysList) void;
pub extern fn kvStore_History(list: [*c]kvEntryList, kv: [*c]kvStore, key: [*c]const u8, opts: [*c]kvWatchOptions) natsStatus;
pub extern fn kvEntryList_Destroy(list: [*c]kvEntryList) void;
pub extern fn kvStore_Bucket(kv: [*c]kvStore) [*c]const u8;
pub extern fn kvStore_Status(new_status: [*c][*c]kvStatus, kv: [*c]kvStore) natsStatus;
pub extern fn kvWatcher_Next(new_entry: [*c][*c]kvEntry, w: [*c]kvWatcher, timeout: i64) natsStatus;
pub extern fn kvWatcher_Stop(w: [*c]kvWatcher) natsStatus;
pub extern fn kvWatcher_Destroy(w: [*c]kvWatcher) void;
pub extern fn kvStatus_Bucket(sts: [*c]kvStatus) [*c]const u8;
pub extern fn kvStatus_Values(sts: [*c]kvStatus) u64;
pub extern fn kvStatus_History(sts: [*c]kvStatus) i64;
pub extern fn kvStatus_TTL(sts: [*c]kvStatus) i64;
pub extern fn kvStatus_Replicas(sts: [*c]kvStatus) i64;
pub extern fn kvStatus_Bytes(sts: [*c]kvStatus) u64;
pub extern fn kvStatus_Destroy(sts: [*c]kvStatus) void;
pub const struct_micro_client_s = opaque {};
pub const microClient = struct_micro_client_s;
pub const struct___for_forward_compatibility_only = opaque {};
pub const microClientConfig = struct___for_forward_compatibility_only;
pub const struct_micro_endpoint_s = opaque {};
pub const microEndpoint = struct_micro_endpoint_s;
pub const struct_micro_request_s = opaque {};
pub const microRequest = struct_micro_request_s;
pub const struct_micro_error_s = opaque {};
pub const microError = struct_micro_error_s;
pub const microRequestHandler = ?*const fn (?*microRequest) callconv(.c) ?*microError;
pub const struct_micro_endpoint_config_s = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Subject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    QueueGroup: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    NoQueueGroup: bool = @import("std").mem.zeroes(bool),
    Metadata: natsMetadata = @import("std").mem.zeroes(natsMetadata),
    Handler: microRequestHandler = @import("std").mem.zeroes(microRequestHandler),
    State: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const microEndpointConfig = struct_micro_endpoint_config_s;
pub const struct_micro_endpoint_info_s = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Subject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    QueueGroup: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Metadata: natsMetadata = @import("std").mem.zeroes(natsMetadata),
};
pub const microEndpointInfo = struct_micro_endpoint_info_s;
pub const struct_micro_endpoint_stats_s = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Subject: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    QueueGroup: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    NumRequests: i64 = @import("std").mem.zeroes(i64),
    NumErrors: i64 = @import("std").mem.zeroes(i64),
    ProcessingTimeSeconds: i64 = @import("std").mem.zeroes(i64),
    ProcessingTimeNanoseconds: i64 = @import("std").mem.zeroes(i64),
    AverageProcessingTimeNanoseconds: i64 = @import("std").mem.zeroes(i64),
    LastErrorString: [2048]u8 = @import("std").mem.zeroes([2048]u8),
};
pub const microEndpointStats = struct_micro_endpoint_stats_s;
pub const struct_micro_group_s = opaque {};
pub const microGroup = struct_micro_group_s;
pub const struct_micro_group_config_s = extern struct {
    Prefix: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    QueueGroup: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    NoQueueGroup: bool = @import("std").mem.zeroes(bool),
};
pub const microGroupConfig = struct_micro_group_config_s;
pub const microErrorHandler = ?*const fn (?*microService, ?*microEndpoint, natsStatus) callconv(.c) void;
pub const microDoneHandler = ?*const fn (?*microService) callconv(.c) void;
pub const struct_micro_service_config_s = extern struct {
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Version: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Description: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    QueueGroup: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    NoQueueGroup: bool = @import("std").mem.zeroes(bool),
    Metadata: natsMetadata = @import("std").mem.zeroes(natsMetadata),
    Endpoint: [*c]microEndpointConfig = @import("std").mem.zeroes([*c]microEndpointConfig),
    StatsHandler: microRequestHandler = @import("std").mem.zeroes(microRequestHandler),
    ErrHandler: microErrorHandler = @import("std").mem.zeroes(microErrorHandler),
    DoneHandler: microDoneHandler = @import("std").mem.zeroes(microDoneHandler),
    State: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const microServiceConfig = struct_micro_service_config_s;
pub const struct_micro_service_info_s = extern struct {
    Type: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Version: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Description: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Id: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Metadata: natsMetadata = @import("std").mem.zeroes(natsMetadata),
    Endpoints: [*c]microEndpointInfo = @import("std").mem.zeroes([*c]microEndpointInfo),
    EndpointsLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const microServiceInfo = struct_micro_service_info_s;
pub const struct_micro_service_stats_s = extern struct {
    Type: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Name: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Version: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Id: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    Started: i64 = @import("std").mem.zeroes(i64),
    Endpoints: [*c]microEndpointStats = @import("std").mem.zeroes([*c]microEndpointStats),
    EndpointsLen: c_int = @import("std").mem.zeroes(c_int),
};
pub const microServiceStats = struct_micro_service_stats_s;
pub extern var micro_ErrorOutOfMemory: ?*microError;
pub extern var micro_ErrorInvalidArg: ?*microError;
pub extern fn micro_AddService(new_microservice: [*c]?*microService, nc: [*c]natsConnection, config: [*c]microServiceConfig) ?*microError;
pub extern fn microService_AddEndpoint(m: ?*microService, config: [*c]microEndpointConfig) ?*microError;
pub extern fn microService_AddGroup(new_group: [*c]?*microGroup, m: ?*microService, config: [*c]microGroupConfig) ?*microError;
pub extern fn microService_Destroy(m: ?*microService) ?*microError;
pub extern fn microService_GetConnection(m: ?*microService) [*c]natsConnection;
pub extern fn microService_GetInfo(new_info: [*c][*c]microServiceInfo, m: ?*microService) ?*microError;
pub extern fn microService_GetState(m: ?*microService) ?*anyopaque;
pub extern fn microService_GetStats(new_stats: [*c][*c]microServiceStats, m: ?*microService) ?*microError;
pub extern fn microService_IsStopped(m: ?*microService) bool;
pub extern fn microService_Run(m: ?*microService) ?*microError;
pub extern fn microService_Stop(m: ?*microService) ?*microError;
pub extern fn microGroup_AddGroup(new_group: [*c]?*microGroup, parent: ?*microGroup, config: [*c]microGroupConfig) ?*microError;
pub extern fn microGroup_AddEndpoint(g: ?*microGroup, config: [*c]microEndpointConfig) ?*microError;
pub extern fn microRequest_AddHeader(req: ?*microRequest, key: [*c]const u8, value: [*c]const u8) ?*microError;
pub extern fn microRequest_DeleteHeader(req: ?*microRequest, key: [*c]const u8) ?*microError;
pub extern fn microRequest_GetConnection(req: ?*microRequest) [*c]natsConnection;
pub extern fn microRequest_GetData(req: ?*microRequest) [*c]const u8;
pub extern fn microRequest_GetDataLength(req: ?*microRequest) c_int;
pub extern fn microRequest_GetEndpointState(req: ?*microRequest) ?*anyopaque;
pub extern fn microRequest_GetHeaderKeys(req: ?*microRequest, keys: [*c][*c][*c]const u8, count: [*c]c_int) ?*microError;
pub extern fn microRequest_GetHeaderValue(req: ?*microRequest, key: [*c]const u8, value: [*c][*c]const u8) ?*microError;
pub extern fn microRequest_GetHeaderValues(req: ?*microRequest, key: [*c]const u8, values: [*c][*c][*c]const u8, count: [*c]c_int) ?*microError;
pub extern fn microRequest_GetMsg(req: ?*microRequest) [*c]natsMsg;
pub extern fn microRequest_GetReply(req: ?*microRequest) [*c]const u8;
pub extern fn microRequest_GetService(req: ?*microRequest) ?*microService;
pub extern fn microRequest_GetServiceState(req: ?*microRequest) ?*anyopaque;
pub extern fn microRequest_GetSubject(req: ?*microRequest) [*c]const u8;
pub extern fn microRequest_Respond(req: ?*microRequest, data: [*c]const u8, len: usize) ?*microError;
pub extern fn microRequest_RespondError(req: ?*microRequest, err: ?*microError) ?*microError;
pub extern fn microRequest_RespondCustom(req: ?*microRequest, err: ?*microError, data: [*c]const u8, len: usize) ?*microError;
pub extern fn microRequest_SetHeader(req: ?*microRequest, key: [*c]const u8, value: [*c]const u8) ?*microError;
pub extern fn micro_Errorf(format: [*c]const u8, ...) ?*microError;
pub extern fn micro_ErrorfCode(code: c_int, format: [*c]const u8, ...) ?*microError;
pub extern fn micro_ErrorFromStatus(s: natsStatus) ?*microError;
pub extern fn microError_Code(err: ?*microError) c_int;
pub extern fn microError_Destroy(err: ?*microError) void;
pub extern fn microError_Status(err: ?*microError) natsStatus;
pub extern fn microError_String(err: ?*microError, buf: [*c]u8, len: usize) [*c]const u8;
pub extern fn microError_Wrapf(err: ?*microError, format: [*c]const u8, ...) ?*microError;
pub extern fn micro_NewClient(new_client: [*c]?*microClient, nc: [*c]natsConnection, cfg: ?*microClientConfig) ?*microError;
pub extern fn microClient_Destroy(client: ?*microClient) void;
pub extern fn microClient_DoRequest(reply: [*c][*c]natsMsg, client: ?*microClient, subject: [*c]const u8, data: [*c]const u8, data_len: c_int) ?*microError;
pub extern fn microServiceInfo_Destroy(info: [*c]microServiceInfo) void;
pub extern fn microServiceStats_Destroy(stats: [*c]microServiceStats) void;
pub extern fn nats_setErrorReal(fileName: [*c]const u8, funcName: [*c]const u8, line: c_int, errSts: natsStatus, errTxtFmt: [*c]const u8, ...) natsStatus;
pub extern fn nats_updateErrStack(err: natsStatus, func: [*c]const u8) natsStatus;
pub extern fn nats_clearLastError() void;
pub extern fn nats_doNotUpdateErrStack(skipStackUpdate: bool) void;
pub extern fn nats_updateErrTxt(fileName: [*c]const u8, funcName: [*c]const u8, line: c_int, errTxtFmt: [*c]const u8, ...) void;
pub extern fn nats_setErrStatusAndTxt(err: natsStatus, errTxt: [*c]const u8) void;
pub extern fn natsBuf_InitWithBackend(buf: [*c]natsBuffer, data: [*c]u8, len: c_int, capacity: c_int) natsStatus;
pub extern fn natsBuf_Init(buf: [*c]natsBuffer, capacity: c_int) natsStatus;
pub extern fn natsBuf_CreateWithBackend(newBuf: [*c][*c]natsBuffer, data: [*c]u8, len: c_int, capacity: c_int) natsStatus;
pub extern fn natsBuf_Create(newBuf: [*c][*c]natsBuffer, capacity: c_int) natsStatus;
pub extern fn natsBuf_Reset(buf: [*c]natsBuffer) void;
pub extern fn natsBuf_MoveTo(buf: [*c]natsBuffer, newPosition: c_int) void;
pub extern fn natsBuf_Expand(buf: [*c]natsBuffer, newSize: c_int) natsStatus;
pub extern fn natsBuf_Append(buf: [*c]natsBuffer, data: [*c]const u8, dataLen: c_int) natsStatus;
pub extern fn natsBuf_AppendByte(buf: [*c]natsBuffer, b: u8) natsStatus;
pub extern fn natsBuf_Consume(buf: [*c]natsBuffer, n: c_int) void;
pub extern fn natsBuf_Destroy(buf: [*c]natsBuffer) void;
pub const OP_START: c_int = 0;
pub const OP_PLUS: c_int = 1;
pub const OP_PLUS_O: c_int = 2;
pub const OP_PLUS_OK: c_int = 3;
pub const OP_MINUS: c_int = 4;
pub const OP_MINUS_E: c_int = 5;
pub const OP_MINUS_ER: c_int = 6;
pub const OP_MINUS_ERR: c_int = 7;
pub const OP_MINUS_ERR_SPC: c_int = 8;
pub const MINUS_ERR_ARG: c_int = 9;
pub const OP_M: c_int = 10;
pub const OP_MS: c_int = 11;
pub const OP_MSG: c_int = 12;
pub const OP_MSG_SPC: c_int = 13;
pub const MSG_ARG: c_int = 14;
pub const MSG_PAYLOAD: c_int = 15;
pub const MSG_END: c_int = 16;
pub const OP_H: c_int = 17;
pub const OP_P: c_int = 18;
pub const OP_PI: c_int = 19;
pub const OP_PIN: c_int = 20;
pub const OP_PING: c_int = 21;
pub const OP_PO: c_int = 22;
pub const OP_PON: c_int = 23;
pub const OP_PONG: c_int = 24;
pub const OP_I: c_int = 25;
pub const OP_IN: c_int = 26;
pub const OP_INF: c_int = 27;
pub const OP_INFO: c_int = 28;
pub const OP_INFO_SPC: c_int = 29;
pub const INFO_ARG: c_int = 30;
pub const natsOp = c_uint;
pub extern fn natsParser_Create(newParser: [*c][*c]natsParser) natsStatus;
pub extern fn natsParser_Parse(nc: [*c]struct___natsConnection, buf: [*c]u8, bufLen: c_int) natsStatus;
pub extern fn natsParser_Destroy(parser: [*c]natsParser) void;
pub extern fn natsTimer_Create(timer: [*c][*c]natsTimer, timerCb: natsTimerCb, stopCb: natsTimerStopCb, interval: i64, closure: ?*anyopaque) natsStatus;
pub extern fn natsTimer_Stop(timer: [*c]natsTimer) void;
pub extern fn natsTimer_Reset(timer: [*c]natsTimer, interval: i64) void;
pub extern fn natsTimer_Release(t: [*c]natsTimer) void;
pub extern fn natsTimer_Destroy(timer: [*c]natsTimer) void;
pub extern fn natsUrl_Create(newUrl: [*c][*c]natsUrl, urlStr: [*c]const u8) natsStatus;
pub extern fn natsUrl_Destroy(url: [*c]natsUrl) void;
pub const struct___natsHashIter = extern struct {
    hash: [*c]natsHash = @import("std").mem.zeroes([*c]natsHash),
    current: [*c]natsHashEntry = @import("std").mem.zeroes([*c]natsHashEntry),
    next: [*c]natsHashEntry = @import("std").mem.zeroes([*c]natsHashEntry),
    currBkt: c_int = @import("std").mem.zeroes(c_int),
    started: bool = @import("std").mem.zeroes(bool),
};
pub const natsHashIter = struct___natsHashIter;
pub const struct___natsStrHashIter = extern struct {
    hash: [*c]natsStrHash = @import("std").mem.zeroes([*c]natsStrHash),
    current: [*c]natsStrHashEntry = @import("std").mem.zeroes([*c]natsStrHashEntry),
    next: [*c]natsStrHashEntry = @import("std").mem.zeroes([*c]natsStrHashEntry),
    currBkt: c_int = @import("std").mem.zeroes(c_int),
    started: bool = @import("std").mem.zeroes(bool),
};
pub const natsStrHashIter = struct___natsStrHashIter;
pub extern fn natsHash_Create(newHash: [*c][*c]natsHash, initialSize: c_int) natsStatus;
pub extern fn natsHash_Set(hash: [*c]natsHash, key: i64, data: ?*anyopaque, oldData: [*c]?*anyopaque) natsStatus;
pub extern fn natsHash_Get(hash: [*c]natsHash, key: i64) ?*anyopaque;
pub extern fn natsHash_Remove(hash: [*c]natsHash, key: i64) ?*anyopaque;
pub extern fn natsHash_RemoveSingle(hash: [*c]natsHash, key: [*c]i64, data: [*c]?*anyopaque) natsStatus;
pub extern fn natsHash_Destroy(hash: [*c]natsHash) void;
pub extern fn natsHashIter_Init(iter: [*c]natsHashIter, hash: [*c]natsHash) void;
pub extern fn natsHashIter_Next(iter: [*c]natsHashIter, key: [*c]i64, value: [*c]?*anyopaque) bool;
pub extern fn natsHashIter_RemoveCurrent(iter: [*c]natsHashIter) natsStatus;
pub extern fn natsHashIter_Done(iter: [*c]natsHashIter) void;
pub extern fn natsStrHash_Create(newHash: [*c][*c]natsStrHash, initialSize: c_int) natsStatus;
pub extern fn natsStrHash_Hash(data: [*c]const u8, dataLen: c_int) u32;
pub extern fn natsStrHash_SetEx(hash: [*c]natsStrHash, key: [*c]u8, copyKey: bool, freeKey: bool, data: ?*anyopaque, oldData: [*c]?*anyopaque) natsStatus;
pub extern fn natsStrHash_GetEx(hash: [*c]natsStrHash, key: [*c]u8, keyLen: c_int) ?*anyopaque;
pub extern fn natsStrHash_Remove(hash: [*c]natsStrHash, key: [*c]u8) ?*anyopaque;
pub extern fn natsStrHash_RemoveSingle(hash: [*c]natsStrHash, key: [*c][*c]u8, data: [*c]?*anyopaque) natsStatus;
pub extern fn natsStrHash_Destroy(hash: [*c]natsStrHash) void;
pub extern fn natsStrHashIter_Init(iter: [*c]natsStrHashIter, hash: [*c]natsStrHash) void;
pub extern fn natsStrHashIter_Next(iter: [*c]natsStrHashIter, key: [*c][*c]u8, value: [*c]?*anyopaque) bool;
pub extern fn natsStrHashIter_RemoveCurrent(iter: [*c]natsStrHashIter) natsStatus;
pub extern fn natsStrHashIter_Done(iter: [*c]natsStrHashIter) void;
pub extern fn natsSrvPool_Create(newPool: [*c][*c]natsSrvPool, opts: [*c]struct___natsOptions) natsStatus;
pub extern fn natsSrvPool_GetCurrentServer(pool: [*c]natsSrvPool, cur: [*c]const natsSrv, index: [*c]c_int) [*c]natsSrv;
pub extern fn natsSrvPool_GetNextServer(pool: [*c]natsSrvPool, opts: [*c]struct___natsOptions, cur: [*c]const natsSrv) [*c]natsSrv;
pub extern fn natsSrvPool_addNewURLs(pool: [*c]natsSrvPool, curUrl: [*c]const natsUrl, urls: [*c][*c]u8, urlCount: c_int, tlsName: [*c]const u8, added: [*c]bool) natsStatus;
pub extern fn natsSrvPool_GetServers(pool: [*c]natsSrvPool, implicitOnly: bool, servers: [*c][*c][*c]u8, count: [*c]c_int) natsStatus;
pub extern fn natsSrvPool_Destroy(pool: [*c]natsSrvPool) void;
pub extern fn natsGC_collect(item: [*c]natsGCItem) bool;
pub const struct___natsHeaderValue = extern struct {
    value: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    needFree: bool = @import("std").mem.zeroes(bool),
    next: [*c]struct___natsHeaderValue = @import("std").mem.zeroes([*c]struct___natsHeaderValue),
};
pub const natsHeaderValue = struct___natsHeaderValue;
pub extern fn natsMsgHeader_encodedLen(msg: [*c]natsMsg) c_int;
pub extern fn natsMsgHeader_encode(buf: [*c]natsBuffer, msg: [*c]natsMsg) natsStatus;
pub extern fn natsMsg_init(msg: [*c]natsMsg, subject: [*c]const u8, data: [*c]const u8, dataLen: c_int) void;
pub extern fn natsMsg_create(newMsg: [*c][*c]natsMsg, subject: [*c]const u8, subjLen: c_int, reply: [*c]const u8, replyLen: c_int, buf: [*c]const u8, bufLen: c_int, hdrLen: c_int) natsStatus;
pub extern fn natsMsg_createWithPadding(newMsg: [*c][*c]natsMsg, subject: [*c]const u8, subjLen: c_int, reply: [*c]const u8, replyLen: c_int, buf: [*c]const u8, bufLen: c_int, bufPaddingSize: c_int, hdrLen: c_int) natsStatus;
pub extern fn natsMsg_freeHeaders(msg: [*c]natsMsg) void;
pub extern fn natsMsg_free(object: ?*anyopaque) void;
pub fn nats_destroyQueuedMessages(arg_queue: [*c]natsDispatchQueue) callconv(.c) void {
    var queue = arg_queue;
    _ = &queue;
    var next: [*c]natsMsg = null;
    _ = &next;
    {
        var msg: [*c]natsMsg = queue.*.head;
        _ = &msg;
        while (msg != @as([*c]natsMsg, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) : (msg = next) {
            next = msg.*.next;
            natsMsg_Destroy(msg);
        }
    }
}
pub export fn natsSub_enqueueMessage(arg_sub: [*c]natsSubscription, arg_msg: [*c]natsMsg) void {
    var sub = arg_sub;
    _ = &sub;
    var msg = arg_msg;
    _ = &msg;
    var signal_1: bool = @as(c_int, 0) != 0;
    _ = &signal_1;
    var q: [*c]natsDispatchQueue = &sub.*.dispatcher.*.queue;
    _ = &q;
    if (q.*.head == @as([*c]natsMsg, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
        signal_1 = @as(c_int, 1) != 0;
        msg.*.next = null;
        q.*.head = msg;
    } else {
        q.*.tail.*.next = msg;
    }
    q.*.tail = msg;
    q.*.msgs += 1;
    q.*.bytes += msg.*.dataLen + msg.*.hdrLen;
    if (signal_1) {
        natsCondition_Signal(sub.*.dispatcher.*.cond);
    }
}
pub export fn natsSub_enqueueUserMessage(arg_sub: [*c]natsSubscription, arg_msg: [*c]natsMsg) natsStatus {
    var sub = arg_sub;
    _ = &sub;
    var msg = arg_msg;
    _ = &msg;
    var toQ: [*c]natsDispatchQueue = &sub.*.dispatcher.*.queue;
    _ = &toQ;
    var statsQ: [*c]natsDispatchQueue = &sub.*.ownDispatcher.queue;
    _ = &statsQ;
    var newMsgs: c_int = statsQ.*.msgs + @as(c_int, 1);
    _ = &newMsgs;
    var newBytes: c_int = statsQ.*.bytes + (msg.*.dataLen + msg.*.hdrLen);
    _ = &newBytes;
    msg.*.sub = sub;
    if (((sub.*.msgsLimit > @as(c_int, 0)) and (newMsgs > sub.*.msgsLimit)) or ((sub.*.bytesLimit > @as(c_int, 0)) and (newBytes > sub.*.bytesLimit))) {
        return @as(c_uint, @bitCast(NATS_SLOW_CONSUMER));
    }
    sub.*.slowConsumer = @as(c_int, 0) != 0;
    if (newMsgs > sub.*.msgsMax) {
        sub.*.msgsMax = newMsgs;
    }
    if (newBytes > sub.*.bytesMax) {
        sub.*.bytesMax = newBytes;
    }
    if (sub.*.jsi != @as([*c]jsSub, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
        if (sub.*.jsi.*.ackNone) {
            _ = blk: {
                const ref = &msg.*.flags;
                ref.* |= @as(c_int, 1) << @intCast(1);
                break :blk ref.*;
            };
        }
        if (sub.*.jsi.*.fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
            var isUserMessage: bool = @as(c_int, 0) != 0;
            _ = &isUserMessage;
            _ = js_checkFetchedMsg(sub, msg, @as(u64, @bitCast(@as(c_long, @as(c_int, 0)))), @as(c_int, 0) != 0, &isUserMessage);
            if (isUserMessage) {
                sub.*.jsi.*.fetch.*.receivedMsgs += 1;
                sub.*.jsi.*.fetch.*.receivedBytes += @as(i64, @bitCast(@as(c_long, msg.*.dataLen + msg.*.hdrLen)));
            }
        }
    }
    if (toQ != statsQ) {
        statsQ.*.msgs += 1;
        statsQ.*.bytes += msg.*.dataLen + msg.*.hdrLen;
    }
    natsSub_enqueueMessage(sub, msg);
    return @as(c_uint, @bitCast(NATS_OK));
}
pub const ASYNC_CLOSED: c_int = 0;
pub const ASYNC_DISCONNECTED: c_int = 1;
pub const ASYNC_RECONNECTED: c_int = 2;
pub const ASYNC_ERROR: c_int = 3;
pub const ASYNC_DISCOVERED_SERVERS: c_int = 4;
pub const ASYNC_CONNECTED: c_int = 5;
pub const ASYNC_LAME_DUCK_MODE: c_int = 6;
pub const natsAsyncCbType = c_uint;
pub const struct___natsAsyncCbInfo = extern struct {
    type: natsAsyncCbType = @import("std").mem.zeroes(natsAsyncCbType),
    nc: [*c]struct___natsConnection = @import("std").mem.zeroes([*c]struct___natsConnection),
    sub: [*c]struct___natsSubscription = @import("std").mem.zeroes([*c]struct___natsSubscription),
    err: natsStatus = @import("std").mem.zeroes(natsStatus),
    errTxt: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    next: [*c]struct___natsAsyncCbInfo = @import("std").mem.zeroes([*c]struct___natsAsyncCbInfo),
};
pub const natsAsyncCbInfo = struct___natsAsyncCbInfo;
pub extern fn natsAsyncCb_PostConnHandler(nc: [*c]struct___natsConnection, @"type": natsAsyncCbType) void;
pub extern fn natsAsyncCb_PostErrHandler(nc: [*c]struct___natsConnection, sub: [*c]struct___natsSubscription, err: natsStatus, errTxt: [*c]u8) void;
pub extern fn natsAsyncCb_Destroy(info: [*c]natsAsyncCbInfo) void;
pub extern fn natsDeadline_Init(deadline: [*c]natsDeadline, timeout: i64) void;
pub extern fn natsDeadline_GetTimeout(deadline: [*c]natsDeadline) c_int;
pub extern fn natsDeadline_Clear(deadline: [*c]natsDeadline) void;
pub extern fn nats_setTargetTime(timeout: i64) i64;
pub extern fn natsNUID_init() natsStatus;
pub extern fn natsNUID_Next(buffer: [*c]u8, bufferLen: c_int) natsStatus;
pub extern fn nats_Rand64() i64;
pub extern fn natsNUID_free() void;
pub fn nats_StringEquals(arg_s1: [*c]const u8, arg_s2: [*c]const u8) callconv(.c) bool {
    var s1 = arg_s1;
    _ = &s1;
    var s2 = arg_s2;
    _ = &s2;
    if (s1 == @as([*c]const u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) return s2 == @as([*c]const u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))));
    if (s2 == @as([*c]const u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) return @as(c_int, 0) != 0;
    return strcmp(s1, s2) != 0;
}
pub extern var gLockSpinCount: i64;
pub const natsInitOnceCb = ?*const fn () callconv(.c) void;
pub const struct___natsControl = extern struct {
    op: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    args: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const natsControl = struct___natsControl;
pub const natsEvLoopCallbacks = extern struct {
    attach: natsEvLoop_Attach = @import("std").mem.zeroes(natsEvLoop_Attach),
    read: natsEvLoop_ReadAddRemove = @import("std").mem.zeroes(natsEvLoop_ReadAddRemove),
    write: natsEvLoop_WriteAddRemove = @import("std").mem.zeroes(natsEvLoop_WriteAddRemove),
    detach: natsEvLoop_Detach = @import("std").mem.zeroes(natsEvLoop_Detach),
};
pub const userCreds = struct___userCreds;
pub extern fn nats_sslRegisterThreadForCleanup() void;
pub extern fn nats_setNATSThreadKey() void;
pub const natsThreadCb = ?*const fn (?*anyopaque) callconv(.c) void;
pub extern fn natsThread_Create(t: [*c][*c]natsThread, cb: natsThreadCb, arg: ?*anyopaque) natsStatus;
pub extern fn natsThread_IsCurrent(t: [*c]natsThread) bool;
pub extern fn natsThread_Join(t: [*c]natsThread) void;
pub extern fn natsThread_Detach(t: [*c]natsThread) void;
pub extern fn natsThread_Yield() void;
pub extern fn natsThread_Destroy(t: [*c]natsThread) void;
pub extern fn natsThreadLocal_CreateKey(tl: [*c]natsThreadLocal, destructor: ?*const fn (?*anyopaque) callconv(.c) void) natsStatus;
pub extern fn natsThreadLocal_Get(tl: natsThreadLocal) ?*anyopaque;
pub extern fn natsThreadLocal_SetEx(tl: natsThreadLocal, value: ?*const anyopaque, setErr: bool) natsStatus;
pub extern fn natsThreadLocal_DestroyKey(tl: natsThreadLocal) void;
pub extern fn nats_InitOnce(control: [*c]natsInitOnceType, cb: natsInitOnceCb) bool;
pub extern fn natsCondition_Create(cond: [*c][*c]natsCondition) natsStatus;
pub extern fn natsCondition_Wait(cond: [*c]natsCondition, mutex: [*c]natsMutex) void;
pub extern fn natsCondition_TimedWait(cond: [*c]natsCondition, mutex: [*c]natsMutex, timeout: i64) natsStatus;
pub extern fn natsCondition_AbsoluteTimedWait(cond: [*c]natsCondition, mutex: [*c]natsMutex, absoluteTime: i64) natsStatus;
pub extern fn natsCondition_Signal(cond: [*c]natsCondition) void;
pub extern fn natsCondition_Broadcast(cond: [*c]natsCondition) void;
pub extern fn natsCondition_Destroy(cond: [*c]natsCondition) void;
pub extern fn natsMutex_Create(newMutex: [*c][*c]natsMutex) natsStatus;
pub extern fn natsMutex_Lock(m: [*c]natsMutex) void;
pub extern fn natsMutex_TryLock(m: [*c]natsMutex) bool;
pub extern fn natsMutex_Unlock(m: [*c]natsMutex) void;
pub extern fn natsMutex_Destroy(m: [*c]natsMutex) void;
pub extern fn jsSub_free(sub: [*c]jsSub) void;
pub extern fn jsSub_deleteConsumer(sub: [*c]natsSubscription) natsStatus;
pub extern fn jsSub_deleteConsumerAfterDrain(sub: [*c]natsSubscription) void;
pub extern fn jsSub_trackSequences(jsi: [*c]jsSub, reply: [*c]const u8) natsStatus;
pub extern fn jsSub_processSequenceMismatch(sub: [*c]natsSubscription, msg: [*c]natsMsg, sm: [*c]bool) natsStatus;
pub extern fn jsSub_checkForFlowControlResponse(sub: [*c]natsSubscription) [*c]u8;
pub extern fn jsSub_scheduleFlowControlResponse(jsi: [*c]jsSub, reply: [*c]const u8) natsStatus;
pub extern fn jsSub_checkOrderedMsg(sub: [*c]natsSubscription, msg: [*c]natsMsg, reset: [*c]bool) natsStatus;
pub extern fn jsSub_resetOrderedConsumer(sub: [*c]natsSubscription, sseq: u64) natsStatus;
pub extern fn natsMsg_isJSCtrl(msg: [*c]natsMsg, ctrlType: [*c]c_int) bool;
pub fn nats_lockDispatcher(arg_d: [*c]natsDispatcher) callconv(.c) void {
    var d = arg_d;
    _ = &d;
    if (d.*.mu != @as([*c]natsMutex, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
        natsMutex_Lock(d.*.mu);
    }
}
pub fn nats_unlockDispatcher(arg_d: [*c]natsDispatcher) callconv(.c) void {
    var d = arg_d;
    _ = &d;
    if (d.*.mu != @as([*c]natsMutex, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
        natsMutex_Unlock(d.*.mu);
    }
}
pub export fn nats_dispatchThreadPool(arg_arg: ?*anyopaque) void {
    var arg = arg_arg;
    _ = &arg;
    var d: [*c]natsDispatcher = @as([*c]natsDispatcher, @ptrCast(@alignCast(arg)));
    _ = &d;
    nats_lockDispatcher(d);
    while (true) {
        var msg: [*c]natsMsg = null;
        _ = &msg;
        var fcReply: [*c]u8 = null;
        _ = &fcReply;
        var timerNeedReset: bool = @as(c_int, 0) != 0;
        _ = &timerNeedReset;
        var userMsg: bool = @as(c_int, 1) != 0;
        _ = &userMsg;
        var timeout: bool = @as(c_int, 0) != 0;
        _ = &timeout;
        var overLimit: bool = @as(c_int, 0) != 0;
        _ = &overLimit;
        var lastMessageInSub: bool = @as(c_int, 0) != 0;
        _ = &lastMessageInSub;
        var lastMessageInFetch: bool = @as(c_int, 0) != 0;
        _ = &lastMessageInFetch;
        var fetchStatus: natsStatus = @as(c_uint, @bitCast(NATS_OK));
        _ = &fetchStatus;
        while (((blk: {
            const tmp = d.*.queue.head;
            msg = tmp;
            break :blk tmp;
        }) == @as([*c]natsMsg, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and !d.*.shutdown) {
            natsCondition_Wait(d.*.cond, d.*.mu);
        }
        if ((msg == @as([*c]natsMsg, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and (@as(c_int, @intFromBool(d.*.shutdown)) != 0)) {
            break;
        }
        _removeHeadMsg(d, msg);
        var sub: [*c]natsSubscription = msg.*.sub;
        _ = &sub;
        var nc: [*c]natsConnection = sub.*.conn;
        _ = &nc;
        var jsi: [*c]jsSub = sub.*.jsi;
        _ = &jsi;
        var fetch: [*c]jsFetch = if (jsi != @as([*c]jsSub, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) jsi.*.fetch else null;
        _ = &fetch;
        var messageCB: natsMsgHandler = sub.*.msgCb;
        _ = &messageCB;
        var messageClosure: ?*anyopaque = sub.*.msgCbClosure;
        _ = &messageClosure;
        var completeCB: natsOnCompleteCB = sub.*.onCompleteCB;
        _ = &completeCB;
        var completeCBClosure: ?*anyopaque = sub.*.onCompleteCBClosure;
        _ = &completeCBClosure;
        var ctrl: [*c]natsSubscriptionControlMessages = sub.*.control;
        _ = &ctrl;
        var draining: bool = sub.*.draining;
        _ = &draining;
        var connClosed: bool = sub.*.connClosed;
        _ = &connClosed;
        fetchStatus = _preProcessUserMessage(sub, jsi, fetch, msg, &userMsg, &overLimit, &lastMessageInSub, &lastMessageInFetch, &fcReply);
        timerNeedReset = @as(c_int, 0) != 0;
        if ((@as(c_int, @intFromBool(userMsg)) != 0) or (msg == sub.*.control.*.sub.timeout)) {
            sub.*.timeoutSuspended = @as(c_int, 1) != 0;
            if ((!sub.*.draining and !sub.*.closed) and (sub.*.timeout > @as(i64, @bitCast(@as(c_long, @as(c_int, 0)))))) if ((@as(c_int, @intFromBool(timeout)) != 0) or (sub.*.ownDispatcher.queue.msgs == @as(c_int, 0))) {
                timerNeedReset = @as(c_int, 1) != 0;
            };
        }
        if (msg == ctrl.*.sub.drain) {
            nats_unlockDispatcher(d);
            natsSub_setDrainCompleteState(sub);
            natsConn_removeSubscription(nc, sub);
            nats_lockDispatcher(d);
            continue;
        } else if (msg == ctrl.*.sub.close) {
            nats_unlockDispatcher(d);
            natsSub_setDrainCompleteState(sub);
            if ((fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and (fetch.*.opts.CompleteHandler != @as(jsFetchCompleteHandler, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))))) {
                fetchStatus = fetch.*.status;
                if ((fetchStatus == @as(c_uint, @bitCast(NATS_OK))) and (@as(c_int, @intFromBool(connClosed)) != 0)) {
                    fetchStatus = @as(c_uint, @bitCast(NATS_CONNECTION_CLOSED));
                }
                fetch.*.opts.CompleteHandler.?(nc, sub, fetchStatus, fetch.*.opts.CompleteHandlerClosure);
            }
            if (completeCB != @as(natsOnCompleteCB, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
                completeCB.?(completeCBClosure);
            }
            natsSub_release(sub);
            nats_lockDispatcher(d);
            continue;
        } else if (msg == ctrl.*.sub.timeout) {
            nats_unlockDispatcher(d);
            messageCB.?(nc, sub, null, messageClosure);
            nats_lockDispatcher(d);
            if (!sub.*.draining and !sub.*.closed) {
                sub.*.timedOut = @as(c_int, 0) != 0;
                natsTimer_Reset(sub.*.timeoutTimer, sub.*.timeout);
            }
            continue;
        } else if ((fetchStatus != @as(c_uint, @bitCast(NATS_OK))) and !lastMessageInFetch) {
            fetch.*.status = fetchStatus;
            nats_unlockDispatcher(d);
            _ = natsSubscription_Unsubscribe(sub);
            natsMsg_Destroy(msg);
            nats_lockDispatcher(d);
            continue;
        } else if (((fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and (fetchStatus == @as(c_uint, @bitCast(NATS_OK)))) and !userMsg) {
            jsi.*.active = @as(c_int, 1) != 0;
            natsMsg_Destroy(msg);
            continue;
        } else if ((((@as(c_int, @intFromBool(sub.*.closed)) != 0) or (msg.*.sub == @as([*c]struct___natsSubscription, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))))) or (msg.*.subject == @as([*c]const u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))))) or (strcmp(msg.*.subject, "") == @as(c_int, 0))) {
            natsMsg_Destroy(msg);
            continue;
        }
        if (!sub.*.draining and (sub.*.timeout != @as(i64, @bitCast(@as(c_long, @as(c_int, 0)))))) {
            sub.*.timeoutSuspended = @as(c_int, 1) != 0;
            if (sub.*.ownDispatcher.queue.msgs == @as(c_int, 0)) {
                timerNeedReset = @as(c_int, 1) != 0;
            }
        }
        if (lastMessageInFetch) {
            fetch.*.status = fetchStatus;
        }
        nats_unlockDispatcher(d);
        if (!overLimit) {
            messageCB.?(nc, sub, msg, messageClosure);
        } else {
            natsMsg_Destroy(msg);
        }
        if (((fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and !lastMessageInFetch) and !draining) {
            fetch.*.status = js_maybeFetchMore(sub, fetch);
            if (fetch.*.status != @as(c_uint, @bitCast(NATS_OK))) {
                _ = natsSubscription_Drain(sub);
            }
        }
        if (fcReply != @as([*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
            _ = natsConnection_Publish(nc, fcReply, null, @as(c_int, 0));
            free(@as(?*anyopaque, @ptrCast(fcReply)));
        }
        if ((@as(c_int, @intFromBool(lastMessageInFetch)) != 0) or (@as(c_int, @intFromBool(lastMessageInSub)) != 0)) {
            natsSub_setDrainCompleteState(sub);
            if (lastMessageInFetch) {
                _ = natsSubscription_Unsubscribe(sub);
            } else {
                natsConn_removeSubscription(nc, sub);
            }
        }
        nats_lockDispatcher(d);
        if ((!sub.*.closed and (sub.*.timeout != @as(i64, @bitCast(@as(c_long, @as(c_int, 0)))))) and (@as(c_int, @intFromBool(timerNeedReset)) != 0)) {
            timerNeedReset = @as(c_int, 0) != 0;
            sub.*.timeoutSuspended = @as(c_int, 0) != 0;
            natsTimer_Reset(sub.*.timeoutTimer, sub.*.timeout);
        }
    }
    nats_destroyQueuedMessages(&d.*.queue);
    nats_unlockDispatcher(d);
    natsLib_Release();
}
pub export fn nats_dispatchThreadOwn(arg_arg: ?*anyopaque) void {
    var arg = arg_arg;
    _ = &arg;
    var sub: [*c]natsSubscription = @as([*c]natsSubscription, @ptrCast(@alignCast(arg)));
    _ = &sub;
    var rmSub: bool = @as(c_int, 0) != 0;
    _ = &rmSub;
    var unsub: bool = @as(c_int, 0) != 0;
    _ = &unsub;
    var connClosed: bool = @as(c_int, 0) != 0;
    _ = &connClosed;
    var nc: [*c]natsConnection = sub.*.conn;
    _ = &nc;
    var messageCB: natsMsgHandler = sub.*.msgCb;
    _ = &messageCB;
    var messageClosure: ?*anyopaque = sub.*.msgCbClosure;
    _ = &messageClosure;
    var completeCB: natsOnCompleteCB = null;
    _ = &completeCB;
    var completeCBClosure: ?*anyopaque = @as(?*anyopaque, @ptrFromInt(@as(c_int, 0)));
    _ = &completeCBClosure;
    var fetch: [*c]jsFetch = null;
    _ = &fetch;
    _ = natsMutex_Lock(nc.*.mu);
    _ = natsMutex_Unlock(nc.*.mu);
    while (true) {
        var s: natsStatus = @as(c_uint, @bitCast(NATS_OK));
        _ = &s;
        var msg: [*c]natsMsg = null;
        _ = &msg;
        var userMsg: bool = @as(c_int, 1) != 0;
        _ = &userMsg;
        var overLimit: bool = @as(c_int, 0) != 0;
        _ = &overLimit;
        var lastMessageInSub: bool = @as(c_int, 0) != 0;
        _ = &lastMessageInSub;
        var lastMessageInFetch: bool = @as(c_int, 0) != 0;
        _ = &lastMessageInFetch;
        natsSub_Lock(sub);
        var timeout: i64 = sub.*.timeout;
        _ = &timeout;
        while (((((blk: {
            const tmp = sub.*.ownDispatcher.queue.head;
            msg = tmp;
            break :blk tmp;
        }) == @as([*c]natsMsg, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and !sub.*.closed) and !sub.*.draining) and (s != @as(c_uint, @bitCast(NATS_TIMEOUT)))) {
            if (timeout != @as(i64, @bitCast(@as(c_long, @as(c_int, 0))))) {
                s = natsCondition_TimedWait(sub.*.ownDispatcher.cond, sub.*.mu, timeout);
            } else {
                natsCondition_Wait(sub.*.ownDispatcher.cond, sub.*.mu);
            }
        }
        var draining: bool = sub.*.draining;
        _ = &draining;
        completeCB = sub.*.onCompleteCB;
        completeCBClosure = sub.*.onCompleteCBClosure;
        var jsi: [*c]jsSub = sub.*.jsi;
        _ = &jsi;
        connClosed = sub.*.connClosed;
        fetch = if (jsi != @as([*c]jsSub, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) jsi.*.fetch else null;
        if (sub.*.closed) {
            natsSub_Unlock(sub);
            break;
        }
        if (msg == @as([*c]natsMsg, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
            natsSub_Unlock(sub);
            if (draining) {
                rmSub = @as(c_int, 1) != 0;
                break;
            }
            if (s == @as(c_uint, @bitCast(NATS_TIMEOUT))) {
                messageCB.?(nc, sub, null, messageClosure);
            }
            continue;
        }
        _removeHeadMsg(&sub.*.ownDispatcher, msg);
        var fcReply: [*c]u8 = null;
        _ = &fcReply;
        var fetchStatus: natsStatus = _preProcessUserMessage(sub, jsi, fetch, msg, &userMsg, &overLimit, &lastMessageInSub, &lastMessageInFetch, &fcReply);
        _ = &fetchStatus;
        if ((fetchStatus != @as(c_uint, @bitCast(NATS_OK))) and !lastMessageInFetch) {
            fetch.*.status = fetchStatus;
            natsSub_Unlock(sub);
            natsMsg_Destroy(msg);
            unsub = @as(c_int, 1) != 0;
            break;
        } else if (((fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and (fetchStatus == @as(c_uint, @bitCast(NATS_OK)))) and !userMsg) {
            jsi.*.active = @as(c_int, 1) != 0;
            natsSub_Unlock(sub);
            natsMsg_Destroy(msg);
            continue;
        }
        if (lastMessageInFetch) {
            fetch.*.status = fetchStatus;
        }
        natsSub_Unlock(sub);
        if (!overLimit) {
            messageCB.?(nc, sub, msg, messageClosure);
        } else {
            natsMsg_Destroy(msg);
        }
        if (((fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and !lastMessageInFetch) and !draining) {
            fetch.*.status = js_maybeFetchMore(sub, fetch);
            if (fetch.*.status != @as(c_uint, @bitCast(NATS_OK))) {
                _ = natsSubscription_Drain(sub);
            }
        }
        if (fcReply != @as([*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
            _ = natsConnection_Publish(nc, fcReply, null, @as(c_int, 0));
            free(@as(?*anyopaque, @ptrCast(fcReply)));
        }
        if (lastMessageInFetch) {
            unsub = @as(c_int, 1) != 0;
            break;
        }
        if (lastMessageInSub) {
            rmSub = @as(c_int, 1) != 0;
            break;
        }
    }
    natsSub_setDrainCompleteState(sub);
    if (unsub) {
        _ = natsSubscription_Unsubscribe(sub);
    } else if (rmSub) {
        natsConn_removeSubscription(nc, sub);
    }
    if ((fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and (fetch.*.opts.CompleteHandler != @as(jsFetchCompleteHandler, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))))) {
        var fetchStatus: natsStatus = fetch.*.status;
        _ = &fetchStatus;
        if ((fetchStatus == @as(c_uint, @bitCast(NATS_OK))) and (@as(c_int, @intFromBool(connClosed)) != 0)) {
            fetchStatus = @as(c_uint, @bitCast(NATS_CONNECTION_CLOSED));
        }
        fetch.*.opts.CompleteHandler.?(nc, sub, fetchStatus, fetch.*.opts.CompleteHandlerClosure);
    }
    if (completeCB != @as(natsOnCompleteCB, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) {
        completeCB.?(completeCBClosure);
    }
    natsSub_release(sub);
}
pub fn NATS_FREE_STRINGS(arg_strings: [*c][*c]u8, arg_count: c_int) callconv(.c) void {
    var strings = arg_strings;
    _ = &strings;
    var count = arg_count;
    _ = &count;
    if (strings == @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) return;
    {
        var i: c_int = 0;
        _ = &i;
        while (i < count) : (i += 1) {
            free(@as(?*anyopaque, @ptrCast((blk: {
                const tmp = i;
                if (tmp >= 0) break :blk strings + @as(usize, @intCast(tmp)) else break :blk strings - ~@as(usize, @bitCast(@as(isize, @intCast(tmp)) +% -1));
            }).*)));
        }
    }
}
pub extern fn natsConn_create(newConn: [*c][*c]natsConnection, options: [*c]natsOptions) natsStatus;
pub extern fn natsConn_retain(nc: [*c]natsConnection) void;
pub extern fn natsConn_release(nc: [*c]natsConnection) void;
pub extern fn natsConn_bufferWrite(nc: [*c]natsConnection, buffer: [*c]const u8, len: c_int) natsStatus;
pub extern fn natsConn_bufferFlush(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConn_isClosed(nc: [*c]natsConnection) bool;
pub extern fn natsConn_isReconnecting(nc: [*c]natsConnection) bool;
pub extern fn natsConn_flushOrKickFlusher(nc: [*c]natsConnection) natsStatus;
pub extern fn natsConn_processMsg(nc: [*c]natsConnection, buf: [*c]u8, bufLen: c_int) natsStatus;
pub extern fn natsConn_processOK(nc: [*c]natsConnection) void;
pub extern fn natsConn_processErr(nc: [*c]natsConnection, buf: [*c]u8, bufLen: c_int) void;
pub extern fn natsConn_processPing(nc: [*c]natsConnection) void;
pub extern fn natsConn_processPong(nc: [*c]natsConnection) void;
pub extern fn natsConn_subscribeImpl(newSub: [*c][*c]natsSubscription, nc: [*c]natsConnection, lock: bool, subj: [*c]const u8, queue: [*c]const u8, timeout: i64, cb: natsMsgHandler, cbClosure: ?*anyopaque, preventUseOfLibDlvPool: bool, jsi: [*c]jsSub) natsStatus;
pub extern fn natsConn_unsubscribe(nc: [*c]natsConnection, sub: [*c]natsSubscription, max: c_int, drainMode: bool, timeout: i64) natsStatus;
pub extern fn natsConn_enqueueUnsubProto(nc: [*c]natsConnection, sid: i64) natsStatus;
pub extern fn natsConn_drainSub(nc: [*c]natsConnection, sub: [*c]natsSubscription, checkConnDrainStatus: bool) natsStatus;
pub extern fn natsConn_isDraining(nc: [*c]natsConnection) bool;
pub extern fn natsConn_isDrainingPubs(nc: [*c]natsConnection) bool;
pub extern fn natsConn_removeSubscription(nc: [*c]natsConnection, sub: [*c]natsSubscription) void;
pub extern fn natsConn_processAsyncINFO(nc: [*c]natsConnection, buf: [*c]u8, len: c_int) void;
pub extern fn natsConn_addRespInfo(newResp: [*c][*c]respInfo, nc: [*c]natsConnection, respInbox: [*c]u8, respInboxSize: c_int) natsStatus;
pub extern fn natsConn_disposeRespInfo(nc: [*c]natsConnection, resp: [*c]respInfo, needsLock: bool) void;
pub extern fn natsConn_initResp(nc: [*c]natsConnection, cb: natsMsgHandler) natsStatus;
pub extern fn natsConn_destroyRespPool(nc: [*c]natsConnection) void;
pub extern fn natsConn_publish(nc: [*c]natsConnection, msg: [*c]natsMsg, reply: [*c]const u8, directFlush: bool) natsStatus;
pub extern fn natsConn_userCreds(userJWT: [*c][*c]u8, customErrTxt: [*c][*c]u8, closure: ?*anyopaque) natsStatus;
pub extern fn natsConn_signatureHandler(customErrTxt: [*c][*c]u8, sig: [*c][*c]u8, sigLen: [*c]c_int, nonce: [*c]const u8, closure: ?*anyopaque) natsStatus;
pub extern fn natsConn_sendSubProto(nc: [*c]natsConnection, subject: [*c]const u8, queue: [*c]const u8, sid: i64) natsStatus;
pub extern fn natsConn_sendUnsubProto(nc: [*c]natsConnection, subId: i64, max: c_int) natsStatus;
pub extern fn natsConn_setFilterWithClosure(nc: [*c]natsConnection, f: natsMsgFilter, closure: ?*anyopaque) void;
pub extern fn natsConn_initInbox(nc: [*c]natsConnection, buf: [*c]u8, bufSize: c_int, newInbox: [*c][*c]u8, allocated: [*c]bool) natsStatus;
pub extern fn natsConn_newInbox(nc: [*c]natsConnection, newInbox: [*c][*c]natsInbox) natsStatus;
pub extern fn natsConn_srvVersionAtLeast(nc: [*c]natsConnection, major: c_int, minor: c_int, update: c_int) bool;
pub extern fn natsConn_defaultErrHandler(nc: [*c]natsConnection, sub: [*c]natsSubscription, err: natsStatus, closure: ?*anyopaque) void;
pub extern fn natsConn_close(nc: [*c]natsConnection) void;
pub extern fn natsConn_destroy(nc: [*c]natsConnection, fromPublicDestroy: bool) void;
pub extern var testDrainAutoUnsubRace: bool;
pub fn natsSub_Lock(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsMutex_Lock(sub.*.mu);
}
pub fn natsSub_Unlock(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsMutex_Unlock(sub.*.mu);
}
pub fn natsSub_lockRetain(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsSub_Lock(sub);
    sub.*.refs += 1;
}
pub extern fn natsSub_unlockRelease(sub: [*c]natsSubscription) void;
pub fn natsSub_retain(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsSub_lockRetain(sub);
    natsSub_Unlock(sub);
}
pub extern fn natsSub_release(sub: [*c]natsSubscription) void;
pub fn natsSub_lockDispatcher(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    if (sub.*.dispatcher != (&sub.*.ownDispatcher)) {
        nats_lockDispatcher(sub.*.dispatcher);
    }
}
pub fn natsSub_unlockDispatcher(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    if (sub.*.dispatcher != (&sub.*.ownDispatcher)) {
        nats_unlockDispatcher(sub.*.dispatcher);
    }
}
pub fn nats_lockSubAndDispatcher(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsSub_Lock(sub);
    natsSub_lockDispatcher(sub);
}
pub fn nats_unlockSubAndDispatcher(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsSub_unlockDispatcher(sub);
    natsSub_Unlock(sub);
}
pub fn nats_lockRetainSubAndDispatcher(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsSub_lockRetain(sub);
    natsSub_lockDispatcher(sub);
}
pub fn nats_unlockReleaseSubAndDispatcher(arg_sub: [*c]natsSubscription) callconv(.c) void {
    var sub = arg_sub;
    _ = &sub;
    natsSub_unlockDispatcher(sub);
    natsSub_unlockRelease(sub);
}
pub extern fn natsSub_create(newSub: [*c][*c]natsSubscription, nc: [*c]natsConnection, subj: [*c]const u8, queueGroup: [*c]const u8, timeout: i64, cb: natsMsgHandler, cbClosure: ?*anyopaque, noLibDlvPool: bool, jsi: [*c]jsSub) natsStatus;
pub extern fn natsSub_setMax(sub: [*c]natsSubscription, max: u64) bool;
pub extern fn natsSub_initDrain(sub: [*c]natsSubscription) void;
pub extern fn natsSub_startDrain(sub: [*c]natsSubscription, timeout: i64) natsStatus;
pub extern fn natsSub_setDrainCompleteState(sub: [*c]natsSubscription) void;
pub extern fn natsSub_setDrainSkip(sub: [*c]natsSubscription, s: natsStatus) void;
pub extern fn natsSub_updateDrainStatus(sub: [*c]natsSubscription, s: natsStatus) void;
pub extern fn natsSub_drain(sub: [*c]natsSubscription) void;
pub extern fn natsSub_nextMsg(nextMsg: [*c][*c]natsMsg, sub: [*c]natsSubscription, timeout: i64, pullSubInternal: bool) natsStatus;
pub extern fn natsSub_close(sub: [*c]natsSubscription, connectionClosed: bool) void;
pub extern fn nats_createControlMessages(sub: [*c]natsSubscription) natsStatus;
pub extern var jsonMaxNested: c_int;
pub const nats_JSONArray = extern struct {
    values: [*c]?*anyopaque = @import("std").mem.zeroes([*c]?*anyopaque),
    typ: c_int = @import("std").mem.zeroes(c_int),
    eltSize: c_int = @import("std").mem.zeroes(c_int),
    size: c_int = @import("std").mem.zeroes(c_int),
    cap: c_int = @import("std").mem.zeroes(c_int),
};
pub const nats_JSON = extern struct {
    str: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    fields: [*c]natsStrHash = @import("std").mem.zeroes([*c]natsStrHash),
};
const union_unnamed_75 = extern union {
    vstr: [*c]u8,
    vbool: bool,
    vuint: u64,
    vint: i64,
    vdec: c_longdouble,
    varr: [*c]nats_JSONArray,
    vobj: [*c]nats_JSON,
};
pub const nats_JSONField = extern struct {
    name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    typ: c_int = @import("std").mem.zeroes(c_int),
    value: union_unnamed_75 = @import("std").mem.zeroes(union_unnamed_75),
    numTyp: c_int = @import("std").mem.zeroes(c_int),
};
pub const jsonRangeCB = ?*const fn (?*anyopaque, [*c]const u8, [*c]nats_JSONField) callconv(.c) natsStatus;
pub extern fn nats_ParseInt64(d: [*c]const u8, dLen: c_int) i64;
pub extern fn nats_Trim(pres: [*c][*c]u8, s: [*c]const u8) natsStatus;
pub extern fn nats_ParseControl(control: [*c]natsControl, line: [*c]const u8) natsStatus;
pub extern fn nats_CreateStringFromBuffer(newStr: [*c][*c]u8, buf: [*c]natsBuffer) natsStatus;
pub extern fn nats_GetBoolStr(value: bool) [*c]const u8;
pub extern fn nats_NormalizeErr(@"error": [*c]u8) void;
pub extern fn nats_JSONParse(json: [*c][*c]nats_JSON, str: [*c]const u8, strLen: c_int) natsStatus;
pub extern fn nats_JSONGetField(json: [*c]nats_JSON, fieldName: [*c]const u8, fieldType: c_int, retField: [*c][*c]nats_JSONField) natsStatus;
pub extern fn nats_JSONGetStr(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c][*c]u8) natsStatus;
pub extern fn nats_JSONGetStrPtr(json: [*c]nats_JSON, fieldName: [*c]const u8, str: [*c][*c]const u8) natsStatus;
pub extern fn nats_JSONGetBytes(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c][*c]u8, len: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetInt(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetInt32(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c]i32) natsStatus;
pub extern fn nats_JSONGetUInt16(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c]u16) natsStatus;
pub extern fn nats_JSONGetBool(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c]bool) natsStatus;
pub extern fn nats_JSONGetLong(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c]i64) natsStatus;
pub extern fn nats_JSONGetULong(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c]u64) natsStatus;
pub extern fn nats_JSONGetDouble(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c]c_longdouble) natsStatus;
pub extern fn nats_JSONGetObject(json: [*c]nats_JSON, fieldName: [*c]const u8, value: [*c][*c]nats_JSON) natsStatus;
pub extern fn nats_JSONGetTime(json: [*c]nats_JSON, fieldName: [*c]const u8, timeUTC: [*c]i64) natsStatus;
pub extern fn nats_JSONGetArrayField(json: [*c]nats_JSON, fieldName: [*c]const u8, fieldType: c_int, retField: [*c][*c]nats_JSONField) natsStatus;
pub extern fn nats_JSONArrayAsStrings(arr: [*c]nats_JSONArray, array: [*c][*c][*c]u8, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayStr(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c][*c]u8, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONArrayAsBools(arr: [*c]nats_JSONArray, array: [*c][*c]bool, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayBool(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c]bool, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONArrayAsDoubles(arr: [*c]nats_JSONArray, array: [*c][*c]c_longdouble, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayDouble(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c]c_longdouble, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONArrayAsInts(arr: [*c]nats_JSONArray, array: [*c][*c]c_int, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayInt(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c]c_int, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONArrayAsLongs(arr: [*c]nats_JSONArray, array: [*c][*c]i64, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayLong(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c]i64, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONArrayAsULongs(arr: [*c]nats_JSONArray, array: [*c][*c]u64, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayULong(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c]u64, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONArrayAsObjects(arr: [*c]nats_JSONArray, array: [*c][*c][*c]nats_JSON, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayObject(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c][*c]nats_JSON, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONArrayAsArrays(arr: [*c]nats_JSONArray, array: [*c][*c][*c]nats_JSONArray, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONGetArrayArray(json: [*c]nats_JSON, fieldName: [*c]const u8, array: [*c][*c][*c]nats_JSONArray, arraySize: [*c]c_int) natsStatus;
pub extern fn nats_JSONRange(json: [*c]nats_JSON, expectedType: c_int, expectedNumType: c_int, cb: jsonRangeCB, userInfo: ?*anyopaque) natsStatus;
pub extern fn nats_JSONDestroy(json: [*c]nats_JSON) void;
pub extern fn nats_EncodeTimeUTC(buf: [*c]u8, bufLen: usize, timeUTC: i64) natsStatus;
pub extern fn nats_Base32_Init() void;
pub extern fn nats_Base32_DecodeString(src: [*c]const u8, dst: [*c]u8, dstMax: c_int, dstLen: [*c]c_int) natsStatus;
pub extern fn nats_Base64RawURL_EncodeString(src: [*c]const u8, srcLen: c_int, pDest: [*c][*c]u8) natsStatus;
pub extern fn nats_Base64_Encode(src: [*c]const u8, srcLen: c_int, pDest: [*c][*c]u8) natsStatus;
pub extern fn nats_Base64_DecodeLen(src: [*c]const u8, srcLen: [*c]c_int, dstLen: [*c]c_int) natsStatus;
pub extern fn nats_Base64_DecodeInPlace(src: [*c]const u8, l: c_int, dst: [*c]u8) void;
pub extern fn nats_Base64_Decode(src: [*c]const u8, dst: [*c][*c]u8, dstLen: [*c]c_int) natsStatus;
pub extern fn nats_CRC16_Compute(data: [*c]u8, len: c_int) u16;
pub extern fn nats_CRC16_Validate(data: [*c]u8, len: c_int, expected: u16) bool;
pub extern fn nats_ReadFile(buffer: [*c][*c]natsBuffer, initBufSize: c_int, @"fn": [*c]const u8) natsStatus;
pub extern fn nats_HostIsIP(host: [*c]const u8) bool;
pub extern fn nats_GetJWTOrSeed(val: [*c][*c]u8, content: [*c]const u8, item: c_int) natsStatus;
pub extern fn nats_FreeAddrInfo(res: [*c]struct_addrinfo) void;
pub extern fn nats_marshalLong(buf: [*c]natsBuffer, comma: bool, fieldName: [*c]const u8, lval: i64) natsStatus;
pub extern fn nats_marshalULong(buf: [*c]natsBuffer, comma: bool, fieldName: [*c]const u8, uval: u64) natsStatus;
pub extern fn nats_marshalDuration(out_buf: [*c]natsBuffer, comma: bool, field_name: [*c]const u8, d: i64) natsStatus;
pub extern fn nats_marshalMetadata(buf: [*c]natsBuffer, comma: bool, fieldName: [*c]const u8, md: natsMetadata) natsStatus;
pub extern fn nats_unmarshalMetadata(json: [*c]nats_JSON, fieldName: [*c]const u8, md: [*c]natsMetadata) natsStatus;
pub extern fn nats_cloneMetadata(clone: [*c]natsMetadata, md: natsMetadata) natsStatus;
pub extern fn nats_freeMetadata(md: [*c]natsMetadata) void;
pub extern fn nats_IsSubjectValid(subject: [*c]const u8, wcAllowed: bool) bool;
pub extern fn nats_parseTime(str: [*c]u8, timeUTC: [*c]i64) natsStatus;
pub extern fn nats_formatStringArray(out: [*c][*c]u8, strings: [*c][*c]const u8, count: c_int) natsStatus;
pub extern var jsDefaultAPIPrefix: [*c]const u8;
pub extern const jsDefaultRequestWait: i64;
pub const struct___jsApiError = extern struct {
    Code: c_int = @import("std").mem.zeroes(c_int),
    ErrCode: u16 = @import("std").mem.zeroes(u16),
    Description: [*c]u8 = @import("std").mem.zeroes([*c]u8),
};
pub const jsApiError = struct___jsApiError;
pub const struct___jsApiResponse = extern struct {
    Type: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    Error: jsApiError = @import("std").mem.zeroes(jsApiError),
};
pub const jsApiResponse = struct___jsApiResponse;
pub extern fn js_setOpts(nc: [*c][*c]natsConnection, freePfx: [*c]bool, js: [*c]jsCtx, opts: [*c]jsOptions, resOpts: [*c]jsOptions) natsStatus;
pub extern fn js_lenWithoutTrailingDot(str: [*c]const u8) c_int;
pub extern fn js_unmarshalResponse(ar: [*c]jsApiResponse, new_json: [*c][*c]nats_JSON, resp: [*c]natsMsg) natsStatus;
pub extern fn js_freeApiRespContent(ar: [*c]jsApiResponse) void;
pub extern fn js_unmarshalAccountInfo(json: [*c]nats_JSON, new_ai: [*c][*c]jsAccountInfo) natsStatus;
pub extern fn js_marshalStreamConfig(new_buf: [*c][*c]natsBuffer, cfg: [*c]jsStreamConfig) natsStatus;
pub extern fn js_unmarshalStreamConfig(json: [*c]nats_JSON, fieldName: [*c]const u8, new_cfg: [*c][*c]jsStreamConfig) natsStatus;
pub extern fn js_destroyStreamConfig(cfg: [*c]jsStreamConfig) void;
pub extern fn js_unmarshalStreamState(pjson: [*c]nats_JSON, fieldName: [*c]const u8, state: [*c]jsStreamState) natsStatus;
pub extern fn js_unmarshalStreamInfo(json: [*c]nats_JSON, new_si: [*c][*c]jsStreamInfo) natsStatus;
pub extern fn js_unmarshalConsumerInfo(json: [*c]nats_JSON, new_ci: [*c][*c]jsConsumerInfo) natsStatus;
pub extern fn js_cleanStreamState(state: [*c]jsStreamState) void;
pub extern fn js_checkConsName(cons: [*c]const u8, isDurable: bool) natsStatus;
pub extern fn js_getMetaData(reply: [*c]const u8, domain: [*c][*c]u8, stream: [*c][*c]u8, consumer: [*c][*c]u8, numDelivered: [*c]u64, sseq: [*c]u64, dseq: [*c]u64, tm: [*c]i64, numPending: [*c]u64, asked: c_int) natsStatus;
pub extern fn js_retain(js: [*c]jsCtx) void;
pub extern fn js_release(js: [*c]jsCtx) void;
pub extern fn js_directGetMsgToJSMsg(stream: [*c]const u8, msg: [*c]natsMsg) natsStatus;
pub extern fn js_cloneConsumerConfig(org: [*c]jsConsumerConfig, clone: [*c][*c]jsConsumerConfig) natsStatus;
pub extern fn js_destroyConsumerConfig(cc: [*c]jsConsumerConfig) void;
pub extern fn js_checkFetchedMsg(sub: [*c]natsSubscription, msg: [*c]natsMsg, fetchID: u64, checkSts: bool, usrMsg: [*c]bool) natsStatus;
pub extern fn js_maybeFetchMore(sub: [*c]natsSubscription, fetch: [*c]jsFetch) natsStatus;
pub const struct___natsDispatcherPool = opaque {};
pub const natsDispatcherPool = struct___natsDispatcherPool;
pub extern fn natsLib_Retain() void;
pub extern fn natsLib_Release() void;
pub extern fn nats_assignSubToDispatch(sub: [*c]natsSubscription) natsStatus;
pub extern fn nats_closeLib(wait: bool, timeout: i64) natsStatus;
pub extern fn nats_initSSL() natsStatus;
pub extern fn nats_openLib(config: [*c]natsClientConfig) natsStatus;
pub extern fn nats_postAsyncCbInfo(info: [*c]natsAsyncCbInfo) natsStatus;
pub extern fn nats_setMessageDispatcherPoolCap(max: c_int) natsStatus;
pub extern fn nats_initForOS() void;
pub extern fn nats_overrideDefaultOptionsWithConfig(opts: [*c]natsOptions) void;
pub extern fn nats_resetTimer(t: [*c]natsTimer, newInterval: i64) void;
pub extern fn nats_stopTimer(t: [*c]natsTimer) void;
pub extern fn nats_getTimersCount() c_int;
pub extern fn nats_getTimersCountInList() c_int;
pub fn _removeHeadMsg(arg_d: [*c]natsDispatcher, arg_msg: [*c]natsMsg) callconv(.c) void {
    var d = arg_d;
    _ = &d;
    var msg = arg_msg;
    _ = &msg;
    d.*.queue.head = msg.*.next;
    if (d.*.queue.tail == msg) {
        d.*.queue.tail = null;
    }
    msg.*.next = null;
}
pub fn _preProcessUserMessage(arg_sub: [*c]natsSubscription, arg_jsi: [*c]jsSub, arg_fetch: [*c]jsFetch, arg_msg: [*c]natsMsg, arg_userMsg: [*c]bool, arg_overLimit: [*c]bool, arg_lastMessageInSub: [*c]bool, arg_lastMessageInFetch: [*c]bool, arg_fcReply: [*c][*c]u8) callconv(.c) natsStatus {
    var sub = arg_sub;
    _ = &sub;
    var jsi = arg_jsi;
    _ = &jsi;
    var fetch = arg_fetch;
    _ = &fetch;
    var msg = arg_msg;
    _ = &msg;
    var userMsg = arg_userMsg;
    _ = &userMsg;
    var overLimit = arg_overLimit;
    _ = &overLimit;
    var lastMessageInSub = arg_lastMessageInSub;
    _ = &lastMessageInSub;
    var lastMessageInFetch = arg_lastMessageInFetch;
    _ = &lastMessageInFetch;
    var fcReply = arg_fcReply;
    _ = &fcReply;
    var fetchStatus: natsStatus = @as(c_uint, @bitCast(NATS_OK));
    _ = &fetchStatus;
    userMsg.* = @as(c_int, 1) != 0;
    var isRealMessage: bool = @as(c_int, @bitCast(@as(c_uint, msg.*.subject[@as(c_uint, @intCast(@as(c_int, 0)))]))) != @as(c_int, '\x00');
    _ = &isRealMessage;
    if (isRealMessage) {
        sub.*.ownDispatcher.queue.msgs -= 1;
        sub.*.ownDispatcher.queue.bytes -= msg.*.dataLen + msg.*.hdrLen;
    }
    if ((jsi != @as([*c]jsSub, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) and (fetch != @as([*c]jsFetch, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))))) {
        fetchStatus = js_checkFetchedMsg(sub, msg, jsi.*.fetchID, @as(c_int, 1) != 0, userMsg);
    }
    userMsg.* = (@as(c_int, @intFromBool(userMsg.*)) != 0) and (@as(c_int, @bitCast(@as(c_uint, msg.*.subject[@as(c_uint, @intCast(@as(c_int, 0)))]))) != @as(c_int, '\x00'));
    if (userMsg.*) {
        if (sub.*.max > @as(u64, @bitCast(@as(c_long, @as(c_int, 0))))) {
            overLimit.* = sub.*.delivered == sub.*.max;
            lastMessageInSub.* = sub.*.delivered == (sub.*.max -% @as(u64, @bitCast(@as(c_long, @as(c_int, 1)))));
        }
        if (fetch != null) {
            var overMaxBytes: bool = (fetch.*.opts.MaxBytes > @as(i64, @bitCast(@as(c_long, @as(c_int, 0))))) and (fetch.*.deliveredBytes > fetch.*.opts.MaxBytes);
            _ = &overMaxBytes;
            var overMaxFetch: bool = overMaxBytes;
            _ = &overMaxFetch;
            lastMessageInFetch.* = overMaxBytes;
            if (fetch.*.opts.MaxMessages > @as(c_int, 0)) {
                overMaxFetch |= @as(bool, fetch.*.deliveredMsgs >= fetch.*.opts.MaxMessages);
                lastMessageInFetch.* |= @as(bool, fetch.*.deliveredMsgs == (fetch.*.opts.MaxMessages - @as(c_int, 1)));
            }
            if (fetchStatus == @as(c_uint, @bitCast(NATS_OK))) {
                if ((@as(c_int, @intFromBool(lastMessageInFetch.*)) != 0) or (@as(c_int, @intFromBool(overMaxFetch)) != 0)) {
                    fetchStatus = @as(c_uint, @bitCast(NATS_MAX_DELIVERED_MSGS));
                } else if (overMaxBytes) {
                    fetchStatus = @as(c_uint, @bitCast(NATS_LIMIT_REACHED));
                }
            }
            overLimit.* = ((@as(c_int, @intFromBool(overLimit.*)) != 0) or (@as(c_int, @intFromBool(overMaxFetch)) != 0)) or (@as(c_int, @intFromBool(overMaxBytes)) != 0);
        }
        if (!overLimit.*) {
            sub.*.delivered +%= 1;
            if (fetch != null) {
                fetch.*.deliveredMsgs += 1;
                fetch.*.deliveredBytes += @as(i64, @bitCast(@as(c_long, msg.*.dataLen + msg.*.hdrLen)));
            }
        }
        fcReply.* = if (jsi == @as([*c]jsSub, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) null else jsSub_checkForFlowControlResponse(sub);
    }
    return fetchStatus;
}
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 19);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 0);
pub const __clang_version__ = "19.1.0 (https://github.com/ziglang/zig-bootstrap 46b9e66db90230fe62404b27b85a378ccf2c82c2)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 19.1.0 (https://github.com/ziglang/zig-bootstrap 46b9e66db90230fe62404b27b85a378ccf2c82c2)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):95:9
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):101:9
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_NORM_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_NORM_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_NORM_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_NORM_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):202:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):224:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):232:9
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __GCC_DESTRUCTIVE_SIZE = @as(c_int, 64);
pub const __GCC_CONSTRUCTIVE_SIZE = @as(c_int, 64);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __NO_INLINE__ = @as(c_int, 1);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __ELF__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):366:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):367:9
pub const __znver1 = @as(c_int, 1);
pub const __znver1__ = @as(c_int, 1);
pub const __tune_znver1__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const __GLIBC_MINOR__ = @as(c_int, 39);
pub const _DEBUG = @as(c_int, 1);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const NATSP_H_ = "";
pub const N_UNIX_H_ = "";
pub const _GNU_SOURCE = "";
pub const __CLANG_STDINT_H = "";
pub const _STDINT_H = @as(c_int, 1);
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`");
// /usr/include/features.h:189:9
pub const _ISOC95_SOURCE = @as(c_int, 1);
pub const _ISOC99_SOURCE = @as(c_int, 1);
pub const _ISOC11_SOURCE = @as(c_int, 1);
pub const _ISOC23_SOURCE = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const _XOPEN_SOURCE = @as(c_int, 700);
pub const _XOPEN_SOURCE_EXTENDED = @as(c_int, 1);
pub const _LARGEFILE64_SOURCE = @as(c_int, 1);
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const _DYNAMIC_STACK_SIZE_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC23 = @as(c_int, 1);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const __USE_XOPEN = @as(c_int, 1);
pub const __USE_XOPEN_EXTENDED = @as(c_int, 1);
pub const __USE_UNIX98 = @as(c_int, 1);
pub const _LARGEFILE_SOURCE = @as(c_int, 1);
pub const __USE_XOPEN2K8XSI = @as(c_int, 1);
pub const __USE_XOPEN2KXSI = @as(c_int, 1);
pub const __USE_LARGEFILE = @as(c_int, 1);
pub const __USE_LARGEFILE64 = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_TIME_BITS64 = @as(c_int, 1);
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_DYNAMIC_STACK_SIZE = @as(c_int, 1);
pub const __USE_GNU = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C23_STRTOL = @as(c_int, 1);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// /usr/include/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    _ = &name;
    return __has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`");
// /usr/include/sys/cdefs.h:55:10
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /usr/include/sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/include/sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub const __attribute_overloadable__ = @compileError("unable to translate macro: undefined identifier `__overloadable__`");
// /usr/include/sys/cdefs.h:151:10
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub const __warnattr = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:370:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/sys/cdefs.h:371:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /usr/include/sys/cdefs.h:379:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:410:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:417:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/sys/cdefs.h:419:11
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ','");
// /usr/include/sys/cdefs.h:422:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/include/sys/cdefs.h:452:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:463:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /usr/include/sys/cdefs.h:469:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/sys/cdefs.h:479:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/sys/cdefs.h:486:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/include/sys/cdefs.h:492:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/include/sys/cdefs.h:501:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /usr/include/sys/cdefs.h:502:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/sys/cdefs.h:510:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/sys/cdefs.h:520:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /usr/include/sys/cdefs.h:533:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/include/sys/cdefs.h:543:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/include/sys/cdefs.h:555:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`");
// /usr/include/sys/cdefs.h:568:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/sys/cdefs.h:577:10
pub const __wur = "";
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/include/sys/cdefs.h:595:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/include/sys/cdefs.h:604:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/sys/cdefs.h:622:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/sys/cdefs.h:623:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/sys/cdefs.h:666:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:715:10
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:792:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:793:10
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /usr/include/sys/cdefs.h:807:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/sys/cdefs.h:808:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:853:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:854:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:855:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/sys/cdefs.h:865:10
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /usr/include/sys/cdefs.h:872:10
pub const __attribute_struct_may_alias__ = @compileError("unable to translate macro: undefined identifier `__may_alias__`");
// /usr/include/sys/cdefs.h:881:10
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C23 = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C23 = @as(c_int, 1);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 1);
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /usr/include/bits/types.h:137:10
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`");
// /usr/include/bits/typesizes.h:73:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const _BITS_WCHAR_H = @as(c_int, 1);
pub const __WCHAR_MAX = __WCHAR_MAX__;
pub const __WCHAR_MIN = -__WCHAR_MAX - @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const _BITS_STDINT_UINTN_H = @as(c_int, 1);
pub const _BITS_STDINT_LEAST_H = @as(c_int, 1);
pub const __intptr_t_defined = "";
pub const __INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_MIN = -@as(c_int, 128);
pub const INT16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT8_MAX = @as(c_int, 127);
pub const INT16_MAX = @as(c_int, 32767);
pub const INT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT8_MAX = @as(c_int, 255);
pub const UINT16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_LEAST8_MIN = -@as(c_int, 128);
pub const INT_LEAST16_MIN = -@as(c_int, 32767) - @as(c_int, 1);
pub const INT_LEAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const INT_LEAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_LEAST8_MAX = @as(c_int, 127);
pub const INT_LEAST16_MAX = @as(c_int, 32767);
pub const INT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const INT_LEAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_LEAST8_MAX = @as(c_int, 255);
pub const UINT_LEAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const UINT_LEAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const UINT_LEAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INT_FAST8_MIN = -@as(c_int, 128);
pub const INT_FAST16_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST32_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INT_FAST64_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INT_FAST8_MAX = @as(c_int, 127);
pub const INT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const INT_FAST64_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINT_FAST8_MAX = @as(c_int, 255);
pub const UINT_FAST16_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST32_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const UINT_FAST64_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const INTPTR_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const INTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const UINTPTR_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const INTMAX_MIN = -__INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal)) - @as(c_int, 1);
pub const INTMAX_MAX = __INT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 9223372036854775807, .decimal));
pub const UINTMAX_MAX = __UINT64_C(@import("std").zig.c_translation.promoteIntLiteral(c_int, 18446744073709551615, .decimal));
pub const PTRDIFF_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal) - @as(c_int, 1);
pub const PTRDIFF_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const SIG_ATOMIC_MIN = -@import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
pub const SIG_ATOMIC_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const WCHAR_MIN = __WCHAR_MIN;
pub const WCHAR_MAX = __WCHAR_MAX;
pub const WINT_MIN = @as(c_uint, 0);
pub const WINT_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub inline fn INT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn INT32_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const INT64_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub inline fn UINT8_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub inline fn UINT16_C(c: anytype) @TypeOf(c) {
    _ = &c;
    return c;
}
pub const UINT32_C = @import("std").zig.c_translation.Macros.U_SUFFIX;
pub const UINT64_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INTMAX_C = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const UINTMAX_C = @import("std").zig.c_translation.Macros.UL_SUFFIX;
pub const INT8_WIDTH = @as(c_int, 8);
pub const UINT8_WIDTH = @as(c_int, 8);
pub const INT16_WIDTH = @as(c_int, 16);
pub const UINT16_WIDTH = @as(c_int, 16);
pub const INT32_WIDTH = @as(c_int, 32);
pub const UINT32_WIDTH = @as(c_int, 32);
pub const INT64_WIDTH = @as(c_int, 64);
pub const UINT64_WIDTH = @as(c_int, 64);
pub const INT_LEAST8_WIDTH = @as(c_int, 8);
pub const UINT_LEAST8_WIDTH = @as(c_int, 8);
pub const INT_LEAST16_WIDTH = @as(c_int, 16);
pub const UINT_LEAST16_WIDTH = @as(c_int, 16);
pub const INT_LEAST32_WIDTH = @as(c_int, 32);
pub const UINT_LEAST32_WIDTH = @as(c_int, 32);
pub const INT_LEAST64_WIDTH = @as(c_int, 64);
pub const UINT_LEAST64_WIDTH = @as(c_int, 64);
pub const INT_FAST8_WIDTH = @as(c_int, 8);
pub const UINT_FAST8_WIDTH = @as(c_int, 8);
pub const INT_FAST16_WIDTH = __WORDSIZE;
pub const UINT_FAST16_WIDTH = __WORDSIZE;
pub const INT_FAST32_WIDTH = __WORDSIZE;
pub const UINT_FAST32_WIDTH = __WORDSIZE;
pub const INT_FAST64_WIDTH = @as(c_int, 64);
pub const UINT_FAST64_WIDTH = @as(c_int, 64);
pub const INTPTR_WIDTH = __WORDSIZE;
pub const UINTPTR_WIDTH = __WORDSIZE;
pub const INTMAX_WIDTH = @as(c_int, 64);
pub const UINTMAX_WIDTH = @as(c_int, 64);
pub const PTRDIFF_WIDTH = __WORDSIZE;
pub const SIG_ATOMIC_WIDTH = @as(c_int, 32);
pub const SIZE_WIDTH = __WORDSIZE;
pub const WCHAR_WIDTH = @as(c_int, 32);
pub const WINT_WIDTH = @as(c_int, 32);
pub const __STDBOOL_H = "";
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const @"bool" = bool;
pub const @"true" = @as(c_int, 1);
pub const @"false" = @as(c_int, 0);
pub const _SYS_TIME_H = @as(c_int, 1);
pub const __time_t_defined = @as(c_int, 1);
pub const __timeval_defined = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const _SYS_SELECT_H = @as(c_int, 1);
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`");
// /usr/include/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='");
// /usr/include/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /usr/include/bits/select.h:34:9
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0)) {
    _ = &d;
    _ = &s;
    return (__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = @import("std").zig.c_translation.MacroArithmetic.div(@as(c_int, 1024), @as(c_int, 8) * @import("std").zig.c_translation.sizeof(c_ulong));
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    _ = &HI;
    _ = &LO;
    return blk: {
        _ = &LO;
        break :blk HI;
    };
}
pub const __NFDBITS = @as(c_int, 8) * @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS)) {
    _ = &d;
    return @import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    _ = &d;
    return @import("std").zig.c_translation.cast(__fd_mask, @as(c_ulong, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.fds_bits) {
    _ = &set;
    return set.*.fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    _ = &fdsetp;
    return __FD_ZERO(fdsetp);
}
pub const TIMEVAL_TO_TIMESPEC = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/sys/time.h:38:10
pub const TIMESPEC_TO_TIMEVAL = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/sys/time.h:42:10
pub inline fn timerisset(tvp: anytype) @TypeOf((tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0)) {
    _ = &tvp;
    return (tvp.*.tv_sec != 0) or (tvp.*.tv_usec != 0);
}
pub const timerclear = @compileError("unable to translate C expr: expected ')' instead got '='");
// /usr/include/sys/time.h:232:10
pub inline fn timercmp(a: anytype, b: anytype, CMP: anytype) @TypeOf(if (a.*.tv_sec == b.*.tv_sec) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec) {
    _ = &a;
    _ = &b;
    _ = &CMP;
    return if (a.*.tv_sec == b.*.tv_sec) a.*.tv_usec ++ CMP(b).*.tv_usec else a.*.tv_sec ++ CMP(b).*.tv_sec;
}
pub const timeradd = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/sys/time.h:237:10
pub const timersub = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/sys/time.h:247:10
pub const _FCNTL_H = @as(c_int, 1);
pub const __O_LARGEFILE = @as(c_int, 0);
pub const F_GETLK64 = @as(c_int, 5);
pub const F_SETLK64 = @as(c_int, 6);
pub const F_SETLKW64 = @as(c_int, 7);
pub const __iovec_defined = @as(c_int, 1);
pub const __need_size_t = "";
pub const _SIZE_T = "";
pub const O_ACCMODE = @as(c_int, 0o003);
pub const O_RDONLY = @as(c_int, 0o0);
pub const O_WRONLY = @as(c_int, 0o1);
pub const O_RDWR = @as(c_int, 0o2);
pub const O_CREAT = @as(c_int, 0o100);
pub const O_EXCL = @as(c_int, 0o200);
pub const O_NOCTTY = @as(c_int, 0o400);
pub const O_TRUNC = @as(c_int, 0o1000);
pub const O_APPEND = @as(c_int, 0o2000);
pub const O_NONBLOCK = @as(c_int, 0o4000);
pub const O_NDELAY = O_NONBLOCK;
pub const O_SYNC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o4010000, .octal);
pub const O_FSYNC = O_SYNC;
pub const O_ASYNC = @as(c_int, 0o20000);
pub const __O_DIRECTORY = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o200000, .octal);
pub const __O_NOFOLLOW = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o400000, .octal);
pub const __O_CLOEXEC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o2000000, .octal);
pub const __O_DIRECT = @as(c_int, 0o40000);
pub const __O_NOATIME = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o1000000, .octal);
pub const __O_PATH = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o10000000, .octal);
pub const __O_DSYNC = @as(c_int, 0o10000);
pub const __O_TMPFILE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o20000000, .octal) | __O_DIRECTORY;
pub const F_GETLK = F_GETLK64;
pub const F_SETLK = F_SETLK64;
pub const F_SETLKW = F_SETLKW64;
pub const F_OFD_GETLK = @as(c_int, 36);
pub const F_OFD_SETLK = @as(c_int, 37);
pub const F_OFD_SETLKW = @as(c_int, 38);
pub const O_LARGEFILE = __O_LARGEFILE;
pub const O_DIRECTORY = __O_DIRECTORY;
pub const O_NOFOLLOW = __O_NOFOLLOW;
pub const O_CLOEXEC = __O_CLOEXEC;
pub const O_DIRECT = __O_DIRECT;
pub const O_NOATIME = __O_NOATIME;
pub const O_PATH = __O_PATH;
pub const O_TMPFILE = __O_TMPFILE;
pub const O_DSYNC = __O_DSYNC;
pub const O_RSYNC = O_SYNC;
pub const F_DUPFD = @as(c_int, 0);
pub const F_GETFD = @as(c_int, 1);
pub const F_SETFD = @as(c_int, 2);
pub const F_GETFL = @as(c_int, 3);
pub const F_SETFL = @as(c_int, 4);
pub const __F_SETOWN = @as(c_int, 8);
pub const __F_GETOWN = @as(c_int, 9);
pub const F_SETOWN = __F_SETOWN;
pub const F_GETOWN = __F_GETOWN;
pub const __F_SETSIG = @as(c_int, 10);
pub const __F_GETSIG = @as(c_int, 11);
pub const __F_SETOWN_EX = @as(c_int, 15);
pub const __F_GETOWN_EX = @as(c_int, 16);
pub const F_SETSIG = __F_SETSIG;
pub const F_GETSIG = __F_GETSIG;
pub const F_SETOWN_EX = __F_SETOWN_EX;
pub const F_GETOWN_EX = __F_GETOWN_EX;
pub const F_SETLEASE = @as(c_int, 1024);
pub const F_GETLEASE = @as(c_int, 1025);
pub const F_NOTIFY = @as(c_int, 1026);
pub const F_SETPIPE_SZ = @as(c_int, 1031);
pub const F_GETPIPE_SZ = @as(c_int, 1032);
pub const F_ADD_SEALS = @as(c_int, 1033);
pub const F_GET_SEALS = @as(c_int, 1034);
pub const F_GET_RW_HINT = @as(c_int, 1035);
pub const F_SET_RW_HINT = @as(c_int, 1036);
pub const F_GET_FILE_RW_HINT = @as(c_int, 1037);
pub const F_SET_FILE_RW_HINT = @as(c_int, 1038);
pub const F_DUPFD_CLOEXEC = @as(c_int, 1030);
pub const FD_CLOEXEC = @as(c_int, 1);
pub const F_RDLCK = @as(c_int, 0);
pub const F_WRLCK = @as(c_int, 1);
pub const F_UNLCK = @as(c_int, 2);
pub const F_EXLCK = @as(c_int, 4);
pub const F_SHLCK = @as(c_int, 8);
pub const LOCK_SH = @as(c_int, 1);
pub const LOCK_EX = @as(c_int, 2);
pub const LOCK_NB = @as(c_int, 4);
pub const LOCK_UN = @as(c_int, 8);
pub const LOCK_MAND = @as(c_int, 32);
pub const LOCK_READ = @as(c_int, 64);
pub const LOCK_WRITE = @as(c_int, 128);
pub const LOCK_RW = @as(c_int, 192);
pub const DN_ACCESS = @as(c_int, 0x00000001);
pub const DN_MODIFY = @as(c_int, 0x00000002);
pub const DN_CREATE = @as(c_int, 0x00000004);
pub const DN_DELETE = @as(c_int, 0x00000008);
pub const DN_RENAME = @as(c_int, 0x00000010);
pub const DN_ATTRIB = @as(c_int, 0x00000020);
pub const DN_MULTISHOT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const F_SEAL_SEAL = @as(c_int, 0x0001);
pub const F_SEAL_SHRINK = @as(c_int, 0x0002);
pub const F_SEAL_GROW = @as(c_int, 0x0004);
pub const F_SEAL_WRITE = @as(c_int, 0x0008);
pub const F_SEAL_FUTURE_WRITE = @as(c_int, 0x0010);
pub const F_SEAL_EXEC = @as(c_int, 0x0020);
pub const RWH_WRITE_LIFE_NOT_SET = @as(c_int, 0);
pub const RWF_WRITE_LIFE_NOT_SET = RWH_WRITE_LIFE_NOT_SET;
pub const RWH_WRITE_LIFE_NONE = @as(c_int, 1);
pub const RWH_WRITE_LIFE_SHORT = @as(c_int, 2);
pub const RWH_WRITE_LIFE_MEDIUM = @as(c_int, 3);
pub const RWH_WRITE_LIFE_LONG = @as(c_int, 4);
pub const RWH_WRITE_LIFE_EXTREME = @as(c_int, 5);
pub const FAPPEND = O_APPEND;
pub const FFSYNC = O_FSYNC;
pub const FASYNC = O_ASYNC;
pub const FNONBLOCK = O_NONBLOCK;
pub const FNDELAY = O_NDELAY;
pub const __POSIX_FADV_DONTNEED = @as(c_int, 4);
pub const __POSIX_FADV_NOREUSE = @as(c_int, 5);
pub const POSIX_FADV_NORMAL = @as(c_int, 0);
pub const POSIX_FADV_RANDOM = @as(c_int, 1);
pub const POSIX_FADV_SEQUENTIAL = @as(c_int, 2);
pub const POSIX_FADV_WILLNEED = @as(c_int, 3);
pub const POSIX_FADV_DONTNEED = __POSIX_FADV_DONTNEED;
pub const POSIX_FADV_NOREUSE = __POSIX_FADV_NOREUSE;
pub const SYNC_FILE_RANGE_WAIT_BEFORE = @as(c_int, 1);
pub const SYNC_FILE_RANGE_WRITE = @as(c_int, 2);
pub const SYNC_FILE_RANGE_WAIT_AFTER = @as(c_int, 4);
pub const SYNC_FILE_RANGE_WRITE_AND_WAIT = (SYNC_FILE_RANGE_WRITE | SYNC_FILE_RANGE_WAIT_BEFORE) | SYNC_FILE_RANGE_WAIT_AFTER;
pub const SPLICE_F_MOVE = @as(c_int, 1);
pub const SPLICE_F_NONBLOCK = @as(c_int, 2);
pub const SPLICE_F_MORE = @as(c_int, 4);
pub const SPLICE_F_GIFT = @as(c_int, 8);
pub const _FALLOC_H_ = "";
pub const FALLOC_FL_ALLOCATE_RANGE = @as(c_int, 0x00);
pub const FALLOC_FL_KEEP_SIZE = @as(c_int, 0x01);
pub const FALLOC_FL_PUNCH_HOLE = @as(c_int, 0x02);
pub const FALLOC_FL_NO_HIDE_STALE = @as(c_int, 0x04);
pub const FALLOC_FL_COLLAPSE_RANGE = @as(c_int, 0x08);
pub const FALLOC_FL_ZERO_RANGE = @as(c_int, 0x10);
pub const FALLOC_FL_INSERT_RANGE = @as(c_int, 0x20);
pub const FALLOC_FL_UNSHARE_RANGE = @as(c_int, 0x40);
pub const MAX_HANDLE_SZ = @as(c_int, 128);
pub const AT_HANDLE_FID = AT_REMOVEDIR;
pub inline fn __OPEN_NEEDS_MODE(oflag: anytype) @TypeOf(((oflag & O_CREAT) != @as(c_int, 0)) or ((oflag & __O_TMPFILE) == __O_TMPFILE)) {
    _ = &oflag;
    return ((oflag & O_CREAT) != @as(c_int, 0)) or ((oflag & __O_TMPFILE) == __O_TMPFILE);
}
pub const __mode_t_defined = "";
pub const __off_t_defined = "";
pub const __off64_t_defined = "";
pub const __pid_t_defined = "";
pub const _BITS_STAT_H = @as(c_int, 1);
pub const _BITS_STRUCT_STAT_H = @as(c_int, 1);
pub const st_atime = @compileError("unable to translate macro: undefined identifier `st_atim`");
// /usr/include/bits/struct_stat.h:77:11
pub const st_mtime = @compileError("unable to translate macro: undefined identifier `st_mtim`");
// /usr/include/bits/struct_stat.h:78:11
pub const st_ctime = @compileError("unable to translate macro: undefined identifier `st_ctim`");
// /usr/include/bits/struct_stat.h:79:11
pub const _STATBUF_ST_BLKSIZE = "";
pub const _STATBUF_ST_RDEV = "";
pub const _STATBUF_ST_NSEC = "";
pub const __S_IFMT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o170000, .octal);
pub const __S_IFDIR = @as(c_int, 0o040000);
pub const __S_IFCHR = @as(c_int, 0o020000);
pub const __S_IFBLK = @as(c_int, 0o060000);
pub const __S_IFREG = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o100000, .octal);
pub const __S_IFIFO = @as(c_int, 0o010000);
pub const __S_IFLNK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o120000, .octal);
pub const __S_IFSOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0o140000, .octal);
pub inline fn __S_TYPEISMQ(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub inline fn __S_TYPEISSEM(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub inline fn __S_TYPEISSHM(buf: anytype) @TypeOf(buf.*.st_mode - buf.*.st_mode) {
    _ = &buf;
    return buf.*.st_mode - buf.*.st_mode;
}
pub const __S_ISUID = @as(c_int, 0o4000);
pub const __S_ISGID = @as(c_int, 0o2000);
pub const __S_ISVTX = @as(c_int, 0o1000);
pub const __S_IREAD = @as(c_int, 0o400);
pub const __S_IWRITE = @as(c_int, 0o200);
pub const __S_IEXEC = @as(c_int, 0o100);
pub const UTIME_NOW = (@as(c_long, 1) << @as(c_int, 30)) - @as(c_long, 1);
pub const UTIME_OMIT = (@as(c_long, 1) << @as(c_int, 30)) - @as(c_long, 2);
pub const S_IFMT = __S_IFMT;
pub const S_IFDIR = __S_IFDIR;
pub const S_IFCHR = __S_IFCHR;
pub const S_IFBLK = __S_IFBLK;
pub const S_IFREG = __S_IFREG;
pub const S_IFIFO = __S_IFIFO;
pub const S_IFLNK = __S_IFLNK;
pub const S_IFSOCK = __S_IFSOCK;
pub const S_ISUID = __S_ISUID;
pub const S_ISGID = __S_ISGID;
pub const S_ISVTX = __S_ISVTX;
pub const S_IRUSR = __S_IREAD;
pub const S_IWUSR = __S_IWRITE;
pub const S_IXUSR = __S_IEXEC;
pub const S_IRWXU = (__S_IREAD | __S_IWRITE) | __S_IEXEC;
pub const S_IRGRP = S_IRUSR >> @as(c_int, 3);
pub const S_IWGRP = S_IWUSR >> @as(c_int, 3);
pub const S_IXGRP = S_IXUSR >> @as(c_int, 3);
pub const S_IRWXG = S_IRWXU >> @as(c_int, 3);
pub const S_IROTH = S_IRGRP >> @as(c_int, 3);
pub const S_IWOTH = S_IWGRP >> @as(c_int, 3);
pub const S_IXOTH = S_IXGRP >> @as(c_int, 3);
pub const S_IRWXO = S_IRWXG >> @as(c_int, 3);
pub const R_OK = @as(c_int, 4);
pub const W_OK = @as(c_int, 2);
pub const X_OK = @as(c_int, 1);
pub const F_OK = @as(c_int, 0);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const AT_FDCWD = -@as(c_int, 100);
pub const AT_SYMLINK_NOFOLLOW = @as(c_int, 0x100);
pub const AT_REMOVEDIR = @as(c_int, 0x200);
pub const AT_SYMLINK_FOLLOW = @as(c_int, 0x400);
pub const AT_NO_AUTOMOUNT = @as(c_int, 0x800);
pub const AT_EMPTY_PATH = @as(c_int, 0x1000);
pub const AT_STATX_SYNC_TYPE = @as(c_int, 0x6000);
pub const AT_STATX_SYNC_AS_STAT = @as(c_int, 0x0000);
pub const AT_STATX_FORCE_SYNC = @as(c_int, 0x2000);
pub const AT_STATX_DONT_SYNC = @as(c_int, 0x4000);
pub const AT_RECURSIVE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const AT_EACCESS = @as(c_int, 0x200);
pub const F_ULOCK = @as(c_int, 0);
pub const F_LOCK = @as(c_int, 1);
pub const F_TLOCK = @as(c_int, 2);
pub const F_TEST = @as(c_int, 3);
pub const _NETINET_TCP_H = @as(c_int, 1);
pub const TCP_NODELAY = @as(c_int, 1);
pub const TCP_MAXSEG = @as(c_int, 2);
pub const TCP_CORK = @as(c_int, 3);
pub const TCP_KEEPIDLE = @as(c_int, 4);
pub const TCP_KEEPINTVL = @as(c_int, 5);
pub const TCP_KEEPCNT = @as(c_int, 6);
pub const TCP_SYNCNT = @as(c_int, 7);
pub const TCP_LINGER2 = @as(c_int, 8);
pub const TCP_DEFER_ACCEPT = @as(c_int, 9);
pub const TCP_WINDOW_CLAMP = @as(c_int, 10);
pub const TCP_INFO = @as(c_int, 11);
pub const TCP_QUICKACK = @as(c_int, 12);
pub const TCP_CONGESTION = @as(c_int, 13);
pub const TCP_MD5SIG = @as(c_int, 14);
pub const TCP_COOKIE_TRANSACTIONS = @as(c_int, 15);
pub const TCP_THIN_LINEAR_TIMEOUTS = @as(c_int, 16);
pub const TCP_THIN_DUPACK = @as(c_int, 17);
pub const TCP_USER_TIMEOUT = @as(c_int, 18);
pub const TCP_REPAIR = @as(c_int, 19);
pub const TCP_REPAIR_QUEUE = @as(c_int, 20);
pub const TCP_QUEUE_SEQ = @as(c_int, 21);
pub const TCP_REPAIR_OPTIONS = @as(c_int, 22);
pub const TCP_FASTOPEN = @as(c_int, 23);
pub const TCP_TIMESTAMP = @as(c_int, 24);
pub const TCP_NOTSENT_LOWAT = @as(c_int, 25);
pub const TCP_CC_INFO = @as(c_int, 26);
pub const TCP_SAVE_SYN = @as(c_int, 27);
pub const TCP_SAVED_SYN = @as(c_int, 28);
pub const TCP_REPAIR_WINDOW = @as(c_int, 29);
pub const TCP_FASTOPEN_CONNECT = @as(c_int, 30);
pub const TCP_ULP = @as(c_int, 31);
pub const TCP_MD5SIG_EXT = @as(c_int, 32);
pub const TCP_FASTOPEN_KEY = @as(c_int, 33);
pub const TCP_FASTOPEN_NO_COOKIE = @as(c_int, 34);
pub const TCP_ZEROCOPY_RECEIVE = @as(c_int, 35);
pub const TCP_INQ = @as(c_int, 36);
pub const TCP_CM_INQ = TCP_INQ;
pub const TCP_TX_DELAY = @as(c_int, 37);
pub const TCP_REPAIR_ON = @as(c_int, 1);
pub const TCP_REPAIR_OFF = @as(c_int, 0);
pub const TCP_REPAIR_OFF_NO_WP = -@as(c_int, 1);
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __ino64_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __nlink_t_defined = "";
pub const __uid_t_defined = "";
pub const __id_t_defined = "";
pub const __ssize_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const __useconds_t_defined = "";
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    _ = &x;
    return ((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    _ = &x;
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 40);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 4);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/bits/struct_mutex.h:56:10
pub const _RWLOCK_INTERNAL_H = "";
pub const __PTHREAD_RWLOCK_ELISION_EXTRA = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/bits/struct_rwlock.h:40:11
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    _ = &__flags;
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = &__PTHREAD_RWLOCK_ELISION_EXTRA;
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/bits/thread-shared-types.h:113:9
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const _SYS_SOCKET_H = @as(c_int, 1);
pub const __BITS_SOCKET_H = "";
pub const __socklen_t_defined = "";
pub const PF_UNSPEC = @as(c_int, 0);
pub const PF_LOCAL = @as(c_int, 1);
pub const PF_UNIX = PF_LOCAL;
pub const PF_FILE = PF_LOCAL;
pub const PF_INET = @as(c_int, 2);
pub const PF_AX25 = @as(c_int, 3);
pub const PF_IPX = @as(c_int, 4);
pub const PF_APPLETALK = @as(c_int, 5);
pub const PF_NETROM = @as(c_int, 6);
pub const PF_BRIDGE = @as(c_int, 7);
pub const PF_ATMPVC = @as(c_int, 8);
pub const PF_X25 = @as(c_int, 9);
pub const PF_INET6 = @as(c_int, 10);
pub const PF_ROSE = @as(c_int, 11);
pub const PF_DECnet = @as(c_int, 12);
pub const PF_NETBEUI = @as(c_int, 13);
pub const PF_SECURITY = @as(c_int, 14);
pub const PF_KEY = @as(c_int, 15);
pub const PF_NETLINK = @as(c_int, 16);
pub const PF_ROUTE = PF_NETLINK;
pub const PF_PACKET = @as(c_int, 17);
pub const PF_ASH = @as(c_int, 18);
pub const PF_ECONET = @as(c_int, 19);
pub const PF_ATMSVC = @as(c_int, 20);
pub const PF_RDS = @as(c_int, 21);
pub const PF_SNA = @as(c_int, 22);
pub const PF_IRDA = @as(c_int, 23);
pub const PF_PPPOX = @as(c_int, 24);
pub const PF_WANPIPE = @as(c_int, 25);
pub const PF_LLC = @as(c_int, 26);
pub const PF_IB = @as(c_int, 27);
pub const PF_MPLS = @as(c_int, 28);
pub const PF_CAN = @as(c_int, 29);
pub const PF_TIPC = @as(c_int, 30);
pub const PF_BLUETOOTH = @as(c_int, 31);
pub const PF_IUCV = @as(c_int, 32);
pub const PF_RXRPC = @as(c_int, 33);
pub const PF_ISDN = @as(c_int, 34);
pub const PF_PHONET = @as(c_int, 35);
pub const PF_IEEE802154 = @as(c_int, 36);
pub const PF_CAIF = @as(c_int, 37);
pub const PF_ALG = @as(c_int, 38);
pub const PF_NFC = @as(c_int, 39);
pub const PF_VSOCK = @as(c_int, 40);
pub const PF_KCM = @as(c_int, 41);
pub const PF_QIPCRTR = @as(c_int, 42);
pub const PF_SMC = @as(c_int, 43);
pub const PF_XDP = @as(c_int, 44);
pub const PF_MCTP = @as(c_int, 45);
pub const PF_MAX = @as(c_int, 46);
pub const AF_UNSPEC = PF_UNSPEC;
pub const AF_LOCAL = PF_LOCAL;
pub const AF_UNIX = PF_UNIX;
pub const AF_FILE = PF_FILE;
pub const AF_INET = PF_INET;
pub const AF_AX25 = PF_AX25;
pub const AF_IPX = PF_IPX;
pub const AF_APPLETALK = PF_APPLETALK;
pub const AF_NETROM = PF_NETROM;
pub const AF_BRIDGE = PF_BRIDGE;
pub const AF_ATMPVC = PF_ATMPVC;
pub const AF_X25 = PF_X25;
pub const AF_INET6 = PF_INET6;
pub const AF_ROSE = PF_ROSE;
pub const AF_DECnet = PF_DECnet;
pub const AF_NETBEUI = PF_NETBEUI;
pub const AF_SECURITY = PF_SECURITY;
pub const AF_KEY = PF_KEY;
pub const AF_NETLINK = PF_NETLINK;
pub const AF_ROUTE = PF_ROUTE;
pub const AF_PACKET = PF_PACKET;
pub const AF_ASH = PF_ASH;
pub const AF_ECONET = PF_ECONET;
pub const AF_ATMSVC = PF_ATMSVC;
pub const AF_RDS = PF_RDS;
pub const AF_SNA = PF_SNA;
pub const AF_IRDA = PF_IRDA;
pub const AF_PPPOX = PF_PPPOX;
pub const AF_WANPIPE = PF_WANPIPE;
pub const AF_LLC = PF_LLC;
pub const AF_IB = PF_IB;
pub const AF_MPLS = PF_MPLS;
pub const AF_CAN = PF_CAN;
pub const AF_TIPC = PF_TIPC;
pub const AF_BLUETOOTH = PF_BLUETOOTH;
pub const AF_IUCV = PF_IUCV;
pub const AF_RXRPC = PF_RXRPC;
pub const AF_ISDN = PF_ISDN;
pub const AF_PHONET = PF_PHONET;
pub const AF_IEEE802154 = PF_IEEE802154;
pub const AF_CAIF = PF_CAIF;
pub const AF_ALG = PF_ALG;
pub const AF_NFC = PF_NFC;
pub const AF_VSOCK = PF_VSOCK;
pub const AF_KCM = PF_KCM;
pub const AF_QIPCRTR = PF_QIPCRTR;
pub const AF_SMC = PF_SMC;
pub const AF_XDP = PF_XDP;
pub const AF_MCTP = PF_MCTP;
pub const AF_MAX = PF_MAX;
pub const SOL_RAW = @as(c_int, 255);
pub const SOL_DECNET = @as(c_int, 261);
pub const SOL_X25 = @as(c_int, 262);
pub const SOL_PACKET = @as(c_int, 263);
pub const SOL_ATM = @as(c_int, 264);
pub const SOL_AAL = @as(c_int, 265);
pub const SOL_IRDA = @as(c_int, 266);
pub const SOL_NETBEUI = @as(c_int, 267);
pub const SOL_LLC = @as(c_int, 268);
pub const SOL_DCCP = @as(c_int, 269);
pub const SOL_NETLINK = @as(c_int, 270);
pub const SOL_TIPC = @as(c_int, 271);
pub const SOL_RXRPC = @as(c_int, 272);
pub const SOL_PPPOL2TP = @as(c_int, 273);
pub const SOL_BLUETOOTH = @as(c_int, 274);
pub const SOL_PNPIPE = @as(c_int, 275);
pub const SOL_RDS = @as(c_int, 276);
pub const SOL_IUCV = @as(c_int, 277);
pub const SOL_CAIF = @as(c_int, 278);
pub const SOL_ALG = @as(c_int, 279);
pub const SOL_NFC = @as(c_int, 280);
pub const SOL_KCM = @as(c_int, 281);
pub const SOL_TLS = @as(c_int, 282);
pub const SOL_XDP = @as(c_int, 283);
pub const SOL_MPTCP = @as(c_int, 284);
pub const SOL_MCTP = @as(c_int, 285);
pub const SOL_SMC = @as(c_int, 286);
pub const SOL_VSOCK = @as(c_int, 287);
pub const SOMAXCONN = @as(c_int, 4096);
pub const _BITS_SOCKADDR_H = @as(c_int, 1);
pub const __SOCKADDR_COMMON = @compileError("unable to translate macro: undefined identifier `family`");
// /usr/include/bits/sockaddr.h:34:9
pub const __SOCKADDR_COMMON_SIZE = @import("std").zig.c_translation.sizeof(c_ushort);
pub const _SS_SIZE = @as(c_int, 128);
pub const __ss_aligntype = c_ulong;
pub const _SS_PADSIZE = (_SS_SIZE - __SOCKADDR_COMMON_SIZE) - @import("std").zig.c_translation.sizeof(__ss_aligntype);
pub inline fn CMSG_DATA(cmsg: anytype) @TypeOf(cmsg.*.__cmsg_data) {
    _ = &cmsg;
    return cmsg.*.__cmsg_data;
}
pub inline fn CMSG_NXTHDR(mhdr: anytype, cmsg: anytype) @TypeOf(__cmsg_nxthdr(mhdr, cmsg)) {
    _ = &mhdr;
    _ = &cmsg;
    return __cmsg_nxthdr(mhdr, cmsg);
}
pub inline fn CMSG_FIRSTHDR(mhdr: anytype) @TypeOf(if (@import("std").zig.c_translation.cast(usize, mhdr.*.msg_controllen) >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_int, 0))) {
    _ = &mhdr;
    return if (@import("std").zig.c_translation.cast(usize, mhdr.*.msg_controllen) >= @import("std").zig.c_translation.sizeof(struct_cmsghdr)) @import("std").zig.c_translation.cast([*c]struct_cmsghdr, mhdr.*.msg_control) else @import("std").zig.c_translation.cast([*c]struct_cmsghdr, @as(c_int, 0));
}
pub inline fn CMSG_ALIGN(len: anytype) @TypeOf(((len + @import("std").zig.c_translation.sizeof(usize)) - @as(c_int, 1)) & @import("std").zig.c_translation.cast(usize, ~(@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)))) {
    _ = &len;
    return ((len + @import("std").zig.c_translation.sizeof(usize)) - @as(c_int, 1)) & @import("std").zig.c_translation.cast(usize, ~(@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)));
}
pub inline fn CMSG_SPACE(len: anytype) @TypeOf(CMSG_ALIGN(len) + CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr))) {
    _ = &len;
    return CMSG_ALIGN(len) + CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr));
}
pub inline fn CMSG_LEN(len: anytype) @TypeOf(CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + len) {
    _ = &len;
    return CMSG_ALIGN(@import("std").zig.c_translation.sizeof(struct_cmsghdr)) + len;
}
pub inline fn __CMSG_PADDING(len: anytype) @TypeOf((@import("std").zig.c_translation.sizeof(usize) - (len & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)))) & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1))) {
    _ = &len;
    return (@import("std").zig.c_translation.sizeof(usize) - (len & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1)))) & (@import("std").zig.c_translation.sizeof(usize) - @as(c_int, 1));
}
pub const __ASM_GENERIC_SOCKET_H = "";
pub const _LINUX_POSIX_TYPES_H = "";
pub const _LINUX_STDDEF_H = "";
pub const __struct_group = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /usr/include/linux/stddef.h:26:9
pub const __DECLARE_FLEX_ARRAY = @compileError("unable to translate macro: undefined identifier `__empty_`");
// /usr/include/linux/stddef.h:47:9
pub const __counted_by = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/linux/stddef.h:55:9
pub const __counted_by_le = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/linux/stddef.h:59:9
pub const __counted_by_be = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/linux/stddef.h:63:9
pub const _ASM_X86_POSIX_TYPES_64_H = "";
pub const __ASM_GENERIC_POSIX_TYPES_H = "";
pub const __ASM_X86_BITSPERLONG_H = "";
pub const __BITS_PER_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_BITS_PER_LONG = "";
pub const __BITS_PER_LONG_LONG = @as(c_int, 64);
pub const __ASM_GENERIC_SOCKIOS_H = "";
pub const FIOSETOWN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8901, .hex);
pub const SIOCSPGRP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8902, .hex);
pub const FIOGETOWN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8903, .hex);
pub const SIOCGPGRP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8904, .hex);
pub const SIOCATMARK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8905, .hex);
pub const SIOCGSTAMP_OLD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8906, .hex);
pub const SIOCGSTAMPNS_OLD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8907, .hex);
pub const SOL_SOCKET = @as(c_int, 1);
pub const SO_DEBUG = @as(c_int, 1);
pub const SO_REUSEADDR = @as(c_int, 2);
pub const SO_TYPE = @as(c_int, 3);
pub const SO_ERROR = @as(c_int, 4);
pub const SO_DONTROUTE = @as(c_int, 5);
pub const SO_BROADCAST = @as(c_int, 6);
pub const SO_SNDBUF = @as(c_int, 7);
pub const SO_RCVBUF = @as(c_int, 8);
pub const SO_SNDBUFFORCE = @as(c_int, 32);
pub const SO_RCVBUFFORCE = @as(c_int, 33);
pub const SO_KEEPALIVE = @as(c_int, 9);
pub const SO_OOBINLINE = @as(c_int, 10);
pub const SO_NO_CHECK = @as(c_int, 11);
pub const SO_PRIORITY = @as(c_int, 12);
pub const SO_LINGER = @as(c_int, 13);
pub const SO_BSDCOMPAT = @as(c_int, 14);
pub const SO_REUSEPORT = @as(c_int, 15);
pub const SO_PASSCRED = @as(c_int, 16);
pub const SO_PEERCRED = @as(c_int, 17);
pub const SO_RCVLOWAT = @as(c_int, 18);
pub const SO_SNDLOWAT = @as(c_int, 19);
pub const SO_RCVTIMEO_OLD = @as(c_int, 20);
pub const SO_SNDTIMEO_OLD = @as(c_int, 21);
pub const SO_SECURITY_AUTHENTICATION = @as(c_int, 22);
pub const SO_SECURITY_ENCRYPTION_TRANSPORT = @as(c_int, 23);
pub const SO_SECURITY_ENCRYPTION_NETWORK = @as(c_int, 24);
pub const SO_BINDTODEVICE = @as(c_int, 25);
pub const SO_ATTACH_FILTER = @as(c_int, 26);
pub const SO_DETACH_FILTER = @as(c_int, 27);
pub const SO_GET_FILTER = SO_ATTACH_FILTER;
pub const SO_PEERNAME = @as(c_int, 28);
pub const SO_ACCEPTCONN = @as(c_int, 30);
pub const SO_PEERSEC = @as(c_int, 31);
pub const SO_PASSSEC = @as(c_int, 34);
pub const SO_MARK = @as(c_int, 36);
pub const SO_PROTOCOL = @as(c_int, 38);
pub const SO_DOMAIN = @as(c_int, 39);
pub const SO_RXQ_OVFL = @as(c_int, 40);
pub const SO_WIFI_STATUS = @as(c_int, 41);
pub const SCM_WIFI_STATUS = SO_WIFI_STATUS;
pub const SO_PEEK_OFF = @as(c_int, 42);
pub const SO_NOFCS = @as(c_int, 43);
pub const SO_LOCK_FILTER = @as(c_int, 44);
pub const SO_SELECT_ERR_QUEUE = @as(c_int, 45);
pub const SO_BUSY_POLL = @as(c_int, 46);
pub const SO_MAX_PACING_RATE = @as(c_int, 47);
pub const SO_BPF_EXTENSIONS = @as(c_int, 48);
pub const SO_INCOMING_CPU = @as(c_int, 49);
pub const SO_ATTACH_BPF = @as(c_int, 50);
pub const SO_DETACH_BPF = SO_DETACH_FILTER;
pub const SO_ATTACH_REUSEPORT_CBPF = @as(c_int, 51);
pub const SO_ATTACH_REUSEPORT_EBPF = @as(c_int, 52);
pub const SO_CNX_ADVICE = @as(c_int, 53);
pub const SCM_TIMESTAMPING_OPT_STATS = @as(c_int, 54);
pub const SO_MEMINFO = @as(c_int, 55);
pub const SO_INCOMING_NAPI_ID = @as(c_int, 56);
pub const SO_COOKIE = @as(c_int, 57);
pub const SCM_TIMESTAMPING_PKTINFO = @as(c_int, 58);
pub const SO_PEERGROUPS = @as(c_int, 59);
pub const SO_ZEROCOPY = @as(c_int, 60);
pub const SO_TXTIME = @as(c_int, 61);
pub const SCM_TXTIME = SO_TXTIME;
pub const SO_BINDTOIFINDEX = @as(c_int, 62);
pub const SO_TIMESTAMP_OLD = @as(c_int, 29);
pub const SO_TIMESTAMPNS_OLD = @as(c_int, 35);
pub const SO_TIMESTAMPING_OLD = @as(c_int, 37);
pub const SO_TIMESTAMP_NEW = @as(c_int, 63);
pub const SO_TIMESTAMPNS_NEW = @as(c_int, 64);
pub const SO_TIMESTAMPING_NEW = @as(c_int, 65);
pub const SO_RCVTIMEO_NEW = @as(c_int, 66);
pub const SO_SNDTIMEO_NEW = @as(c_int, 67);
pub const SO_DETACH_REUSEPORT_BPF = @as(c_int, 68);
pub const SO_PREFER_BUSY_POLL = @as(c_int, 69);
pub const SO_BUSY_POLL_BUDGET = @as(c_int, 70);
pub const SO_NETNS_COOKIE = @as(c_int, 71);
pub const SO_BUF_LOCK = @as(c_int, 72);
pub const SO_RESERVE_MEM = @as(c_int, 73);
pub const SO_TXREHASH = @as(c_int, 74);
pub const SO_RCVMARK = @as(c_int, 75);
pub const SO_PASSPIDFD = @as(c_int, 76);
pub const SO_PEERPIDFD = @as(c_int, 77);
pub const SO_DEVMEM_LINEAR = @as(c_int, 78);
pub const SCM_DEVMEM_LINEAR = SO_DEVMEM_LINEAR;
pub const SO_DEVMEM_DMABUF = @as(c_int, 79);
pub const SCM_DEVMEM_DMABUF = SO_DEVMEM_DMABUF;
pub const SO_DEVMEM_DONTNEED = @as(c_int, 80);
pub const SO_TIMESTAMP = SO_TIMESTAMP_OLD;
pub const SO_TIMESTAMPNS = SO_TIMESTAMPNS_OLD;
pub const SO_TIMESTAMPING = SO_TIMESTAMPING_OLD;
pub const SO_RCVTIMEO = SO_RCVTIMEO_OLD;
pub const SO_SNDTIMEO = SO_SNDTIMEO_OLD;
pub const SCM_TIMESTAMP = SO_TIMESTAMP;
pub const SCM_TIMESTAMPNS = SO_TIMESTAMPNS;
pub const SCM_TIMESTAMPING = SO_TIMESTAMPING;
pub const __osockaddr_defined = @as(c_int, 1);
pub const __SOCKADDR_ALLTYPES = @compileError("unable to translate macro: undefined identifier `sockaddr_at`");
// /usr/include/sys/socket.h:63:10
pub const __SOCKADDR_ONETYPE = @compileError("unable to translate macro: untranslatable usage of arg `type`");
// /usr/include/sys/socket.h:78:10
pub const TH_FIN = @as(c_int, 0x01);
pub const TH_SYN = @as(c_int, 0x02);
pub const TH_RST = @as(c_int, 0x04);
pub const TH_PUSH = @as(c_int, 0x08);
pub const TH_ACK = @as(c_int, 0x10);
pub const TH_URG = @as(c_int, 0x20);
pub const TCPOPT_EOL = @as(c_int, 0);
pub const TCPOPT_NOP = @as(c_int, 1);
pub const TCPOPT_MAXSEG = @as(c_int, 2);
pub const TCPOLEN_MAXSEG = @as(c_int, 4);
pub const TCPOPT_WINDOW = @as(c_int, 3);
pub const TCPOLEN_WINDOW = @as(c_int, 3);
pub const TCPOPT_SACK_PERMITTED = @as(c_int, 4);
pub const TCPOLEN_SACK_PERMITTED = @as(c_int, 2);
pub const TCPOPT_SACK = @as(c_int, 5);
pub const TCPOPT_TIMESTAMP = @as(c_int, 8);
pub const TCPOLEN_TIMESTAMP = @as(c_int, 10);
pub const TCPOLEN_TSTAMP_APPA = TCPOLEN_TIMESTAMP + @as(c_int, 2);
pub const TCPOPT_TSTAMP_HDR = (((TCPOPT_NOP << @as(c_int, 24)) | (TCPOPT_NOP << @as(c_int, 16))) | (TCPOPT_TIMESTAMP << @as(c_int, 8))) | TCPOLEN_TIMESTAMP;
pub const TCP_MSS = @as(c_int, 512);
pub const TCP_MAXWIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const TCP_MAX_WINSHIFT = @as(c_int, 14);
pub const SOL_TCP = @as(c_int, 6);
pub const TCPI_OPT_TIMESTAMPS = @as(c_int, 1);
pub const TCPI_OPT_SACK = @as(c_int, 2);
pub const TCPI_OPT_WSCALE = @as(c_int, 4);
pub const TCPI_OPT_ECN = @as(c_int, 8);
pub const TCPI_OPT_ECN_SEEN = @as(c_int, 16);
pub const TCPI_OPT_SYN_DATA = @as(c_int, 32);
pub const TCP_MD5SIG_MAXKEYLEN = @as(c_int, 80);
pub const TCP_MD5SIG_FLAG_PREFIX = @as(c_int, 1);
pub const TCP_MD5SIG_FLAG_IFINDEX = @as(c_int, 2);
pub const TCP_COOKIE_MIN = @as(c_int, 8);
pub const TCP_COOKIE_MAX = @as(c_int, 16);
pub const TCP_COOKIE_PAIR_SIZE = @as(c_int, 2) * TCP_COOKIE_MAX;
pub const TCP_COOKIE_IN_ALWAYS = @as(c_int, 1) << @as(c_int, 0);
pub const TCP_COOKIE_OUT_NEVER = @as(c_int, 1) << @as(c_int, 1);
pub const TCP_S_DATA_IN = @as(c_int, 1) << @as(c_int, 2);
pub const TCP_S_DATA_OUT = @as(c_int, 1) << @as(c_int, 3);
pub const TCP_MSS_DEFAULT = @as(c_uint, 536);
pub const TCP_MSS_DESIRED = @as(c_uint, 1220);
pub const _NETDB_H = @as(c_int, 1);
pub const _NETINET_IN_H = @as(c_int, 1);
pub const __USE_KERNEL_IPV6_DEFS = @as(c_int, 0);
pub const IP_OPTIONS = @as(c_int, 4);
pub const IP_HDRINCL = @as(c_int, 3);
pub const IP_TOS = @as(c_int, 1);
pub const IP_TTL = @as(c_int, 2);
pub const IP_RECVOPTS = @as(c_int, 6);
pub const IP_RECVRETOPTS = IP_RETOPTS;
pub const IP_RETOPTS = @as(c_int, 7);
pub const IP_MULTICAST_IF = @as(c_int, 32);
pub const IP_MULTICAST_TTL = @as(c_int, 33);
pub const IP_MULTICAST_LOOP = @as(c_int, 34);
pub const IP_ADD_MEMBERSHIP = @as(c_int, 35);
pub const IP_DROP_MEMBERSHIP = @as(c_int, 36);
pub const IP_UNBLOCK_SOURCE = @as(c_int, 37);
pub const IP_BLOCK_SOURCE = @as(c_int, 38);
pub const IP_ADD_SOURCE_MEMBERSHIP = @as(c_int, 39);
pub const IP_DROP_SOURCE_MEMBERSHIP = @as(c_int, 40);
pub const IP_MSFILTER = @as(c_int, 41);
pub const MCAST_JOIN_GROUP = @as(c_int, 42);
pub const MCAST_BLOCK_SOURCE = @as(c_int, 43);
pub const MCAST_UNBLOCK_SOURCE = @as(c_int, 44);
pub const MCAST_LEAVE_GROUP = @as(c_int, 45);
pub const MCAST_JOIN_SOURCE_GROUP = @as(c_int, 46);
pub const MCAST_LEAVE_SOURCE_GROUP = @as(c_int, 47);
pub const MCAST_MSFILTER = @as(c_int, 48);
pub const IP_MULTICAST_ALL = @as(c_int, 49);
pub const IP_UNICAST_IF = @as(c_int, 50);
pub const MCAST_EXCLUDE = @as(c_int, 0);
pub const MCAST_INCLUDE = @as(c_int, 1);
pub const IP_ROUTER_ALERT = @as(c_int, 5);
pub const IP_PKTINFO = @as(c_int, 8);
pub const IP_PKTOPTIONS = @as(c_int, 9);
pub const IP_PMTUDISC = @as(c_int, 10);
pub const IP_MTU_DISCOVER = @as(c_int, 10);
pub const IP_RECVERR = @as(c_int, 11);
pub const IP_RECVTTL = @as(c_int, 12);
pub const IP_RECVTOS = @as(c_int, 13);
pub const IP_MTU = @as(c_int, 14);
pub const IP_FREEBIND = @as(c_int, 15);
pub const IP_IPSEC_POLICY = @as(c_int, 16);
pub const IP_XFRM_POLICY = @as(c_int, 17);
pub const IP_PASSSEC = @as(c_int, 18);
pub const IP_TRANSPARENT = @as(c_int, 19);
pub const IP_ORIGDSTADDR = @as(c_int, 20);
pub const IP_RECVORIGDSTADDR = IP_ORIGDSTADDR;
pub const IP_MINTTL = @as(c_int, 21);
pub const IP_NODEFRAG = @as(c_int, 22);
pub const IP_CHECKSUM = @as(c_int, 23);
pub const IP_BIND_ADDRESS_NO_PORT = @as(c_int, 24);
pub const IP_RECVFRAGSIZE = @as(c_int, 25);
pub const IP_RECVERR_RFC4884 = @as(c_int, 26);
pub const IP_PMTUDISC_DONT = @as(c_int, 0);
pub const IP_PMTUDISC_WANT = @as(c_int, 1);
pub const IP_PMTUDISC_DO = @as(c_int, 2);
pub const IP_PMTUDISC_PROBE = @as(c_int, 3);
pub const IP_PMTUDISC_INTERFACE = @as(c_int, 4);
pub const IP_PMTUDISC_OMIT = @as(c_int, 5);
pub const IP_LOCAL_PORT_RANGE = @as(c_int, 51);
pub const IP_PROTOCOL = @as(c_int, 52);
pub const SOL_IP = @as(c_int, 0);
pub const IP_DEFAULT_MULTICAST_TTL = @as(c_int, 1);
pub const IP_DEFAULT_MULTICAST_LOOP = @as(c_int, 1);
pub const IP_MAX_MEMBERSHIPS = @as(c_int, 20);
pub const IPV6_ADDRFORM = @as(c_int, 1);
pub const IPV6_2292PKTINFO = @as(c_int, 2);
pub const IPV6_2292HOPOPTS = @as(c_int, 3);
pub const IPV6_2292DSTOPTS = @as(c_int, 4);
pub const IPV6_2292RTHDR = @as(c_int, 5);
pub const IPV6_2292PKTOPTIONS = @as(c_int, 6);
pub const IPV6_CHECKSUM = @as(c_int, 7);
pub const IPV6_2292HOPLIMIT = @as(c_int, 8);
pub const SCM_SRCRT = @compileError("unable to translate macro: undefined identifier `IPV6_RXSRCRT`");
// /usr/include/bits/in.h:172:9
pub const IPV6_NEXTHOP = @as(c_int, 9);
pub const IPV6_AUTHHDR = @as(c_int, 10);
pub const IPV6_UNICAST_HOPS = @as(c_int, 16);
pub const IPV6_MULTICAST_IF = @as(c_int, 17);
pub const IPV6_MULTICAST_HOPS = @as(c_int, 18);
pub const IPV6_MULTICAST_LOOP = @as(c_int, 19);
pub const IPV6_JOIN_GROUP = @as(c_int, 20);
pub const IPV6_LEAVE_GROUP = @as(c_int, 21);
pub const IPV6_ROUTER_ALERT = @as(c_int, 22);
pub const IPV6_MTU_DISCOVER = @as(c_int, 23);
pub const IPV6_MTU = @as(c_int, 24);
pub const IPV6_RECVERR = @as(c_int, 25);
pub const IPV6_V6ONLY = @as(c_int, 26);
pub const IPV6_JOIN_ANYCAST = @as(c_int, 27);
pub const IPV6_LEAVE_ANYCAST = @as(c_int, 28);
pub const IPV6_MULTICAST_ALL = @as(c_int, 29);
pub const IPV6_ROUTER_ALERT_ISOLATE = @as(c_int, 30);
pub const IPV6_RECVERR_RFC4884 = @as(c_int, 31);
pub const IPV6_IPSEC_POLICY = @as(c_int, 34);
pub const IPV6_XFRM_POLICY = @as(c_int, 35);
pub const IPV6_HDRINCL = @as(c_int, 36);
pub const IPV6_RECVPKTINFO = @as(c_int, 49);
pub const IPV6_PKTINFO = @as(c_int, 50);
pub const IPV6_RECVHOPLIMIT = @as(c_int, 51);
pub const IPV6_HOPLIMIT = @as(c_int, 52);
pub const IPV6_RECVHOPOPTS = @as(c_int, 53);
pub const IPV6_HOPOPTS = @as(c_int, 54);
pub const IPV6_RTHDRDSTOPTS = @as(c_int, 55);
pub const IPV6_RECVRTHDR = @as(c_int, 56);
pub const IPV6_RTHDR = @as(c_int, 57);
pub const IPV6_RECVDSTOPTS = @as(c_int, 58);
pub const IPV6_DSTOPTS = @as(c_int, 59);
pub const IPV6_RECVPATHMTU = @as(c_int, 60);
pub const IPV6_PATHMTU = @as(c_int, 61);
pub const IPV6_DONTFRAG = @as(c_int, 62);
pub const IPV6_RECVTCLASS = @as(c_int, 66);
pub const IPV6_TCLASS = @as(c_int, 67);
pub const IPV6_AUTOFLOWLABEL = @as(c_int, 70);
pub const IPV6_ADDR_PREFERENCES = @as(c_int, 72);
pub const IPV6_MINHOPCOUNT = @as(c_int, 73);
pub const IPV6_ORIGDSTADDR = @as(c_int, 74);
pub const IPV6_RECVORIGDSTADDR = IPV6_ORIGDSTADDR;
pub const IPV6_TRANSPARENT = @as(c_int, 75);
pub const IPV6_UNICAST_IF = @as(c_int, 76);
pub const IPV6_RECVFRAGSIZE = @as(c_int, 77);
pub const IPV6_FREEBIND = @as(c_int, 78);
pub const IPV6_ADD_MEMBERSHIP = IPV6_JOIN_GROUP;
pub const IPV6_DROP_MEMBERSHIP = IPV6_LEAVE_GROUP;
pub const IPV6_RXHOPOPTS = IPV6_HOPOPTS;
pub const IPV6_RXDSTOPTS = IPV6_DSTOPTS;
pub const IPV6_PMTUDISC_DONT = @as(c_int, 0);
pub const IPV6_PMTUDISC_WANT = @as(c_int, 1);
pub const IPV6_PMTUDISC_DO = @as(c_int, 2);
pub const IPV6_PMTUDISC_PROBE = @as(c_int, 3);
pub const IPV6_PMTUDISC_INTERFACE = @as(c_int, 4);
pub const IPV6_PMTUDISC_OMIT = @as(c_int, 5);
pub const SOL_IPV6 = @as(c_int, 41);
pub const SOL_ICMPV6 = @as(c_int, 58);
pub const IPV6_RTHDR_LOOSE = @as(c_int, 0);
pub const IPV6_RTHDR_STRICT = @as(c_int, 1);
pub const IPV6_RTHDR_TYPE_0 = @as(c_int, 0);
pub inline fn IN_CLASSA(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) == @as(c_int, 0)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) == @as(c_int, 0);
}
pub const IN_CLASSA_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff000000, .hex);
pub const IN_CLASSA_NSHIFT = @as(c_int, 24);
pub const IN_CLASSA_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IN_CLASSA_NET;
pub const IN_CLASSA_MAX = @as(c_int, 128);
pub inline fn IN_CLASSB(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
}
pub const IN_CLASSB_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff0000, .hex);
pub const IN_CLASSB_NSHIFT = @as(c_int, 16);
pub const IN_CLASSB_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IN_CLASSB_NET;
pub const IN_CLASSB_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub inline fn IN_CLASSC(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000000, .hex);
}
pub const IN_CLASSC_NET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffff00, .hex);
pub const IN_CLASSC_NSHIFT = @as(c_int, 8);
pub const IN_CLASSC_HOST = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex) & ~IN_CLASSC_NET;
pub inline fn IN_CLASSD(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex);
}
pub inline fn IN_MULTICAST(a: anytype) @TypeOf(IN_CLASSD(a)) {
    _ = &a;
    return IN_CLASSD(a);
}
pub inline fn IN_EXPERIMENTAL(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex);
}
pub inline fn IN_BADCLASS(a: anytype) @TypeOf((@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) {
    _ = &a;
    return (@import("std").zig.c_translation.cast(in_addr_t, a) & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex)) == @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xf0000000, .hex);
}
pub const INADDR_ANY = @import("std").zig.c_translation.cast(in_addr_t, @as(c_int, 0x00000000));
pub const INADDR_BROADCAST = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const INADDR_NONE = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffffffff, .hex));
pub const INADDR_DUMMY = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xc0000008, .hex));
pub const IN_LOOPBACKNET = @as(c_int, 127);
pub const INADDR_LOOPBACK = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x7f000001, .hex));
pub const INADDR_UNSPEC_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000000, .hex));
pub const INADDR_ALLHOSTS_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000001, .hex));
pub const INADDR_ALLRTRS_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe0000002, .hex));
pub const INADDR_ALLSNOOPERS_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe000006a, .hex));
pub const INADDR_MAX_LOCAL_GROUP = @import("std").zig.c_translation.cast(in_addr_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xe00000ff, .hex));
pub const s6_addr = @compileError("unable to translate macro: undefined identifier `__in6_u`");
// /usr/include/netinet/in.h:229:9
pub const s6_addr16 = @compileError("unable to translate macro: undefined identifier `__in6_u`");
// /usr/include/netinet/in.h:231:10
pub const s6_addr32 = @compileError("unable to translate macro: undefined identifier `__in6_u`");
// /usr/include/netinet/in.h:232:10
pub const IN6ADDR_ANY_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/netinet/in.h:239:9
pub const IN6ADDR_LOOPBACK_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/netinet/in.h:240:9
pub const INET_ADDRSTRLEN = @as(c_int, 16);
pub const INET6_ADDRSTRLEN = @as(c_int, 46);
pub inline fn IP_MSFILTER_SIZE(numsrc: anytype) @TypeOf((@import("std").zig.c_translation.sizeof(struct_ip_msfilter) - @import("std").zig.c_translation.sizeof(struct_in_addr)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_in_addr))) {
    _ = &numsrc;
    return (@import("std").zig.c_translation.sizeof(struct_ip_msfilter) - @import("std").zig.c_translation.sizeof(struct_in_addr)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_in_addr));
}
pub inline fn GROUP_FILTER_SIZE(numsrc: anytype) @TypeOf((@import("std").zig.c_translation.sizeof(struct_group_filter) - @import("std").zig.c_translation.sizeof(struct_sockaddr_storage)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_sockaddr_storage))) {
    _ = &numsrc;
    return (@import("std").zig.c_translation.sizeof(struct_group_filter) - @import("std").zig.c_translation.sizeof(struct_sockaddr_storage)) + (numsrc * @import("std").zig.c_translation.sizeof(struct_sockaddr_storage));
}
pub const IN6_IS_ADDR_UNSPECIFIED = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:435:10
pub const IN6_IS_ADDR_LOOPBACK = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:443:10
pub const IN6_IS_ADDR_LINKLOCAL = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:451:10
pub const IN6_IS_ADDR_SITELOCAL = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:456:10
pub const IN6_IS_ADDR_V4MAPPED = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:461:10
pub const IN6_IS_ADDR_V4COMPAT = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:468:10
pub const IN6_ARE_ADDR_EQUAL = @compileError("unable to translate macro: undefined identifier `__a`");
// /usr/include/netinet/in.h:476:10
pub const IN6_IS_ADDR_MULTICAST = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:523:9
pub const IN6_IS_ADDR_MC_NODELOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:535:9
pub const IN6_IS_ADDR_MC_LINKLOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:539:9
pub const IN6_IS_ADDR_MC_SITELOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:543:9
pub const IN6_IS_ADDR_MC_ORGLOCAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:547:9
pub const IN6_IS_ADDR_MC_GLOBAL = @compileError("unable to translate C expr: unexpected token 'const'");
// /usr/include/netinet/in.h:551:9
pub const _RPC_NETDB_H = @as(c_int, 1);
pub const __sigevent_t_defined = @as(c_int, 1);
pub const ____sigval_t_defined = "";
pub const __SIGEV_MAX_SIZE = @as(c_int, 64);
pub const __SIGEV_PAD_SIZE = @import("std").zig.c_translation.MacroArithmetic.div(__SIGEV_MAX_SIZE, @import("std").zig.c_translation.sizeof(c_int)) - @as(c_int, 4);
pub const sigev_notify_function = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/bits/types/sigevent_t.h:45:9
pub const sigev_notify_attributes = @compileError("unable to translate macro: undefined identifier `_sigev_un`");
// /usr/include/bits/types/sigevent_t.h:46:9
pub const _PATH_HEQUIV = "/etc/hosts.equiv";
pub const _PATH_HOSTS = "/etc/hosts";
pub const _PATH_NETWORKS = "/etc/networks";
pub const _PATH_NSSWITCH_CONF = "/etc/nsswitch.conf";
pub const _PATH_PROTOCOLS = "/etc/protocols";
pub const _PATH_SERVICES = "/etc/services";
pub const h_errno = __h_errno_location().*;
pub const HOST_NOT_FOUND = @as(c_int, 1);
pub const TRY_AGAIN = @as(c_int, 2);
pub const NO_RECOVERY = @as(c_int, 3);
pub const NO_DATA = @as(c_int, 4);
pub const NETDB_INTERNAL = -@as(c_int, 1);
pub const NETDB_SUCCESS = @as(c_int, 0);
pub const NO_ADDRESS = NO_DATA;
pub const SCOPE_DELIMITER = '%';
pub const h_addr = @compileError("unable to translate macro: undefined identifier `h_addr_list`");
// /usr/include/netdb.h:106:10
pub const GAI_WAIT = @as(c_int, 0);
pub const GAI_NOWAIT = @as(c_int, 1);
pub const AI_PASSIVE = @as(c_int, 0x0001);
pub const AI_CANONNAME = @as(c_int, 0x0002);
pub const AI_NUMERICHOST = @as(c_int, 0x0004);
pub const AI_V4MAPPED = @as(c_int, 0x0008);
pub const AI_ALL = @as(c_int, 0x0010);
pub const AI_ADDRCONFIG = @as(c_int, 0x0020);
pub const AI_IDN = @as(c_int, 0x0040);
pub const AI_CANONIDN = @as(c_int, 0x0080);
pub const AI_IDN_ALLOW_UNASSIGNED = @compileError("unable to translate C expr: unexpected token 'A number'");
// /usr/include/netdb.h:608:11
pub const AI_IDN_USE_STD3_ASCII_RULES = @compileError("unable to translate C expr: unexpected token 'A number'");
// /usr/include/netdb.h:610:11
pub const AI_NUMERICSERV = @as(c_int, 0x0400);
pub const EAI_BADFLAGS = -@as(c_int, 1);
pub const EAI_NONAME = -@as(c_int, 2);
pub const EAI_AGAIN = -@as(c_int, 3);
pub const EAI_FAIL = -@as(c_int, 4);
pub const EAI_FAMILY = -@as(c_int, 6);
pub const EAI_SOCKTYPE = -@as(c_int, 7);
pub const EAI_SERVICE = -@as(c_int, 8);
pub const EAI_MEMORY = -@as(c_int, 10);
pub const EAI_SYSTEM = -@as(c_int, 11);
pub const EAI_OVERFLOW = -@as(c_int, 12);
pub const EAI_NODATA = -@as(c_int, 5);
pub const EAI_ADDRFAMILY = -@as(c_int, 9);
pub const EAI_INPROGRESS = -@as(c_int, 100);
pub const EAI_CANCELED = -@as(c_int, 101);
pub const EAI_NOTCANCELED = -@as(c_int, 102);
pub const EAI_ALLDONE = -@as(c_int, 103);
pub const EAI_INTR = -@as(c_int, 104);
pub const EAI_IDN_ENCODE = -@as(c_int, 105);
pub const NI_MAXHOST = @as(c_int, 1025);
pub const NI_MAXSERV = @as(c_int, 32);
pub const NI_NUMERICHOST = @as(c_int, 1);
pub const NI_NUMERICSERV = @as(c_int, 2);
pub const NI_NOFQDN = @as(c_int, 4);
pub const NI_NAMEREQD = @as(c_int, 8);
pub const NI_DGRAM = @as(c_int, 16);
pub const NI_IDN = @as(c_int, 32);
pub const NI_IDN_ALLOW_UNASSIGNED = @compileError("unable to translate C expr: unexpected token 'A number'");
// /usr/include/netdb.h:649:11
pub const NI_IDN_USE_STD3_ASCII_RULES = @compileError("unable to translate C expr: unexpected token 'A number'");
// /usr/include/netdb.h:651:11
pub const _PTHREAD_H = @as(c_int, 1);
pub const _SCHED_H = @as(c_int, 1);
pub const __need_NULL = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const _BITS_SCHED_H = @as(c_int, 1);
pub const SCHED_OTHER = @as(c_int, 0);
pub const SCHED_FIFO = @as(c_int, 1);
pub const SCHED_RR = @as(c_int, 2);
pub const SCHED_BATCH = @as(c_int, 3);
pub const SCHED_ISO = @as(c_int, 4);
pub const SCHED_IDLE = @as(c_int, 5);
pub const SCHED_DEADLINE = @as(c_int, 6);
pub const SCHED_RESET_ON_FORK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const CSIGNAL = @as(c_int, 0x000000ff);
pub const CLONE_VM = @as(c_int, 0x00000100);
pub const CLONE_FS = @as(c_int, 0x00000200);
pub const CLONE_FILES = @as(c_int, 0x00000400);
pub const CLONE_SIGHAND = @as(c_int, 0x00000800);
pub const CLONE_PIDFD = @as(c_int, 0x00001000);
pub const CLONE_PTRACE = @as(c_int, 0x00002000);
pub const CLONE_VFORK = @as(c_int, 0x00004000);
pub const CLONE_PARENT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00008000, .hex);
pub const CLONE_THREAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00010000, .hex);
pub const CLONE_NEWNS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00020000, .hex);
pub const CLONE_SYSVSEM = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00040000, .hex);
pub const CLONE_SETTLS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00080000, .hex);
pub const CLONE_PARENT_SETTID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00100000, .hex);
pub const CLONE_CHILD_CLEARTID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00200000, .hex);
pub const CLONE_DETACHED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00400000, .hex);
pub const CLONE_UNTRACED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x00800000, .hex);
pub const CLONE_CHILD_SETTID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const CLONE_NEWCGROUP = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x02000000, .hex);
pub const CLONE_NEWUTS = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x04000000, .hex);
pub const CLONE_NEWIPC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const CLONE_NEWUSER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const CLONE_NEWPID = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const CLONE_NEWNET = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const CLONE_IO = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const CLONE_NEWTIME = @as(c_int, 0x00000080);
pub const _BITS_TYPES_STRUCT_SCHED_PARAM = @as(c_int, 1);
pub const _BITS_CPU_SET_H = @as(c_int, 1);
pub const __CPU_SETSIZE = @as(c_int, 1024);
pub const __NCPUBITS = @as(c_int, 8) * @import("std").zig.c_translation.sizeof(__cpu_mask);
pub inline fn __CPUELT(cpu: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(cpu, __NCPUBITS)) {
    _ = &cpu;
    return @import("std").zig.c_translation.MacroArithmetic.div(cpu, __NCPUBITS);
}
pub inline fn __CPUMASK(cpu: anytype) @TypeOf(@import("std").zig.c_translation.cast(__cpu_mask, @as(c_int, 1)) << @import("std").zig.c_translation.MacroArithmetic.rem(cpu, __NCPUBITS)) {
    _ = &cpu;
    return @import("std").zig.c_translation.cast(__cpu_mask, @as(c_int, 1)) << @import("std").zig.c_translation.MacroArithmetic.rem(cpu, __NCPUBITS);
}
pub const __CPU_ZERO_S = @compileError("unable to translate C expr: unexpected token 'do'");
// /usr/include/bits/cpu-set.h:46:10
pub const __CPU_SET_S = @compileError("unable to translate macro: undefined identifier `__cpu`");
// /usr/include/bits/cpu-set.h:58:9
pub const __CPU_CLR_S = @compileError("unable to translate macro: undefined identifier `__cpu`");
// /usr/include/bits/cpu-set.h:65:9
pub const __CPU_ISSET_S = @compileError("unable to translate macro: undefined identifier `__cpu`");
// /usr/include/bits/cpu-set.h:72:9
pub inline fn __CPU_COUNT_S(setsize: anytype, cpusetp: anytype) @TypeOf(__sched_cpucount(setsize, cpusetp)) {
    _ = &setsize;
    _ = &cpusetp;
    return __sched_cpucount(setsize, cpusetp);
}
pub const __CPU_EQUAL_S = @compileError("unable to translate macro: undefined identifier `__builtin_memcmp`");
// /usr/include/bits/cpu-set.h:84:10
pub const __CPU_OP_S = @compileError("unable to translate macro: undefined identifier `__dest`");
// /usr/include/bits/cpu-set.h:99:9
pub inline fn __CPU_ALLOC_SIZE(count: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div((count + __NCPUBITS) - @as(c_int, 1), __NCPUBITS) * @import("std").zig.c_translation.sizeof(__cpu_mask)) {
    _ = &count;
    return @import("std").zig.c_translation.MacroArithmetic.div((count + __NCPUBITS) - @as(c_int, 1), __NCPUBITS) * @import("std").zig.c_translation.sizeof(__cpu_mask);
}
pub inline fn __CPU_ALLOC(count: anytype) @TypeOf(__sched_cpualloc(count)) {
    _ = &count;
    return __sched_cpualloc(count);
}
pub inline fn __CPU_FREE(cpuset: anytype) @TypeOf(__sched_cpufree(cpuset)) {
    _ = &cpuset;
    return __sched_cpufree(cpuset);
}
pub const __sched_priority = @compileError("unable to translate macro: undefined identifier `sched_priority`");
// /usr/include/sched.h:48:9
pub const CPU_SETSIZE = __CPU_SETSIZE;
pub inline fn CPU_SET(cpu: anytype, cpusetp: anytype) @TypeOf(__CPU_SET_S(cpu, @import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp)) {
    _ = &cpu;
    _ = &cpusetp;
    return __CPU_SET_S(cpu, @import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp);
}
pub inline fn CPU_CLR(cpu: anytype, cpusetp: anytype) @TypeOf(__CPU_CLR_S(cpu, @import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp)) {
    _ = &cpu;
    _ = &cpusetp;
    return __CPU_CLR_S(cpu, @import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp);
}
pub inline fn CPU_ISSET(cpu: anytype, cpusetp: anytype) @TypeOf(__CPU_ISSET_S(cpu, @import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp)) {
    _ = &cpu;
    _ = &cpusetp;
    return __CPU_ISSET_S(cpu, @import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp);
}
pub inline fn CPU_ZERO(cpusetp: anytype) @TypeOf(__CPU_ZERO_S(@import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp)) {
    _ = &cpusetp;
    return __CPU_ZERO_S(@import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp);
}
pub inline fn CPU_COUNT(cpusetp: anytype) @TypeOf(__CPU_COUNT_S(@import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp)) {
    _ = &cpusetp;
    return __CPU_COUNT_S(@import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp);
}
pub inline fn CPU_SET_S(cpu: anytype, setsize: anytype, cpusetp: anytype) @TypeOf(__CPU_SET_S(cpu, setsize, cpusetp)) {
    _ = &cpu;
    _ = &setsize;
    _ = &cpusetp;
    return __CPU_SET_S(cpu, setsize, cpusetp);
}
pub inline fn CPU_CLR_S(cpu: anytype, setsize: anytype, cpusetp: anytype) @TypeOf(__CPU_CLR_S(cpu, setsize, cpusetp)) {
    _ = &cpu;
    _ = &setsize;
    _ = &cpusetp;
    return __CPU_CLR_S(cpu, setsize, cpusetp);
}
pub inline fn CPU_ISSET_S(cpu: anytype, setsize: anytype, cpusetp: anytype) @TypeOf(__CPU_ISSET_S(cpu, setsize, cpusetp)) {
    _ = &cpu;
    _ = &setsize;
    _ = &cpusetp;
    return __CPU_ISSET_S(cpu, setsize, cpusetp);
}
pub inline fn CPU_ZERO_S(setsize: anytype, cpusetp: anytype) @TypeOf(__CPU_ZERO_S(setsize, cpusetp)) {
    _ = &setsize;
    _ = &cpusetp;
    return __CPU_ZERO_S(setsize, cpusetp);
}
pub inline fn CPU_COUNT_S(setsize: anytype, cpusetp: anytype) @TypeOf(__CPU_COUNT_S(setsize, cpusetp)) {
    _ = &setsize;
    _ = &cpusetp;
    return __CPU_COUNT_S(setsize, cpusetp);
}
pub inline fn CPU_EQUAL(cpusetp1: anytype, cpusetp2: anytype) @TypeOf(__CPU_EQUAL_S(@import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp1, cpusetp2)) {
    _ = &cpusetp1;
    _ = &cpusetp2;
    return __CPU_EQUAL_S(@import("std").zig.c_translation.sizeof(cpu_set_t), cpusetp1, cpusetp2);
}
pub inline fn CPU_EQUAL_S(setsize: anytype, cpusetp1: anytype, cpusetp2: anytype) @TypeOf(__CPU_EQUAL_S(setsize, cpusetp1, cpusetp2)) {
    _ = &setsize;
    _ = &cpusetp1;
    _ = &cpusetp2;
    return __CPU_EQUAL_S(setsize, cpusetp1, cpusetp2);
}
pub const CPU_AND = @compileError("unable to translate C expr: unexpected token ')'");
// /usr/include/sched.h:111:10
pub const CPU_OR = @compileError("unable to translate C expr: unexpected token '|'");
// /usr/include/sched.h:113:10
pub const CPU_XOR = @compileError("unable to translate C expr: unexpected token '^'");
// /usr/include/sched.h:115:10
pub const CPU_AND_S = @compileError("unable to translate C expr: unexpected token ')'");
// /usr/include/sched.h:117:10
pub const CPU_OR_S = @compileError("unable to translate C expr: unexpected token '|'");
// /usr/include/sched.h:119:10
pub const CPU_XOR_S = @compileError("unable to translate C expr: unexpected token '^'");
// /usr/include/sched.h:121:10
pub inline fn CPU_ALLOC_SIZE(count: anytype) @TypeOf(__CPU_ALLOC_SIZE(count)) {
    _ = &count;
    return __CPU_ALLOC_SIZE(count);
}
pub inline fn CPU_ALLOC(count: anytype) @TypeOf(__CPU_ALLOC(count)) {
    _ = &count;
    return __CPU_ALLOC(count);
}
pub inline fn CPU_FREE(cpuset: anytype) @TypeOf(__CPU_FREE(cpuset)) {
    _ = &cpuset;
    return __CPU_FREE(cpuset);
}
pub const _TIME_H = @as(c_int, 1);
pub const _BITS_TIME_H = @as(c_int, 1);
pub const CLOCKS_PER_SEC = @import("std").zig.c_translation.cast(__clock_t, @import("std").zig.c_translation.promoteIntLiteral(c_int, 1000000, .decimal));
pub const CLOCK_REALTIME = @as(c_int, 0);
pub const CLOCK_MONOTONIC = @as(c_int, 1);
pub const CLOCK_PROCESS_CPUTIME_ID = @as(c_int, 2);
pub const CLOCK_THREAD_CPUTIME_ID = @as(c_int, 3);
pub const CLOCK_MONOTONIC_RAW = @as(c_int, 4);
pub const CLOCK_REALTIME_COARSE = @as(c_int, 5);
pub const CLOCK_MONOTONIC_COARSE = @as(c_int, 6);
pub const CLOCK_BOOTTIME = @as(c_int, 7);
pub const CLOCK_REALTIME_ALARM = @as(c_int, 8);
pub const CLOCK_BOOTTIME_ALARM = @as(c_int, 9);
pub const CLOCK_TAI = @as(c_int, 11);
pub const TIMER_ABSTIME = @as(c_int, 1);
pub const _BITS_TIMEX_H = @as(c_int, 1);
pub const ADJ_OFFSET = @as(c_int, 0x0001);
pub const ADJ_FREQUENCY = @as(c_int, 0x0002);
pub const ADJ_MAXERROR = @as(c_int, 0x0004);
pub const ADJ_ESTERROR = @as(c_int, 0x0008);
pub const ADJ_STATUS = @as(c_int, 0x0010);
pub const ADJ_TIMECONST = @as(c_int, 0x0020);
pub const ADJ_TAI = @as(c_int, 0x0080);
pub const ADJ_SETOFFSET = @as(c_int, 0x0100);
pub const ADJ_MICRO = @as(c_int, 0x1000);
pub const ADJ_NANO = @as(c_int, 0x2000);
pub const ADJ_TICK = @as(c_int, 0x4000);
pub const ADJ_OFFSET_SINGLESHOT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8001, .hex);
pub const ADJ_OFFSET_SS_READ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xa001, .hex);
pub const MOD_OFFSET = ADJ_OFFSET;
pub const MOD_FREQUENCY = ADJ_FREQUENCY;
pub const MOD_MAXERROR = ADJ_MAXERROR;
pub const MOD_ESTERROR = ADJ_ESTERROR;
pub const MOD_STATUS = ADJ_STATUS;
pub const MOD_TIMECONST = ADJ_TIMECONST;
pub const MOD_CLKB = ADJ_TICK;
pub const MOD_CLKA = ADJ_OFFSET_SINGLESHOT;
pub const MOD_TAI = ADJ_TAI;
pub const MOD_MICRO = ADJ_MICRO;
pub const MOD_NANO = ADJ_NANO;
pub const STA_PLL = @as(c_int, 0x0001);
pub const STA_PPSFREQ = @as(c_int, 0x0002);
pub const STA_PPSTIME = @as(c_int, 0x0004);
pub const STA_FLL = @as(c_int, 0x0008);
pub const STA_INS = @as(c_int, 0x0010);
pub const STA_DEL = @as(c_int, 0x0020);
pub const STA_UNSYNC = @as(c_int, 0x0040);
pub const STA_FREQHOLD = @as(c_int, 0x0080);
pub const STA_PPSSIGNAL = @as(c_int, 0x0100);
pub const STA_PPSJITTER = @as(c_int, 0x0200);
pub const STA_PPSWANDER = @as(c_int, 0x0400);
pub const STA_PPSERROR = @as(c_int, 0x0800);
pub const STA_CLOCKERR = @as(c_int, 0x1000);
pub const STA_NANO = @as(c_int, 0x2000);
pub const STA_MODE = @as(c_int, 0x4000);
pub const STA_CLK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const STA_RONLY = ((((((STA_PPSSIGNAL | STA_PPSJITTER) | STA_PPSWANDER) | STA_PPSERROR) | STA_CLOCKERR) | STA_NANO) | STA_MODE) | STA_CLK;
pub const __struct_tm_defined = @as(c_int, 1);
pub const __itimerspec_defined = @as(c_int, 1);
pub const _BITS_TYPES_LOCALE_T_H = @as(c_int, 1);
pub const _BITS_TYPES___LOCALE_T_H = @as(c_int, 1);
pub const TIME_UTC = @as(c_int, 1);
pub inline fn __isleap(year: anytype) @TypeOf((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 400)) == @as(c_int, 0)))) {
    _ = &year;
    return (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 4)) == @as(c_int, 0)) and ((@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 100)) != @as(c_int, 0)) or (@import("std").zig.c_translation.MacroArithmetic.rem(year, @as(c_int, 400)) == @as(c_int, 0)));
}
pub const _BITS_SETJMP_H = @as(c_int, 1);
pub const __jmp_buf_tag_defined = @as(c_int, 1);
pub const __SC_THREAD_STACK_MIN_VALUE = @as(c_int, 75);
pub const PTHREAD_STACK_MIN = __sysconf(__SC_THREAD_STACK_MIN_VALUE);
pub const PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/pthread.h:90:9
pub const PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/pthread.h:93:10
pub const PTHREAD_ERRORCHECK_MUTEX_INITIALIZER_NP = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/pthread.h:95:10
pub const PTHREAD_ADAPTIVE_MUTEX_INITIALIZER_NP = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/pthread.h:97:10
pub const PTHREAD_RWLOCK_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/pthread.h:114:10
pub const PTHREAD_RWLOCK_WRITER_NONRECURSIVE_INITIALIZER_NP = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/pthread.h:117:11
pub const PTHREAD_COND_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/pthread.h:155:9
pub const PTHREAD_CANCELED = @import("std").zig.c_translation.cast(?*anyopaque, -@as(c_int, 1));
pub const PTHREAD_ONCE_INIT = @as(c_int, 0);
pub const PTHREAD_BARRIER_SERIAL_THREAD = -@as(c_int, 1);
pub const PTHREAD_ATTR_NO_SIGMASK_NP = -@as(c_int, 1);
pub const __cleanup_fct_attribute = "";
pub const pthread_cleanup_push = @compileError("unable to translate macro: undefined identifier `__cancel_buf`");
// /usr/include/pthread.h:681:10
pub const pthread_cleanup_pop = @compileError("unable to translate macro: undefined identifier `__cancel_buf`");
// /usr/include/pthread.h:702:10
pub const pthread_cleanup_push_defer_np = @compileError("unable to translate macro: undefined identifier `__cancel_buf`");
// /usr/include/pthread.h:716:11
pub const pthread_cleanup_pop_restore_np = @compileError("unable to translate macro: undefined identifier `__cancel_buf`");
// /usr/include/pthread.h:738:11
pub inline fn __sigsetjmp_cancel(env: anytype, savemask: anytype) @TypeOf(__sigsetjmp(@import("std").zig.c_translation.cast([*c]struct___jmp_buf_tag, @import("std").zig.c_translation.cast(?*anyopaque, env)), savemask)) {
    _ = &env;
    _ = &savemask;
    return __sigsetjmp(@import("std").zig.c_translation.cast([*c]struct___jmp_buf_tag, @import("std").zig.c_translation.cast(?*anyopaque, env)), savemask);
}
pub const _UNISTD_H = @as(c_int, 1);
pub const _POSIX_VERSION = @as(c_long, 200809);
pub const __POSIX2_THIS_VERSION = @as(c_long, 200809);
pub const _POSIX2_VERSION = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_VERSION = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_BIND = __POSIX2_THIS_VERSION;
pub const _POSIX2_C_DEV = __POSIX2_THIS_VERSION;
pub const _POSIX2_SW_DEV = __POSIX2_THIS_VERSION;
pub const _POSIX2_LOCALEDEF = __POSIX2_THIS_VERSION;
pub const _XOPEN_VERSION = @as(c_int, 700);
pub const _XOPEN_XCU_VERSION = @as(c_int, 4);
pub const _XOPEN_XPG2 = @as(c_int, 1);
pub const _XOPEN_XPG3 = @as(c_int, 1);
pub const _XOPEN_XPG4 = @as(c_int, 1);
pub const _XOPEN_UNIX = @as(c_int, 1);
pub const _XOPEN_ENH_I18N = @as(c_int, 1);
pub const _XOPEN_LEGACY = @as(c_int, 1);
pub const _BITS_POSIX_OPT_H = @as(c_int, 1);
pub const _POSIX_JOB_CONTROL = @as(c_int, 1);
pub const _POSIX_SAVED_IDS = @as(c_int, 1);
pub const _POSIX_PRIORITY_SCHEDULING = @as(c_long, 200809);
pub const _POSIX_SYNCHRONIZED_IO = @as(c_long, 200809);
pub const _POSIX_FSYNC = @as(c_long, 200809);
pub const _POSIX_MAPPED_FILES = @as(c_long, 200809);
pub const _POSIX_MEMLOCK = @as(c_long, 200809);
pub const _POSIX_MEMLOCK_RANGE = @as(c_long, 200809);
pub const _POSIX_MEMORY_PROTECTION = @as(c_long, 200809);
pub const _POSIX_CHOWN_RESTRICTED = @as(c_int, 0);
pub const _POSIX_VDISABLE = '\x00';
pub const _POSIX_NO_TRUNC = @as(c_int, 1);
pub const _XOPEN_REALTIME = @as(c_int, 1);
pub const _XOPEN_REALTIME_THREADS = @as(c_int, 1);
pub const _XOPEN_SHM = @as(c_int, 1);
pub const _POSIX_THREADS = @as(c_long, 200809);
pub const _POSIX_REENTRANT_FUNCTIONS = @as(c_int, 1);
pub const _POSIX_THREAD_SAFE_FUNCTIONS = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIORITY_SCHEDULING = @as(c_long, 200809);
pub const _POSIX_THREAD_ATTR_STACKSIZE = @as(c_long, 200809);
pub const _POSIX_THREAD_ATTR_STACKADDR = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIO_INHERIT = @as(c_long, 200809);
pub const _POSIX_THREAD_PRIO_PROTECT = @as(c_long, 200809);
pub const _POSIX_THREAD_ROBUST_PRIO_INHERIT = @as(c_long, 200809);
pub const _POSIX_THREAD_ROBUST_PRIO_PROTECT = -@as(c_int, 1);
pub const _POSIX_SEMAPHORES = @as(c_long, 200809);
pub const _POSIX_REALTIME_SIGNALS = @as(c_long, 200809);
pub const _POSIX_ASYNCHRONOUS_IO = @as(c_long, 200809);
pub const _POSIX_ASYNC_IO = @as(c_int, 1);
pub const _LFS_ASYNCHRONOUS_IO = @as(c_int, 1);
pub const _POSIX_PRIORITIZED_IO = @as(c_long, 200809);
pub const _LFS64_ASYNCHRONOUS_IO = @as(c_int, 1);
pub const _LFS_LARGEFILE = @as(c_int, 1);
pub const _LFS64_LARGEFILE = @as(c_int, 1);
pub const _LFS64_STDIO = @as(c_int, 1);
pub const _POSIX_SHARED_MEMORY_OBJECTS = @as(c_long, 200809);
pub const _POSIX_CPUTIME = @as(c_int, 0);
pub const _POSIX_THREAD_CPUTIME = @as(c_int, 0);
pub const _POSIX_REGEXP = @as(c_int, 1);
pub const _POSIX_READER_WRITER_LOCKS = @as(c_long, 200809);
pub const _POSIX_SHELL = @as(c_int, 1);
pub const _POSIX_TIMEOUTS = @as(c_long, 200809);
pub const _POSIX_SPIN_LOCKS = @as(c_long, 200809);
pub const _POSIX_SPAWN = @as(c_long, 200809);
pub const _POSIX_TIMERS = @as(c_long, 200809);
pub const _POSIX_BARRIERS = @as(c_long, 200809);
pub const _POSIX_MESSAGE_PASSING = @as(c_long, 200809);
pub const _POSIX_THREAD_PROCESS_SHARED = @as(c_long, 200809);
pub const _POSIX_MONOTONIC_CLOCK = @as(c_int, 0);
pub const _POSIX_CLOCK_SELECTION = @as(c_long, 200809);
pub const _POSIX_ADVISORY_INFO = @as(c_long, 200809);
pub const _POSIX_IPV6 = @as(c_long, 200809);
pub const _POSIX_RAW_SOCKETS = @as(c_long, 200809);
pub const _POSIX2_CHAR_TERM = @as(c_long, 200809);
pub const _POSIX_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_THREAD_SPORADIC_SERVER = -@as(c_int, 1);
pub const _POSIX_TRACE = -@as(c_int, 1);
pub const _POSIX_TRACE_EVENT_FILTER = -@as(c_int, 1);
pub const _POSIX_TRACE_INHERIT = -@as(c_int, 1);
pub const _POSIX_TRACE_LOG = -@as(c_int, 1);
pub const _POSIX_TYPED_MEMORY_OBJECTS = -@as(c_int, 1);
pub const _POSIX_V7_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V6_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _XBS5_LPBIG_OFFBIG = -@as(c_int, 1);
pub const _POSIX_V7_LP64_OFF64 = @as(c_int, 1);
pub const _POSIX_V6_LP64_OFF64 = @as(c_int, 1);
pub const _XBS5_LP64_OFF64 = @as(c_int, 1);
pub const __ILP32_OFF32_CFLAGS = "-m32";
pub const __ILP32_OFF32_LDFLAGS = "-m32";
pub const __ILP32_OFFBIG_CFLAGS = "-m32 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64";
pub const __ILP32_OFFBIG_LDFLAGS = "-m32";
pub const __LP64_OFF64_CFLAGS = "-m64";
pub const __LP64_OFF64_LDFLAGS = "-m64";
pub const STDIN_FILENO = @as(c_int, 0);
pub const STDOUT_FILENO = @as(c_int, 1);
pub const STDERR_FILENO = @as(c_int, 2);
pub const SEEK_DATA = @as(c_int, 3);
pub const SEEK_HOLE = @as(c_int, 4);
pub const L_SET = SEEK_SET;
pub const L_INCR = SEEK_CUR;
pub const L_XTND = SEEK_END;
pub const _SC_PAGE_SIZE = _SC_PAGESIZE;
pub const _CS_POSIX_V6_WIDTH_RESTRICTED_ENVS = _CS_V6_WIDTH_RESTRICTED_ENVS;
pub const _CS_POSIX_V5_WIDTH_RESTRICTED_ENVS = _CS_V5_WIDTH_RESTRICTED_ENVS;
pub const _CS_POSIX_V7_WIDTH_RESTRICTED_ENVS = _CS_V7_WIDTH_RESTRICTED_ENVS;
pub const _GETOPT_POSIX_H = @as(c_int, 1);
pub const _GETOPT_CORE_H = @as(c_int, 1);
pub const TEMP_FAILURE_RETRY = @compileError("unable to translate macro: undefined identifier `__result`");
// /usr/include/unistd.h:1134:10
pub const _LINUX_CLOSE_RANGE_H = "";
pub const CLOSE_RANGE_UNSHARE = @as(c_uint, 1) << @as(c_int, 1);
pub const CLOSE_RANGE_CLOEXEC = @as(c_uint, 1) << @as(c_int, 2);
pub const _SIGNAL_H = "";
pub const _BITS_SIGNUM_GENERIC_H = @as(c_int, 1);
pub const SIG_ERR = @import("std").zig.c_translation.cast(__sighandler_t, -@as(c_int, 1));
pub const SIG_DFL = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 0));
pub const SIG_IGN = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 1));
pub const SIG_HOLD = @import("std").zig.c_translation.cast(__sighandler_t, @as(c_int, 2));
pub const SIGINT = @as(c_int, 2);
pub const SIGILL = @as(c_int, 4);
pub const SIGABRT = @as(c_int, 6);
pub const SIGFPE = @as(c_int, 8);
pub const SIGSEGV = @as(c_int, 11);
pub const SIGTERM = @as(c_int, 15);
pub const SIGHUP = @as(c_int, 1);
pub const SIGQUIT = @as(c_int, 3);
pub const SIGTRAP = @as(c_int, 5);
pub const SIGKILL = @as(c_int, 9);
pub const SIGPIPE = @as(c_int, 13);
pub const SIGALRM = @as(c_int, 14);
pub const SIGIO = SIGPOLL;
pub const SIGIOT = SIGABRT;
pub const SIGCLD = SIGCHLD;
pub const _BITS_SIGNUM_ARCH_H = @as(c_int, 1);
pub const SIGSTKFLT = @as(c_int, 16);
pub const SIGPWR = @as(c_int, 30);
pub const SIGBUS = @as(c_int, 7);
pub const SIGSYS = @as(c_int, 31);
pub const SIGURG = @as(c_int, 23);
pub const SIGSTOP = @as(c_int, 19);
pub const SIGTSTP = @as(c_int, 20);
pub const SIGCONT = @as(c_int, 18);
pub const SIGCHLD = @as(c_int, 17);
pub const SIGTTIN = @as(c_int, 21);
pub const SIGTTOU = @as(c_int, 22);
pub const SIGPOLL = @as(c_int, 29);
pub const SIGXFSZ = @as(c_int, 25);
pub const SIGXCPU = @as(c_int, 24);
pub const SIGVTALRM = @as(c_int, 26);
pub const SIGPROF = @as(c_int, 27);
pub const SIGUSR1 = @as(c_int, 10);
pub const SIGUSR2 = @as(c_int, 12);
pub const SIGWINCH = @as(c_int, 28);
pub const __SIGRTMIN = @as(c_int, 32);
pub const __SIGRTMAX = @as(c_int, 64);
pub const _NSIG = __SIGRTMAX + @as(c_int, 1);
pub const __sig_atomic_t_defined = @as(c_int, 1);
pub const __siginfo_t_defined = @as(c_int, 1);
pub const __SI_MAX_SIZE = @as(c_int, 128);
pub const __SI_PAD_SIZE = @import("std").zig.c_translation.MacroArithmetic.div(__SI_MAX_SIZE, @import("std").zig.c_translation.sizeof(c_int)) - @as(c_int, 4);
pub const _BITS_SIGINFO_ARCH_H = @as(c_int, 1);
pub const __SI_ALIGNMENT = "";
pub const __SI_BAND_TYPE = c_long;
pub const __SI_CLOCK_T = __clock_t;
pub const __SI_ERRNO_THEN_CODE = @as(c_int, 1);
pub const __SI_HAVE_SIGSYS = @as(c_int, 1);
pub const __SI_SIGFAULT_ADDL = "";
pub const si_pid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:128:9
pub const si_uid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:129:9
pub const si_timerid = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:130:9
pub const si_overrun = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:131:9
pub const si_status = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:132:9
pub const si_utime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:133:9
pub const si_stime = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:134:9
pub const si_value = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:135:9
pub const si_int = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:136:9
pub const si_ptr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:137:9
pub const si_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:138:9
pub const si_addr_lsb = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:139:9
pub const si_lower = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:140:9
pub const si_upper = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:141:9
pub const si_pkey = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:142:9
pub const si_band = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:143:9
pub const si_fd = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:144:9
pub const si_call_addr = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:146:10
pub const si_syscall = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:147:10
pub const si_arch = @compileError("unable to translate macro: undefined identifier `_sifields`");
// /usr/include/bits/types/siginfo_t.h:148:10
pub const _BITS_SIGINFO_CONSTS_H = @as(c_int, 1);
pub const __SI_ASYNCIO_AFTER_SIGIO = @as(c_int, 1);
pub const _BITS_SIGINFO_CONSTS_ARCH_H = @as(c_int, 1);
pub const __sigval_t_defined = "";
pub const _BITS_SIGEVENT_CONSTS_H = @as(c_int, 1);
pub inline fn sigmask(sig: anytype) @TypeOf(__glibc_macro_warning("sigmask is deprecated")(@import("std").zig.c_translation.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))))) {
    _ = &sig;
    return __glibc_macro_warning("sigmask is deprecated")(@import("std").zig.c_translation.cast(c_int, @as(c_uint, 1) << (sig - @as(c_int, 1))));
}
pub const NSIG = _NSIG;
pub const _BITS_SIGACTION_H = @as(c_int, 1);
pub const sa_handler = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/bits/sigaction.h:39:10
pub const sa_sigaction = @compileError("unable to translate macro: undefined identifier `__sigaction_handler`");
// /usr/include/bits/sigaction.h:40:10
pub const SA_NOCLDSTOP = @as(c_int, 1);
pub const SA_NOCLDWAIT = @as(c_int, 2);
pub const SA_SIGINFO = @as(c_int, 4);
pub const SA_ONSTACK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x08000000, .hex);
pub const SA_RESTART = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x10000000, .hex);
pub const SA_NODEFER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const SA_RESETHAND = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub const SA_INTERRUPT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const SA_NOMASK = SA_NODEFER;
pub const SA_ONESHOT = SA_RESETHAND;
pub const SA_STACK = SA_ONSTACK;
pub const SIG_BLOCK = @as(c_int, 0);
pub const SIG_UNBLOCK = @as(c_int, 1);
pub const SIG_SETMASK = @as(c_int, 2);
pub const _BITS_SIGCONTEXT_H = @as(c_int, 1);
pub const FP_XSTATE_MAGIC1 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x46505853, .hex);
pub const FP_XSTATE_MAGIC2 = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x46505845, .hex);
pub const FP_XSTATE_MAGIC2_SIZE = @import("std").zig.c_translation.sizeof(FP_XSTATE_MAGIC2);
pub const __stack_t_defined = @as(c_int, 1);
pub const _SYS_UCONTEXT_H = @as(c_int, 1);
pub inline fn __ctx(fld: anytype) @TypeOf(fld) {
    _ = &fld;
    return fld;
}
pub const __NGREG = @as(c_int, 23);
pub const NGREG = __NGREG;
pub const _BITS_SIGSTACK_H = @as(c_int, 1);
pub const MINSIGSTKSZ = @as(c_int, 2048);
pub const SIGSTKSZ = @as(c_int, 8192);
pub const _BITS_SS_FLAGS_H = @as(c_int, 1);
pub const __sigstack_defined = @as(c_int, 1);
pub const _BITS_SIGTHREAD_H = @as(c_int, 1);
pub const SIGRTMIN = __libc_current_sigrtmin();
pub const SIGRTMAX = __libc_current_sigrtmax();
pub const _SYS_WAIT_H = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 1);
pub const WUNTRACED = @as(c_int, 2);
pub const WSTOPPED = @as(c_int, 2);
pub const WEXITED = @as(c_int, 4);
pub const WCONTINUED = @as(c_int, 8);
pub const WNOWAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const __WNOTHREAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const __WALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const __WCLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub inline fn __WEXITSTATUS(status: anytype) @TypeOf((status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8)) {
    _ = &status;
    return (status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8);
}
pub inline fn __WTERMSIG(status: anytype) @TypeOf(status & @as(c_int, 0x7f)) {
    _ = &status;
    return status & @as(c_int, 0x7f);
}
pub inline fn __WSTOPSIG(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn __WIFEXITED(status: anytype) @TypeOf(__WTERMSIG(status) == @as(c_int, 0)) {
    _ = &status;
    return __WTERMSIG(status) == @as(c_int, 0);
}
pub inline fn __WIFSIGNALED(status: anytype) @TypeOf((@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0)) {
    _ = &status;
    return (@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0);
}
pub inline fn __WIFSTOPPED(status: anytype) @TypeOf((status & @as(c_int, 0xff)) == @as(c_int, 0x7f)) {
    _ = &status;
    return (status & @as(c_int, 0xff)) == @as(c_int, 0x7f);
}
pub inline fn __WIFCONTINUED(status: anytype) @TypeOf(status == __W_CONTINUED) {
    _ = &status;
    return status == __W_CONTINUED;
}
pub inline fn __WCOREDUMP(status: anytype) @TypeOf(status & __WCOREFLAG) {
    _ = &status;
    return status & __WCOREFLAG;
}
pub inline fn __W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    _ = &ret;
    _ = &sig;
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn __W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | @as(c_int, 0x7f)) {
    _ = &sig;
    return (sig << @as(c_int, 8)) | @as(c_int, 0x7f);
}
pub const __W_CONTINUED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex);
pub const __WCOREFLAG = @as(c_int, 0x80);
pub inline fn WEXITSTATUS(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn WTERMSIG(status: anytype) @TypeOf(__WTERMSIG(status)) {
    _ = &status;
    return __WTERMSIG(status);
}
pub inline fn WSTOPSIG(status: anytype) @TypeOf(__WSTOPSIG(status)) {
    _ = &status;
    return __WSTOPSIG(status);
}
pub inline fn WIFEXITED(status: anytype) @TypeOf(__WIFEXITED(status)) {
    _ = &status;
    return __WIFEXITED(status);
}
pub inline fn WIFSIGNALED(status: anytype) @TypeOf(__WIFSIGNALED(status)) {
    _ = &status;
    return __WIFSIGNALED(status);
}
pub inline fn WIFSTOPPED(status: anytype) @TypeOf(__WIFSTOPPED(status)) {
    _ = &status;
    return __WIFSTOPPED(status);
}
pub inline fn WIFCONTINUED(status: anytype) @TypeOf(__WIFCONTINUED(status)) {
    _ = &status;
    return __WIFCONTINUED(status);
}
pub const WCOREFLAG = __WCOREFLAG;
pub inline fn WCOREDUMP(status: anytype) @TypeOf(__WCOREDUMP(status)) {
    _ = &status;
    return __WCOREDUMP(status);
}
pub inline fn W_EXITCODE(ret: anytype, sig: anytype) @TypeOf(__W_EXITCODE(ret, sig)) {
    _ = &ret;
    _ = &sig;
    return __W_EXITCODE(ret, sig);
}
pub inline fn W_STOPCODE(sig: anytype) @TypeOf(__W_STOPCODE(sig)) {
    _ = &sig;
    return __W_STOPCODE(sig);
}
pub const __idtype_t_defined = "";
pub const WAIT_ANY = -@as(c_int, 1);
pub const WAIT_MYPGRP = @as(c_int, 0);
pub const _ERRNO_H = @as(c_int, 1);
pub const _BITS_ERRNO_H = @as(c_int, 1);
pub const _ASM_GENERIC_ERRNO_H = "";
pub const _ASM_GENERIC_ERRNO_BASE_H = "";
pub const EPERM = @as(c_int, 1);
pub const ENOENT = @as(c_int, 2);
pub const ESRCH = @as(c_int, 3);
pub const EINTR = @as(c_int, 4);
pub const EIO = @as(c_int, 5);
pub const ENXIO = @as(c_int, 6);
pub const E2BIG = @as(c_int, 7);
pub const ENOEXEC = @as(c_int, 8);
pub const EBADF = @as(c_int, 9);
pub const ECHILD = @as(c_int, 10);
pub const EAGAIN = @as(c_int, 11);
pub const ENOMEM = @as(c_int, 12);
pub const EACCES = @as(c_int, 13);
pub const EFAULT = @as(c_int, 14);
pub const ENOTBLK = @as(c_int, 15);
pub const EBUSY = @as(c_int, 16);
pub const EEXIST = @as(c_int, 17);
pub const EXDEV = @as(c_int, 18);
pub const ENODEV = @as(c_int, 19);
pub const ENOTDIR = @as(c_int, 20);
pub const EISDIR = @as(c_int, 21);
pub const EINVAL = @as(c_int, 22);
pub const ENFILE = @as(c_int, 23);
pub const EMFILE = @as(c_int, 24);
pub const ENOTTY = @as(c_int, 25);
pub const ETXTBSY = @as(c_int, 26);
pub const EFBIG = @as(c_int, 27);
pub const ENOSPC = @as(c_int, 28);
pub const ESPIPE = @as(c_int, 29);
pub const EROFS = @as(c_int, 30);
pub const EMLINK = @as(c_int, 31);
pub const EPIPE = @as(c_int, 32);
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const EDEADLK = @as(c_int, 35);
pub const ENAMETOOLONG = @as(c_int, 36);
pub const ENOLCK = @as(c_int, 37);
pub const ENOSYS = @as(c_int, 38);
pub const ENOTEMPTY = @as(c_int, 39);
pub const ELOOP = @as(c_int, 40);
pub const EWOULDBLOCK = EAGAIN;
pub const ENOMSG = @as(c_int, 42);
pub const EIDRM = @as(c_int, 43);
pub const ECHRNG = @as(c_int, 44);
pub const EL2NSYNC = @as(c_int, 45);
pub const EL3HLT = @as(c_int, 46);
pub const EL3RST = @as(c_int, 47);
pub const ELNRNG = @as(c_int, 48);
pub const EUNATCH = @as(c_int, 49);
pub const ENOCSI = @as(c_int, 50);
pub const EL2HLT = @as(c_int, 51);
pub const EBADE = @as(c_int, 52);
pub const EBADR = @as(c_int, 53);
pub const EXFULL = @as(c_int, 54);
pub const ENOANO = @as(c_int, 55);
pub const EBADRQC = @as(c_int, 56);
pub const EBADSLT = @as(c_int, 57);
pub const EDEADLOCK = EDEADLK;
pub const EBFONT = @as(c_int, 59);
pub const ENOSTR = @as(c_int, 60);
pub const ENODATA = @as(c_int, 61);
pub const ETIME = @as(c_int, 62);
pub const ENOSR = @as(c_int, 63);
pub const ENONET = @as(c_int, 64);
pub const ENOPKG = @as(c_int, 65);
pub const EREMOTE = @as(c_int, 66);
pub const ENOLINK = @as(c_int, 67);
pub const EADV = @as(c_int, 68);
pub const ESRMNT = @as(c_int, 69);
pub const ECOMM = @as(c_int, 70);
pub const EPROTO = @as(c_int, 71);
pub const EMULTIHOP = @as(c_int, 72);
pub const EDOTDOT = @as(c_int, 73);
pub const EBADMSG = @as(c_int, 74);
pub const EOVERFLOW = @as(c_int, 75);
pub const ENOTUNIQ = @as(c_int, 76);
pub const EBADFD = @as(c_int, 77);
pub const EREMCHG = @as(c_int, 78);
pub const ELIBACC = @as(c_int, 79);
pub const ELIBBAD = @as(c_int, 80);
pub const ELIBSCN = @as(c_int, 81);
pub const ELIBMAX = @as(c_int, 82);
pub const ELIBEXEC = @as(c_int, 83);
pub const EILSEQ = @as(c_int, 84);
pub const ERESTART = @as(c_int, 85);
pub const ESTRPIPE = @as(c_int, 86);
pub const EUSERS = @as(c_int, 87);
pub const ENOTSOCK = @as(c_int, 88);
pub const EDESTADDRREQ = @as(c_int, 89);
pub const EMSGSIZE = @as(c_int, 90);
pub const EPROTOTYPE = @as(c_int, 91);
pub const ENOPROTOOPT = @as(c_int, 92);
pub const EPROTONOSUPPORT = @as(c_int, 93);
pub const ESOCKTNOSUPPORT = @as(c_int, 94);
pub const EOPNOTSUPP = @as(c_int, 95);
pub const EPFNOSUPPORT = @as(c_int, 96);
pub const EAFNOSUPPORT = @as(c_int, 97);
pub const EADDRINUSE = @as(c_int, 98);
pub const EADDRNOTAVAIL = @as(c_int, 99);
pub const ENETDOWN = @as(c_int, 100);
pub const ENETUNREACH = @as(c_int, 101);
pub const ENETRESET = @as(c_int, 102);
pub const ECONNABORTED = @as(c_int, 103);
pub const ECONNRESET = @as(c_int, 104);
pub const ENOBUFS = @as(c_int, 105);
pub const EISCONN = @as(c_int, 106);
pub const ENOTCONN = @as(c_int, 107);
pub const ESHUTDOWN = @as(c_int, 108);
pub const ETOOMANYREFS = @as(c_int, 109);
pub const ETIMEDOUT = @as(c_int, 110);
pub const ECONNREFUSED = @as(c_int, 111);
pub const EHOSTDOWN = @as(c_int, 112);
pub const EHOSTUNREACH = @as(c_int, 113);
pub const EALREADY = @as(c_int, 114);
pub const EINPROGRESS = @as(c_int, 115);
pub const ESTALE = @as(c_int, 116);
pub const EUCLEAN = @as(c_int, 117);
pub const ENOTNAM = @as(c_int, 118);
pub const ENAVAIL = @as(c_int, 119);
pub const EISNAM = @as(c_int, 120);
pub const EREMOTEIO = @as(c_int, 121);
pub const EDQUOT = @as(c_int, 122);
pub const ENOMEDIUM = @as(c_int, 123);
pub const EMEDIUMTYPE = @as(c_int, 124);
pub const ECANCELED = @as(c_int, 125);
pub const ENOKEY = @as(c_int, 126);
pub const EKEYEXPIRED = @as(c_int, 127);
pub const EKEYREVOKED = @as(c_int, 128);
pub const EKEYREJECTED = @as(c_int, 129);
pub const EOWNERDEAD = @as(c_int, 130);
pub const ENOTRECOVERABLE = @as(c_int, 131);
pub const ERFKILL = @as(c_int, 132);
pub const EHWPOISON = @as(c_int, 133);
pub const ENOTSUP = EOPNOTSUPP;
pub const errno = __errno_location().*;
pub const __error_t_defined = @as(c_int, 1);
pub const _STRING_H = @as(c_int, 1);
pub const strdupa = @compileError("unable to translate macro: undefined identifier `__old`");
// /usr/include/string.h:201:10
pub const strndupa = @compileError("unable to translate macro: undefined identifier `__old`");
// /usr/include/string.h:211:10
pub const _STRINGS_H = @as(c_int, 1);
pub const _ARPA_INET_H = @as(c_int, 1);
pub const _SYS_POLL_H = @as(c_int, 1);
pub const POLLIN = @as(c_int, 0x001);
pub const POLLPRI = @as(c_int, 0x002);
pub const POLLOUT = @as(c_int, 0x004);
pub const POLLRDNORM = @as(c_int, 0x040);
pub const POLLRDBAND = @as(c_int, 0x080);
pub const POLLWRNORM = @as(c_int, 0x100);
pub const POLLWRBAND = @as(c_int, 0x200);
pub const POLLMSG = @as(c_int, 0x400);
pub const POLLREMOVE = @as(c_int, 0x1000);
pub const POLLRDHUP = @as(c_int, 0x2000);
pub const POLLERR = @as(c_int, 0x008);
pub const POLLHUP = @as(c_int, 0x010);
pub const POLLNVAL = @as(c_int, 0x020);
pub const NATS_ONCE_STATIC_INIT = PTHREAD_ONCE_INIT;
pub const NATS_SOCK_INVALID = -@as(c_int, 1);
pub inline fn NATS_SOCK_SHUTDOWN(s: anytype) @TypeOf(shutdown(s, SHUT_RDWR)) {
    _ = &s;
    return shutdown(s, SHUT_RDWR);
}
pub inline fn NATS_SOCK_CLOSE(s: anytype) @TypeOf(close(s)) {
    _ = &s;
    return close(s);
}
pub const NATS_SOCK_CONNECT_IN_PROGRESS = EINPROGRESS;
pub const NATS_SOCK_WOULD_BLOCK = EWOULDBLOCK;
pub const NATS_SOCK_ERROR = -@as(c_int, 1);
pub const NATS_SOCK_GET_ERROR = errno;
pub const __NATS_FUNCTION__ = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// ./src/submodules/nats.c/src/include/n-unix.h:60:9
pub const nats_asprintf = asprintf;
pub const nats_strcasestr = strcasestr;
pub const nats_vsnprintf = vsnprintf;
pub const nats_strtok = strtok_r;
pub inline fn nats_vscprintf(f: anytype, a: anytype) @TypeOf(vsnprintf(NULL, @as(c_int, 0), f, a)) {
    _ = &f;
    _ = &a;
    return vsnprintf(NULL, @as(c_int, 0), f, a);
}
pub const SSL = ?*anyopaque;
pub const SSL_free = @compileError("unable to translate C expr: unexpected token '{'");
// ./src/submodules/nats.c/src/natsp.h:30:9
pub const SSL_CTX = ?*anyopaque;
pub const SSL_CTX_free = @compileError("unable to translate C expr: unexpected token '{'");
// ./src/submodules/nats.c/src/natsp.h:32:9
pub const NO_SSL_ERR = "The library was built without SSL support!";
pub const ERR_H_ = "";
pub const STATUS_H_ = "";
pub const NATS_H_ = "";
pub const __need_wchar_t = "";
pub const _WCHAR_T = "";
pub const _STDLIB_H = @as(c_int, 1);
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 0);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex");
// /usr/include/bits/floatn-common.h:178:13
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    _ = &x;
    return __builtin_nanf(x);
}
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`");
// /usr/include/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// /usr/include/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`");
// /usr/include/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`");
// /usr/include/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`");
// /usr/include/bits/floatn-common.h:292:13
pub const __ldiv_t_defined = @as(c_int, 1);
pub const __lldiv_t_defined = @as(c_int, 1);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const MB_CUR_MAX = __ctype_get_mb_cur_max();
pub const _ALLOCA_H = @as(c_int, 1);
pub const __COMPAR_FN_T = "";
pub const __CLANG_INTTYPES_H = "";
pub const _INTTYPES_H = @as(c_int, 1);
pub const ____gwchar_t_defined = @as(c_int, 1);
pub const __PRI64_PREFIX = "l";
pub const __PRIPTR_PREFIX = "l";
pub const PRId8 = "d";
pub const PRId16 = "d";
pub const PRId32 = "d";
pub const PRId64 = __PRI64_PREFIX ++ "d";
pub const PRIdLEAST8 = "d";
pub const PRIdLEAST16 = "d";
pub const PRIdLEAST32 = "d";
pub const PRIdLEAST64 = __PRI64_PREFIX ++ "d";
pub const PRIdFAST8 = "d";
pub const PRIdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const PRIdFAST64 = __PRI64_PREFIX ++ "d";
pub const PRIi8 = "i";
pub const PRIi16 = "i";
pub const PRIi32 = "i";
pub const PRIi64 = __PRI64_PREFIX ++ "i";
pub const PRIiLEAST8 = "i";
pub const PRIiLEAST16 = "i";
pub const PRIiLEAST32 = "i";
pub const PRIiLEAST64 = __PRI64_PREFIX ++ "i";
pub const PRIiFAST8 = "i";
pub const PRIiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const PRIiFAST64 = __PRI64_PREFIX ++ "i";
pub const PRIo8 = "o";
pub const PRIo16 = "o";
pub const PRIo32 = "o";
pub const PRIo64 = __PRI64_PREFIX ++ "o";
pub const PRIoLEAST8 = "o";
pub const PRIoLEAST16 = "o";
pub const PRIoLEAST32 = "o";
pub const PRIoLEAST64 = __PRI64_PREFIX ++ "o";
pub const PRIoFAST8 = "o";
pub const PRIoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const PRIoFAST64 = __PRI64_PREFIX ++ "o";
pub const PRIu8 = "u";
pub const PRIu16 = "u";
pub const PRIu32 = "u";
pub const PRIu64 = __PRI64_PREFIX ++ "u";
pub const PRIuLEAST8 = "u";
pub const PRIuLEAST16 = "u";
pub const PRIuLEAST32 = "u";
pub const PRIuLEAST64 = __PRI64_PREFIX ++ "u";
pub const PRIuFAST8 = "u";
pub const PRIuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const PRIuFAST64 = __PRI64_PREFIX ++ "u";
pub const PRIx8 = "x";
pub const PRIx16 = "x";
pub const PRIx32 = "x";
pub const PRIx64 = __PRI64_PREFIX ++ "x";
pub const PRIxLEAST8 = "x";
pub const PRIxLEAST16 = "x";
pub const PRIxLEAST32 = "x";
pub const PRIxLEAST64 = __PRI64_PREFIX ++ "x";
pub const PRIxFAST8 = "x";
pub const PRIxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const PRIxFAST64 = __PRI64_PREFIX ++ "x";
pub const PRIX8 = "X";
pub const PRIX16 = "X";
pub const PRIX32 = "X";
pub const PRIX64 = __PRI64_PREFIX ++ "X";
pub const PRIXLEAST8 = "X";
pub const PRIXLEAST16 = "X";
pub const PRIXLEAST32 = "X";
pub const PRIXLEAST64 = __PRI64_PREFIX ++ "X";
pub const PRIXFAST8 = "X";
pub const PRIXFAST16 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST32 = __PRIPTR_PREFIX ++ "X";
pub const PRIXFAST64 = __PRI64_PREFIX ++ "X";
pub const PRIdMAX = __PRI64_PREFIX ++ "d";
pub const PRIiMAX = __PRI64_PREFIX ++ "i";
pub const PRIoMAX = __PRI64_PREFIX ++ "o";
pub const PRIuMAX = __PRI64_PREFIX ++ "u";
pub const PRIxMAX = __PRI64_PREFIX ++ "x";
pub const PRIXMAX = __PRI64_PREFIX ++ "X";
pub const PRIdPTR = __PRIPTR_PREFIX ++ "d";
pub const PRIiPTR = __PRIPTR_PREFIX ++ "i";
pub const PRIoPTR = __PRIPTR_PREFIX ++ "o";
pub const PRIuPTR = __PRIPTR_PREFIX ++ "u";
pub const PRIxPTR = __PRIPTR_PREFIX ++ "x";
pub const PRIXPTR = __PRIPTR_PREFIX ++ "X";
pub const PRIb8 = "b";
pub const PRIb16 = "b";
pub const PRIb32 = "b";
pub const PRIb64 = __PRI64_PREFIX ++ "b";
pub const PRIbLEAST8 = "b";
pub const PRIbLEAST16 = "b";
pub const PRIbLEAST32 = "b";
pub const PRIbLEAST64 = __PRI64_PREFIX ++ "b";
pub const PRIbFAST8 = "b";
pub const PRIbFAST16 = __PRIPTR_PREFIX ++ "b";
pub const PRIbFAST32 = __PRIPTR_PREFIX ++ "b";
pub const PRIbFAST64 = __PRI64_PREFIX ++ "b";
pub const PRIbMAX = __PRI64_PREFIX ++ "b";
pub const PRIbPTR = __PRIPTR_PREFIX ++ "b";
pub const PRIB8 = "B";
pub const PRIB16 = "B";
pub const PRIB32 = "B";
pub const PRIB64 = __PRI64_PREFIX ++ "B";
pub const PRIBLEAST8 = "B";
pub const PRIBLEAST16 = "B";
pub const PRIBLEAST32 = "B";
pub const PRIBLEAST64 = __PRI64_PREFIX ++ "B";
pub const PRIBFAST8 = "B";
pub const PRIBFAST16 = __PRIPTR_PREFIX ++ "B";
pub const PRIBFAST32 = __PRIPTR_PREFIX ++ "B";
pub const PRIBFAST64 = __PRI64_PREFIX ++ "B";
pub const PRIBMAX = __PRI64_PREFIX ++ "B";
pub const PRIBPTR = __PRIPTR_PREFIX ++ "B";
pub const SCNd8 = "hhd";
pub const SCNd16 = "hd";
pub const SCNd32 = "d";
pub const SCNd64 = __PRI64_PREFIX ++ "d";
pub const SCNdLEAST8 = "hhd";
pub const SCNdLEAST16 = "hd";
pub const SCNdLEAST32 = "d";
pub const SCNdLEAST64 = __PRI64_PREFIX ++ "d";
pub const SCNdFAST8 = "hhd";
pub const SCNdFAST16 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST32 = __PRIPTR_PREFIX ++ "d";
pub const SCNdFAST64 = __PRI64_PREFIX ++ "d";
pub const SCNi8 = "hhi";
pub const SCNi16 = "hi";
pub const SCNi32 = "i";
pub const SCNi64 = __PRI64_PREFIX ++ "i";
pub const SCNiLEAST8 = "hhi";
pub const SCNiLEAST16 = "hi";
pub const SCNiLEAST32 = "i";
pub const SCNiLEAST64 = __PRI64_PREFIX ++ "i";
pub const SCNiFAST8 = "hhi";
pub const SCNiFAST16 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST32 = __PRIPTR_PREFIX ++ "i";
pub const SCNiFAST64 = __PRI64_PREFIX ++ "i";
pub const SCNu8 = "hhu";
pub const SCNu16 = "hu";
pub const SCNu32 = "u";
pub const SCNu64 = __PRI64_PREFIX ++ "u";
pub const SCNuLEAST8 = "hhu";
pub const SCNuLEAST16 = "hu";
pub const SCNuLEAST32 = "u";
pub const SCNuLEAST64 = __PRI64_PREFIX ++ "u";
pub const SCNuFAST8 = "hhu";
pub const SCNuFAST16 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST32 = __PRIPTR_PREFIX ++ "u";
pub const SCNuFAST64 = __PRI64_PREFIX ++ "u";
pub const SCNo8 = "hho";
pub const SCNo16 = "ho";
pub const SCNo32 = "o";
pub const SCNo64 = __PRI64_PREFIX ++ "o";
pub const SCNoLEAST8 = "hho";
pub const SCNoLEAST16 = "ho";
pub const SCNoLEAST32 = "o";
pub const SCNoLEAST64 = __PRI64_PREFIX ++ "o";
pub const SCNoFAST8 = "hho";
pub const SCNoFAST16 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST32 = __PRIPTR_PREFIX ++ "o";
pub const SCNoFAST64 = __PRI64_PREFIX ++ "o";
pub const SCNx8 = "hhx";
pub const SCNx16 = "hx";
pub const SCNx32 = "x";
pub const SCNx64 = __PRI64_PREFIX ++ "x";
pub const SCNxLEAST8 = "hhx";
pub const SCNxLEAST16 = "hx";
pub const SCNxLEAST32 = "x";
pub const SCNxLEAST64 = __PRI64_PREFIX ++ "x";
pub const SCNxFAST8 = "hhx";
pub const SCNxFAST16 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST32 = __PRIPTR_PREFIX ++ "x";
pub const SCNxFAST64 = __PRI64_PREFIX ++ "x";
pub const SCNdMAX = __PRI64_PREFIX ++ "d";
pub const SCNiMAX = __PRI64_PREFIX ++ "i";
pub const SCNoMAX = __PRI64_PREFIX ++ "o";
pub const SCNuMAX = __PRI64_PREFIX ++ "u";
pub const SCNxMAX = __PRI64_PREFIX ++ "x";
pub const SCNdPTR = __PRIPTR_PREFIX ++ "d";
pub const SCNiPTR = __PRIPTR_PREFIX ++ "i";
pub const SCNoPTR = __PRIPTR_PREFIX ++ "o";
pub const SCNuPTR = __PRIPTR_PREFIX ++ "u";
pub const SCNxPTR = __PRIPTR_PREFIX ++ "x";
pub const SCNb8 = "hhb";
pub const SCNb16 = "hb";
pub const SCNb32 = "b";
pub const SCNb64 = __PRI64_PREFIX ++ "b";
pub const SCNbLEAST8 = "hhb";
pub const SCNbLEAST16 = "hb";
pub const SCNbLEAST32 = "b";
pub const SCNbLEAST64 = __PRI64_PREFIX ++ "b";
pub const SCNbFAST8 = "hhb";
pub const SCNbFAST16 = __PRIPTR_PREFIX ++ "b";
pub const SCNbFAST32 = __PRIPTR_PREFIX ++ "b";
pub const SCNbFAST64 = __PRI64_PREFIX ++ "b";
pub const SCNbMAX = __PRI64_PREFIX ++ "b";
pub const SCNbPTR = __PRIPTR_PREFIX ++ "b";
pub const _STDIO_H = @as(c_int, 1);
pub const __need___va_list = "";
pub const __GNUC_VA_LIST = "";
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/bits/types/struct_FILE.h:102:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/bits/types/struct_FILE.h:106:9
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const __cookie_io_functions_t_defined = @as(c_int, 1);
pub const _VA_LIST_DEFINED = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const P_tmpdir = "/tmp";
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 238328, .decimal);
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const L_cuserid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const _PRINTF_NAN_LEN_MAX = @as(c_int, 4);
pub const RENAME_NOREPLACE = @as(c_int, 1) << @as(c_int, 0);
pub const RENAME_EXCHANGE = @as(c_int, 1) << @as(c_int, 1);
pub const RENAME_WHITEOUT = @as(c_int, 1) << @as(c_int, 2);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const VERSION_H_ = "";
pub const NATS_VERSION_MAJOR = @as(c_int, 3);
pub const NATS_VERSION_MINOR = @as(c_int, 10);
pub const NATS_VERSION_PATCH = @as(c_int, 0);
pub const NATS_VERSION_STRING = "3.10.0-beta";
pub const NATS_VERSION_NUMBER = ((NATS_VERSION_MAJOR << @as(c_int, 16)) | (NATS_VERSION_MINOR << @as(c_int, 8))) | NATS_VERSION_PATCH;
pub const NATS_VERSION_REQUIRED_NUMBER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x030900, .hex);
pub const NATS_EXTERN = "";
pub const NATS_DEFAULT_URL = "nats://localhost:4222";
pub const JSMsgSize = "Nats-Msg-Size";
pub const JSMsgRollup = "Nats-Rollup";
pub const JSMsgRollupSubject = "sub";
pub const JSMsgRollupAll = "all";
pub const JSStream = "Nats-Stream";
pub const JSSequence = "Nats-Sequence";
pub const JSLastSequence = "Nats-Last-Sequence";
pub const JSTimeStamp = "Nats-Time-Stamp";
pub const JSSubject = "Nats-Subject";
pub inline fn nats_CheckCompatibility() @TypeOf(nats_CheckCompatibilityImpl(NATS_VERSION_REQUIRED_NUMBER, NATS_VERSION_NUMBER, NATS_VERSION_STRING)) {
    return nats_CheckCompatibilityImpl(NATS_VERSION_REQUIRED_NUMBER, NATS_VERSION_NUMBER, NATS_VERSION_STRING);
}
pub const MICRO_API_PREFIX = "$SRV";
pub const MICRO_INFO_RESPONSE_TYPE = "io.nats.micro.v1.info_response";
pub const MICRO_INFO_VERB = "INFO";
pub const MICRO_PING_RESPONSE_TYPE = "io.nats.micro.v1.ping_response";
pub const MICRO_PING_VERB = "PING";
pub const MICRO_STATS_RESPONSE_TYPE = "io.nats.micro.v1.stats_response";
pub const MICRO_STATS_VERB = "STATS";
pub const MICRO_STATUS_HDR = "Nats-Status";
pub const MICRO_ERROR_HDR = "Nats-Service-Error";
pub const MICRO_ERROR_CODE_HDR = "Nats-Service-Error-Code";
pub inline fn microError_Ignore(__err: anytype) @TypeOf(microError_Destroy(__err)) {
    _ = &__err;
    return microError_Destroy(__err);
}
pub const NATS_SSL_ERR_REASON_STRING = @compileError("unable to translate macro: undefined identifier `ERR_reason_error_string`");
// ./src/submodules/nats.c/src/err.h:22:9
pub inline fn nats_setDefaultError(e: anytype) @TypeOf(nats_setError(e, "%s", natsStatus_GetText(e))) {
    _ = &e;
    return nats_setError(e, "%s", natsStatus_GetText(e));
}
pub const nats_setError = @compileError("unable to translate C expr: expected ')' instead got '...'");
// ./src/submodules/nats.c/src/err.h:26:9
pub inline fn NATS_UPDATE_ERR_STACK(s: anytype) @TypeOf(if (s == NATS_OK) s else nats_updateErrStack(s, __NATS_FUNCTION__)) {
    _ = &s;
    return if (s == NATS_OK) s else nats_updateErrStack(s, __NATS_FUNCTION__);
}
pub const NATS_UPDATE_ERR_TXT = @compileError("unable to translate C expr: expected ')' instead got '...'");
// ./src/submodules/nats.c/src/err.h:42:9
pub const BUF_H_ = "";
pub const NATS_EMPTY_BUFFER = @compileError("unable to translate C expr: unexpected token '{'");
// ./src/submodules/nats.c/src/buf.h:32:9
pub inline fn natsBuf_Data(b: anytype) @TypeOf(b.*.data) {
    _ = &b;
    return b.*.data;
}
pub inline fn natsBuf_Capacity(b: anytype) @TypeOf(b.*.capacity) {
    _ = &b;
    return b.*.capacity;
}
pub inline fn natsBuf_Len(b: anytype) @TypeOf(b.*.len) {
    _ = &b;
    return b.*.len;
}
pub inline fn natsBuf_Available(b: anytype) @TypeOf(b.*.capacity - b.*.len) {
    _ = &b;
    return b.*.capacity - b.*.len;
}
pub inline fn natsBuf_Cleanup(b: anytype) @TypeOf(natsBuf_Destroy(b)) {
    _ = &b;
    return natsBuf_Destroy(b);
}
pub const PARSER_H_ = "";
pub const MAX_CONTROL_LINE_SIZE = @as(c_int, 4096);
pub const TIMER_H_ = "";
pub const URL_H_ = "";
pub const SRVPOOL_H_ = "";
pub const HASH_H_ = "";
pub inline fn natsHash_Count(h: anytype) @TypeOf(h.*.used) {
    _ = &h;
    return h.*.used;
}
pub inline fn natsStrHash_Count(h: anytype) @TypeOf(h.*.used) {
    _ = &h;
    return h.*.used;
}
pub inline fn natsStrHash_Set(h: anytype, k: anytype, c: anytype, d: anytype, o: anytype) @TypeOf(natsStrHash_SetEx(h, k, c, if (c) @"true" else @"false", d, o)) {
    _ = &h;
    _ = &k;
    _ = &c;
    _ = &d;
    _ = &o;
    return natsStrHash_SetEx(h, k, c, if (c) @"true" else @"false", d, o);
}
pub inline fn natsStrHash_Get(h: anytype, k: anytype) @TypeOf(natsStrHash_GetEx(h, k, @import("std").zig.c_translation.cast(c_int, strlen(k)))) {
    _ = &h;
    _ = &k;
    return natsStrHash_GetEx(h, k, @import("std").zig.c_translation.cast(c_int, strlen(k)));
}
pub inline fn natsSrvPool_GetSize(p: anytype) @TypeOf(p.*.size) {
    _ = &p;
    return p.*.size;
}
pub inline fn natsSrvPool_GetSrv(p: anytype, i: anytype) @TypeOf(p.*.srvrs[@as(usize, @intCast(i))]) {
    _ = &p;
    _ = &i;
    return p.*.srvrs[@as(usize, @intCast(i))];
}
pub const natsSrvPool_SetSrvDidConnect = @compileError("unable to translate C expr: expected ')' instead got '='");
// ./src/submodules/nats.c/src/srvpool.h:50:9
pub const natsSrvPool_SetSrvReconnects = @compileError("unable to translate C expr: expected ')' instead got '='");
// ./src/submodules/nats.c/src/srvpool.h:51:9
pub const MSG_H_ = "";
pub const GC_H_ = "";
pub const HDR_LINE_PRE = "NATS/1.0";
pub const HDR_LINE_PRE_LEN = @as(c_int, 8);
pub const HDR_LINE = HDR_LINE_PRE ++ _CRLF_;
pub const HDR_LINE_LEN = @as(c_int, 10);
pub const STATUS_HDR = "Status";
pub const DESCRIPTION_HDR = "Description";
pub const HDR_STATUS_NO_RESP_503 = "503";
pub const HDR_STATUS_NOT_FOUND_404 = "404";
pub const HDR_STATUS_TIMEOUT_408 = "408";
pub const HDR_STATUS_MAX_BYTES_409 = "409";
pub const HDR_STATUS_CTRL_100 = "100";
pub const HDR_STATUS_LEN = @as(c_int, 3);
pub const natsMsg_setNeedsLift = @compileError("unable to translate C expr: expected ')' instead got '|='");
// ./src/submodules/nats.c/src/msg.h:33:9
pub inline fn natsMsg_needsLift(m: anytype) @TypeOf((m.*.flags & (@as(c_int, 1) << @as(c_int, 0))) != @as(c_int, 0)) {
    _ = &m;
    return (m.*.flags & (@as(c_int, 1) << @as(c_int, 0))) != @as(c_int, 0);
}
pub const natsMsg_clearNeedsLift = @compileError("unable to translate C expr: expected ')' instead got '&='");
// ./src/submodules/nats.c/src/msg.h:35:9
pub const natsMsg_setAcked = @compileError("unable to translate C expr: expected ')' instead got '|='");
// ./src/submodules/nats.c/src/msg.h:37:9
pub inline fn natsMsg_isAcked(m: anytype) @TypeOf((m.*.flags & (@as(c_int, 1) << @as(c_int, 1))) != @as(c_int, 0)) {
    _ = &m;
    return (m.*.flags & (@as(c_int, 1) << @as(c_int, 1))) != @as(c_int, 0);
}
pub const natsMsg_clearAcked = @compileError("unable to translate C expr: expected ')' instead got '&='");
// ./src/submodules/nats.c/src/msg.h:39:9
pub const natsMsg_setNoDestroy = @compileError("unable to translate C expr: expected ')' instead got '|='");
// ./src/submodules/nats.c/src/msg.h:41:9
pub inline fn natsMsg_isNoDestroy(m: anytype) @TypeOf((m.*.flags & (@as(c_int, 1) << @as(c_int, 2))) != @as(c_int, 0)) {
    _ = &m;
    return (m.*.flags & (@as(c_int, 1) << @as(c_int, 2))) != @as(c_int, 0);
}
pub const natsMsg_clearNoDestroy = @compileError("unable to translate C expr: expected ')' instead got '&='");
// ./src/submodules/nats.c/src/msg.h:43:9
pub const natsMsg_noDestroyFlag = @as(c_int, 1) << @as(c_int, 2);
pub const natsMsg_setTimeout = @compileError("unable to translate C expr: expected ')' instead got '|='");
// ./src/submodules/nats.c/src/msg.h:46:9
pub inline fn natsMsg_isTimeout(m: anytype) @TypeOf((m.*.flags & (@as(c_int, 1) << @as(c_int, 3))) != @as(c_int, 0)) {
    _ = &m;
    return (m.*.flags & (@as(c_int, 1) << @as(c_int, 3))) != @as(c_int, 0);
}
pub const natsMsg_clearTimeout = @compileError("unable to translate C expr: expected ')' instead got '&='");
// ./src/submodules/nats.c/src/msg.h:48:9
pub inline fn natsMsg_dataAndHdrLen(m: anytype) @TypeOf(m.*.dataLen + m.*.hdrLen) {
    _ = &m;
    return m.*.dataLen + m.*.hdrLen;
}
pub const DISPATCH_H_ = "";
pub const ASYNCCB_H_ = "";
pub const STATS_H_ = "";
pub const NATSTIME_H_ = "";
pub const NUID_H_ = "";
pub const NUID_BUFFER_LEN = @as(c_int, 12) + @as(c_int, 10);
pub const LIB_NATS_VERSION_STRING = NATS_VERSION_STRING;
pub const LIB_NATS_VERSION_NUMBER = NATS_VERSION_NUMBER;
pub const LIB_NATS_VERSION_REQUIRED_NUMBER = NATS_VERSION_REQUIRED_NUMBER;
pub const CString = "C";
pub const _OK_OP_ = "+OK";
pub const _ERR_OP_ = "-ERR";
pub const _MSG_OP_ = "MSG";
pub const _PING_OP_ = "PING";
pub const _PONG_OP_ = "PONG";
pub const _INFO_OP_ = "INFO";
pub const _CRLF_ = "\r\n";
pub const _SPC_ = " ";
pub const _HPUB_P_ = "HPUB ";
pub const _PING_PROTO_ = "PING\r\n";
pub const _PONG_PROTO_ = "PONG\r\n";
pub const _SUB_PROTO_ = "SUB %s %s %" ++ PRId64 ++ "\r\n";
pub const _UNSUB_PROTO_ = "UNSUB %" ++ PRId64 ++ " %d\r\n";
pub const _UNSUB_NO_MAX_PROTO_ = "UNSUB %" ++ PRId64 ++ " \r\n";
pub const STALE_CONNECTION = "Stale Connection";
pub const PERMISSIONS_ERR = "Permissions Violation";
pub const AUTHORIZATION_ERR = "Authorization Violation";
pub const AUTHENTICATION_EXPIRED_ERR = "User Authentication Expired";
pub const _CRLF_LEN_ = @as(c_int, 2);
pub const _SPC_LEN_ = @as(c_int, 1);
pub const _HPUB_P_LEN_ = @as(c_int, 5);
pub const _PING_OP_LEN_ = @as(c_int, 4);
pub const _PONG_OP_LEN_ = @as(c_int, 4);
pub const _PING_PROTO_LEN_ = @as(c_int, 6);
pub const _PONG_PROTO_LEN_ = @as(c_int, 6);
pub const _OK_OP_LEN_ = @as(c_int, 3);
pub const _ERR_OP_LEN_ = @as(c_int, 4);
pub const NATS_DEFAULT_INBOX_PRE = "_INBOX.";
pub const NATS_DEFAULT_INBOX_PRE_LEN = @as(c_int, 7);
pub const NATS_MAX_REQ_ID_LEN = @as(c_int, 19);
pub const WAIT_FOR_READ = @as(c_int, 0);
pub const WAIT_FOR_WRITE = @as(c_int, 1);
pub const WAIT_FOR_CONNECT = @as(c_int, 2);
pub const DEFAULT_DRAIN_TIMEOUT = @as(c_int, 30000);
pub const MAX_FRAMES = @as(c_int, 50);
pub inline fn nats_IsStringEmpty(s: anytype) @TypeOf(if ((s == NULL) or (s[@as(usize, @intCast(@as(c_int, 0)))] == '\x00')) @"true" else @"false") {
    _ = &s;
    return if ((s == NULL) or (s[@as(usize, @intCast(@as(c_int, 0)))] == '\x00')) @"true" else @"false";
}
pub inline fn nats_HasPrefix(_s: anytype, _prefix: anytype) @TypeOf(if (nats_IsStringEmpty(_s)) nats_IsStringEmpty(_prefix) else strncmp(_s, _prefix, strlen(_prefix)) == @as(c_int, 0)) {
    _ = &_s;
    _ = &_prefix;
    return if (nats_IsStringEmpty(_s)) nats_IsStringEmpty(_prefix) else strncmp(_s, _prefix, strlen(_prefix)) == @as(c_int, 0);
}
pub const DUP_STRING = @compileError("unable to translate C expr: unexpected token '{'");
// ./src/submodules/nats.c/src/natsp.h:119:9
pub const IF_OK_DUP_STRING = @compileError("unable to translate C expr: unexpected token 'if'");
// ./src/submodules/nats.c/src/natsp.h:126:9
pub const ERR_CODE_AUTH_EXPIRED = @as(c_int, 1);
pub const ERR_CODE_AUTH_VIOLATION = @as(c_int, 2);
pub const IFOK = @compileError("unable to translate C expr: unexpected token 'if'");
// ./src/submodules/nats.c/src/natsp.h:146:9
pub inline fn NATS_MILLIS_TO_NANOS(d: anytype) @TypeOf(@import("std").zig.c_translation.cast(i64, d) * @import("std").zig.c_translation.cast(i64, @as(f64, 1E6))) {
    _ = &d;
    return @import("std").zig.c_translation.cast(i64, d) * @import("std").zig.c_translation.cast(i64, @as(f64, 1E6));
}
pub inline fn NATS_SECONDS_TO_NANOS(d: anytype) @TypeOf(@import("std").zig.c_translation.cast(i64, d) * @import("std").zig.c_translation.cast(i64, @as(f64, 1E9))) {
    _ = &d;
    return @import("std").zig.c_translation.cast(i64, d) * @import("std").zig.c_translation.cast(i64, @as(f64, 1E9));
}
pub inline fn natsSSLCtx_getExpectedHostname(ctx: anytype) @TypeOf(ctx.*.expectedHostname) {
    _ = &ctx;
    return ctx.*.expectedHostname;
}
pub inline fn natsThreadLocal_Set(k: anytype, v: anytype) @TypeOf(natsThreadLocal_SetEx(k, v, @"true")) {
    _ = &k;
    _ = &v;
    return natsThreadLocal_SetEx(k, v, @"true");
}
pub const MEM_H_ = "";
pub inline fn NATS_MALLOC(s: anytype) @TypeOf(malloc(s)) {
    _ = &s;
    return malloc(s);
}
pub inline fn NATS_CALLOC(c: anytype, s: anytype) @TypeOf(calloc(c, s)) {
    _ = &c;
    _ = &s;
    return calloc(c, s);
}
pub inline fn NATS_REALLOC(p: anytype, s: anytype) @TypeOf(realloc(p, s)) {
    _ = &p;
    _ = &s;
    return realloc(p, s);
}
pub inline fn NATS_STRDUP(s: anytype) @TypeOf(strdup(s)) {
    _ = &s;
    return strdup(s);
}
pub inline fn NATS_FREE(p: anytype) @TypeOf(free(p)) {
    _ = &p;
    return free(p);
}
pub const HAVE_EXPLICIT_BZERO = @as(c_int, 1);
pub const CONN_H_ = "";
pub const RESP_INFO_POOL_MAX_SIZE = @as(c_int, 10);
pub inline fn natsConn_Lock(c: anytype) @TypeOf(natsMutex_Lock(c.*.mu)) {
    _ = &c;
    return natsMutex_Lock(c.*.mu);
}
pub inline fn natsConn_Unlock(c: anytype) @TypeOf(natsMutex_Unlock(c.*.mu)) {
    _ = &c;
    return natsMutex_Unlock(c.*.mu);
}
pub const SET_WRITE_DEADLINE = @compileError("unable to translate C expr: unexpected token 'if'");
// ./src/submodules/nats.c/src/conn.h:35:9
pub inline fn natsConn_subscribeNoPool(sub: anytype, nc: anytype, subj: anytype, cb: anytype, closure: anytype) @TypeOf(natsConn_subscribeImpl(sub, nc, @"true", subj, NULL, @as(c_int, 0), cb, closure, @"true", NULL)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    _ = &cb;
    _ = &closure;
    return natsConn_subscribeImpl(sub, nc, @"true", subj, NULL, @as(c_int, 0), cb, closure, @"true", NULL);
}
pub inline fn natsConn_subscribeNoPoolNoLock(sub: anytype, nc: anytype, subj: anytype, cb: anytype, closure: anytype) @TypeOf(natsConn_subscribeImpl(sub, nc, @"false", subj, NULL, @as(c_int, 0), cb, closure, @"true", NULL)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    _ = &cb;
    _ = &closure;
    return natsConn_subscribeImpl(sub, nc, @"false", subj, NULL, @as(c_int, 0), cb, closure, @"true", NULL);
}
pub inline fn natsConn_subscribeSyncNoPool(sub: anytype, nc: anytype, subj: anytype) @TypeOf(natsConn_subscribeNoPool(sub, nc, subj, NULL, NULL)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    return natsConn_subscribeNoPool(sub, nc, subj, NULL, NULL);
}
pub inline fn natsConn_subscribeWithTimeout(sub: anytype, nc: anytype, subj: anytype, timeout: anytype, cb: anytype, closure: anytype) @TypeOf(natsConn_subscribeImpl(sub, nc, @"true", subj, NULL, timeout, cb, closure, @"false", NULL)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    _ = &timeout;
    _ = &cb;
    _ = &closure;
    return natsConn_subscribeImpl(sub, nc, @"true", subj, NULL, timeout, cb, closure, @"false", NULL);
}
pub inline fn natsConn_subscribe(sub: anytype, nc: anytype, subj: anytype, cb: anytype, closure: anytype) @TypeOf(natsConn_subscribeWithTimeout(sub, nc, subj, @as(c_int, 0), cb, closure)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    _ = &cb;
    _ = &closure;
    return natsConn_subscribeWithTimeout(sub, nc, subj, @as(c_int, 0), cb, closure);
}
pub inline fn natsConn_subscribeSync(sub: anytype, nc: anytype, subj: anytype) @TypeOf(natsConn_subscribe(sub, nc, subj, NULL, NULL)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    return natsConn_subscribe(sub, nc, subj, NULL, NULL);
}
pub inline fn natsConn_queueSubscribeWithTimeout(sub: anytype, nc: anytype, subj: anytype, queue: anytype, timeout: anytype, cb: anytype, closure: anytype) @TypeOf(natsConn_subscribeImpl(sub, nc, @"true", subj, queue, timeout, cb, closure, @"false", NULL)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    _ = &queue;
    _ = &timeout;
    _ = &cb;
    _ = &closure;
    return natsConn_subscribeImpl(sub, nc, @"true", subj, queue, timeout, cb, closure, @"false", NULL);
}
pub inline fn natsConn_queueSubscribe(sub: anytype, nc: anytype, subj: anytype, queue: anytype, cb: anytype, closure: anytype) @TypeOf(natsConn_queueSubscribeWithTimeout(sub, nc, subj, queue, @as(c_int, 0), cb, closure)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    _ = &queue;
    _ = &cb;
    _ = &closure;
    return natsConn_queueSubscribeWithTimeout(sub, nc, subj, queue, @as(c_int, 0), cb, closure);
}
pub inline fn natsConn_queueSubscribeSync(sub: anytype, nc: anytype, subj: anytype, queue: anytype) @TypeOf(natsConn_queueSubscribe(sub, nc, subj, queue, NULL, NULL)) {
    _ = &sub;
    _ = &nc;
    _ = &subj;
    _ = &queue;
    return natsConn_queueSubscribe(sub, nc, subj, queue, NULL, NULL);
}
pub inline fn natsConn_setFilter(c: anytype, f: anytype) @TypeOf(natsConn_setFilterWithClosure(c, f, NULL)) {
    _ = &c;
    _ = &f;
    return natsConn_setFilterWithClosure(c, f, NULL);
}
pub const SUB_H_ = "";
pub const SUB_DRAIN_STARTED = @import("std").zig.c_translation.cast(u8, @as(c_int, 1));
pub const SUB_DRAIN_COMPLETE = @import("std").zig.c_translation.cast(u8, @as(c_int, 2));
pub inline fn natsSub_drainStarted(s: anytype) @TypeOf((s.*.drainState & SUB_DRAIN_STARTED) != @as(c_int, 0)) {
    _ = &s;
    return (s.*.drainState & SUB_DRAIN_STARTED) != @as(c_int, 0);
}
pub inline fn natsSub_drainComplete(s: anytype) @TypeOf((s.*.drainState & SUB_DRAIN_COMPLETE) != @as(c_int, 0)) {
    _ = &s;
    return (s.*.drainState & SUB_DRAIN_COMPLETE) != @as(c_int, 0);
}
pub const UTIL_H_ = "";
pub const JSON_MAX_NEXTED = @as(c_int, 100);
pub const TYPE_NOT_SET = @as(c_int, 0);
pub const TYPE_STR = @as(c_int, 1);
pub const TYPE_BOOL = @as(c_int, 2);
pub const TYPE_NUM = @as(c_int, 3);
pub const TYPE_INT = @as(c_int, 4);
pub const TYPE_UINT = @as(c_int, 5);
pub const TYPE_DOUBLE = @as(c_int, 6);
pub const TYPE_ARRAY = @as(c_int, 7);
pub const TYPE_OBJECT = @as(c_int, 8);
pub const TYPE_NULL = @as(c_int, 9);
pub const snprintf_truncate = @compileError("unable to translate C expr: expected ')' instead got '...'");
// ./src/submodules/nats.c/src/util.h:71:9
pub inline fn js_lock(js: anytype) @TypeOf(natsMutex_Lock(js.*.mu)) {
    _ = &js;
    return natsMutex_Lock(js.*.mu);
}
pub const js_unlock = @compileError("unable to translate macro: undefined identifier `js`");
// ./src/submodules/nats.c/src/js.h:27:9
pub const NATS_DEFAULT_ASYNC_FETCH_SIZE = @as(c_int, 128);
pub const jsMsgIdHdr = "Nats-Msg-Id";
pub const jsExpectedStreamHdr = "Nats-Expected-Stream";
pub const jsExpectedLastSeqHdr = "Nats-Expected-Last-Sequence";
pub const jsExpectedLastSubjSeqHdr = "Nats-Expected-Last-Subject-Sequence";
pub const jsExpectedLastMsgIdHdr = "Nats-Expected-Last-Msg-Id";
pub const jsConsumerStalledHdr = "Nats-Consumer-Stalled";
pub const jsErrStreamNameRequired = "stream name is required";
pub const jsErrConsumerNameRequired = "consumer name is required";
pub const jsErrNoStreamMatchesSubject = "no stream matches subject";
pub const jsErrPullSubscribeToPushConsumer = "cannot pull subscribe to push based consumer";
pub const jsErrPullSubscribeRequired = "must use pull subscribe to bind to pull based consumer";
pub const jsErrMsgNotBound = "message not bound to a subscription";
pub const jsErrMsgNotJS = "not a JetStream message";
pub const jsErrDurRequired = "durable name is required";
pub const jsErrNotAPullSubscription = "not a JetStream pull subscription";
pub const jsErrNotAJetStreamSubscription = "not a JetStream subscription";
pub const jsErrNotApplicableToPullSub = "not applicable to JetStream pull subscriptions";
pub const jsErrNoHeartbeatForQueueSub = "a queue subscription cannot be created for a consumer with heartbeat";
pub const jsErrNoFlowControlForQueueSub = "a queue subscription cannot be created for a consumer with flow control";
pub const jsErrConsumerSeqMismatch = "consumer sequence mismatch";
pub const jsErrOrderedConsNoDurable = "durable can not be set for an ordered consumer";
pub const jsErrOrderedConsNoAckPolicy = "ack policy can not be set for an ordered consume";
pub const jsErrOrderedConsNoMaxDeliver = "max deliver can not be set for an ordered consumer";
pub const jsErrOrderedConsNoDeliverSubject = "deliver subject can not be set for an ordered consumer";
pub const jsErrOrderedConsNoQueue = "queue can not be set for an ordered consumer";
pub const jsErrOrderedConsNoBind = "can not bind existing consumer for an ordered consumer";
pub const jsErrOrderedConsNoPullMode = "can not use pull mode for an ordered consumer";
pub const jsErrStreamConfigRequired = "stream configuration required";
pub const jsErrInvalidStreamName = "invalid stream name";
pub const jsErrConsumerConfigRequired = "consumer configuration required";
pub const jsErrInvalidDurableName = "invalid durable name";
pub const jsErrInvalidConsumerName = "invalid consumer name";
pub const jsErrConcurrentFetchNotAllowed = "concurrent fetch request not allowed";
pub const jsCtrlHeartbeat = @as(c_int, 1);
pub const jsCtrlFlowControl = @as(c_int, 2);
pub const jsRetPolicyLimitsStr = "limits";
pub const jsRetPolicyInterestStr = "interest";
pub const jsRetPolicyWorkQueueStr = "workqueue";
pub const jsDiscardPolicyOldStr = "old";
pub const jsDiscardPolicyNewStr = "new";
pub const jsStorageTypeFileStr = "file";
pub const jsStorageTypeMemStr = "memory";
pub const jsStorageCompressionNoneStr = "none";
pub const jsStorageCompressionS2Str = "s2";
pub const jsDeliverAllStr = "all";
pub const jsDeliverLastStr = "last";
pub const jsDeliverNewStr = "new";
pub const jsDeliverBySeqStr = "by_start_sequence";
pub const jsDeliverByTimeStr = "by_start_time";
pub const jsDeliverLastPerSubjectStr = "last_per_subject";
pub const jsAckNoneStr = "none";
pub const jsAckAllStr = "all";
pub const jsAckExplictStr = "explicit";
pub const jsReplayOriginalStr = "original";
pub const jsReplayInstantStr = "instant";
pub const jsAckPrefix = "$JS.ACK.";
pub const jsAckPrefixLen = @as(c_int, 8);
pub const jsAckAck = "+ACK";
pub const jsAckNak = "-NAK";
pub const jsAckInProgress = "+WPI";
pub const jsAckTerm = "+TERM";
pub const jsExtDomainT = "$JS.%s.API";
pub const jsApiAccountInfo = "%.*s.INFO";
pub const jsApiStreamCreateT = "%.*s.STREAM.CREATE.%s";
pub const jsApiStreamUpdateT = "%.*s.STREAM.UPDATE.%s";
pub const jsApiStreamPurgeT = "%.*s.STREAM.PURGE.%s";
pub const jsApiStreamDeleteT = "%.*s.STREAM.DELETE.%s";
pub const jsApiStreamInfoT = "%.*s.STREAM.INFO.%s";
pub const jsApiConsumerCreateT = "%.*s.CONSUMER.CREATE.%s";
pub const jsApiDurableCreateT = "%.*s.CONSUMER.DURABLE.CREATE.%s.%s";
pub const jsApiConsumerCreateExT = "%.*s.CONSUMER.CREATE.%s.%s";
pub const jsApiConsumerCreateExWithFilterT = "%.*s.CONSUMER.CREATE.%s.%s.%s";
pub const jsApiConsumerInfoT = "%.*s.CONSUMER.INFO.%s.%s";
pub const jsApiConsumerDeleteT = "%.*s.CONSUMER.DELETE.%s.%s";
pub const jsApiStreams = "%.*s.STREAM.NAMES";
pub const jsApiRequestNextT = "%s.CONSUMER.MSG.NEXT.%s.%s";
pub const jsApiMsgDeleteT = "%.*s.STREAM.MSG.DELETE.%s";
pub const jsApiMsgGetT = "%.*s.STREAM.MSG.GET.%s";
pub const jsApiDirectMsgGetT = "%.*s.DIRECT.GET.%s";
pub const jsApiDirectMsgGetLastBySubjectT = "%.*s.DIRECT.GET.%s.%s";
pub const jsApiStreamListT = "%.*s.STREAM.LIST";
pub const jsApiStreamNamesT = "%.*s.STREAM.NAMES";
pub const jsApiConsumerListT = "%.*s.CONSUMER.LIST.%s";
pub const jsApiConsumerNamesT = "%.*s.CONSUMER.NAMES.%s";
pub const jsApiConsumerPauseT = "%.*s.CONSUMER.PAUSE.%s.%s";
pub const js_apiSubj = @compileError("unable to translate C expr: expected ')' instead got '...'");
// ./src/submodules/nats.c/src/js.h:183:9
pub const IFOK_JSR = @compileError("unable to translate macro: undefined identifier `errCode`");
// ./src/submodules/nats.c/src/js.h:187:9
pub inline fn js_apiResponseIsErr(ar: anytype) @TypeOf((ar.*.Error.Code != @as(c_int, 0)) or (ar.*.Error.ErrCode != @as(c_int, 0))) {
    _ = &ar;
    return (ar.*.Error.Code != @as(c_int, 0)) or (ar.*.Error.ErrCode != @as(c_int, 0));
}
pub const JS_EMPTY_API_RESPONSE = @compileError("unable to translate C expr: unexpected token '{'");
// ./src/submodules/nats.c/src/js.h:209:9
pub const GLIB_H_ = "";
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __itimer_which = enum___itimer_which;
pub const itimerval = struct_itimerval;
pub const flock = struct_flock;
pub const flock64 = struct_flock64;
pub const iovec = struct_iovec;
pub const __pid_type = enum___pid_type;
pub const f_owner_ex = struct_f_owner_ex;
pub const file_handle = struct_file_handle;
pub const stat = struct_stat;
pub const stat64 = struct_stat64;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const __socket_type = enum___socket_type;
pub const sockaddr = struct_sockaddr;
pub const sockaddr_storage = struct_sockaddr_storage;
pub const msghdr = struct_msghdr;
pub const cmsghdr = struct_cmsghdr;
pub const ucred = struct_ucred;
pub const linger = struct_linger;
pub const osockaddr = struct_osockaddr;
pub const in_addr = struct_in_addr;
pub const sockaddr_in = struct_sockaddr_in;
pub const in6_addr = struct_in6_addr;
pub const sockaddr_in6 = struct_sockaddr_in6;
pub const mmsghdr = struct_mmsghdr;
pub const tcphdr = struct_tcphdr;
pub const tcp_ca_state = enum_tcp_ca_state;
pub const tcp_info = struct_tcp_info;
pub const tcp_md5sig = struct_tcp_md5sig;
pub const tcp_repair_opt = struct_tcp_repair_opt;
pub const tcp_cookie_transactions = struct_tcp_cookie_transactions;
pub const tcp_repair_window = struct_tcp_repair_window;
pub const tcp_zerocopy_receive = struct_tcp_zerocopy_receive;
pub const ip_opts = struct_ip_opts;
pub const in_pktinfo = struct_in_pktinfo;
pub const ip_mreq = struct_ip_mreq;
pub const ip_mreqn = struct_ip_mreqn;
pub const ip_mreq_source = struct_ip_mreq_source;
pub const ipv6_mreq = struct_ipv6_mreq;
pub const group_req = struct_group_req;
pub const group_source_req = struct_group_source_req;
pub const ip_msfilter = struct_ip_msfilter;
pub const group_filter = struct_group_filter;
pub const in6_pktinfo = struct_in6_pktinfo;
pub const ip6_mtuinfo = struct_ip6_mtuinfo;
pub const rpcent = struct_rpcent;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const netent = struct_netent;
pub const hostent = struct_hostent;
pub const servent = struct_servent;
pub const protoent = struct_protoent;
pub const addrinfo = struct_addrinfo;
pub const gaicb = struct_gaicb;
pub const sched_param = struct_sched_param;
pub const timex = struct_timex;
pub const tm = struct_tm;
pub const itimerspec = struct_itimerspec;
pub const __locale_struct = struct___locale_struct;
pub const __jmp_buf_tag = struct___jmp_buf_tag;
pub const _pthread_cleanup_buffer = struct__pthread_cleanup_buffer;
pub const __cancel_jmp_buf_tag = struct___cancel_jmp_buf_tag;
pub const __pthread_cleanup_frame = struct___pthread_cleanup_frame;
pub const _fpx_sw_bytes = struct__fpx_sw_bytes;
pub const _fpreg = struct__fpreg;
pub const _fpxreg = struct__fpxreg;
pub const _xmmreg = struct__xmmreg;
pub const _fpstate = struct__fpstate;
pub const sigcontext = struct_sigcontext;
pub const _xsave_hdr = struct__xsave_hdr;
pub const _ymmh_state = struct__ymmh_state;
pub const _xstate = struct__xstate;
pub const _libc_fpxreg = struct__libc_fpxreg;
pub const _libc_xmmreg = struct__libc_xmmreg;
pub const _libc_fpstate = struct__libc_fpstate;
pub const rusage = struct_rusage;
pub const pollfd = struct_pollfd;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_FILE = struct__IO_FILE;
pub const _IO_cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const obstack = struct_obstack;
pub const __natsGCItem = struct___natsGCItem;
pub const __natsStrHashEntry = struct___natsStrHashEntry;
pub const __natsStrHash = struct___natsStrHash;
pub const __natsMsg = struct___natsMsg;
pub const __natsDispatchQueue_s = struct___natsDispatchQueue_s;
pub const __natsDispatcher_s = struct___natsDispatcher_s;
pub const __natsSubscriptionControlMessages = struct___natsSubscriptionControlMessages;
pub const __natsTimer = struct___natsTimer;
pub const __pmInfo = struct___pmInfo;
pub const __jsCtx = struct___jsCtx;
pub const __jsFetch = struct___jsFetch;
pub const __jsSub = struct___jsSub;
pub const __natsSubscription = struct___natsSubscription;
pub const __natsSSLCtx = struct___natsSSLCtx;
pub const __userCreds = struct___userCreds;
pub const __natsOptions = struct___natsOptions;
pub const __natsUrl = struct___natsUrl;
pub const __natsSrv = struct___natsSrv;
pub const __natsDeadline = struct___natsDeadline;
pub const __natsSockCtx = struct___natsSockCtx;
pub const __natsSrvPool = struct___natsSrvPool;
pub const __natsBuffer = struct___natsBuffer;
pub const __natsServerInfo = struct___natsServerInfo;
pub const __natsHashEntry = struct___natsHashEntry;
pub const __natsHash = struct___natsHash;
pub const micro_service_s = struct_micro_service_s;
pub const __natsMsgArg = struct___natsMsgArg;
pub const __natsParser = struct___natsParser;
pub const __natsPong = struct___natsPong;
pub const __natsPongList = struct___natsPongList;
pub const __natsStatistics = struct___natsStatistics;
pub const __respInfo = struct___respInfo;
pub const __natsConnection = struct___natsConnection;
pub const __natsClientConfig = struct___natsClientConfig;
pub const __kvStore = struct___kvStore;
pub const __kvEntry = struct___kvEntry;
pub const __kvStatus = struct___kvStatus;
pub const __kvWatcher = struct___kvWatcher;
pub const micro_client_s = struct_micro_client_s;
pub const __for_forward_compatibility_only = struct___for_forward_compatibility_only;
pub const micro_endpoint_s = struct_micro_endpoint_s;
pub const micro_request_s = struct_micro_request_s;
pub const micro_error_s = struct_micro_error_s;
pub const micro_endpoint_config_s = struct_micro_endpoint_config_s;
pub const micro_endpoint_info_s = struct_micro_endpoint_info_s;
pub const micro_endpoint_stats_s = struct_micro_endpoint_stats_s;
pub const micro_group_s = struct_micro_group_s;
pub const micro_group_config_s = struct_micro_group_config_s;
pub const micro_service_config_s = struct_micro_service_config_s;
pub const micro_service_info_s = struct_micro_service_info_s;
pub const micro_service_stats_s = struct_micro_service_stats_s;
pub const __natsHashIter = struct___natsHashIter;
pub const __natsStrHashIter = struct___natsStrHashIter;
pub const __natsHeaderValue = struct___natsHeaderValue;
pub const __natsAsyncCbInfo = struct___natsAsyncCbInfo;
pub const __natsControl = struct___natsControl;
pub const __jsApiError = struct___jsApiError;
pub const __jsApiResponse = struct___jsApiResponse;
pub const __natsDispatcherPool = struct___natsDispatcherPool;
