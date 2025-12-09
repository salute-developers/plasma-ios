#!/bin/bash

# Универсальный скрипт для генерации документации Docusaurus
# Использование: ./docusaurus/generate-docs.sh [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL] [--with-changelog]

set -e

# Параметры по умолчанию
DEFAULT_ARTIFACT_ID="SDDSServTheme"
DEFAULT_VERSION="1.0.0-test"
DEFAULT_BRANCH="test"
DEFAULT_TARGET_TYPE="swiftui"
DEFAULT_THEME_NAME="SDDS Serv Theme"
DEFAULT_CODE_REFERENCE="SDDSServTheme"
DEFAULT_DOCS_URL="https://plasma.sberdevices.ru"

# Флаги
WITH_CHANGELOG=false
ARGS=()

# Парсим аргументы
for arg in "$@"; do
    case $arg in
        --with-changelog)
            WITH_CHANGELOG=true
            ;;
        *)
            ARGS+=("$arg")
            ;;
    esac
done

# Получаем параметры из аргументов или используем значения по умолчанию
ARTIFACT_ID="${ARGS[0]:-$DEFAULT_ARTIFACT_ID}"
VERSION="${ARGS[1]:-$DEFAULT_VERSION}"
BRANCH_NAME="${ARGS[2]:-$DEFAULT_BRANCH}"
TARGET_TYPE="${ARGS[3]:-$DEFAULT_TARGET_TYPE}"
THEME_NAME="${ARGS[4]:-$DEFAULT_THEME_NAME}"
CODE_REFERENCE="${ARGS[5]:-$DEFAULT_CODE_REFERENCE}"
DOCS_URL="${ARGS[6]:-$DEFAULT_DOCS_URL}"

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
echo "  With Changelog: $WITH_CHANGELOG"
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

# Определяем путь к override-docs конкретной темы
case "$THEME_NAME" in
    "sddsserv")
        override_docs="../Themes/SDDSservTheme/override-docs"
        ;;
    "styles-salute")
        override_docs="../Themes/StylesSaluteTheme/override-docs"
        ;;
    "plasma-b2c")
        override_docs="../Themes/PlasmaB2CTheme/override-docs"
        ;;
    "plasma-homeds")
        override_docs="../Themes/PlasmaHomeDSTheme/override-docs"
        ;;
    *)
        echo "❌ Неизвестная тема: $THEME_NAME, используем локальный override-docs"
        override_docs="override-docs"
        ;;
esac

echo "🎯 Override-docs для темы $THEME_NAME: $override_docs"

# Создаем директорию назначения
mkdir -p "$destination_dir"

# Копируем common-template
echo "📁 Копирование common-template..."
cp -r "$common_template"/* "$destination_dir/"

# Копируем swiftui-template
echo "📁 Копирование swiftui-template..."
cp -r "$swiftui_template"/* "$destination_dir/"

# Убираем :tokens: префикс из ARTIFACT_ID для URL
CLEAN_ARTIFACT_ID="${ARTIFACT_ID#:tokens:}"

# Определяем ветку для деплоя
if [[ "$BRANCH_NAME" == "main" ]]; then
    DEPLOY_BRANCH=""
    BASE_URL="/ios/$CLEAN_ARTIFACT_ID/$VERSION/"
elif [[ "$BRANCH_NAME" == "develop" ]]; then
    DEPLOY_BRANCH="dev"
    BASE_URL="/$DEPLOY_BRANCH/ios/$CLEAN_ARTIFACT_ID/$VERSION/"
else
    DEPLOY_BRANCH="pr/$(echo "$BRANCH_NAME" | tr '[:upper:]' '[:lower:]')"
    BASE_URL="/$DEPLOY_BRANCH/ios/$CLEAN_ARTIFACT_ID/$VERSION/"
fi

# Преобразуем шаблоны
echo "🔧 Преобразование шаблонов..."
echo "🔍 DEBUG: DOCS_URL='$DOCS_URL', BASE_URL='$BASE_URL'"
find "$destination_dir" -type f \( -name "*.md" -o -name "docusaurus.config.ts" \) -exec sed -i.bak \
    -e "s|{{ docs-url }}|$DOCS_URL|g" \
    -e "s|{{ docs-baseUrl }}|$BASE_URL|g" \
    -e "s|{{ docs-artifactId }}|$ARTIFACT_ID|g" \
    -e "s|{{ docs-artifactVersion }}|$VERSION|g" \
    -e "s|{{ docs-target }}|$TARGET_TYPE|g" \
    -e "s|{{ docs-api-href }}|$DOCS_URL/$DEPLOY_BRANCH/$TARGET_TYPE/$CLEAN_ARTIFACT_ID/$VERSION/|g" \
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

# Генерируем changelog если требуется
if [[ "$WITH_CHANGELOG" == true ]]; then
    echo ""
    echo "📝 Генерация changelog..."
    
    # Проверяем наличие файла release-changelog.md
    if [[ -f "../release-changelog.md" ]]; then
        echo "  ✅ Найден файл release-changelog.md"
        echo "  🔍 Размер файла: $(wc -c < ../release-changelog.md) байт"
        echo "  🔍 Содержимое release-changelog.md (первые 500 строк):"
        head -500 "../release-changelog.md" || echo "Файл пуст или нечитаем"
        echo ""
        
        # Генерируем changelog для данной библиотеки
        echo "  🔄 Парсинг changelog для $CLEAN_ARTIFACT_ID..."
        echo "  📄 Файл changelog: ../release-changelog.md"
        
        # Используем parse-changelog.js напрямую (ожидает markdown)
        node ../scripts/parse-changelog.js "$CLEAN_ARTIFACT_ID" "../release-changelog.md" "$destination_dir/docs/CHANGELOG.md" "sdds-uikit"
        
        if [[ -f "$destination_dir/docs/CHANGELOG.md" ]]; then
            echo "  ✅ Changelog сгенерирован: $destination_dir/docs/CHANGELOG.md"
            echo "  🔍 Содержимое сгенерированного changelog:"
            cat "$destination_dir/docs/CHANGELOG.md"
        else
            echo "  ⚠️  Changelog не был сгенерирован"
        fi
    else
        echo "  ⚠️  Файл release-changelog.md не найден, пропускаем генерацию changelog"
    fi
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
echo "  # С генерацией changelog:"
echo "  ./docusaurus/generate-docs.sh SDDSComponents 1.0.0-test test swiftui \"SDDS iOS Components\" SDDSComponents --with-changelog"
echo ""
echo "  # Для другой темы:"
echo "  ./docusaurus/generate-docs.sh my-theme 2.0.0 main swiftui \"My Theme\" MyTheme"