FROM teddysun/shadowsocks-rust:debian-1.15.2

ARG TARGETPLATFORM
WORKDIR /root
COPY v2ray-plugin.sh /root/v2ray-plugin.sh
COPY entry.sh /root/entry.sh
COPY shadowsocks-rust-debian.sh /root/shadowsocks-rust-debian.sh
COPY config.json  /etc/shadowsocks-rust/config.json
RUN chmod +x /root/entry.sh
ENV TZ=Asia/Tehran
ENTRYPOINT ["/root/entry.sh"]
CMD [ "/usr/bin/ssservice", "server", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]