FROM rabbitmq:3.12-management

ENV RABBITMQ_NODENAME=rabbit@localhost

EXPOSE 5672 15672

USER rabbitmq:rabbitmq

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD rabbitmq-diagnostics -q ping