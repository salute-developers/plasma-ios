#!/bin/bash

# Универсальный скрипт для генерации документации Docusaurus
# Использование: ./docusaurus/generate-docs.sh [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE]

set -e

# Параметры по умолчанию
DEFAULT_ARTIFACT_ID="SDDSServTheme"
DEFAULT_VERSION="1.0.0-test"
DEFAULT_BRANCH="test"
DEFAULT_TARGET_TYPE="swiftui"
DEFAULT_THEME_NAME="SDDS Serv Theme"
DEFAULT_CODE_REFERENCE="SDDSServTheme"
DEFAULT_DOCS_URL="https://plasma.sberdevices.ru"

# Получаем параметры из аргументов или используем значения по умолчанию
ARTIFACT_ID="${1:-$DEFAULT_ARTIFACT_ID}"
VERSION="${2:-$DEFAULT_VERSION}"
BRANCH_NAME="${3:-$DEFAULT_BRANCH}"
TARGET_TYPE="${4:-$DEFAULT_TARGET_TYPE}"
THEME_NAME="${5:-$DEFAULT_THEME_NAME}"
CODE_REFERENCE="${6:-$DEFAULT_CODE_REFERENCE}"
DOCS_URL="${7:-$DEFAULT_DOCS_URL}"

echo "🔄 Генерация документации Docusaurus..."
echo ""
echo "📋 Параметры:"
echo "  Artifact ID: $ARTIFACT_ID"
echo "  Version: $VERSION"
echo "  Branch: $BRANCH_NAME"
echo "  Target Type: $TARGET_TYPE"
echo "  Theme Name: $THEME_NAME"
echo "  Code Reference: $CODE_REFERENCE"
echo "  Docs URL: $DOCS_URL"
echo ""

# Проверяем зависимости
echo "🔍 Проверка зависимостей..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js не установлен"
    exit 1
fi

if ! command -v yarn &> /dev/null; then
    echo "❌ Yarn не установлен"
    exit 1
fi

echo "✅ Все зависимости установлены"
echo ""

# Определяем пути
template_root_dir="./"
destination_dir="build/generated/docusaurus"
common_template="$template_root_dir/common-template"
swiftui_template="$template_root_dir/swiftui-template"
override_docs="override-docs"

# Создаем директорию назначения
mkdir -p "$destination_dir"

# Копируем common-template
echo "📁 Копирование common-template..."
cp -r "$common_template"/* "$destination_dir/"

# Копируем swiftui-template
echo "📁 Копирование swiftui-template..."
cp -r "$swiftui_template"/* "$destination_dir/"

# Определяем ветку для деплоя
if [[ "$BRANCH_NAME" == "main" ]]; then
    DEPLOY_BRANCH=""
    BASE_URL="/$TARGET_TYPE/$ARTIFACT_ID/$VERSION/"
elif [[ "$BRANCH_NAME" == "develop" ]]; then
    DEPLOY_BRANCH="dev"
    BASE_URL="/$DEPLOY_BRANCH/$TARGET_TYPE/$ARTIFACT_ID/$VERSION/"
else
    DEPLOY_BRANCH="pr/$(echo "$BRANCH_NAME" | tr '[:upper:]' '[:lower:]')"
    BASE_URL="/$DEPLOY_BRANCH/$TARGET_TYPE/$ARTIFACT_ID/$VERSION/"
fi

# Преобразуем шаблоны
echo "🔧 Преобразование шаблонов..."
find "$destination_dir" -type f \( -name "*.md" -o -name "docusaurus.config.ts" \) -exec sed -i.bak \
    -e "s|{{ docs-url }}|$DOCS_URL|g" \
    -e "s|{{ docs-baseUrl }}|$BASE_URL|g" \
    -e "s|{{ docs-artifactId }}|$ARTIFACT_ID|g" \
    -e "s|{{ docs-artifactVersion }}|$VERSION|g" \
    -e "s|{{ docs-target }}|$TARGET_TYPE|g" \
    -e "s|{{ docs-api-href }}|$DOCS_URL/$DEPLOY_BRANCH/$TARGET_TYPE/$ARTIFACT_ID/$VERSION/|g" \
    -e "s|{{ docs-theme-name }}|$THEME_NAME|g" \
    -e "s|{{ docs-theme-codeReference }}|$CODE_REFERENCE|g" \
    {} \; 2>/dev/null || true

# Удаляем backup файлы
find "$destination_dir" -name "*.bak" -delete

# Копируем override-docs если существует
if [[ -d "$override_docs" ]]; then
    echo "📁 Копирование override-docs..."
    cp -r "$override_docs"/* "$destination_dir/"
fi

echo "✅ Документация для $THEME_NAME сгенерирована в $destination_dir"
echo ""
echo "🚀 Для запуска локального сервера выполните:"
echo "  cd $destination_dir && yarn install && yarn start"
echo ""
echo "📖 Примеры использования:"
echo "  # Для SDDSServTheme (по умолчанию):"
echo "  ./docusaurus/generate-docs.sh"
echo ""
echo "  # Для Styles Salute Theme:"
echo "  ./docusaurus/generate-docs.sh styles-salute-theme 1.0.0-test test swiftui \"Styles Salute Theme\" StylesSaluteTheme"
echo ""
echo "  # Для SDDSComponents:"
echo "  ./docusaurus/generate-docs.sh SDDSComponents 1.0.0-test test swiftui \"SDDS iOS Components\" SDDSComponents"
echo ""
echo "  # Для другой темы:"
echo "  ./docusaurus/generate-docs.sh my-theme 2.0.0 main swiftui \"My Theme\" MyTheme"