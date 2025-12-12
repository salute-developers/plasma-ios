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
RELEASE_CHANGELOG_MD_PATH="${3:-../release-changelog.md}"
LIBRARY_CHANGELOG_JSON_PATH="${4:-build/changelog.json}"
CORE_LIB_NAME="${5:-sdds-uikit}"

# Функция для обновления changelog.json с новой версией
docusaurus_changelog_update() {
    log "Начинаю обновление changelog.json с версией $VERSION"
    
    # Проверяем наличие jq
    if ! command -v jq &> /dev/null; then
        error "jq не установлен. Установите jq для работы с JSON"
        exit 1
    fi
    
    # Проверяем наличие release-changelog.md
    if [[ ! -f "$RELEASE_CHANGELOG_MD_PATH" ]]; then
        warning "Файл release-changelog.md не найден: $RELEASE_CHANGELOG_MD_PATH"
        warning "Пропускаю обновление changelog.json"
        return 0
    fi
    
    log "Найден файл release-changelog.md: $RELEASE_CHANGELOG_MD_PATH"
    
    # Создаем директорию для changelog.json если не существует
    local json_dir=$(dirname "$LIBRARY_CHANGELOG_JSON_PATH")
    mkdir -p "$json_dir"
    
    # Загружаем существующий changelog.json или создаем новый
    if [[ ! -f "$LIBRARY_CHANGELOG_JSON_PATH" ]]; then
        warning "changelog.json не найден, создаю новый"
        echo "{}" > "$LIBRARY_CHANGELOG_JSON_PATH"
    fi
    
    log "Обновляю changelog.json с версией $VERSION..."
    
    # Используем parse-changelog-to-json.js для генерации DTO формата (как на Android)
    # Формат: { "date": "...", "core": [...], "lib": [...] }
    local script_dir="$(cd "$SCRIPT_DIR/../.." && pwd)"
    log "Парсинг markdown и преобразование в DTO формат..."
    local dto_json=$(node "$script_dir/scripts/parse-changelog-to-json.js" "$ARTIFACT_ID" "$RELEASE_CHANGELOG_MD_PATH" "$CORE_LIB_NAME" 2>/dev/null || echo "")
    
    if [[ -z "$dto_json" ]]; then
        error "Не удалось сгенерировать DTO из changelog"
        exit 1
    fi
    
    # Проверяем, что dto_json валидный JSON
    if ! echo "$dto_json" | jq . > /dev/null 2>&1; then
        error "Сгенерированный DTO не является валидным JSON"
        log "DTO содержимое: $dto_json"
        exit 1
    fi
    
    log "DTO успешно сгенерирован"
    
    local temp_file=$(mktemp)
    
    # Читаем существующий changelog.json
    local existing_changelog=$(cat "$LIBRARY_CHANGELOG_JSON_PATH")
    
    # Если версия уже существует, удаляем её
    if echo "$existing_changelog" | jq -e "has(\"$VERSION\")" > /dev/null 2>&1; then
        log "Версия $VERSION уже существует в changelog.json, удаляю старую запись"
        echo "$existing_changelog" | jq "del(.\"$VERSION\")" > "$temp_file"
        existing_changelog=$(cat "$temp_file")
    fi
    
    # Добавляем новую версию с данными из DTO (формат: { "date": "...", "core": [...], "lib": [...] })
    # Объединяем существующий changelog с новой версией
    echo "$existing_changelog" | jq --arg version "$VERSION" --argjson version_data "$dto_json" \
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

