#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

TAG_INPUT="${TAG_INPUT:-${1:-}}"
MODULES_INPUT="${MODULES_INPUT:-${2:-}}"
VERSIONS_INPUT="${VERSIONS_INPUT:-${3:-}}"

get_latest_version() {
  local versions_file="$1"
  jq -r 'keys[]' "$versions_file" | sort -V | tail -1
}

get_module_version() {
  local module="$1"
  local versions_file="$2"
  local from_input=""

  if [[ -n "${VERSIONS_INPUT:-}" ]] && echo "$VERSIONS_INPUT" | jq -e . >/dev/null 2>&1; then
    from_input=$(echo "$VERSIONS_INPUT" | jq -r --arg module "$module" '.[$module] // empty')
  fi

  if [[ -n "$from_input" ]]; then
    echo "$from_input"
  else
    get_latest_version "$versions_file"
  fi
}

get_modules_json() {
  if [[ -n "${MODULES_INPUT:-}" ]] && echo "$MODULES_INPUT" | jq -e . >/dev/null 2>&1; then
    echo "$MODULES_INPUT"
    return
  fi

  if [[ -n "${VERSIONS_INPUT:-}" ]] && echo "$VERSIONS_INPUT" | jq -e . >/dev/null 2>&1; then
    echo "$VERSIONS_INPUT" | jq -c 'keys'
    return
  fi

  echo '["sddsserv-theme","plasma-b2c-theme","plasma-home-ds-theme","styles-salute-theme"]'
}

is_module_selected() {
  local module="$1"
  echo "$SELECTED_MODULES_JSON" | jq -e --arg module "$module" 'index($module) != null' >/dev/null 2>&1
}

TAG="${TAG_INPUT:-}"
if [[ -z "$TAG" ]]; then
  TAG="$(git -C "$REPO_ROOT" tag --sort=-creatordate | awk '/^release-[0-9]{2}-[0-9]{2}-[0-9]{4}$/' | head -n 1)"
fi

SELECTED_MODULES_JSON="$(get_modules_json)"
ANNOUNCEMENT_LINES=()

if is_module_selected "sddsserv-theme"; then
  SDDSSERV_VERSION="$(get_module_version "sddsserv-theme" "$REPO_ROOT/Themes/SDDSservTheme/override-docs/versionsArchived.json")"
  ANNOUNCEMENT_LINES+=("Changelog SDDS Serv Theme: https://plasma.sberdevices.ru/ios/sddsserv-theme/${SDDSSERV_VERSION}/CHANGELOG/")
fi

if is_module_selected "plasma-b2c-theme"; then
  B2C_VERSION="$(get_module_version "plasma-b2c-theme" "$REPO_ROOT/Themes/PlasmaB2CTheme/override-docs/versionsArchived.json")"
  ANNOUNCEMENT_LINES+=("Changelog Plasma B2C Theme: https://plasma.sberdevices.ru/ios/plasma-b2c-theme/${B2C_VERSION}/CHANGELOG/")
fi

if is_module_selected "plasma-home-ds-theme"; then
  HOME_VERSION="$(get_module_version "plasma-home-ds-theme" "$REPO_ROOT/Themes/PlasmaHomeDSTheme/override-docs/versionsArchived.json")"
  ANNOUNCEMENT_LINES+=("Changelog Plasma HomeDS Theme: https://plasma.sberdevices.ru/ios/plasma-home-ds-theme/${HOME_VERSION}/CHANGELOG/")
fi

if is_module_selected "styles-salute-theme"; then
  SALUTE_VERSION="$(get_module_version "styles-salute-theme" "$REPO_ROOT/Themes/StylesSaluteTheme/override-docs/versionsArchived.json")"
  ANNOUNCEMENT_LINES+=("Changelog Styles Salute Theme: https://plasma.sberdevices.ru/ios/styles-salute-theme/${SALUTE_VERSION}/CHANGELOG/")
fi

RELEASE_DATE="$(echo "$TAG" | sed -E 's/^release-([0-9]{2})-([0-9]{2})-([0-9]{4})$/\1.\2.\3/')"
CHANGELOG_BLOCK="$(printf "%s\n" "${ANNOUNCEMENT_LINES[@]}")"

cat <<EOF
# Опубликован релиз iOS от ${RELEASE_DATE}

${CHANGELOG_BLOCK}
Релиз : https://github.com/salute-developers/plasma-ios/releases/tag/${TAG}
EOF
