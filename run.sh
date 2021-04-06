#!/bin/bash
set -eu

/usr/local/bin/docker-entrypoint.sh rabbitmq-server -detached

sleep 5s

rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl join_cluster rabbit@rabbitmq1
rabbitmqctl stop

sleep 5s

rabbitmq-server
