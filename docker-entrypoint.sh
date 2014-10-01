#!/bin/bash
set -e

if [ "$1" = 'rabbitmq-server' ]; then
	chown -R rabbitmq /data/rabbitmq
	chown -R rabbitmq /var/lib/rabbitmq
	exec gosu rabbitmq "$@"
fi

exec "$@"
