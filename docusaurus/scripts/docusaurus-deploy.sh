#!/bin/bash

# docusaurusDeploy - Разворачивает документацию Docusaurus на удаленном сервере

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

docusaurus_deploy() {
    log "Начинаю деплой документации Docusaurus..."
    
    # Инициализация
    check_dependencies
    get_project_info
    
    local destination_dir="$PWD/build/generated/docusaurus"
    local build_dir="$destination_dir/build"
    local deploy_json="$destination_dir/deploy.json"
    
    # Проверяем, что артефакты собраны
    if [[ ! -d "$build_dir" ]]; then
        error "Артефакты Docusaurus не найдены. Сначала выполните docusaurus-build"
        exit 1
    fi
    
    # Проверяем переменные окружения для S3
    if [[ -z "$S3_ACCESS_KEY_ID" || -z "$S3_SECRET_ACCESS_KEY" || -z "$S3_ENDPOINT" || -z "$S3_REGION" || -z "$S3_BUCKET" ]]; then
        error "Не все переменные окружения для S3 заданы:"
        error "  S3_ACCESS_KEY_ID: ${S3_ACCESS_KEY_ID:-не задано}"
        error "  S3_SECRET_ACCESS_KEY: ${S3_SECRET_ACCESS_KEY:-не задано}"
        error "  S3_ENDPOINT: ${S3_ENDPOINT:-не задано}"
        error "  S3_REGION: ${S3_REGION:-не задано}"
        error "  S3_BUCKET: ${S3_BUCKET:-не задано}"
        exit 1
    fi
    
    # Настраиваем s3cmd
    log "Настройка s3cmd..."
    cat > ~/.s3cfg << EOF
[default]
access_key = $S3_ACCESS_KEY_ID
secret_key = $S3_SECRET_ACCESS_KEY
host_base = $S3_ENDPOINT
host_bucket = %(bucket)s.$S3_ENDPOINT
use_https = True
EOF
    
    # Загружаем файлы в S3
    log "Загрузка файлов в S3..."
    log "  Источник: $build_dir"
    log "  Назначение: s3://$S3_BUCKET/$DEPLOY_URL"
    
    s3cmd sync --delete-removed --acl-public "$build_dir/" "s3://$S3_BUCKET/$DEPLOY_URL"
    
    # Создаем deploy.json
    log "Создание deploy.json..."
    cat > "$deploy_json" << EOF
{
  "deployUrl": "$DOCS_URL$BASE_URL"
}
EOF
    
    success "Документация успешно развернута"
    log "URL документации: $DOCS_URL$BASE_URL"
    log "Deploy info сохранен: $deploy_json"
}

# Запуск функции деплоя
docusaurus_deploy
