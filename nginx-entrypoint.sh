#!/bin/sh
set -e

echo "Starting Nginx with active color: ${ACTIVE_COLOR}"

# Generate new config in a temporary location
envsubst '${ACTIVE_COLOR}' < /nginx.template > /etc/nginx/conf.d/default.conf.tmp

# Wait briefly to ensure nginx is ready
sleep 1

# Replace old config safely
cp /etc/nginx/conf.d/default.conf.tmp /etc/nginx/conf.d/default.conf

# Run Nginx in foreground
nginx -g 'daemon off;'
