#!/usr/bin/env bash

set -eu

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

function install() {
    bash $DOTFILES_DIR/tools/install_cmds.sh
    bash $DOTFILES_DIR/symlink.sh
    brew bundle --file="$DOTFILES_DIR/.Brewfile"
}

install
