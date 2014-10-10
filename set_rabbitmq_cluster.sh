#!/bin/bash

if [[ -z ${RABBITMQ_COOKIES} ]]; then
        echo "RABBITMQ_COOKIES is unset"
	#sed -i "s/\$CLUSTER_NODES//" /etc/rabbitmq/rabbitmq.config
else	
        echo "RABBITMQ_COOKIES is set : ${RABBITMQ_COOKIES}"
        echo "${RABBITMQ_COOKIES}" > /var/lib/rabbitmq/.erlang.cookie
	chmod 400 /var/lib/rabbitmq/.erlang.cookie
	#cluster=", \n {cluster_nodes, $CLUSTER_NODES}"
	#sed -i "s/\$CLUSTER_NODES/$cluster/" /etc/rabbitmq/rabbitmq.config
fi
