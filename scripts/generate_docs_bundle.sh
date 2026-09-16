#!/bin/bash
# Сборка дерева документационного бандла iOS для dsbuilder docs generate --platform swiftui.
#
# Обёртка над `dsbuilder-ios docs aggregate --sdds`: одна команда CLI извлекает сэмплы
# (`// @DocSample`), рендерит маркеры и раскладывает дерево. Скрипт добавляет к ней только
# проверку предусловий и генерацию ios-api-meta.json.
#
# Скриншоты сэмплов хранятся в репозитории (Themes/<Тема>Theme/docs/screenshots)
# и подхватываются CLI автоматически. Переснять их: см. DocSampleScreenshotTests.
#
# Использование:
#   scripts/generate_docs_bundle.sh --theme PlasmaHomeDS [--artifact-version 0.12.0]
#
# Результат: Themes/<Тема>Theme/.sdds/temp/docs
#
# Дальше (вне этого репо): dsbuilder docs generate --platform swiftui \
#   --docs-dir Themes/<Тема>Theme/.sdds/temp/docs

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$REPO_ROOT"

THEME=""
EXTRA_ARGS=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --theme) THEME="$2"; shift 2 ;;
    *) EXTRA_ARGS+=("$1"); shift ;;
  esac
done

if [[ -z "$THEME" ]]; then
  echo "usage: $0 --theme <Name> [--artifact-version <v>] [прочие флаги docs aggregate]" >&2
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

echo "▸ Сборка dsbuilder-ios"
swift build --package-path DesignSystemBuilder -c release --product dsbuilder-ios
BIN="$(swift build --package-path DesignSystemBuilder -c release --product dsbuilder-ios --show-bin-path)/dsbuilder-ios"

echo "▸ Извлечение сэмплов и агрегация бандла"
"$BIN" docs aggregate --sdds "$REPO_ROOT/$THEME_SDDS" --report ${EXTRA_ARGS[@]+"${EXTRA_ARGS[@]}"}

echo "✅ Готово: $THEME_SDDS/temp/docs"
