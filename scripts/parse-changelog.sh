#!/bin/bash

# Скрипт для генерации changelog из JSON для конкретной библиотеки
# Использование: ./scripts/parse-changelog.sh [LIBRARY_NAME] [CHANGELOG_JSON_FILE] [OUTPUT_FILE]

set -e

# Параметры
LIBRARY_NAME="${1:-SDDSComponents}"
CHANGELOG_JSON_FILE="${2:-release-changelog.json}"
OUTPUT_FILE="${3:-}"

# Функция для нормализации имени библиотеки (приведение к формату JSON)
normalize_library_name() {
    local name="$1"
    # Убираем префикс :tokens: если есть
    name="${name#:tokens:}"
    
    # Маппинг имен библиотек к ключам в JSON
    case "$name" in
        "plasma-home-ds-theme")
            echo "plasma-homeds-theme"
            ;;
        "plasma-homeds-theme")
            echo "plasma-homeds-theme"
            ;;
        "sddsserv-theme")
            echo "sddsserv-theme"
            ;;
        "plasma-b2c-theme")
            echo "plasma-b2c-theme"
            ;;
        *)
            # Если не найдено в маппинге, возвращаем как есть
            echo "$name"
            ;;
    esac
}

# Нормализуем имя библиотеки
NORMALIZED_LIBRARY_NAME=$(normalize_library_name "$LIBRARY_NAME")

# Проверяем наличие jq
if ! command -v jq &> /dev/null; then
    echo "❌ jq не установлен. Установите jq для работы с JSON."
    exit 1
fi

# Проверяем наличие JSON файла
if [[ ! -f "$CHANGELOG_JSON_FILE" ]]; then
    echo "❌ JSON файл не найден: $CHANGELOG_JSON_FILE"
    exit 1
fi

echo "🔍 Генерация changelog для библиотеки: $LIBRARY_NAME (нормализовано: $NORMALIZED_LIBRARY_NAME)"
echo "📄 JSON файл: $CHANGELOG_JSON_FILE"

# Создаем временный файл для результата
TEMP_FILE=$(mktemp)
trap "rm -f $TEMP_FILE" EXIT

# Инициализируем выходной файл
echo "# Changelog for $LIBRARY_NAME" > "$TEMP_FILE"
echo "" >> "$TEMP_FILE"

# Получаем список секций для темы
sections=$(jq -r ".themes[\"$NORMALIZED_LIBRARY_NAME\"].sections[]?" "$CHANGELOG_JSON_FILE" 2>/dev/null)

if [[ -z "$sections" ]]; then
    echo "No changes found for $LIBRARY_NAME in this release." >> "$TEMP_FILE"
else
    # Обрабатываем каждую секцию
    for section in $sections; do
        # Получаем секцию из JSON
        section_json=$(jq -c ".sections[] | select(.h2 == \"$section\")" "$CHANGELOG_JSON_FILE" 2>/dev/null)
        
        if [[ -n "$section_json" ]]; then
            h2=$(echo "$section_json" | jq -r ".h2")
            echo "## $h2" >> "$TEMP_FILE"
            echo "" >> "$TEMP_FILE"
            
            # Обрабатываем каждый элемент контента
            echo "$section_json" | jq -r '.content[]? | 
                (if .h3 != null and .h3 != "" then "### \(.h3)\n" else "" end),
                (.items[]? // empty),
                (if .items != null and (.items | length) > 0 then "" else "" end),
                (.prs[]? // empty | "[PR](\(.))"),
                ""' >> "$TEMP_FILE"
        fi
    done
fi

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
