#
# RabbitMQ Dockerfile
#
# https://github.com/dockerfile/rabbitmq
#

# Pull base image.
FROM debian:jessie

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
  rabbitmq-plugins enable --offline rabbitmq_management && \
  rabbitmq-plugins enable --offline rabbitmq_shovel rabbitmq_shovel_management

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Add scripts
COPY set_rabbitmq_password.sh /set_rabbitmq_password.sh
COPY set_rabbitmq_cluster.sh /set_rabbitmq_cluster.sh
# Config
COPY rabbitmq.config /etc/rabbitmq/rabbitmq.config

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# Expose ports.
EXPOSE 5672
EXPOSE 15672
EXPOSE 25672
EXPOSE 4369

CMD ["rabbitmq-server"]
