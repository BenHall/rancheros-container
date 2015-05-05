FROM ubuntu:14.04
RUN apt-get update -q
RUN apt-get install -qy qemu-kvm socat curl dnsmasq iptables cloud-utils
RUN mkdir -p /cache
RUN curl -L https://github.com/rancherio/os/releases/download/v0.3.0/rancheros.iso > /cache/rancheros.iso
RUN ln -s /cache/rancheros.iso /system.iso
ADD bin /usr/local/bin
EXPOSE 2222/tcp
EXPOSE 2376/tcp
CMD kvm-start
