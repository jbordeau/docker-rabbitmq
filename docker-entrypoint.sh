#!/bin/bash
set -e

if [ "$1" = 'rabbitmq-server' ]; then
	chown -R rabbitmq:rabbitmq /data
fi

if [ ! -f /.rabbitmq_password_set ]; then
	/set_rabbitmq_password.sh
fi

exec "$@"
