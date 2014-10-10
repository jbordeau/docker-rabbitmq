#!/bin/bash

if [[ -z ${RABBITMQ_COOKIES} ]]; then
        echo "RABBITMQ_COOKIES is unset"
else	
        echo "RABBITMQ_COOKIES is set : ${RABBITMQ_COOKIES}"
        echo "${RABBITMQ_COOKIES}" > /var/lib/rabbitmq/.erlang.cookie
	chmod 400 /var/lib/rabbitmq/.erlang.cookie
fi
