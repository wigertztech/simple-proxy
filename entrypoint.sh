#!/bin/bash

: "${PORT:=8080}"
: "${PROXY_HOSTNAME:=localhost}"
: "${PROXY_PORT:=8081}"

cat << EOF > /etc/nginx/nginx.conf
events {
    worker_connections 1024;
}
stream {
    server {
        listen $PORT;
        proxy_pass $PROXY_HOSTNAME:$PROXY_PORT;
    }
}
EOF
echo "-- nginx.conf --"
cat /etc/nginx/nginx.conf
echo "----------------"

rm /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'