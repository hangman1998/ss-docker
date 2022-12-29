FROM teddysun/shadowsocks-rust:alpine-1.15.2
# RUN apk add --no-cache gettext
RUN set -x && \
    apk add --update libintl && \
    apk add --virtual build_deps gettext &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps

COPY config.json  /etc/shadowsocks-rust/config.json.var
COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
CMD [ "/usr/bin/ssservice", "server", "--log-without-time", "-c", "/etc/shadowsocks-rust/config.json" ]