#!/bin/bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
FUNCTIONS_DIR="${REPO_DIR}"
ZSHRC="${HOME}/.zshrc"

START_MARKER="# --- Zsh Custom Functions Setup START ---"
END_MARKER="# --- Zsh Custom Functions Setup END ---"

echo "Updating Zsh custom functions configuration..."

CONFIG_BLOCK="${START_MARKER}
fpath=(${FUNCTIONS_DIR} \$fpath)

# Load all functions in the directory automatically
if [ -d \"${FUNCTIONS_DIR}\" ]; then
    for func in \"${FUNCTIONS_DIR}\"/*(:t); do
        unfunction \"\$func\" 2>/dev/null
        autoload -Uz \"\$func\"
    done
fi
${END_MARKER}"


if [ -f "$ZSHRC" ]; then
    sed -i.bak "/${START_MARKER}/,/${END_MARKER}/d" "$ZSHRC"
fi

echo "$CONFIG_BLOCK" >> "$ZSHRC"

echo "Success! Configuration updated."
echo "Restarting shell to apply changes..."

exec $SHELL -l
