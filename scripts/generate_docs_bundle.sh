#!/bin/bash
# Сборка дерева документационного бандла iOS для dsbuilder docs generate --platform swiftui.
# Конвейер (паритет с Android documentationExtract/documentationAggregate):
#   1. ios-api-meta.json           (generate_api_meta.sh — если ещё нет)
#   2. info-артефакты theme-builder (config-info-ios.json + config-info-tokens-ios.json —
#      генерятся вместе с темой; скрипт проверяет их наличие)
#   3. extract   — samples.json + сниппеты из // @DocSample
#   4. aggregate — .sdds/temp/docs/{content,structure-*,meta,assets}
#
# Скриншоты сэмплов хранятся в репозитории (Themes/<Тема>Theme/docs/screenshots)
# и подхватываются отсюда — как на Android, где png лежат в docs-модуле темы.
# Переснять их: см. DocSampleScreenshotTests.
#
# Использование:
#   scripts/generate_docs_bundle.sh --theme PlasmaHomeDS [--artifact-version 0.12.0]
#
# Дальше (вне этого репо): dsbuilder docs generate --platform swiftui \
#   --docs-dir DesignSystemBuilder/.sdds/temp/docs

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

THEME=""
ARTIFACT_VERSION="0.0.0"
EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --theme) THEME="$2"; shift 2 ;;
    --artifact-version) ARTIFACT_VERSION="$2"; shift 2 ;;
    *) EXTRA_ARGS+=("$1"); shift ;;
  esac
done

if [[ -z "$THEME" ]]; then
  echo "usage: $0 --theme <Name> [--artifact-version <v>] [прочие флаги aggregate]" >&2
  exit 2
fi

API_META="DesignSystemBuilder/.sdds/ios-api-meta.json"
if [[ ! -f "$API_META" ]]; then
  echo "▸ ios-api-meta.json отсутствует — генерирую"
  "$SCRIPT_DIR/generate_api_meta.sh"
fi

THEME_SDDS="Themes/${THEME}Theme/.sdds"
for f in config-info-ios.json config-info-tokens-ios.json; do
  if [[ ! -f "$THEME_SDDS/$f" ]]; then
    echo "✗ $THEME_SDDS/$f не найден — сгенерируйте тему: cd DesignSystemBuilder && ./build_cli.sh --run" >&2
    exit 1
  fi
done

echo "▸ Сборка dsbuilder"
swift build --package-path DesignSystemBuilder -c release --product dsbuilder
BIN="$(swift build --package-path DesignSystemBuilder -c release --product dsbuilder --show-bin-path)/dsbuilder"

THEME_SAMPLES="Themes/${THEME}Theme/docs/Samples"
EXTRACT_ARGS=(docs extract --repo-root "$REPO_ROOT" --report
  --emit-registry SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Generated/DocSamplesRegistry.swift)
if [[ -d "$THEME_SAMPLES" ]]; then
  EXTRACT_ARGS+=(--theme-samples "$THEME_SAMPLES" --theme-module "${THEME}Theme")
fi
echo "▸ Извлечение сэмплов"
"$BIN" "${EXTRACT_ARGS[@]}"

USER_DOCS="Themes/${THEME}Theme/docs/override-docs"
SCREENSHOTS="Themes/${THEME}Theme/docs/screenshots"
AGGREGATE_ARGS=(docs aggregate --repo-root "$REPO_ROOT" --theme "$THEME" --artifact-version "$ARTIFACT_VERSION" --report)
if [[ -d "$USER_DOCS" ]]; then
  AGGREGATE_ARGS+=(--user-docs "$USER_DOCS")
fi
if [[ -d "$SCREENSHOTS" ]]; then
  AGGREGATE_ARGS+=(--screenshots "$SCREENSHOTS")
else
  echo "⚠️  $SCREENSHOTS не найден — бандл соберётся без скриншотов"
fi
echo "▸ Агрегация бандла"
"$BIN" "${AGGREGATE_ARGS[@]}" ${EXTRA_ARGS[@]+"${EXTRA_ARGS[@]}"}

echo "✅ Готово: DesignSystemBuilder/.sdds/temp/docs"
