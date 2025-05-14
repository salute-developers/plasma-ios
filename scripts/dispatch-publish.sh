#!/bin/bash
set -euo pipefail

MODULES_STRING="$1"
TAG="$2"
REPO="salute-developers/plasma-ios"

echo "📦 Dispatching publish events for modules:"
echo "$MODULES_STRING"

IFS=' ' read -ra MODULES <<< "$MODULES_STRING"

# Для publish-themes соберём список модулей
THEME_MODULES=()

for MODULE in "${MODULES[@]}"; do
  echo "➡️ Processing module: $MODULE"

  EVENT_TYPE=""
  PAYLOAD=""

  case "$MODULE" in
    "SDDSComponents")
      EVENT_TYPE="publish-components"
      PAYLOAD="{\"tag\": \"$TAG\"}"
      ;;
    "SDDSIcons")
      EVENT_TYPE="publish-icons"
      PAYLOAD="{\"tag\": \"$TAG\"}"
      ;;
    "SDDSDemoApp")
      EVENT_TYPE="publish-demo-app"
      PAYLOAD="{\"tag\": \"$TAG\"}"
      ;;
    Themes/*)
      THEME_MODULES+=("$MODULE")
      continue  # пропускаем прямую отправку — обработаем потом все вместе
      ;;
    *)
      echo "⚠️ Unknown module: $MODULE — skipping"
      continue
      ;;
  esac

  echo "🚀 Dispatching $EVENT_TYPE with payload: $PAYLOAD"

  curl -s -X POST "https://api.github.com/repos/$REPO/dispatches" \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GH_TOKEN}" \
    -d @- <<EOF
{
  "event_type": "$EVENT_TYPE",
  "client_payload": $PAYLOAD
}
EOF

done

# Отправим одно событие для всех theme-модулей
if [[ ${#THEME_MODULES[@]} -gt 0 ]]; then
  MODULE_LIST=$(printf "\"%s\", " "${THEME_MODULES[@]}" | sed 's/, $//')
  PAYLOAD="{\"modules\": [ $MODULE_LIST ], \"tag\": \"$TAG\"}"

  echo "🚀 Dispatching publish-themes for modules: ${THEME_MODULES[*]}"
  echo "📦 Payload: $PAYLOAD"

  curl -s -X POST "https://api.github.com/repos/$REPO/dispatches" \
    -H "Accept: application/vnd.github+json" \
    -H "Authorization: Bearer ${GH_TOKEN}" \
    -d @- <<EOF
{
  "event_type": "publish-themes",
  "client_payload": $PAYLOAD
}
EOF
fi 