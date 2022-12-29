FROM teddysun/shadowsocks-rust:1.15.1
RUN apk add --no-cache gettext
COPY config.json  /etc/shadowsocks-rust/config.json.var
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
