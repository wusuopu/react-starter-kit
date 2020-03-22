#!/bin/sh

current_dir=`realpath $(dirname .)`
cd $current_dir

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

cp -v build/index.html.tpl build/index.html
if [[ `uname` = 'Darwin' ]]; then
  # Mac 系统
  sed -i'' -e 's@<noscript>EXTRA_HEAD_PLACEHOLDER</noscript>@'"$EXTRA_HEAD_PLACEHOLDER"'@' build/index.html
else
  sed -i 's@<noscript>EXTRA_HEAD_PLACEHOLDER</noscript>@'"$EXTRA_HEAD_PLACEHOLDER"'@' build/index.html build/index.html
fi


cd ../../etc/nginx/conf.d
cp default.conf.tpl default.conf
router_type=`echo $REACT_APP_CONFIG | awk '/"REACT_ROUTER_TYPE"\s*:\s*"browser"/'`
if [[ "$router_type" != "" ]]; then
  if [[ `uname` = 'Darwin' ]]; then
    # Mac 系统
    sed -i'' -e 's@# try_files $uri /index.html;@try_files $uri /index.html;@' default.conf
  else
    sed -i 's@# try_files $uri /index.html;@try_files $uri /index.html;@' default.conf default.conf
  fi
fi


if [[ "$SKIP_START_NGINX" = "true" ]]; then
  # 不启动nginx
  echo 'skip start nginx'
  exit 0
fi
mkdir -p /var/tmp/nginx
nginx -g 'daemon off;'
