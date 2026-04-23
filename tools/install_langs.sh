#!/usr/bin/env bash

TARGET_DIR="${1:-./tools/langs}"

if [ ! -d "$TARGET_DIR" ]; then
  echo "エラー: ディレクトリ '$TARGET_DIR' が見つかりません。" >&2
  exit 1
fi

echo "ディレクトリ '$TARGET_DIR' 内のシェルスクリプトを実行します..."
echo

find "$TARGET_DIR" -type f -name "*.sh" -print0 | while IFS= read -r -d '' file; do
  echo "--- 実行中: $file ---"
  bash "$file"
  echo "--- 完了: $file ---"
  echo
done

echo "全てのスクリプトの実行が完了しました。"