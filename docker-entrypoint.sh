#!/bin/bash
set -e

if [ ! -f /.rabbitmq_password_set ]; then
	/set_rabbitmq_password.sh
fi

exec "$@"
