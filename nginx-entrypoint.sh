#!/bin/sh
set -e

if [ -z "$ACTIVE_COLOR" ]; then
  echo "ACTIVE_COLOR not set, defaulting to blue"
  ACTIVE_COLOR=blue
fi

echo "Starting Nginx with active color: $ACTIVE_COLOR"

envsubst '$ACTIVE_COLOR' < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf.tmp
mv /etc/nginx/conf.d/default.conf.tmp /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
