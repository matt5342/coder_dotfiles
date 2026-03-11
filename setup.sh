#!/bin/bash

export PATH="${HOME}/.local/bin:$PATH"
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v chezmoi &> /dev/null; then
  cd "$HOME"
  sh -c "$(curl -fsLS get.chezmoi.io/lb)"
fi

chezmoi init --source="$DOTFILES_DIR" --apply
