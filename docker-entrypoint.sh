#!/bin/bash
set -e

/set_rabbitmq_password.sh
/set_rabbitmq_cluster.sh

if [ "$1" = 'rabbitmq-server' ]; then
        chown -R rabbitmq:rabbitmq /data
	chown -R rabbitmq:rabbitmq /var/lib/rabbitmq
fi

exec "$@"
