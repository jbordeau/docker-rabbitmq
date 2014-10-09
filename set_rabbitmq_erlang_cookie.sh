#!/bin/bash

if [[ -z ${RABBITMQ_COOKIES} ]]; then
	echo "update .erlang.cookie with this value : ${RABBITMQ_COOKIES}"
	echo "${RABBITMQ_COOKIES}" > /var/lib/rabbitmq/.erlang.cookie
fi
