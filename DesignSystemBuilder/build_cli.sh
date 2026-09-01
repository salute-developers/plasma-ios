#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
build_cli.sh — собирает CLI-бинарник dsbuilder (Design System Builder).

Использование:
  ./build_cli.sh                 Release-сборка (по умолчанию)
  ./build_cli.sh --debug         Debug-сборка
  ./build_cli.sh --run           собрать и запустить (генерация тем, default-конфиг)
  ./build_cli.sh --run cfg.json  собрать и запустить с внешним JSON-конфигом
  ./build_cli.sh --run --typed-generator
                                 собрать и запустить старым (типизированным) генератором;
                                 любые аргументы после --run уходят в CLI
  ./build_cli.sh --run docs extract --repo-root ..
                                 подкоманды документационного бандла

Результат: DesignSystemBuilder/build/dsbuilder/dsbuilder
EOF
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGURATION="release"
OUTPUT_DIR="$SCRIPT_DIR/build/dsbuilder"
OUTPUT_BIN="$OUTPUT_DIR/dsbuilder"

DO_RUN=0
RUN_ARGS=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --debug)   CONFIGURATION="debug"; shift ;;
    --release) CONFIGURATION="release"; shift ;;
    --run)     DO_RUN=1; shift ;;
    -h|--help) usage; exit 0 ;;
    --) shift; RUN_ARGS+=("$@"); break ;;
    *) if [[ $DO_RUN -eq 1 ]]; then RUN_ARGS+=("$1"); shift
       else echo "Неизвестный аргумент: $1" >&2; exit 1; fi ;;
  esac
done

if ! META_OUTPUT=$("$SCRIPT_DIR/../scripts/generate_api_meta.sh" 2>&1); then
    echo "$META_OUTPUT" >&2
    echo "Не удалось сгенерировать ios-api-meta.json" >&2
    exit 1
fi

echo "▶ Сборка dsbuilder ($CONFIGURATION)…"
swift build --package-path "$SCRIPT_DIR" -c "$CONFIGURATION" --product dsbuilder

BUILT_BIN="$(swift build --package-path "$SCRIPT_DIR" -c "$CONFIGURATION" --product dsbuilder --show-bin-path)/dsbuilder"
if [[ ! -x "$BUILT_BIN" ]]; then
  echo "✗ Бинарник не найден по пути $BUILT_BIN" >&2
  exit 1
fi

rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"
cp -f "$BUILT_BIN" "$OUTPUT_BIN"

echo ""
echo "✅ Готово: $OUTPUT_BIN"
file "$OUTPUT_BIN"

if [[ "$DO_RUN" -eq 1 ]]; then
  echo ""
  echo "▶ Запуск dsbuilder…"
  "$OUTPUT_BIN" ${RUN_ARGS[@]+"${RUN_ARGS[@]}"}
fi
