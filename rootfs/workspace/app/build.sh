#!/bin/sh
set -eo pipefail

if [[ "$SKIP_REACT_BUILD" = "true" ]]; then
  # 跳过build react
  echo 'skip react build'
  exit 0
fi

if [[ "$APP_HOMEPAGE" != "" ]]; then
  if [[ `uname` = 'Darwin' ]]; then
    # Mac 系统
    sed -i'' -e 's@"homepage": "."@"homepage": "'$APP_HOMEPAGE'"@' package.json package.json
  else
    sed -i 's@"homepage": "."@"homepage": "'$APP_HOMEPAGE'"@' package.json package.json
  fi
fi

# 不生成 sourMap 文件
export GENERATE_SOURCEMAP=false
yarn run build

# 为此次build打tag
date +"%Y%m%d-%T" > build/version.txt
cp -v build/index.html build/index.html.tpl

mainjsfile=`ls build/static/js/main.*.js`
cp -v $mainjsfile build/static/js/main.js.tpl
