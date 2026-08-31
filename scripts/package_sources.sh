#!/usr/bin/env bash
#
# Собирает архив исходников SDDS для публикации в GitHub Release.
#
#   scripts/package_sources.sh <version> [output-dir]
#
# Версия — тег релиза (`release-18-08-2026`); результат — `<output-dir>/SDDSSources-<version>.zip`
# (по умолчанию output-dir = <repo>/build).
#
# Архив нужен CLI SDDSThemeBuilder в режиме `--standalone --sources-version <version>`:
# он скачивает его с релиза, распаковывает рядом со сгенерированными токенами и берёт
# оттуда вендоримые исходники вместо репозитория. Поэтому внутри архива сохраняется
# дерево путей репозитория — распакованный корень подходит на роль `--sources-root`
# как есть (см. SourcesReleaseFetcher).
#
# Что кладём — ровно то, что читает StandaloneBundle через `sourcesRootURL` (App.swift).
# Держите список синхронным с ним: лишнего в архиве быть не должно, недостающее
# молча урежет бандл.
set -euo pipefail

VERSION="${1:-}"
if [ -z "$VERSION" ]; then
  echo "Usage: $(basename "$0") <version> [output-dir]" >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_DIR="$(cd "${2:-$REPO_ROOT/build}" 2>/dev/null && pwd || { mkdir -p "${2:-$REPO_ROOT/build}"; cd "${2:-$REPO_ROOT/build}" && pwd; })"

STAGE_NAME="SDDSSources-$VERSION"
STAGE="$OUTPUT_DIR/$STAGE_NAME"
ARCHIVE="$OUTPUT_DIR/$STAGE_NAME.zip"

# Пути относительно корня репозитория. Обязательные — их отсутствие ломает бандл,
# поэтому падаем; InputMask опционален (нужен только для --external-dependencies и
# приезжает сабмодулем).
REQUIRED_PATHS=(
  "SDDSThemeBuilder/SDDSThemeCore/Sources/SDDSThemeCore"
  "SDDSComponents/Sources/SDDSComponents"
  "SDDSComponents/Assets.xcassets"
  "SDDSIcons/Generated/Assets.swift"
  "SDDSIcons/SDDSIcons/Assets.xcassets"
)
OPTIONAL_PATHS=(
  "Vendor/InputMask/Source/InputMask/InputMask/Classes"
)

rm -rf "$STAGE" "$ARCHIVE"
mkdir -p "$STAGE"

copy_path() {
  local relative="$1"
  mkdir -p "$STAGE/$(dirname "$relative")"
  # -L: сабмодуль/симлинки разворачиваем — у клиента их не во что резолвить.
  cp -RL "$REPO_ROOT/$relative" "$STAGE/$relative"
}

for path in "${REQUIRED_PATHS[@]}"; do
  if [ ! -e "$REPO_ROOT/$path" ]; then
    echo "❌ Нет обязательного пути для архива исходников: $path" >&2
    exit 1
  fi
  copy_path "$path"
done

for path in "${OPTIONAL_PATHS[@]}"; do
  if [ -e "$REPO_ROOT/$path" ]; then
    copy_path "$path"
  else
    echo "⚠️  Пропускаю $path (нет на диске — сабмодуль не инициализирован?)"
  fi
done

# Пакеты тем целиком: вариации компонентов и DefaultValues взаимозависимы, поэтому
# бандл берёт готовый пакет. `.sdds` (токены/палитра) и build-артефакты не нужны.
THEMES=()
for theme_dir in "$REPO_ROOT"/Themes/*Theme; do
  [ -d "$theme_dir" ] || continue
  theme_name="$(basename "$theme_dir")"
  THEMES+=("$theme_name")
  mkdir -p "$STAGE/Themes"
  cp -RL "$theme_dir" "$STAGE/Themes/$theme_name"
  rm -rf "$STAGE/Themes/$theme_name/.sdds" "$STAGE/Themes/$theme_name/build"
done

if [ ${#THEMES[@]} -eq 0 ]; then
  echo "❌ В Themes/ нет ни одного пакета темы — архив исходников бесполезен" >&2
  exit 1
fi

COMMIT="$(git -C "$REPO_ROOT" rev-parse HEAD 2>/dev/null || echo unknown)"
{
  printf '{\n'
  printf '  "version": "%s",\n' "$VERSION"
  printf '  "commit": "%s",\n' "$COMMIT"
  printf '  "themes": ['
  printf '"%s"' "${THEMES[0]}"
  for theme in "${THEMES[@]:1}"; do printf ', "%s"' "$theme"; done
  printf ']\n'
  printf '}\n'
} > "$STAGE/sources-manifest.json"

# --keepParent: внутри архива остаётся папка SDDSSources-<version>. CLI переваривает
# оба варианта (с обёрткой и без), но с ней распаковка руками не мусорит в cwd.
ditto -c -k --sequesterRsrc --keepParent "$STAGE" "$ARCHIVE"
rm -rf "$STAGE"

echo "✅ $ARCHIVE ($(du -h "$ARCHIVE" | cut -f1), темы: ${THEMES[*]})"
