#!/usr/bin/env bash

export QPORT=4222

if ! [ -f docker/docker-compose.yml ]; then
  export DOCOMPOSE=./docker-compose.yml
else
  export DOCOMPOSE=docker/docker-compose.yml
fi

docker compose -f $DOCOMPOSE up -d

echo Waiting for open port $QPORT

# Wait for NATS to be ready (up to 30 seconds)
for i in {1..30}
do
    if nc -z localhost $QPORT 2>/dev/null; then
        echo 'ok'
        echo ''
        date
        echo "Port $QPORT is open"
        echo ''
        break
    fi
    echo -n .
    sleep 1
done


