#
# RabbitMQ Dockerfile
#
# https://github.com/dockerfile/rabbitmq
#

# Pull base image.
FROM debian:wheezy

# Install wget
RUN \
	apt-get update && \
	apt-get install -y wget curl pwgen && \
	rm -rf /var/lib/apt/lists/*

# Install RabbitMQ
RUN \
  wget -qO - http://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
  echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server && \
  rm -rf /var/lib/apt/lists/* && \
  rabbitmq-plugins enable rabbitmq_management 

# rabbitmq.config
RUN \
	echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config && \
	echo "[{rabbit, [{cluster_partition_handling,autoheal}]}]." > /etc/rabbitmq/rabbitmq.config

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data", "/etc/rabbitmq"]

# Define working directory.
WORKDIR /data

# Add scripts
ADD set_rabbitmq_password.sh /set_rabbitmq_password.sh

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Expose ports.
EXPOSE 5672
EXPOSE 15672
EXPOSE 25672

CMD ["rabbitmq-server"]
