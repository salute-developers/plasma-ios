#!/bin/bash

# Docusaurus скрипты для iOS
# Адаптация Android Gradle задач для iOS

set -e

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Функция для логирования
log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

# Проверка зависимостей
check_dependencies() {
    log "Проверка зависимостей..."
    
    if ! command -v node &> /dev/null; then
        error "Node.js не установлен. Установите Node.js для работы с Docusaurus"
        exit 1
    fi
    
    if ! command -v yarn &> /dev/null; then
        error "Yarn не установлен. Установите Yarn для работы с Docusaurus"
        exit 1
    fi
    
    if ! command -v s3cmd &> /dev/null; then
        warning "s3cmd не установлен. Для деплоя потребуется s3cmd"
    fi
    
    success "Все зависимости проверены"
}

# Получение параметров проекта
get_project_info() {
    # Читаем параметры из переменных окружения или используем значения по умолчанию
    ARTIFACT_ID=${ARTIFACT_ID:-"SDDSComponents"}
    BRANCH_NAME=${BRANCH_NAME:-"main"}
    TARGET_TYPE=${TARGET_TYPE:-"swiftui"}
    
    # Отладочный вывод для проверки версии
    log "DEBUG: VERSION from environment: '$VERSION'"
    
    # Определяем ветку для деплоя
    if [[ "$BRANCH_NAME" == "main" ]]; then
        DEPLOY_BRANCH="current"
    elif [[ "$BRANCH_NAME" == "develop" ]]; then
        DEPLOY_BRANCH="dev"
    else
        DEPLOY_BRANCH="pr/${BRANCH_NAME,,}"
    fi
    
    # Базовые URL
    DOCS_URL=${DOCS_URL:-"https://plasma.sberdevices.ru"}
    
    # Определяем правильный путь для тем
    if [[ "$ARTIFACT_ID" == *":tokens:"* ]]; then
        # Для тем используем формат /deploy-branch/ios/theme-name/version/
        # Извлекаем имя темы из ARTIFACT_ID (убираем :tokens: префикс)
        THEME_NAME_FROM_ARTIFACT="${ARTIFACT_ID#:tokens:}"
        if [[ "$DEPLOY_BRANCH" == "current" ]]; then
            BASE_URL="/ios/${THEME_NAME_FROM_ARTIFACT}/${VERSION}/"
        else
            BASE_URL="/${DEPLOY_BRANCH}/ios/${THEME_NAME_FROM_ARTIFACT}/${VERSION}/"
        fi
    else
        # Для компонентов используем стандартный формат
        BASE_URL="/${DEPLOY_BRANCH}/${TARGET_TYPE}/${ARTIFACT_ID}/${VERSION}/"
    fi
    
    DEPLOY_URL="${DEPLOY_BRANCH}/${TARGET_TYPE}/${ARTIFACT_ID}/${VERSION}/"
    
    log "Параметры проекта:"
    log "  Artifact ID: $ARTIFACT_ID"
    log "  Version: $VERSION"
    log "  Branch: $BRANCH_NAME"
    log "  Deploy Branch: $DEPLOY_BRANCH"
    log "  Target Type: $TARGET_TYPE"
}

# Функция для замены плейсхолдеров в файлах
# Если передан второй аргумент (snippets_dir), после подстановки вызывается replace_swift_snippets
transform_template() {
    local template_dir="$1"
    local snippets_dir="${2:-}"
    log "Преобразование шаблонов в $template_dir..."
    
    find "$template_dir" -type f \( -name "*.md" -o -name "docusaurus.config.ts" \) -exec sed -i.bak \
        -e "s|{{ docs-url }}|$DOCS_URL|g" \
        -e "s|{{ docs-baseUrl }}|$BASE_URL|g" \
        -e "s|{{ docs-artifactId }}|$ARTIFACT_ID|g" \
        -e "s|{{ docs-artifactVersion }}|$VERSION|g" \
        -e "s|{{ docs-target }}|$TARGET_TYPE|g" \
        -e "s|{{ docs-theme-codeReference }}|$ARTIFACT_ID|g" \
        -e "s|{{ docs-theme-prefix }}|$ARTIFACT_ID|g" \
        -e "s|{{ docs-uikitComposeVersion }}|$VERSION|g" \
        -e "s|{{ docs-iconsVersion }}|$VERSION|g" \
        {} \; 2>/dev/null || true
    
    # Удаляем backup файлы
    find "$template_dir" -name "*.bak" -delete
    
    if [[ -n "$snippets_dir" && -d "$snippets_dir" ]]; then
        replace_swift_snippets "$snippets_dir" "$template_dir"
    fi
    
    success "Шаблоны преобразованы"
}

# Замена в .md и docusaurus.config.ts: строка "// @sample: path" -> содержимое файла snippets_dir/path
replace_swift_snippets() {
    local snippets_dir="$1"
    local template_dir="$2"
    log "Подстановка Swift-сниппетов из $snippets_dir..."
    local count=0
    while IFS= read -r -d '' f; do
        if grep -qE '//[[:space:]]*@sample:[[:space:]]+' "$f" 2>/dev/null; then
            local tmp
            tmp=$(mktemp)
            awk -v snippets_dir="$snippets_dir" '
                /^[[:space:]]*\/\/[[:space:]]*@sample:[[:space:]]+.+$/ {
                    path = $0
                    sub(/^[[:space:]]*\/\/[[:space:]]*@sample:[[:space:]]+/, "", path)
                    gsub(/^[[:space:]]|[[:space:]]$/, "", path)
                    f = snippets_dir "/" path
                    content = ""
                    while ((getline line < f) > 0) content = content (content == "" ? "" : "\n") line
                    close(f)
                    if (content != "") { print content; next }
                }
                { print }
            ' "$f" > "$tmp" && mv "$tmp" "$f"
            count=$((count + 1))
        fi
    done < <(find "$template_dir" -type f \( -name "*.md" -o -name "docusaurus.config.ts" \) -print0 2>/dev/null)
    log "Обработано файлов со сниппетами: $count"
}

# Мерж файлов +*.md в соответствующие *.md (как mergePlusPrefixedDocs на Android)
merge_plus_prefixed_docs() {
    local docs_dir="$1"
    if [[ ! -d "$docs_dir" ]]; then
        return
    fi
    log "Мерж +*.md в $docs_dir..."
    while IFS= read -r -d '' plus_file; do
        local dir base_name base_file
        dir=$(dirname "$plus_file")
        base_name=$(basename "$plus_file")
        base_name="${base_name#+}"
        base_file="$dir/$base_name"
        if [[ ! -f "$base_file" ]]; then
            mv "$plus_file" "$base_file"
            log "  Переименован: $(basename "$plus_file") -> $base_name"
        else
            local merged
            merged=$(printf '%s\n\n\n<!-- merged from %s -->\n\n%s' "$(cat "$base_file")" "$(basename "$plus_file")" "$(cat "$plus_file")")
            echo "$merged" > "$base_file"
            rm -f "$plus_file"
            log "  Смержен: $(basename "$plus_file") -> $base_name"
        fi
    done < <(find "$docs_dir" -type f -name "+*.md" -print0 2>/dev/null || true)
    success "Мерж +*.md выполнен"
}

# Функция для обновления versionsArchived.json
docusaurus_bump() {
    log "Обновляю список версий..."
    
    # Инициализация
    get_project_info
    
    local override_docs="$PWD/override-docs"
    local versions_file="$override_docs/versionsArchived.json"
    
    # Создаем директорию override-docs если не существует
    mkdir -p "$override_docs"
    
    # Создаем или обновляем versionsArchived.json
    if [[ -f "$versions_file" ]]; then
        log "Обновляю существующий файл versionsArchived.json..."
        # Читаем существующий JSON и добавляем новую версию
        local temp_file=$(mktemp)
        jq --arg version "$VERSION" --arg url "$DOCS_URL$BASE_URL" \
           '. + {($version): $url}' "$versions_file" > "$temp_file"
        mv "$temp_file" "$versions_file"
    else
        log "Создаю новый файл versionsArchived.json..."
        # Создаем новый JSON файл с версией
        cat > "$versions_file" << EOF
{
  "$VERSION": "$DOCS_URL$BASE_URL"
}
EOF
    fi
    
    success "Версия $VERSION добавлена в versionsArchived.json"
    log "Файл сохранен: $versions_file"
}

# Основная функция
main() {
    local command="$1"
    
    case "$command" in
        "generate")
            docusaurus_generate
            ;;
        "build")
            docusaurus_build
            ;;
        "run")
            docusaurus_run
            ;;
        "bump")
            docusaurus_bump
            ;;
        "deploy")
            docusaurus_deploy
            ;;
        "clean")
            docusaurus_clean
            ;;
        *)
            echo "Использование: $0 {generate|build|run|bump|deploy|clean}"
            echo ""
            echo "Команды:"
            echo "  generate  - Создает экземпляр Docusaurus из шаблонов"
            echo "  build     - Собирает артефакты Docusaurus для публикации"
            echo "  run       - Запускает просмотр Docusaurus локально"
            echo "  bump      - Обновляет список версий"
            echo "  deploy    - Разворачивает документацию на удаленном сервере"
            echo "  clean     - Удаляет сгенерированную документацию с сервера"
            exit 1
            ;;
    esac
}

# Запуск основной функции только если скрипт вызывается напрямую (не через source)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
