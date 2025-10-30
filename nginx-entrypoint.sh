#!/bin/sh
set -e

echo "Starting Nginx with active color: ${ACTIVE_COLOR}"

# Replace the active color placeholder in the template
envsubst '${ACTIVE_COLOR}' < /nginx.template > /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
