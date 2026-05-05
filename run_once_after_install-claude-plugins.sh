#!/bin/bash

PLUGINS_FILE="$HOME/.config/claude/plugins"

if [ ! -f "$PLUGINS_FILE" ]; then
  echo "No Claude plugins file found at $PLUGINS_FILE, skipping."
  exit 0
fi

if ! command -v claude &>/dev/null; then
  echo "claude CLI not found, skipping plugin installation."
  exit 0
fi

while IFS= read -r line || [ -n "$line" ]; do
  [[ -z "$line" || "$line" == \#* ]] && continue
  repo=$(echo "$line" | awk '{print $1}')
  plugin=$(echo "$line" | awk '{print $2}')
  echo "Adding marketplace: $repo"
  claude plugin marketplace add "$repo" || echo "Warning: failed to add marketplace $repo"
  echo "Installing plugin: $plugin"
  claude plugin install "$plugin" || echo "Warning: failed to install plugin $plugin"
done < "$PLUGINS_FILE"
