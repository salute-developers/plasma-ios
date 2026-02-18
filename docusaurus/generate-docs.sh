#!/bin/bash

# Универсальный скрипт для генерации документации Docusaurus
# Использование: ./docusaurus/generate-docs.sh [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL] [--with-changelog]

set -e

# Параметры по умолчанию
DEFAULT_ARTIFACT_ID="sddsserv-theme"
DEFAULT_VERSION="1.0.0-test"
DEFAULT_BRANCH="test"
DEFAULT_TARGET_TYPE="swiftui"
DEFAULT_THEME_NAME="sddsserv"
DEFAULT_CODE_REFERENCE=""
DEFAULT_DOCS_URL="https://plasma.sberdevices.ru"

resolve_theme_metadata() {
    local theme_name="$1"
    local artifact_id="$2"
    local theme_key="$theme_name"
    local clean_artifact_id="${artifact_id#:tokens:}"

    if [[ -z "$theme_key" ]]; then
        case "$clean_artifact_id" in
            "sddsserv-theme") theme_key="sddsserv" ;;
            "styles-salute-theme") theme_key="styles-salute" ;;
            "plasma-b2c-theme") theme_key="plasma-b2c" ;;
            "plasma-home-ds-theme") theme_key="plasma-homeds" ;;
        esac
    fi

    case "$theme_key" in
        "sddsserv")
            echo "sddsserv|SDDSServTheme|../Themes/SDDSservTheme/override-docs|SDDSservTheme"
            ;;
        "styles-salute")
            echo "styles-salute|StylesSaluteTheme|../Themes/StylesSaluteTheme/override-docs|StylesSaluteTheme"
            ;;
        "plasma-b2c")
            echo "plasma-b2c|PlasmaB2CTheme|../Themes/PlasmaB2CTheme/override-docs|PlasmaB2CTheme"
            ;;
        "plasma-homeds")
            echo "plasma-homeds|PlasmaHomeDSTheme|../Themes/PlasmaHomeDSTheme/override-docs|PlasmaHomeDSTheme"
            ;;
        *)
            echo "$theme_key|||"
            ;;
    esac
}

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

# Для известных тем определяем корректный CODE_REFERENCE и пути автоматически.
THEME_METADATA="$(resolve_theme_metadata "$THEME_NAME" "$ARTIFACT_ID")"
RESOLVED_THEME_NAME="$(echo "$THEME_METADATA" | cut -d'|' -f1)"
RESOLVED_CODE_REFERENCE="$(echo "$THEME_METADATA" | cut -d'|' -f2)"
override_docs="$(echo "$THEME_METADATA" | cut -d'|' -f3)"
THEME_FOLDER_NAME="$(echo "$THEME_METADATA" | cut -d'|' -f4)"

if [[ -n "$RESOLVED_THEME_NAME" ]]; then
    THEME_NAME="$RESOLVED_THEME_NAME"
fi

if [[ -z "$CODE_REFERENCE" ]] && [[ -n "$RESOLVED_CODE_REFERENCE" ]]; then
    CODE_REFERENCE="$RESOLVED_CODE_REFERENCE"
fi

if [[ -z "$CODE_REFERENCE" ]]; then
    echo "❌ CODE_REFERENCE не определен. Передайте параметр [CODE_REFERENCE] или используйте известную тему."
    exit 1
fi

if [[ -z "$override_docs" ]]; then
    echo "⚠️  Неизвестная тема: $THEME_NAME, используем локальный override-docs"
    override_docs="override-docs"
fi

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

echo "🎯 Override-docs для темы $THEME_NAME: $override_docs"

# Создаем директорию назначения
mkdir -p "$destination_dir"

# Извлечение Swift-сниппетов (core + theme) перед генерацией
DOCUSAURUS_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$DOCUSAURUS_DIR/.." && pwd)"
SNIPPETS_DIR="${SNIPPETS_DIR:-$DOCUSAURUS_DIR/build/docs}"
mkdir -p "$SNIPPETS_DIR"
export REPO_ROOT
if [[ -f "$DOCUSAURUS_DIR/scripts/extract-snippets.sh" ]]; then
    echo "📄 Извлечение Swift-сниппетов..."
    THEME_NAME="$THEME_FOLDER_NAME" SNIPPETS_DIR="$SNIPPETS_DIR" bash "$DOCUSAURUS_DIR/scripts/extract-snippets.sh"
fi

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

# Мерж +*.md в соответствующие *.md и подстановка // @sample: сниппетов
source "$DOCUSAURUS_DIR/scripts/docusaurus.sh"
if [[ -d "$destination_dir/docs" ]]; then
    merge_plus_prefixed_docs "$destination_dir/docs"
fi
replace_swift_snippets "$SNIPPETS_DIR" "$destination_dir"

# Проверки на частые ошибки шаблонов.
quick_start_doc="$destination_dir/docs/quick_start.md"
if [[ -f "$quick_start_doc" ]]; then
    package_dependency_count=$(grep -c '\.package(url: "https://github.com/salute-developers/plasma-ios"' "$quick_start_doc")
    if [[ "$package_dependency_count" -ne 1 ]]; then
        echo "❌ В quick_start.md ожидается ровно одна dependency на plasma-ios, найдено: $package_dependency_count"
        exit 1
    fi

    if grep -q '{{ docs-theme-codeReference }}' "$quick_start_doc"; then
        echo "❌ В quick_start.md остался непроцессированный плейсхолдер docs-theme-codeReference"
        exit 1
    fi

    if [[ "$THEME_NAME" != "sddsserv" ]] && grep -q 'SDDSServTheme' "$quick_start_doc"; then
        echo "❌ В quick_start.md для темы '$THEME_NAME' найдено неверное упоминание SDDSServTheme"
        exit 1
    fi
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
echo "  # Для sddsserv-theme (по умолчанию):"
echo "  ./docusaurus/generate-docs.sh"
echo ""
echo "  # Для Styles Salute Theme:"
echo "  ./docusaurus/generate-docs.sh styles-salute-theme 1.0.0-test test swiftui styles-salute"
echo ""
echo "  # Для SDDSComponents:"
echo "  ./docusaurus/generate-docs.sh SDDSComponents 1.0.0-test test swiftui \"SDDS iOS Components\" SDDSComponents"
echo ""
echo "  # С генерацией changelog:"
echo "  ./docusaurus/generate-docs.sh SDDSComponents 1.0.0-test test swiftui \"SDDS iOS Components\" SDDSComponents --with-changelog"
echo ""
echo "  # Для другой темы:"
echo "  ./docusaurus/generate-docs.sh my-theme 2.0.0 main swiftui custom-theme MyTheme"