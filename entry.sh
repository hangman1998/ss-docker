export VARS='$PORT:$PASSWORD:$PATH:$HOST'
envsubst $VARS < /etc/shadowsocks-rust/config.json.var > /etc/shadowsocks-rust/config.json
exec /usr/bin/ssserver --log-without-time -c /etc/shadowsocks-rust/config.json
# exec /usr/bin/v2ray -config /etc/v2ray/config.json