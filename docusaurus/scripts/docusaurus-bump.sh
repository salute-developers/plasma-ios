#!/bin/bash

# docusaurusBump - Обновляет или создает файл versionsArchived.json

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

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

# Запуск функции обновления версий
docusaurus_bump
