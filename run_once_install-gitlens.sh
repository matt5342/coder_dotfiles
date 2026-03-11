#!/bin/bash

if command -v code &>/dev/null; then
  code --extensions-dir "$HOME/.vscode-server/extensions" --install-extension eamodio.gitlens
fi
