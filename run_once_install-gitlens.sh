#!/bin/bash

EXTENSIONS_DIR="$HOME/.vscode-server/extensions"
mkdir -p "$EXTENSIONS_DIR"
code --extensions-dir "$EXTENSIONS_DIR" --install-extension eamodio.gitlens
