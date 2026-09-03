#!/usr/bin/env bash
#
# Собирает все ассеты GitHub Release в один каталог. Единая точка входа для CI
# (.github/workflows/publish-release.yml) и для локального запуска — набор файлов одинаковый.
#
#   scripts/release/build_release.sh <tag> [--output <dir>] [--skip-cli] [--skip-demo]
#
#   <tag>        тег релиза (release-01-09-2026): попадает в имена dsbuilder-cli-<tag>.zip
#                и SDDSSources-<tag>.zip
#   --output     куда сложить ассеты (по умолчанию <repo>/release-artifacts, в .gitignore)
#   --skip-cli   не собирать dsbuilder (быстрая проверка xcframework'ов)
#   --skip-demo  не собирать демо-приложение под симулятор
#
# Шаги: SDDSThemeCore → InputMask/SDDSComponents/SDDSIcons → темы → CLI → архив исходников →
# zip xcframework'ов → проверка, что все ожидаемые файлы на месте. Git и GitHub скрипт не трогает.
#
# SDDSIcons собирается только как зависимость тем (их проекты линкуют build/SDDSIcons.xcframework)
# и в ассеты релиза не попадает: у иконок свой релизный процесс — .github/workflows/release_icons.yml.
set -euo pipefail

usage() {
  sed -n '2,14p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

TAG=""
OUTPUT=""
SKIP_CLI=0
SKIP_DEMO=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --output)   OUTPUT="${2:-}"; shift 2 ;;
    --skip-cli) SKIP_CLI=1; shift ;;
    --skip-demo) SKIP_DEMO=1; shift ;;
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

step "1/8 SDDSThemeCore.xcframework"
ruby scripts/build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore
test -d DesignSystemBuilder/build/SDDSThemeCore.xcframework || {
  echo "❌ DesignSystemBuilder/build/SDDSThemeCore.xcframework не собран" >&2; exit 1; }

step "2/8 InputMask, SDDSComponents, SDDSIcons (иконки — только как зависимость тем)"
ruby scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace

step "3/8 Темы (Themes/*/*.xcodeproj)"
ruby scripts/build_themes.rb

step "4/8 dsbuilder CLI"
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

step "5/8 Архив исходников SDDSSources-$TAG.zip"
scripts/package_sources.sh "$TAG" "$OUTPUT"

step "6/8 Zip xcframework'ов → $OUTPUT"
zip_xcframework() {
  local framework_path="$1"
  local name
  name="$(basename "$framework_path" .xcframework)"
  (cd "$(dirname "$framework_path")" && ditto -c -k --sequesterRsrc --keepParent "$name.xcframework" "$OUTPUT/$name.xcframework.zip")
  echo "  $name.xcframework.zip"
}
zip_xcframework DesignSystemBuilder/build/SDDSThemeCore.xcframework
for framework_path in build/*.xcframework; do
  # Иконки публикует release_icons.yml по тегу SDDSIcons-v*, в датный релиз их не кладём.
  [[ "$(basename "$framework_path")" == "SDDSIcons.xcframework" ]] && continue
  zip_xcframework "$framework_path"
done
# Темы build_themes.rb зипует сам (Themes/build/<Scheme>.xcframework.zip).
for theme_zip in Themes/build/*.xcframework.zip; do
  cp "$theme_zip" "$OUTPUT/"
  echo "  $(basename "$theme_zip")"
done

step "7/8 Демо-приложение под симулятор"
# Собирается в Debug: Release-линковка под симулятор падает на SwiftUICore (см. docs/BUILD.md).
# Приложение не подписывается — оно только для симулятора, на устройство не поставится.
if [[ "$SKIP_DEMO" -eq 1 ]]; then
  echo "пропущено (--skip-demo)"
else
  DEMO_DD="$REPO_ROOT/build/demo"
  rm -rf "$DEMO_DD"
  # scheme => имя ассета
  DEMO_SCHEMES=(
    "SDDSDemoApp:SDDSDemoApp-simulator"
    "SDDSDemoAppSDDSServ:SDDSDemoApp-sddsserv-simulator"
    "SDDSDemoAppPlasmaB2C:SDDSDemoApp-plasmab2c-simulator"
    "SDDSDemoAppPlasmaHomeDS:SDDSDemoApp-plasmahomeds-simulator"
  )
  for entry in "${DEMO_SCHEMES[@]}"; do
    scheme="${entry%%:*}"
    asset="${entry##*:}"
    echo "  $scheme"
    xcodebuild -workspace SDDS.xcworkspace -scheme "$scheme" -configuration Debug \
      -destination 'generic/platform=iOS Simulator' \
      -derivedDataPath "$DEMO_DD" CODE_SIGNING_ALLOWED=NO build > "$DEMO_DD.log" 2>&1 || {
        echo "❌ Не собралась схема $scheme, лог: $DEMO_DD.log" >&2; exit 1; }

    app_path="$(find "$DEMO_DD/Build/Products" -maxdepth 2 -name "$scheme.app" -print -quit)"
    [[ -n "$app_path" ]] || { echo "❌ Не найден $scheme.app" >&2; exit 1; }
    ditto -c -k --sequesterRsrc --keepParent "$app_path" "$OUTPUT/$asset.zip"
    echo "    $asset.zip"
  done
fi

step "8/8 Проверка состава"
MISSING=()
for name in SDDSThemeCore InputMask SDDSComponents; do
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
if [[ "$SKIP_DEMO" -eq 0 ]]; then
  for asset in SDDSDemoApp-simulator SDDSDemoApp-sddsserv-simulator \
               SDDSDemoApp-plasmab2c-simulator SDDSDemoApp-plasmahomeds-simulator; do
    [[ -f "$OUTPUT/$asset.zip" ]] || MISSING+=("$asset.zip")
  done
fi

if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo "❌ В $OUTPUT нет ожидаемых ассетов:" >&2
  printf '   %s\n' "${MISSING[@]}" >&2
  exit 1
fi

echo
echo "✅ Ассеты релиза $TAG:"
ls -la "$OUTPUT"
