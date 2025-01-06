mkdir c
mkdir c/natsc
mkdir c/natsc/src
mkdir c/natsc/src/unix

ls -la src/c/natsc

# tree -afi -P *.c\ -o /tmp/c.log

for file in \
  asynccb.c\
  buf.c\
  comsock.c\
  conn.c\
  crypto.c\
  dispatch.c\
  hash.c\
  js.c\
  jsm.c\
  msg.c\
  nats.c\
  natstime.c\
  nkeys.c\
  nuid.c\
  opts.c\
  parser.c\
  pub.c\
  srvpool.c\
  stats.c\
  status.c\
  sub.c\
  timer.c\
  url.c\
  util.c\
  unix/cond.c\
  unix/mutex.c\
  unix/sock.c\
  unix/thread.c
do
      #rm -f  c/natsc/src/$file.zig
      zig translate-c -lc --verbose-cimport -fno-emit-bin submodules/nats.c/src/$file > c/natsc/src/$file.zig
done

ls -la src/c/natsc/src