#!/bin/bash

# docusaurus-generate-changelog - Генерирует changelog для конкретной библиотеки
# Аналог gradle задачи generateChangelog из Android проекта

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

# Параметры
ARTIFACT_ID="${1:-SDDSComponents}"
RELEASE_CHANGELOG_PATH="${2:-release-changelog.md}"
OUTPUT_CHANGELOG_PATH="${3:-docs/CHANGELOG.md}"
LIBRARY_CHANGELOG_JSON_PATH="${4:-override-docs/changelog.json}"

docusaurus_generate_changelog() {
    log "Начинаю генерацию changelog для библиотеки: $ARTIFACT_ID"
    
    # Проверяем наличие файла release-changelog.md
    if [[ ! -f "$RELEASE_CHANGELOG_PATH" ]]; then
        warning "Файл release-changelog.md не найден: $RELEASE_CHANGELOG_PATH"
        warning "Пропускаем генерацию changelog"
        return 0
    fi
    
    log "Найден файл release-changelog.md"
    
    # Создаем директорию для выходного файла
    local output_dir=$(dirname "$OUTPUT_CHANGELOG_PATH")
    mkdir -p "$output_dir"
    
    # Создаем директорию для JSON файла
    local json_dir=$(dirname "$LIBRARY_CHANGELOG_JSON_PATH")
    mkdir -p "$json_dir"
    
    # Генерируем changelog для данной библиотеки
    log "Парсинг changelog для $ARTIFACT_ID..."
    
    # Используем существующий скрипт parse-changelog.sh
    if [[ -f "$SCRIPT_DIR/../scripts/parse-changelog.sh" ]]; then
        "$SCRIPT_DIR/../scripts/parse-changelog.sh" "$ARTIFACT_ID" "$RELEASE_CHANGELOG_PATH" "$OUTPUT_CHANGELOG_PATH"
        
        if [[ -f "$OUTPUT_CHANGELOG_PATH" ]]; then
            success "Changelog сгенерирован: $OUTPUT_CHANGELOG_PATH"
            
            # Создаем JSON файл с метаданными (аналог Android)
            create_changelog_json "$ARTIFACT_ID" "$OUTPUT_CHANGELOG_PATH" "$LIBRARY_CHANGELOG_JSON_PATH"
        else
            warning "Changelog не был сгенерирован"
        fi
    else
        error "Скрипт parse-changelog.sh не найден"
        return 1
    fi
}

# Функция для создания JSON файла с метаданными changelog
create_changelog_json() {
    local artifact_id="$1"
    local changelog_path="$2"
    local json_path="$3"
    
    log "Создание JSON файла с метаданными changelog..."
    
    # Получаем информацию о changelog
    local changelog_size=$(wc -c < "$changelog_path" 2>/dev/null || echo "0")
    local changelog_lines=$(wc -l < "$changelog_path" 2>/dev/null || echo "0")
    local last_modified=$(date -r "$changelog_path" "+%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date "+%Y-%m-%dT%H:%M:%SZ")
    
    # Создаем JSON структуру
    cat > "$json_path" << EOF
{
  "artifact_id": "$artifact_id",
  "changelog_path": "$changelog_path",
  "generated_at": "$(date "+%Y-%m-%dT%H:%M:%SZ")",
  "file_size": $changelog_size,
  "line_count": $changelog_lines,
  "last_modified": "$last_modified",
  "version": "1.0.0"
}
EOF
    
    success "JSON файл создан: $json_path"
}

# Функция для проверки релевантности библиотеки (улучшенная версия)
is_library_relevant() {
    local h3_title="$1"
    local line_content="$2"
    local artifact_id="$3"
    
    # Проверяем точное совпадение
    if [[ "$h3_title" == *"$artifact_id"* ]]; then
        return 0
    fi
    
    # Проверяем core библиотеки
    if [[ "$h3_title" == *"Core"* ]] || [[ "$h3_title" == *"SDDS"* ]]; then
        return 0
    fi
    
    # Проверяем содержимое строки
    if [[ -n "$line_content" ]] && [[ "$line_content" == *"$artifact_id"* ]]; then
        return 0
    fi
    
    if [[ -n "$line_content" ]] && [[ "$line_content" == *"SDDS"* ]]; then
        return 0
    fi
    
    return 1
}

# Функция для группировки изменений по компонентам (аналог ChangelogUtils.kt)
group_changes_by_components() {
    local changelog_file="$1"
    local output_file="$2"
    local artifact_id="$3"
    
    log "Группировка изменений по компонентам..."
    
    # Создаем временный файл для результата
    local temp_file=$(mktemp)
    trap "rm -f $temp_file" EXIT
    
    # Инициализируем выходной файл
    echo "# Changelog for $artifact_id" > "$temp_file"
    echo "" >> "$temp_file"
    
    # Флаги для отслеживания состояния
    local in_library_section=false
    local current_h2=""
    local current_h3=""
    local found_any_changes=false
    local current_section_lines=()
    local components=()
    
    # Читаем файл построчно
    while IFS= read -r line; do
        # H2 заголовки (основные категории)
        if [[ "$line" =~ ^##[[:space:]]+(.+)$ ]]; then
            # Сохраняем предыдущую секцию если она была релевантной
            if [[ "$in_library_section" == true ]] && [[ ${#current_section_lines[@]} -gt 0 ]]; then
                if [[ "$found_any_changes" == false ]]; then
                    echo "## $current_h2" >> "$temp_file"
                    echo "" >> "$temp_file"
                    found_any_changes=true
                fi
                printf '%s\n' "${current_section_lines[@]}" >> "$temp_file"
                echo "" >> "$temp_file"
            fi
            
            current_h2="${BASH_REMATCH[1]}"
            in_library_section=false
            current_h3=""
            current_section_lines=()
            
        # H3 заголовки (компоненты/библиотеки)
        elif [[ "$line" =~ ^###[[:space:]]+(.+)$ ]]; then
            # Сохраняем предыдущую секцию если она была релевантной
            if [[ "$in_library_section" == true ]] && [[ ${#current_section_lines[@]} -gt 0 ]]; then
                if [[ "$found_any_changes" == false ]]; then
                    echo "## $current_h2" >> "$temp_file"
                    echo "" >> "$temp_file"
                    found_any_changes=true
                fi
                printf '%s\n' "${current_section_lines[@]}" >> "$temp_file"
                echo "" >> "$temp_file"
            fi
            
            current_h3="${BASH_REMATCH[1]}"
            current_section_lines=("$line")
            
            # Проверяем релевантность
            if is_library_relevant "$current_h3" "" "$artifact_id"; then
                in_library_section=true
                components+=("$current_h3")
            else
                in_library_section=false
            fi
            
        # Обычные строки
        elif [[ "$in_library_section" == true ]]; then
            current_section_lines+=("$line")
            
        # Если мы еще не нашли изменений и это не заголовок
        elif [[ "$found_any_changes" == false ]] && [[ ! "$line" =~ ^# ]] && [[ -n "$line" ]]; then
            # Проверяем, есть ли упоминание библиотеки в содержимом
            if is_library_relevant "" "$line" "$artifact_id"; then
                if [[ -n "$current_h2" ]]; then
                    echo "## $current_h2" >> "$temp_file"
                    echo "" >> "$temp_file"
                fi
                echo "$line" >> "$temp_file"
                echo "" >> "$temp_file"
                found_any_changes=true
            fi
        fi
    done < "$changelog_file"
    
    # Сохраняем последнюю секцию если она была релевантной
    if [[ "$in_library_section" == true ]] && [[ ${#current_section_lines[@]} -gt 0 ]]; then
        if [[ "$found_any_changes" == false ]]; then
            echo "## $current_h2" >> "$temp_file"
            echo "" >> "$temp_file"
            found_any_changes=true
        fi
        printf '%s\n' "${current_section_lines[@]}" >> "$temp_file"
        echo "" >> "$temp_file"
    fi
    
    # Если не найдено изменений, добавляем сообщение
    if [[ "$found_any_changes" == false ]]; then
        echo "No changes found for $artifact_id in this release." >> "$temp_file"
    fi
    
    # Копируем результат в выходной файл
    cp "$temp_file" "$output_file"
    
    # Выводим информацию о найденных компонентах
    if [[ ${#components[@]} -gt 0 ]]; then
        log "Найдены изменения для компонентов: ${components[*]}"
    fi
}

# Запуск функции генерации
docusaurus_generate_changelog

success "Генерация changelog завершена для $ARTIFACT_ID"
