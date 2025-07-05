#!/usr/bin/env bash

set -eu

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

files_to_link=(
    ".gitconfig"
    ".zshrc"
    ".tmux.conf"
)

echo "--- シンボリックリンクの作成を開始します ---"

for file_path in "${files_to_link[@]}"; do
    source_path="$DOTFILES_DIR/$file_path"
    destination_path="$HOME_DIR/$(basename "$file_path")"

    if [ ! -f "$source_path" ]; then
        echo "⚠️  ソースファイルが見つかりません。スキップします: $source_path"
        continue
    fi

    if [ -L "$destination_path" ]; then
        if [ "$(readlink "$destination_path")" = "$source_path" ]; then
            echo "✅  正しいシンボリックリンクが既に存在します: $destination_path"
            continue
        fi
        rm "$destination_path"
    elif [ -f "$destination_path" ]; then
        echo "↪️  既存のファイルをバックアップします: ${destination_path}.bak"
        mv "$destination_path" "${destination_path}.bak"
    fi
    echo "🔗  シンボリックリンクを作成します: $destination_path"
    ln -s "$source_path" "$destination_path"
done

echo ""
echo "🎉  シンボリックリンクの作成が完了しました。"
