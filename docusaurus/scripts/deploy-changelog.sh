#!/bin/bash

# Скрипт для деплоя changelog.json на S3
# Использование: ./deploy-changelog.sh [ARTIFACT_ID] [VERSION_INPUT] [BRANCH_NAME] [S3_ACCESS_KEY_ID] [S3_SECRET_ACCESS_KEY] [S3_ENDPOINT] [S3_REGION] [S3_BUCKET]

set -e

# Параметры
ARTIFACT_ID="${1:-}"
VERSION_INPUT="${2:-}"
BRANCH_NAME="${3:-main}"
S3_ACCESS_KEY_ID="${4:-}"
S3_SECRET_ACCESS_KEY="${5:-}"
S3_ENDPOINT="${6:-}"
S3_REGION="${7:-}"
S3_BUCKET="${8:-}"

# Определяем директорию скрипта
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Проверяем обязательные параметры
if [[ -z "$ARTIFACT_ID" ]]; then
    echo "❌ Не указан ARTIFACT_ID"
    exit 1
fi

if [[ -z "$S3_ACCESS_KEY_ID" ]] || [[ -z "$S3_SECRET_ACCESS_KEY" ]] || [[ -z "$S3_ENDPOINT" ]] || [[ -z "$S3_REGION" ]] || [[ -z "$S3_BUCKET" ]]; then
    echo "❌ Не все параметры S3 указаны"
    exit 1
fi

# Убираем :tokens: префикс из artifact_id
clean_artifact_id="${ARTIFACT_ID#:tokens:}"

# Определяем путь к папке темы
theme_dir_name=""
case "$clean_artifact_id" in
    "sddsserv-theme")
        theme_dir_name="SDDSservTheme"
        ;;
    "plasma-b2c-theme")
        theme_dir_name="PlasmaB2CTheme"
        ;;
    "plasma-home-ds-theme")
        theme_dir_name="PlasmaHomeDsTheme"
        ;;
esac

# Получаем последнюю версию из versionsArchived.json
# Эта версия уже была добавлена в versionsArchived.json на шаге deploy
VERSION=""
if [[ -n "$theme_dir_name" ]] && [[ -f "$SCRIPT_DIR/../../Themes/$theme_dir_name/override-docs/versionsArchived.json" ]] && command -v jq &> /dev/null; then
    VERSION=$(jq -r 'keys[]' "$SCRIPT_DIR/../../Themes/$theme_dir_name/override-docs/versionsArchived.json" 2>/dev/null | sort -V | tail -1)
fi

# Если версия не найдена, пробуем получить из deploy.json или используем значение по умолчанию
if [[ -z "$VERSION" ]] || [[ "$VERSION" == "null" ]]; then
    if [[ -f "$SCRIPT_DIR/../build/generated/docusaurus/deploy.json" ]] && command -v jq &> /dev/null; then
        # Пытаемся извлечь версию из пути в deploy.json
        DEPLOY_URL=$(jq -r '.deployUrl' "$SCRIPT_DIR/../build/generated/docusaurus/deploy.json" 2>/dev/null || echo "")
        if [[ -n "$DEPLOY_URL" ]]; then
            # Извлекаем версию из URL (формат: .../ios/theme-name/version/)
            VERSION=$(echo "$DEPLOY_URL" | grep -oE '/[0-9]+\.[0-9]+\.[0-9]+/' | tr -d '/' | head -1)
        fi
    fi
    
    # Если все еще не найдена, используем значение по умолчанию
    if [[ -z "$VERSION" ]]; then
        VERSION="1.0.0"
    fi
fi

echo "🔍 Используемая версия для changelog: $VERSION"

# Проверяем наличие changelog.json
# Скрипт запускается из docusaurus/, поэтому путь относительно этой директории
CHANGELOG_JSON_PATH="build/changelog.json"

# Отладочная информация
echo "🔍 Отладка поиска changelog.json:"
echo "  Текущая директория: $(pwd)"
echo "  Искомый путь: $CHANGELOG_JSON_PATH"
echo "  Абсолютный путь: $(pwd)/$CHANGELOG_JSON_PATH"
if [[ -d "build" ]]; then
    echo "  Директория build/ существует"
    echo "  Содержимое build/:"
    ls -la build/ 2>/dev/null || echo "    (пусто)"
else
    echo "  Директория build/ не существует"
fi

if [[ -f "$CHANGELOG_JSON_PATH" ]]; then
    echo "✅ Файл changelog.json найден"
    echo "📤 Деплой changelog.json на S3..."
    "$SCRIPT_DIR/docusaurus-changelog-deploy.sh" \
        "$ARTIFACT_ID" \
        "$VERSION" \
        "$BRANCH_NAME" \
        "swiftui" \
        "$S3_ACCESS_KEY_ID" \
        "$S3_SECRET_ACCESS_KEY" \
        "$S3_ENDPOINT" \
        "$S3_REGION" \
        "$S3_BUCKET" \
        "$CHANGELOG_JSON_PATH"
else
    echo "⚠️  Файл changelog.json не найден: $CHANGELOG_JSON_PATH"
    echo "⚠️  Пропускаю деплой changelog"
    exit 0
fi

