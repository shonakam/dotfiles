#!/usr/bin/env bash

set -eu

COMMON_COMMANDS=(
    tree
    htop
    jq
    git
    git-lfs
    fzf
    tmux
    ripgrep
    fd
    asdf
    yarn
    docker
    awscli
    ag
    jump
    bat
    gpg
    hstr
)

MACOS_COMMANDS=(
    mas
)

# 💻 macOS用のインストール処理
function install_for_mac() {
    echo "--- macOSのセットアップを開始します ---"

    if ! command -v brew &> /dev/null; then
        echo "❌ Homebrewがインストールされていません。先にインストールしてください。" >&2
        exit 1
    fi

    local all_commands=("${COMMON_COMMANDS[@]}" "${MACOS_COMMANDS[@]}")

    for cmd in "${all_commands[@]}"; do
        if command -v "$cmd" &> /dev/null; then
            echo "✅ $cmd は既にインストールされています。"
        else
            echo "🚀 $cmd をインストールしています..."
            brew install "$cmd"
        fi
    done
}

# 🐧 Linux用のインストール処理
function install_for_linux() {
    echo "--- Linuxのセットアップを開始します ---"
    local install_cmd=""

    # パッケージマネージャーを特定
    if command -v apt-get &> /dev/null; then
        install_cmd="sudo apt-get install -y"
        echo "aptリポジトリを更新しています..."
        sudo apt-get update
    elif command -v dnf &> /dev/null; then
        install_cmd="sudo dnf install -y"
    else
        echo "❌ サポートされているパッケージマネージャー(apt, dnf)が見つかりません。" >&2
        exit 1
    fi

    for cmd in "${COMMON_COMMANDS[@]}"; do
        if command -v "$cmd" &> /dev/null; then
            echo "✅ $cmd は既にインストールされています。"
        else
            echo "🚀 $cmd をインストールしています..."
            ${install_cmd} ${cmd}
        fi
    done
}

function main() {
    local os_name=$(uname)

    if [[ "$os_name" == "Darwin" ]]; then
        install_for_mac
    elif [[ "$os_name" == "Linux" ]]; then
        install_for_linux
    else
        echo "❌ サポートされていないOSです: $os_name" >&2
        exit 1
    fi

    echo "🎉 全てのコマンドのセットアップが完了しました。"
}

main
