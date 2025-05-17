![](_logo/nats-streams-ordersimage.png)

![](_logo/logo.png)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![CI](https://github.com/g41797/nats/actions/workflows/linux.yml/badge.svg)](https://github.com/g41797/nats/actions/workflows/linux.yml)
[![CI](https://github.com/g41797/nats/actions/workflows/mac.yml/badge.svg)](https://github.com/g41797/nats/actions/workflows/mac.yml)

## Straight to the point

Let's try to program the prototype of the system shown in [the picture above](_logo/nats-streams-ordersimage.png).

Key points:
- Many related _subjects_ are stored in a _Stream_
- _Consumers_ can have different modes of operation and receive just _subsets_ of the messages
- Multiple _Acknowledgement_ modes are supported

Flow:
- A new _order_ 
    - arrives on ORDERS.received, 
    - gets sent to the **NEW** _Consumer_ who, on success, 
    - will create a new message on ORDERS.processed
- The ORDERS.processed message
  - again enters the Stream 
  - where a **DISPATCH** Consumer receives it
  - and once processed it will create an ORDERS.completed message
  - which will again enter the Stream
- All messages are delivered to a MONITOR Consumer
  - who pushes them to monitor

Acknowledgements:
- **NEW** and **DISPATCH** Consumers acknowledged all received messages to ensure no order is missed.
- MONITOR Consumer receives all messages without acknowledge.

You can find more details on [NATS Example page](https://docs.nats.io/nats-concepts/jetstream/consumers/example_configuration)

### Stream creation
```zig
const DefaultConnectOpts: protocol.ConnectOpts = .{};
const STREAM: []const u8 = "ORDERS";

var js: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
defer js.DISCONNECT();

var CONF: protocol.StreamConfig = .{ .name = STREAM, .subjects = &.{ "ORDERS.*" } };

try js.CREATE(&CONF);
```

### Submit(publish) orders to the stream
```zig
var submitter: JetStream = try JetStream.CONNECT(std.testing.allocator, DefaultConnectOpts);
defer submitter.DISCONNECT();

try submitter.PUBLISH("ORDERS.received", null, "order-1 ...");
```

### Consume received orders
```zig
const DeleteConsumer: bool = true;

const conf: ConsumerConfig = .{
    .durable_name = "NEW",
    .filter_subject = "ORDERS.received",
};

var NEW: Consumer = try Consumer.START(std.testing.allocator, DefaultConnectOpts, STREAM, &conf);
defer NEW.STOP(DeleteConsumer);

var order = try NEW.CONSUME(protocol.SECNS * 2);
.... process order ....
try NEW.ACK(order.?, true);
try NEW.PUBLISH("ORDERS.processed", null, "...");
```
### Consume processed orders
```zig
const DeleteConsumer: bool = true;

const conf = .{
    .durable_name = "DISPATCH",
    .filter_subject = "ORDERS.processed",
};

var DISPATCH: Consumer = try Consumer.START(std.testing.allocator, DefaultConnectOpts, STREAM, &conf);
defer DISPATCH.STOP(DeleteConsumer);

order = try DISPATCH.CONSUME(protocol.SECNS * 2);
.... process order ....
try DISPATCH.ACK(order.?, false);
try DISPATCH.PUBLISH("ORDERS.completed", null, "...");
```
### Track all orders(messages)
```zig
var subscriber: Subscriber = try Subscriber.SUBSCRIBE(std.testing.allocator, DefaultConnectOpts, STREAM, "ORDERS.*");
defer subscriber.UNSUBSCRIBE();

while (true) {
    const pmsg = try subscriber.NEXT(protocol.SECNS * 5);
    ... pushes info to monitor ...
    subscriber.REUSE(pmsg);
}
```
## Installation
Add *nats* to build.zig.zon:
```bach
zig fetch --save=nats git+https://github.com/g41797/nats
```

Add *nats* to build.zig:
```zig
const nats = b.dependency("nats", .{
    .target = target,
    .optimize = optimize,
});

const lib = b.addStaticLibrary(..);
lib.root_module.addImport("nats", nats.module("nats"));

const lib_unit_tests = b.addTest(...);
lib_unit_tests.root_module.addImport("nats", nats.module("nats"));
```

Import *nats*:
```zig
const nats = @import("nats");
```

## Credits
The project is largely inspired by the very existence of [Nats client for php](https://github.com/basis-company/nats.php).

