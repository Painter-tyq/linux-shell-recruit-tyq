#!/usr/bin/env bash

# 第一个参数是目标目录
DEST="$1"

# 剩下所有参数，全部作为待复制文件，使用 "$@" 保留空格
shift

for file in "$@"; do
    cp "$file" "$DEST/"
done
