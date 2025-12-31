#!/bin/sh

# Generate file env-config.js isinya ENV dari Kubernetes
echo "window.env = {
  \"VUE_APP_BACKEND\": \"$VUE_APP_BACKEND\"
};" > /usr/share/nginx/html/env-config.js

# Jalanin Nginx
exec "$@"