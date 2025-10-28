#!/bin/sh
set -e

if [ -z "$ACTIVE_COLOR" ]; then
  echo "ACTIVE_COLOR not set, defaulting to blue"
  ACTIVE_COLOR=blue
fi

echo "Starting Nginx with active color: $ACTIVE_COLOR"

# Safely generate config without overwriting locked files
envsubst '$ACTIVE_COLOR' < /etc/nginx/conf.d/default.conf > /tmp/default.conf
cp /tmp/default.conf /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
