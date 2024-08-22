FROM alpine:latest

# This tells whaledrive where to find the bootloader
LABEL whaledrive.bootloader.path=/usr/share/syslinux/gptmbr.bin

# Install Docker, the kernel and the syslinux bootloader
RUN apk update && apk add docker linux-virt syslinux

# Override the extlinux conf file with one with no timeout
ADD extlinux.conf /boot/extlinux.conf

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

# Start Docker daemon
CMD ["dockerd", "-H", "tcp://0.0.0.0:2375"]