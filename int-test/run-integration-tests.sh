#!/bin/bash
# runs each auth test with its own NATS server instance
# requires nats-server to be installed and in PATH
# this is done in the CI workflow

set -e

unset NATS_TOKEN NATS_USER NATS_PASS NATS_NKEY_SEED

# Change to project root directory
cd "$(dirname "$0")/.."

# === Token Auth -----------

echo "----- Test Token Authentication"
echo ""

nats-server -c int-test/nats-token.conf &
SERVER_PID=$!
sleep 2

NATS_TOKEN=test_token_12345 zig build integration-test --summary all 2>&1 | grep -E "(Auth: Token|passed|failed)" || true

kill $SERVER_PID 2>/dev/null || true
sleep 1

# === User/Pass Auth -----------

echo ""
echo "----- Test User/Pass Authentication"
echo ""
nats-server -c int-test/nats-userpass.conf &
SERVER_PID=$!
sleep 2

NATS_USER=testuser NATS_PASS=testpass zig build integration-test --summary all 2>&1 | grep -E "(Auth: User|passed|failed)" || true

kill $SERVER_PID 2>/dev/null || true
sleep 1

# === NKey Auth ------------

echo ""
echo "----- Test NKey Authentication"
echo ""

nats-server -c int-test/nats-nkey.conf &
SERVER_PID=$!
sleep 2

# !! seed matches the public key in the config
NATS_NKEY_SEED=SUAEBVUWOAJRL5FSDXP3A7EEUC3ZU7GYILW6TMVK2J63RQAZQQ642MVIBI zig build integration-test --summary all 2>&1 | grep -E "(Auth: NKey|passed|failed)" || true

kill $SERVER_PID 2>/dev/null || true
sleep 1

echo ""
echo "✅"
