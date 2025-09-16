#!/bin/bash

# docusaurusClean - Удаляет сгенерированную ранее документацию с сервера

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

docusaurus_clean() {
    log "Начинаю очистку документации с сервера..."
    
    # Инициализация
    check_dependencies
    get_project_info
    
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
    
    # Удаляем файлы из S3
    log "Удаление файлов из S3..."
    log "  Путь для удаления: s3://$S3_BUCKET/$DEPLOY_URL"
    
    s3cmd del --recursive "s3://$S3_BUCKET/$DEPLOY_URL" || warning "Путь не найден или уже пуст"
    
    success "Документация удалена с сервера"
}

# Запуск функции очистки
docusaurus_clean
