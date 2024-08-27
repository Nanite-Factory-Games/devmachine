FROM alpine:latest

# This tells whaledrive where to find the bootloader
LABEL whaledrive.bootloader.path=/usr/share/syslinux/mbr.bin

# Install Docker, the kernel and the syslinux bootloader
RUN apk update && apk add docker linux-virt

# Override the syslinux conf file with one with no timeout
COPY syslinux.cfg /boot/syslinux.cfg

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

# Start Docker daemon
CMD ["dockerd", "-H", "tcp://0.0.0.0:2375"]