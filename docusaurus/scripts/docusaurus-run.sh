#!/bin/bash

# docusaurusRun - Запускает просмотр Docusaurus локально в браузере

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

docusaurus_run() {
    log "Запускаю локальный просмотр Docusaurus..."
    
    # Инициализация
    check_dependencies
    get_project_info
    
    local destination_dir="$PWD/build/generated/docusaurus"
    
    # Проверяем, что экземпляр Docusaurus существует
    if [[ ! -d "$destination_dir" ]]; then
        error "Экземпляр Docusaurus не найден. Сначала выполните docusaurus-generate"
        exit 1
    fi
    
    cd "$destination_dir"
    
    # Устанавливаем зависимости если нужно
    if [[ ! -d "node_modules" ]]; then
        log "Установка зависимостей..."
        yarn install --frozen-lockfile
    fi
    
    # Запускаем локальный сервер
    log "Запуск локального сервера..."
    log "Документация будет доступна по адресу: http://localhost:3000"
    log "Для остановки нажмите Ctrl+C"
    
    yarn start
}

# Запуск функции запуска
docusaurus_run
