#!/bin/bash -x

set -e

SRC_FILE="./hello-storage/production.sqlite3"
DST_DIR="./sqlite3-backup/"

if [ ! -e $SRC_FILE ];then
  echo "${SRC_FILE} not exists."
  exit 1
fi

mkdir -p $DST_DIR

DST_FILE="${DST_DIR}backup"
sqlite3 $SRC_FILE "VACUUM INTO '${DST_FILE}'"

gzip $DST_FILE

# 1ヶ月分毎日ローリングバックアップする想定のファイル名
mv "${DST_FILE}.gz" "${DST_DIR}backup-$(date +%d).gz"
