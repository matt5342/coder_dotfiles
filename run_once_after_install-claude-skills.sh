#!/bin/bash

SKILLS_FILE="$HOME/.config/claude/skills"

if [ ! -f "$SKILLS_FILE" ]; then
  echo "No Claude skills file found at $SKILLS_FILE, skipping."
  exit 0
fi

if ! command -v npx &>/dev/null; then
  echo "npx not found, skipping Claude skills installation."
  exit 0
fi

while IFS= read -r skill || [ -n "$skill" ]; do
  # Skip blank lines and comments
  [[ -z "$skill" || "$skill" == \#* ]] && continue
  echo "Installing Claude skill: $skill"
  npx skills add "$skill" || echo "Warning: failed to install skill $skill"
done < "$SKILLS_FILE"
