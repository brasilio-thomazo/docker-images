#!/bin/sh
set -e
template_dir="/etc/nginx/templates"
config_dir="/etc/nginx/http.d"

for  template in $(find $template_dir -type f -name "*.conf"); do
  if [ -f "$template" ]; then
    config_file=$(basename $template)
    envsubst "$(printf '${%s}' $(env | cut -d= -f1))" < $template > $config_dir/$config_file
  fi
done

exec "$@"