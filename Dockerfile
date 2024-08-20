FROM alpine:latest

# Install Docker
RUN apk update && apk add docker

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

# Start Docker daemon
CMD ["dockerd", "-H", "tcp://0.0.0.0:2375"]