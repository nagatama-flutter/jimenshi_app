# 停止
docker compose down
# イメージをビルド
docker compose build
# 依存するDBやキャッシュの起動
docker compose up -d postgres redis
# イメージをビルドすると、前のビルドイメージのゴミが残るので消す
docker system prune -f
# マイグレーション実行（必要に応じて）
docker compose up migrations
# バックエンドサービスの起動
docker compose up -d app https-portal
# サーバーのログをtailする
docker compose logs -f app