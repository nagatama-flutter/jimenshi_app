# Serverpod sample

## セットアップ

### `make setup` を実行する

以下が実行される。
  * FVMでのflutterインストール
  * root階層のパッケージの取得
  * 各パッケージのパッケージのインストール

## 実行手順
1. `make run/server` を実行する
    * docker composeでサーバーの実行に必要なサービスの立ち上げ
    * serverpodサーバーのエントリポイントの実行(マイグレーションの適応)
2. VS CodeのDebugタブから `Run debug` で実行する
    * Flutterアプリが立ち上がる
3. サーバー終了時は `make stop/server` を実行する

## 開発中に使用するコマンド

`make help` 参照



