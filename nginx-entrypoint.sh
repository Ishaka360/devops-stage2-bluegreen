#!/bin/sh
set -e

echo "Starting Nginx with active color: ${ACTIVE_COLOR}"

# Generate nginx configuration from template
envsubst '${ACTIVE_COLOR} ${BLUE_PORT} ${GREEN_PORT}' < /nginx.template > /etc/nginx/conf.d/default.conf

# Start nginx in the foreground
nginx -g 'daemon off;'
