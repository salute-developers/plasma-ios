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
    VERSION=${VERSION:-"1.0.0"}
    BRANCH_NAME=${BRANCH_NAME:-"main"}
    TARGET_TYPE=${TARGET_TYPE:-"swiftui"}
    
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
    BASE_URL="/${DEPLOY_BRANCH}/${TARGET_TYPE}/${ARTIFACT_ID}/${VERSION}/"
    DEPLOY_URL="${DEPLOY_BRANCH}/${TARGET_TYPE}/${ARTIFACT_ID}/${VERSION}/"
    
    log "Параметры проекта:"
    log "  Artifact ID: $ARTIFACT_ID"
    log "  Version: $VERSION"
    log "  Branch: $BRANCH_NAME"
    log "  Deploy Branch: $DEPLOY_BRANCH"
    log "  Target Type: $TARGET_TYPE"
}

# Функция для замены плейсхолдеров в файлах
transform_template() {
    local template_dir="$1"
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
    
    success "Шаблоны преобразованы"
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

# Запуск основной функции
main "$@"
