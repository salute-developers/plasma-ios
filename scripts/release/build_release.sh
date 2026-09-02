#!/usr/bin/env bash
#
# Собирает все ассеты GitHub Release в один каталог. Единая точка входа для CI
# (.github/workflows/publish-release.yml) и для локального запуска — набор файлов одинаковый.
#
#   scripts/release/build_release.sh <tag> [--output <dir>] [--skip-cli]
#
#   <tag>        тег релиза (release-01-09-2026): попадает в имена dsbuilder-cli-<tag>.zip
#                и SDDSSources-<tag>.zip
#   --output     куда сложить ассеты (по умолчанию <repo>/release-artifacts, в .gitignore)
#   --skip-cli   не собирать dsbuilder (быстрая проверка xcframework'ов)
#
# Шаги: SDDSThemeCore → InputMask/SDDSComponents/SDDSIcons → темы → CLI → архив исходников →
# zip xcframework'ов → проверка, что все ожидаемые файлы на месте. Git и GitHub скрипт не трогает.
set -euo pipefail

usage() {
  sed -n '2,14p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

TAG=""
OUTPUT=""
SKIP_CLI=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --output)   OUTPUT="${2:-}"; shift 2 ;;
    --skip-cli) SKIP_CLI=1; shift ;;
    -h|--help)  usage; exit 0 ;;
    -*)         echo "Неизвестный аргумент: $1" >&2; usage >&2; exit 1 ;;
    *)          if [[ -z "$TAG" ]]; then TAG="$1"; shift; else echo "Лишний аргумент: $1" >&2; exit 1; fi ;;
  esac
done

if [[ -z "$TAG" ]]; then
  usage >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$REPO_ROOT"

OUTPUT="${OUTPUT:-$REPO_ROOT/release-artifacts}"
mkdir -p "$OUTPUT"
OUTPUT="$(cd "$OUTPUT" && pwd)"
rm -rf "${OUTPUT:?}"/*

step() {
  echo
  echo "==> $*"
}

step "1/7 SDDSThemeCore.xcframework"
ruby scripts/build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore
test -d DesignSystemBuilder/build/SDDSThemeCore.xcframework || {
  echo "❌ DesignSystemBuilder/build/SDDSThemeCore.xcframework не собран" >&2; exit 1; }

step "2/7 InputMask, SDDSComponents, SDDSIcons"
ruby scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace

step "3/7 Темы (Themes/*/*.xcodeproj)"
ruby scripts/build_themes.rb

step "4/7 dsbuilder CLI"
if [[ "$SKIP_CLI" -eq 1 ]]; then
  echo "пропущено (--skip-cli)"
else
  (cd DesignSystemBuilder && ./build_cli.sh)
  test -x DesignSystemBuilder/build/dsbuilder/dsbuilder || { echo "❌ бинарник dsbuilder не собран" >&2; exit 1; }
  test -f DesignSystemBuilder/.sdds/ios-api-meta.json || { echo "❌ ios-api-meta.json не сгенерирован" >&2; exit 1; }
  CLI_STAGE="DesignSystemBuilder/build/dsbuilder-cli"
  rm -rf "$CLI_STAGE" && mkdir -p "$CLI_STAGE"
  cp DesignSystemBuilder/build/dsbuilder/dsbuilder "$CLI_STAGE/"
  cp DesignSystemBuilder/.sdds/ios-api-meta.json "$CLI_STAGE/"
  # --keepParent: в архиве остаётся папка dsbuilder-cli (так документировано в README).
  (cd DesignSystemBuilder/build && ditto -c -k --sequesterRsrc --keepParent dsbuilder-cli "$OUTPUT/dsbuilder-cli-$TAG.zip")
fi

step "5/7 Архив исходников SDDSSources-$TAG.zip"
scripts/package_sources.sh "$TAG" "$OUTPUT"

step "6/7 Zip xcframework'ов → $OUTPUT"
zip_xcframework() {
  local framework_path="$1"
  local name
  name="$(basename "$framework_path" .xcframework)"
  (cd "$(dirname "$framework_path")" && ditto -c -k --sequesterRsrc --keepParent "$name.xcframework" "$OUTPUT/$name.xcframework.zip")
  echo "  $name.xcframework.zip"
}
zip_xcframework DesignSystemBuilder/build/SDDSThemeCore.xcframework
for framework_path in build/*.xcframework; do
  zip_xcframework "$framework_path"
done
# Темы build_themes.rb зипует сам (Themes/build/<Scheme>.xcframework.zip).
for theme_zip in Themes/build/*.xcframework.zip; do
  cp "$theme_zip" "$OUTPUT/"
  echo "  $(basename "$theme_zip")"
done

step "7/7 Проверка состава"
MISSING=()
for name in SDDSThemeCore InputMask SDDSComponents SDDSIcons; do
  [[ -f "$OUTPUT/$name.xcframework.zip" ]] || MISSING+=("$name.xcframework.zip")
done
# Имя zip темы = имя схемы, регистр может отличаться от папки (SDDSservTheme → SDDSServTheme).
for theme_project in Themes/*/*.xcodeproj; do
  theme_name="$(basename "$theme_project" .xcodeproj)"
  if [[ -z "$(find "$OUTPUT" -maxdepth 1 -iname "$theme_name.xcframework.zip")" ]]; then
    MISSING+=("$theme_name.xcframework.zip")
  fi
done
[[ "$SKIP_CLI" -eq 1 || -f "$OUTPUT/dsbuilder-cli-$TAG.zip" ]] || MISSING+=("dsbuilder-cli-$TAG.zip")
[[ -f "$OUTPUT/SDDSSources-$TAG.zip" ]] || MISSING+=("SDDSSources-$TAG.zip")

if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo "❌ В $OUTPUT нет ожидаемых ассетов:" >&2
  printf '   %s\n' "${MISSING[@]}" >&2
  exit 1
fi

echo
echo "✅ Ассеты релиза $TAG:"
ls -la "$OUTPUT"
