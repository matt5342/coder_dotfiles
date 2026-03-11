#!/bin/bash

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

bash "$DOTFILES_DIR/run_once_install-claude-code.sh"
bash "$DOTFILES_DIR/run_once_install-gitlens.sh"
