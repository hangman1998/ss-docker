FROM teddysun/shadowsocks-rust:1.15.1
RUN apt-get update && apt-get install -y gettext
COPY config.json  /etc/shadowsocks-rust/config.json.var
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
CMD [ "/usr/bin/ssservice", "server", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]