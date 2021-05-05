#!/bin/bash

# シェルの動作設定
#   -e: コマンドがエラーになった時点でエラー終了
#   -u: 未定義変数を参照した場合にエラー終了
#   -x: 実行されるコマンドの引数を展開した上で表示

set -eux

cd /var/www

if [ -e '.env' ]; then
  source .env
fi

ncu \
&& ncu -u \
&& npm update \
&& npm install \
&& npx tsc

/wait-for-it.sh "$DATABASE_HOST":"$DATABASE_PORT" --timeout=30 --strict -- npm run typeorm migration:run

npm run typeorm:seed:run

npx tsc -w & pm2-runtime start ecosystem.config.js
