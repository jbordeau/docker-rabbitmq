#!/bin/bash
set -e

if [ "$1" = 'rabbitmq-server' ]; then
	chown -R rabbitmq:rabbitmq /data
fi

/set_rabbitmq_password.sh
/set_rabbitmq_erlang_cookie.sh

exec "$@"
