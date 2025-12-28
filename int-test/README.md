# NATS Integration Tests

> This uses a test step `integration-test` in _build.zig_.
You need to use **ENV VARS** to use it as shown below.

## Run all integration tests automatically

```bash
./test/run-integration-tests.sh
```

This script will:

1. Start NATS server with token auth and run token tests
2. Start NATS server with user/pass auth and run those tests
3. Start NATS server with NKey auth and run those tests

## Run tests manually

You need to pass a nats.conf for each config.

- `nats-default.conf` - No authentication (for regular tests) port 4222
- `nats-token.conf` - Token authentication configuration, port 4223
- `nats-userpass.conf` - User/password authentication configuration, port 4224
- `nats-nkey.conf` - NKey authentication configuration port 4225

### Token Authentication

```bash
# Start NATS with token auth config
nats-server -c test/nats-token.conf &

# Run the test
NATS_TOKEN="test_token_12345" zig build test --summary all

# Stop server
killall nats-server
```

### User/Password Authentication

```bash
# Start NATS with user/pass auth config
nats-server -c test/nats-userpass.conf &

# Run the test
NATS_USER="testuser" NATS_PASS="testpass" zig build test --summary all

# Stop server
killall nats-server
```

### NKey Authentication

The NKey configuration (_user.nk_) uses:

```json
{
  "Public_Key": "UAMCNGKUGLZF7WFC63R2ZGF3G463EXMMNIP3G4NBS7RDUCEVHPDEIEGK",
  "Private_Seed": "SUAEBVUWOAJRL5FSDXP3A7EEUC3ZU7GYILW6TMVK2J63RQAZQQ642MVIBI"
}
```

To generate a pair,

- install the NATS tool [nk](https://docs.nats.io/using-nats/nats-tools/nk). 
- run: `nk -gen user -pubout > user.nk`

```bash
# Start NATS with NKey auth config
nats-server -c test/nats-nkey.conf &

# Run the test with the matching private seed
NATS_NKEY_SEED="SUAEBVUWOAJRL5FSDXP3A7EEUC3ZU7GYILW6TMVK2J63RQAZQQ642MVIBI" zig build test --summary all

# Stop server
killall nats-server
```

## Running in CI: _.github/workflows/ci.yml`_

Local test on OSX (arch `arm64` on my M1) with [act](https://github.com/nektos/act):

```sh
act -W .github/workflows/ci.yml --container-architecture linux/arm64 -j test
```
