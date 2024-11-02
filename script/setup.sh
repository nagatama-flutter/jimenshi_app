#!/bin/bash

# fvm コマンドが存在するかチェック
if ! command -v fvm &> /dev/null
then
    echo "fvm command could not be found"
    exit 1
fi

# fvm install を実行
fvm install

fvm dart pub get

fvm dart run melos bootstrap
