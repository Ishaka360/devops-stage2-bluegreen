#!/bin/sh
set -e

if [ -z "$ACTIVE_COLOR" ]; then
  echo "ACTIVE_COLOR not set, defaulting to blue"
  ACTIVE_COLOR=blue
fi

echo "Starting Nginx with active color: $ACTIVE_COLOR"

# Generate the new config into a temp file
envsubst '$ACTIVE_COLOR' < /etc/nginx/conf.d/default.conf > /tmp/default.conf

# Start Nginx using the temporary config instead of overwriting the original
nginx -c /tmp/default.conf -g "daemon off;"
