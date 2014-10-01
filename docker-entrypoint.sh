#!/bin/bash
set -e

if [ "$1" = 'rabbitmq' ]; then
	chown -R rabbitmq /data/rabbitmq
	exec gosu rabbitmq "$@"
fi

exec "$@"
