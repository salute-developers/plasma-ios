#!/bin/bash

# docusaurusBuild - Собирает артефакты Docusaurus для дальнейшей публикации

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

docusaurus_build() {
    log "Начинаю сборку артефактов Docusaurus..."
    
    # Инициализация
    check_dependencies
    get_project_info
    
    local destination_dir="$PWD/build/generated/docusaurus"
    local build_dir="$destination_dir/build"
    
    # Проверяем, что экземпляр Docusaurus существует
    if [[ ! -d "$destination_dir" ]]; then
        error "Экземпляр Docusaurus не найден. Сначала выполните docusaurus-generate"
        exit 1
    fi
    
    cd "$destination_dir"
    
    # Устанавливаем зависимости
    log "Установка зависимостей..."
    yarn install --frozen-lockfile
    
    # Собираем проект
    log "Сборка проекта..."
    yarn build
    
    success "Артефакты Docusaurus собраны в $build_dir"
}

# Запуск функции сборки
docusaurus_build
