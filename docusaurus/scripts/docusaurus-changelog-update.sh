#!/bin/bash

# docusaurus-changelog-update - Обновляет changelog.json с новой версией
# Аналог gradle задачи generateChangelog из Android проекта

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

# Параметры
ARTIFACT_ID="${1:-}"
VERSION="${2:-}"
RELEASE_CHANGELOG_JSON_PATH="${3:-../release-changelog.json}"
LIBRARY_CHANGELOG_JSON_PATH="${4:-build/changelog.json}"

# Функция для обновления changelog.json с новой версией
docusaurus_changelog_update() {
    log "Начинаю обновление changelog.json с версией $VERSION"
    
    # Проверяем наличие jq
    if ! command -v jq &> /dev/null; then
        error "jq не установлен. Установите jq для работы с JSON"
        exit 1
    fi
    
    # Проверяем наличие release-changelog.json
    if [[ ! -f "$RELEASE_CHANGELOG_JSON_PATH" ]]; then
        warning "Файл release-changelog.json не найден: $RELEASE_CHANGELOG_JSON_PATH"
        warning "Пропускаю обновление changelog.json"
        return 0
    fi
    
    log "Найден файл release-changelog.json: $RELEASE_CHANGELOG_JSON_PATH"
    
    # Создаем директорию для changelog.json если не существует
    local json_dir=$(dirname "$LIBRARY_CHANGELOG_JSON_PATH")
    mkdir -p "$json_dir"
    
    # Загружаем существующий changelog.json или создаем новый
    if [[ ! -f "$LIBRARY_CHANGELOG_JSON_PATH" ]]; then
        warning "changelog.json не найден, создаю новый"
        echo "{}" > "$LIBRARY_CHANGELOG_JSON_PATH"
    fi
    
    log "Обновляю changelog.json с версией $VERSION..."
    
    # Читаем release-changelog.json
    local release_changelog=$(cat "$RELEASE_CHANGELOG_JSON_PATH")
    
    # Получаем текущую дату
    local current_date=$(date "+%Y-%m-%d")
    
    # Обновляем changelog.json: добавляем новую версию как ключ
    # Формат аналогичен Android: { "version": { "date": "...", "sections": [...], "themes": {...} } }
    local temp_file=$(mktemp)
    
    # Читаем существующий changelog.json
    local existing_changelog=$(cat "$LIBRARY_CHANGELOG_JSON_PATH")
    
    # Если версия уже существует, удаляем её
    if echo "$existing_changelog" | jq -e "has(\"$VERSION\")" > /dev/null 2>&1; then
        log "Версия $VERSION уже существует в changelog.json, удаляю старую запись"
        echo "$existing_changelog" | jq "del(.\"$VERSION\")" > "$temp_file"
        existing_changelog=$(cat "$temp_file")
    fi
    
    # Добавляем новую версию с данными из release-changelog.json
    # Формируем объект версии: { "date": "...", "data": { ... } }
    # Проверяем, что release_changelog валидный JSON
    if ! echo "$release_changelog" | jq . > /dev/null 2>&1; then
        error "release-changelog.json содержит невалидный JSON"
        exit 1
    fi
    
    local version_data=$(echo "$release_changelog" | jq --arg date "$current_date" '{
        date: $date,
        data: .
    }')
    
    # Объединяем существующий changelog с новой версией
    echo "$existing_changelog" | jq --arg version "$VERSION" --argjson version_data "$version_data" \
        '. + {($version): $version_data}' > "$temp_file"
    
    # Сохраняем обновленный changelog.json
    mv "$temp_file" "$LIBRARY_CHANGELOG_JSON_PATH"
    
    success "changelog.json обновлен с версией $VERSION"
    log "Файл сохранен: $LIBRARY_CHANGELOG_JSON_PATH"
    
    # Выводим информацию о структуре
    log "Структура changelog.json:"
    echo "$(cat "$LIBRARY_CHANGELOG_JSON_PATH" | jq 'keys')" | head -20
    
    # Выводим полное содержимое changelog.json
    log "Полное содержимое changelog.json:"
    cat "$LIBRARY_CHANGELOG_JSON_PATH" | jq . || echo "Ошибка при выводе JSON"
}

# Запуск функции обновления
docusaurus_changelog_update

success "Обновление changelog.json завершено"

