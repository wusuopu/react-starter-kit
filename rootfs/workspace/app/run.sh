#!/bin/sh

mainjsfile=`ls build/static/js/main.*.js`
cp -v build/static/js/main.js.tpl $mainjsfile

if [[ -z $REACT_APP_CONFIG ]]; then
  export REACT_APP_CONFIG='{}'
fi
if [[ `uname` = 'Darwin' ]]; then
  # Mac 系统
  sed -i'' -e 's@"__REACT-APP-CONFIG__"@'"$REACT_APP_CONFIG"'@' $mainjsfile
else
  sed -i 's@"__REACT-APP-CONFIG__"@'"$REACT_APP_CONFIG"'@' $mainjsfile $mainjsfile
fi

mkdir -p /var/tmp/nginx
nginx -g 'daemon off;'
