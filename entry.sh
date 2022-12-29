export VARS='$PORT:$PASSWORD:$PATH:$HOST'
envsubst $VARS < /etc/shadowsocks-rust/config.json.var > /etc/shadowsocks-rust/config.json
exec /usr/bin/ssservice  server --log-without-time -c /etc/shadowsocks-rust/config.json