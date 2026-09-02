#!/usr/bin/env bash
#
# Генерирует ios-api-meta.json — мету API стилей компонентов
# (агрегатор API стилей). Сканирует *Appearance-структуры SDDSComponents через
# SwiftSyntax-тул Tools/SDDSApiInfoGenerator и пишет результат в трекаемый файл.
#
# Использование:
#   scripts/generate_api_meta.sh              # полная перегенерация
#   scripts/generate_api_meta.sh --only FormItem,Counter   # подмножество (в stdout)
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TOOL_DIR="$REPO_ROOT/Tools/SDDSApiInfoGenerator"
SOURCES="$REPO_ROOT/SDDSComponents/Sources"
PROPS="$REPO_ROOT/DesignSystemBuilder/DesignSystemBuilderCore/Model/Props"
OUTPUT="$REPO_ROOT/DesignSystemBuilder/.sdds/ios-api-meta.json"

echo "==> Сборка сканера (release)…"
BUILD_LOG="$(mktemp)"
trap 'rm -f "$BUILD_LOG"' EXIT
if ! swift build --package-path "$TOOL_DIR" -c release >"$BUILD_LOG" 2>&1; then
    cat "$BUILD_LOG" >&2
    exit 1
fi
BIN="$TOOL_DIR/.build/release/SDDSApiInfoGenerator"

if [[ "${1:-}" == "--only" ]]; then
    # Подмножество → в stdout с диагностикой сверки в stderr (удобно для ревью).
    "$BIN" --sources "$SOURCES" --props "$PROPS" --only "${2:-}" --report
    exit 0
fi

echo "==> Скан $SOURCES (+ сверка с Props, + override'ы)"
mkdir -p "$(dirname "$OUTPUT")"
"$BIN" --sources "$SOURCES" --props "$PROPS" --output "$OUTPUT" --report
echo "==> Готово: $OUTPUT"
