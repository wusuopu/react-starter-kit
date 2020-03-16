#!/bin/sh
set -eo pipefail

if [[ "$SKIP_REACT_BUILD" = "true" ]]; then
  # 跳过build react
  echo 'skip react build'
  exit 0
fi

yarn run build

# 为此次build打tag
date +"%Y%m%d-%T" > build/version.txt

cp build/index.html build/index.html.tpl
