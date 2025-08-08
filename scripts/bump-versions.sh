#!/bin/bash

# Скрипт для автоматического повышения версий в .xcodeproj файлах
# Использование: ./scripts/bump-versions.sh [patch|minor|major] [changed_modules]
# Пример: ./scripts/bump-versions.sh minor "SDDSComponents Themes/PlasmaB2CTheme"

set -e

BUMP_TYPE=${1:-minor}
CHANGED_MODULES=${2:-""}

echo "Bumping versions with type: $BUMP_TYPE"
echo "Changed modules: $CHANGED_MODULES"

# Функция для повышения версии
bump_version() {
    local current_version=$1
    local bump_type=$2
    
    # Разбираем версию на компоненты
    IFS='.' read -r major minor patch <<< "$current_version"
    
    case "$bump_type" in
        major)
            echo "$((major + 1)).0.0"
            ;;
        minor)
            echo "${major}.$((minor + 1)).0"
            ;;
        patch)
            echo "${major}.${minor}.$((patch + 1))"
            ;;
        *)
            echo "Unknown bump type: $bump_type"
            exit 1
            ;;
    esac
}

# Функция для получения текущей версии из .xcodeproj файла
get_current_version() {
    local project_file=$1
    
    # Ищем MARKETING_VERSION в файле и берем все значения
    local versions=$(grep "MARKETING_VERSION = " "$project_file" | sed 's/.*MARKETING_VERSION = \([0-9.]*\);.*/\1/')
    
    if [[ -z "$versions" ]]; then
        echo "Error: Could not find MARKETING_VERSION in $project_file" >&2
        exit 1
    fi
    
    # Берем последнюю версию (обычно это основная версия проекта)
    local version=$(echo "$versions" | tail -1)
    
    echo "$version"
}

# Функция для обновления версии в .xcodeproj файле
update_version_in_project() {
    local project_file=$1
    local old_version=$2
    local new_version=$3
    
    echo "Updating $project_file: $old_version -> $new_version"
    sed -i '' "s/MARKETING_VERSION = $old_version;/MARKETING_VERSION = $new_version;/g" "$project_file"
}

# Функция для проверки, нужно ли обновлять модуль
should_update_module() {
    local module=$1
    local changed_modules=$2
    
    # Если список измененных модулей пустой, не обновляем ничего
    if [[ -z "$changed_modules" ]]; then
        return 1
    fi
    
    # Проверяем, есть ли модуль в списке измененных
    for changed_module in $changed_modules; do
        if [[ "$module" == "$changed_module" ]] || [[ "$module" == *"$changed_module"* ]]; then
            return 0
        fi
    done
    
    return 1
}

# Функция для получения всех тем из папки Themes
get_all_themes() {
    local themes=()
    
    # Ищем все папки в Themes, которые содержат .xcodeproj
    for theme_dir in Themes/*/; do
        if [[ -d "$theme_dir" ]]; then
            theme_name=$(basename "$theme_dir")
            project_file="${theme_dir}${theme_name}.xcodeproj/project.pbxproj"
            
            # Проверяем, что файл проекта существует
            if [[ -f "$project_file" ]]; then
                themes+=("Themes/$theme_name")
            fi
        fi
    done
    
    echo "${themes[@]}"
}

# Получаем все темы автоматически
ALL_THEMES=$(get_all_themes)
echo "Found themes: $ALL_THEMES"

# Создаем массивы для всех модулей
MODULES=("SDDSComponents" "SDDSThemeCore" "SDDSDemoApp")
PROJECTS=("SDDSComponents/SDDSComponents.xcodeproj/project.pbxproj" "SDDSThemeBuilder/SDDSThemeBuilder.xcodeproj/project.pbxproj" "SDDSDemoApp/SDDSDemoApp.xcodeproj/project.pbxproj")

# Добавляем темы в массивы
for theme in $ALL_THEMES; do
    theme_name=$(basename "$theme")
    project_file="${theme}/${theme_name}.xcodeproj/project.pbxproj"
    
    MODULES+=("$theme")
    PROJECTS+=("$project_file")
done

echo "Checking modules for updates..."

# Обновляем версии только для измененных модулей
for i in "${!MODULES[@]}"; do
    module=${MODULES[$i]}
    project_file=${PROJECTS[$i]}
    
    if should_update_module "$module" "$CHANGED_MODULES"; then
        echo "✅ Processing $module"
        
        # Получаем текущую версию
        current_version=$(get_current_version "$project_file")
        echo "  Current version: $current_version"
        
        # Вычисляем новую версию
        new_version=$(bump_version "$current_version" "$BUMP_TYPE")
        echo "  New version: $new_version"
        
        # Обновляем версию в проекте
        update_version_in_project "$project_file" "$current_version" "$new_version"
    else
        echo "⏭️ Skipping $module (no changes detected)"
    fi
done

echo "Version bump completed successfully!" 