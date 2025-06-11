FROM rabbitmq:3.8.0-management

ENV RABBITMQ_NODENAME=rabbit@localhost

EXPOSE 5672 15672

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf

USER rabbitmq:rabbitmq

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD rabbitmq-diagnostics -q ping