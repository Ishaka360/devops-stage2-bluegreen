#!/bin/sh
set -e

echo "Starting Nginx with active color: ${ACTIVE_COLOR}"

# Replace placeholder in the template with the actual active color
envsubst '${ACTIVE_COLOR}' < /etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf.tmp
mv /etc/nginx/conf.d/default.conf.tmp /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground
nginx -g 'daemon off;'
