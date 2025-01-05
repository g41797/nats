#!/usr/bin/env bash

export QPORT=4222

if ! [ -f docker/docker-compose.yml ]; then
  export DOCOMPOSE=./docker-compose.yml
else
  export DOCOMPOSE=docker/docker-compose.yml
fi

docker compose -f $DOCOMPOSE up -d

echo Waiting for open port $QPORT

for (( ; ; ))
do
    sudo netstat --tcp --listening --programs --numeric|grep -o $QPORT|wc -l >/tmp/openedports
    OPENED=$(< /tmp/openedports)
    if [ $OPENED -gt 0 ];
    then
        break
    fi

    echo -n .
    sleep 1
done

echo 'ok'
echo ''

date
sudo netstat --tcp --listening --programs --numeric|grep $QPORT
echo ''


