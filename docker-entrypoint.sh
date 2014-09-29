#!/bin/bash
set -e

if [ "$1" = 'rabbitmq' ]; then
	chown -R rabbitmq /data/log
	chown -R rabbitmq /data/mnesia
	exec gosu rabbitmq "$@"
fi

exec "$@"
