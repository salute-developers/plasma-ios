#!/bin/bash
set -euo pipefail

FROM_TAG=$1

echo "🔍 Detecting changed modules since $FROM_TAG"

declare -a MODULES_SET=()
CHANGED_THEMES=false

while IFS= read -r FILE; do
  echo "➡️ Checking file: $FILE"

  # SDDSComponents
  if [[ "$FILE" == SDDSComponents/* ]]; then
    MODULE="SDDSComponents"
    MODULES_SET+=("$MODULE")
    echo "✅ Matched: $MODULE"
  fi

  # SDDSIcons
  if [[ "$FILE" == SDDSIcons/* ]]; then
    MODULE="SDDSIcons"
    MODULES_SET+=("$MODULE")
    echo "✅ Matched: $MODULE"
  fi

  # Themes
  if [[ "$FILE" == Themes/* ]]; then
    CHANGED_THEMES=true
  fi

  # SDDSDemoApp
  if [[ "$FILE" == SDDSDemoApp/* ]]; then
    MODULE="SDDSDemoApp"
    MODULES_SET+=("$MODULE")
    echo "✅ Matched: $MODULE"
  fi
done < <(git diff --name-only "$FROM_TAG" HEAD)

if [[ "$CHANGED_THEMES" == true ]]; then
  echo "📦 Detected changes in Themes/, enumerating submodules from git diff..."

  THEME_MODULES=$(git diff --name-only "$FROM_TAG" HEAD | \
    grep '^Themes/' | cut -d '/' -f2 | sort -u)

  for NAME in $THEME_MODULES; do
    if [[ -n "$NAME" ]]; then
      MODULE="Themes/$NAME"
      MODULES_SET+=("$MODULE")
      echo "✅ Added theme module: $MODULE"
    fi
  done
fi

UNIQUE_MODULES=$(printf "%s\n" "${MODULES_SET[@]}" | sort -u | xargs)
echo "✅ Final module list: $UNIQUE_MODULES"

# Output for GitHub Actions
echo "modules=$UNIQUE_MODULES" >> "$GITHUB_OUTPUT" 