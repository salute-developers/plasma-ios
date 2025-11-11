#!/bin/bash

# Скрипт для парсинга changelog и извлечения секций для конкретной библиотеки
# Использование: ./scripts/parse-changelog.sh [LIBRARY_NAME] [CHANGELOG_FILE] [OUTPUT_FILE]

set -e

# Параметры
LIBRARY_NAME="${1:-SDDSComponents}"
CHANGELOG_FILE="${2:-release-changelog.md}"
OUTPUT_FILE="${3:-}"

# Проверяем наличие файла changelog
if [[ ! -f "$CHANGELOG_FILE" ]]; then
    echo "❌ Файл changelog не найден: $CHANGELOG_FILE"
    exit 1
fi

echo "🔍 Парсинг changelog для библиотеки: $LIBRARY_NAME"
echo "📄 Файл changelog: $CHANGELOG_FILE"

# Создаем временный файл для результата
TEMP_FILE=$(mktemp)
trap "rm -f $TEMP_FILE" EXIT

# Функция для проверки релевантности библиотеки
is_library_relevant() {
    local h3_title="$1"
    local line_content="$2"
    
    # Проверяем точное совпадение
    if [[ "$h3_title" == *"$LIBRARY_NAME"* ]]; then
        return 0
    fi
    
    # Маппинг названий тем (соответствует формату release notes)
    case "$LIBRARY_NAME" in
        "styles-salute-theme")
            if [[ "$h3_title" == *"styles-salute"* ]]; then
                return 0
            fi
            ;;
        "sddsserv-theme")
            if [[ "$h3_title" == *"sddsserv"* ]] || [[ "$h3_title" == *"SDDSComponents"* ]]; then
                return 0
            fi
            ;;
        "plasma-b2c-theme")
            if [[ "$h3_title" == *"plasma-b2c"* ]]; then
                return 0
            fi
            ;;
        "plasma-homeds-theme")
            if [[ "$h3_title" == *"plasma-home-ds"* ]]; then
                return 0
            fi
            ;;
    esac
    
    # Проверяем core библиотеки только для соответствующих библиотек
    if [[ "$LIBRARY_NAME" == *"SDDSComponents"* ]] || [[ "$LIBRARY_NAME" == *"Core"* ]]; then
        if [[ "$h3_title" == *"Core"* ]] || [[ "$h3_title" == *"SDDSComponents"* ]]; then
            return 0
        fi
    fi
    
    # Проверяем содержимое строки
    if [[ -n "$line_content" ]] && [[ "$line_content" == *"$LIBRARY_NAME"* ]]; then
        return 0
    fi
    
    return 1
}

# Функция для извлечения секций по библиотеке
extract_library_sections() {
    local library="$1"
    local changelog_file="$2"
    local output_file="$3"
    
    # Инициализируем выходной файл
    echo "# Changelog for $library" > "$output_file"
    echo "" >> "$output_file"
    
    # Флаги для отслеживания состояния
    local in_library_section=false
    local current_h2=""
    local current_h3=""
    local found_any_changes=false
    local current_section_lines=()
    
    # Читаем файл построчно
    while IFS= read -r line; do
        # H2 заголовки (названия тем/библиотек)
        if [[ "$line" =~ ^##[[:space:]]+(.+)$ ]]; then
            # Сохраняем предыдущую секцию если она была релевантной
            if [[ "$in_library_section" == true ]] && [[ ${#current_section_lines[@]} -gt 0 ]]; then
                printf '%s\n' "${current_section_lines[@]}" >> "$output_file"
                echo "" >> "$output_file"
                found_any_changes=true
            fi
            
            current_h2="${BASH_REMATCH[1]}"
            current_section_lines=("$line")
            
            # Проверяем релевантность
            if is_library_relevant "$current_h2" ""; then
                in_library_section=true
            else
                in_library_section=false
            fi
            
        # H3 заголовки (компоненты)
        elif [[ "$line" =~ ^###[[:space:]]+(.+)$ ]]; then
            # Добавляем к текущей секции
            current_section_lines+=("$line")
            
        # Обычные строки
        elif [[ "$in_library_section" == true ]]; then
            current_section_lines+=("$line")
            
        # Если мы еще не нашли изменений и это не заголовок
        elif [[ "$found_any_changes" == false ]] && [[ ! "$line" =~ ^# ]] && [[ -n "$line" ]]; then
            # Проверяем, есть ли упоминание библиотеки в содержимом
            if is_library_relevant "" "$line"; then
                if [[ -n "$current_h2" ]]; then
                    echo "## $current_h2" >> "$output_file"
                    echo "" >> "$output_file"
                fi
                echo "$line" >> "$output_file"
                echo "" >> "$output_file"
                found_any_changes=true
            fi
        fi
    done < "$changelog_file"
    
    # Сохраняем последнюю секцию если она была релевантной
    if [[ "$in_library_section" == true ]] && [[ ${#current_section_lines[@]} -gt 0 ]]; then
        if [[ "$found_any_changes" == false ]]; then
            echo "## $current_h2" >> "$output_file"
            echo "" >> "$output_file"
            found_any_changes=true
        fi
        printf '%s\n' "${current_section_lines[@]}" >> "$output_file"
        echo "" >> "$output_file"
    fi
    
    # Если не найдено изменений, добавляем сообщение
    if [[ "$found_any_changes" == false ]]; then
        echo "No changes found for $library in this release." >> "$output_file"
    fi
}

# Выполняем парсинг
extract_library_sections "$LIBRARY_NAME" "$CHANGELOG_FILE" "$TEMP_FILE"

# Выводим результат
echo "✅ Changelog для $LIBRARY_NAME извлечен:"
echo ""
cat "$TEMP_FILE"

# Сохраняем в файл если указан выходной файл
if [[ -n "$OUTPUT_FILE" ]]; then
    cp "$TEMP_FILE" "$OUTPUT_FILE"
    echo ""
    echo "💾 Результат сохранен в: $OUTPUT_FILE"
fi
