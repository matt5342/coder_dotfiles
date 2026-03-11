#!/bin/bash

curl -fsSL https://claude.ai/install.sh | bash

if command -v code &>/dev/null; then
  code --extensions-dir "$HOME/.vscode-server/extensions" --install-extension anthropic.claude-code || true
fi
