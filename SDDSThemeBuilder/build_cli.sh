#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
build_cli.sh — собирает CLI-бинарник SDDSThemeBuilder.

Использование:
  ./build_cli.sh                 Release-сборка (по умолчанию)
  ./build_cli.sh --debug         Debug-сборка
  ./build_cli.sh --run           собрать и запустить (default-конфиг)
  ./build_cli.sh --run cfg.json  собрать и запустить с внешним JSON-конфигом

Результат: SDDSThemeBuilder/build/themebuilder/SDDSThemeBuilder
EOF
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT="$SCRIPT_DIR/SDDSThemeBuilder.xcodeproj"
SCHEME="SDDSThemeBuilder"
CONFIGURATION="Release"
DERIVED_DATA="$SCRIPT_DIR/build/themebuilder-dd"
OUTPUT_DIR="$SCRIPT_DIR/build/themebuilder"
OUTPUT_BIN="$OUTPUT_DIR/SDDSThemeBuilder"

DO_RUN=0
RUN_CONFIG=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --debug)   CONFIGURATION="Debug"; shift ;;
    --release) CONFIGURATION="Release"; shift ;;
    --run)     DO_RUN=1; shift
               if [[ $# -gt 0 && "$1" != --* ]]; then RUN_CONFIG="$1"; shift; fi ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Неизвестный аргумент: $1" >&2; exit 1 ;;
  esac
done

echo "▶ Сборка $SCHEME ($CONFIGURATION)…"
xcodebuild \
  -project "$PROJECT" \
  -scheme "$SCHEME" \
  -configuration "$CONFIGURATION" \
  -derivedDataPath "$DERIVED_DATA" \
  build

PRODUCTS="$DERIVED_DATA/Build/Products/$CONFIGURATION"
BUILT_BIN="$PRODUCTS/$SCHEME"
if [[ ! -x "$BUILT_BIN" ]]; then
  echo "✗ Бинарник не найден по пути $BUILT_BIN" >&2
  exit 1
fi

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"
cp -f "$BUILT_BIN" "$OUTPUT_BIN"
for fw in "$PRODUCTS"/*.framework; do
  [[ -d "$fw" ]] && cp -R "$fw" "$OUTPUT_DIR/"
done

echo ""
echo "✅ Готово: $OUTPUT_BIN"
file "$OUTPUT_BIN"

if [[ "$DO_RUN" -eq 1 ]]; then
  echo ""
  echo "▶ Запуск SDDSThemeBuilder ${RUN_CONFIG:+с конфигом $RUN_CONFIG}…"
  "$OUTPUT_BIN" ${RUN_CONFIG:+"$RUN_CONFIG"}
fi
