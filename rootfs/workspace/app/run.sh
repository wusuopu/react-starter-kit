#!/bin/sh

cp build/index.html.tpl build/index.html

if [[ -z $REACT_APP_CONFIG ]]; then
  export REACT_APP_CONFIG='""'
fi
sed -i 's@"__REACT-APP-CONFIG__"@'"$REACT_APP_CONFIG"'@' build/index.html build/index.html

mkdir -p /var/tmp/nginx
nginx -g 'daemon off;'
