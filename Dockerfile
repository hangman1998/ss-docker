FROM teddysun/shadowsocks-rust:debian-1.15.2

ARG TARGETPLATFORM
WORKDIR /root
COPY v2ray-plugin.sh /root/v2ray-plugin.sh
COPY entry.sh /root/entry.sh
COPY shadowsocks-rust-debian.sh /root/shadowsocks-rust-debian.sh
COPY config.json  /etc/shadowsocks-rust/config.json
# RUN set -ex \
# 	&& apt-get update \
# 	&& apt-get install -y --no-install-recommends wget ca-certificates xz-utils gettext-base \
# 	&& chmod +x /root/shadowsocks-rust-debian.sh \
# 	&& /root/shadowsocks-rust-debian.sh "${TARGETPLATFORM}" \
# 	&& rm -f /root/shadowsocks-rust-debian.sh \
# 	&& chmod +x /root/entry.sh \
# 	&& chmod +x /root/v2ray-plugin.sh \
# 	&& /root/v2ray-plugin.sh "${TARGETPLATFORM}" \
# 	&& rm -f /root/v2ray-plugin.sh \
# 	&& apt-get -y autoremove \
# 	&& apt-get -y clean \
# 	&& rm -rf /var/lib/apt/lists/*
ENV TZ=Asia/Tehran
ENTRYPOINT ["/entry.sh"]
CMD [ "/usr/bin/ssservice", "server", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]