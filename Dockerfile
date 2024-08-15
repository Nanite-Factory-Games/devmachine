FROM alpine:latest

# Install Docker
RUN apk update && apk add docker

# Start Docker daemon
CMD ["dockerd", "-H", "tcp://0.0.0.0:2375"]