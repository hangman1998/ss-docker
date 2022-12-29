FROM teddysun/shadowsocks-rust:1.15.1
# RUN set -ex \
#     && apt-get update \
#     && apt-get -y install gettext-base gettext \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*
COPY config.json  /etc/shadowsocks-rust/config.json
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
CMD [ "/usr/bin/ssservice", "server", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]