#!/bin/bash

# generate-summary.sh - Генерирует summary.json со всеми темами и их версиями
# Использование: ./generate-summary.sh [BRANCH_NAME] [DOCS_URL]

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

# Параметры
BRANCH_NAME="${1:-main}"
DOCS_URL="${2:-https://plasma.sberdevices.ru}"
SUMMARY_JSON_PATH="${3:-summary.json}"

# Маппинг названий тем (из deploy-changelog.sh)
get_theme_mapping() {
    local clean_artifact_id="$1"
    case "$clean_artifact_id" in
        "sddsserv-theme")
            echo "SDDSServTheme"
            ;;
        "styles-salute-theme")
            echo "StylesSaluteTheme"
            ;;
        "plasma-b2c-theme")
            echo "PlasmaB2CTheme"
            ;;
        "plasma-home-ds-theme")
            echo "PlasmaHomeDSTheme"
            ;;
        *)
            echo ""
            ;;
    esac
}

# Маппинг для summary.json (ключи в JSON)
get_summary_key() {
    local theme_dir_name="$1"
    case "$theme_dir_name" in
        "SDDSServTheme")
            echo "SDDSService"
            ;;
        "StylesSaluteTheme")
            echo "plasmaStylesSalute"
            ;;
        "PlasmaB2CTheme")
            echo "plasmaSDService"
            ;;
        "PlasmaHomeDSTheme")
            echo "plasmaHomeDS"
            ;;
        *)
            echo ""
            ;;
    esac
}

# Маппинг имени темы для URL (из deploy-changelog.sh)
get_theme_url_name() {
    local theme_dir_name="$1"
    case "$theme_dir_name" in
        "SDDSServTheme")
            echo "sddsserv-theme"
            ;;
        "StylesSaluteTheme")
            echo "styles-salute-theme"
            ;;
        "PlasmaB2CTheme")
            echo "plasma-b2c-theme"
            ;;
        "PlasmaHomeDSTheme")
            echo "plasma-home-ds-theme"
            ;;
        *)
            echo ""
            ;;
    esac
}

# Получение версии из project.pbxproj
get_version_from_project() {
    local project_file="$1"
    if [[ ! -f "$project_file" ]]; then
        echo ""
        return
    fi
    
    # Ищем MARKETING_VERSION и берем последнее значение
    local version=$(grep "MARKETING_VERSION = " "$project_file" | sed 's/.*MARKETING_VERSION = \([0-9.]*\);.*/\1/' | tail -1)
    echo "$version"
}

# Получение версии из versionsArchived.json (если есть)
get_version_from_archived() {
    local versions_file="$1"
    if [[ ! -f "$versions_file" ]] || ! command -v jq &> /dev/null; then
        echo ""
        return
    fi
    
    # Получаем последнюю версию (максимальную по сортировке версий)
    local version=$(jq -r 'keys[]' "$versions_file" 2>/dev/null | sort -V | tail -1)
    if [[ -z "$version" ]] || [[ "$version" == "null" ]]; then
        echo ""
    else
        echo "$version"
    fi
}

# Определение ветки для деплоя
get_deploy_branch() {
    local branch_name="$1"
    if [[ "$branch_name" == "main" ]]; then
        echo "current"
    elif [[ "$branch_name" == "develop" ]]; then
        echo "dev"
    else
        echo "pr/${branch_name,,}"
    fi
}

# Формирование URL для темы
get_theme_urls() {
    local theme_name="$1"
    local version="$2"
    local deploy_branch="$3"
    local summary_key="$4"
    
    local base_path
    local changelog_path
    
    # Для plasmaSDService (PlasmaB2CTheme) используем URL без версии
    if [[ "$summary_key" == "plasmaSDService" ]]; then
        if [[ "$deploy_branch" == "current" ]]; then
            base_path="/ios/${theme_name}"
        else
            base_path="/${deploy_branch}/ios/${theme_name}"
        fi
    else
        # Для остальных тем используем URL с версией
        if [[ "$deploy_branch" == "current" ]]; then
            base_path="/ios/${theme_name}/${version}"
        else
            base_path="/${deploy_branch}/ios/${theme_name}/${version}"
        fi
    fi
    
    if [[ "$deploy_branch" == "current" ]]; then
        changelog_path="/ios/${theme_name}/changelog.json"
    else
        changelog_path="/${deploy_branch}/ios/${theme_name}/changelog.json"
    fi
    
    echo "${DOCS_URL}${base_path}/"
    echo "${DOCS_URL}${base_path}/CHANGELOG/"
    echo "${DOCS_URL}${changelog_path}"
}

# Генерация summary.json
generate_summary_json() {
    log "Начинаю генерацию summary.json"
    
    local deploy_branch=$(get_deploy_branch "$BRANCH_NAME")
    log "Deploy branch: $deploy_branch"
    
    # Создаем временный файл для JSON
    local temp_file=$(mktemp)
    local summary_json="{}"
    
    # Сканируем все темы в Themes/
    local themes_dir="$SCRIPT_DIR/../../Themes"
    if [[ ! -d "$themes_dir" ]]; then
        error "Директория Themes не найдена: $themes_dir"
        exit 1
    fi
    
    log "Сканирую темы в $themes_dir"
    
    # Обрабатываем каждую тему
    for theme_dir in "$themes_dir"/*/; do
        if [[ ! -d "$theme_dir" ]]; then
            continue
        fi
        
        local theme_dir_name=$(basename "$theme_dir")
        log "Обрабатываю тему: $theme_dir_name"
        
        # Получаем ключ для summary.json
        local summary_key=$(get_summary_key "$theme_dir_name")
        if [[ -z "$summary_key" ]]; then
            warning "Неизвестная тема: $theme_dir_name, пропускаю"
            continue
        fi
        
        # Ищем project.pbxproj
        local project_file="${theme_dir}${theme_dir_name}.xcodeproj/project.pbxproj"
        local version=""
        
        # Пытаемся получить версию из versionsArchived.json (приоритет)
        local versions_file="${theme_dir}override-docs/versionsArchived.json"
        version=$(get_version_from_archived "$versions_file")
        
        # Если не нашли, берем из project.pbxproj
        if [[ -z "$version" ]]; then
            version=$(get_version_from_project "$project_file")
        fi
        
        if [[ -z "$version" ]]; then
            warning "Не удалось определить версию для $theme_dir_name, пропускаю"
            continue
        fi
        
        log "  Версия: $version"
        
        # Формируем имя темы для URL
        local theme_url_name=$(get_theme_url_name "$theme_dir_name")
        if [[ -z "$theme_url_name" ]]; then
            warning "Неизвестное имя темы для URL: $theme_dir_name"
            continue
        fi
        
        # Получаем URL (передаем summary_key для специальной обработки plasmaSDService)
        local urls=($(get_theme_urls "$theme_url_name" "$version" "$deploy_branch" "$summary_key"))
        local doc_url="${urls[0]}"
        local changelog_url="${urls[1]}"
        local changelog_data_url="${urls[2]}"
        
        log "  Documentation: $doc_url"
        log "  Changelog: $changelog_url"
        log "  ChangelogData: $changelog_data_url"
        
        # Добавляем запись в JSON
        if ! command -v jq &> /dev/null; then
            error "jq не установлен. Установите jq для работы с JSON"
            exit 1
        fi
        
        # Создаем JSON структуру для темы
        local theme_json=$(jq -n \
            --arg title "SwiftUI" \
            --arg version "$version" \
            --arg doc_href "$doc_url" \
            --arg changelog_href "$changelog_url" \
            --arg changelog_data_href "$changelog_data_url" \
            '{
                "swiftui": {
                    "title": $title,
                    "version": $version,
                    "links": {
                        "documentation": {
                            "href": $doc_href
                        },
                        "changelog": {
                            "href": $changelog_href
                        },
                        "changelogData": {
                            "href": $changelog_data_href
                        }
                    }
                }
            }')
        
        # Добавляем в общий JSON
        summary_json=$(echo "$summary_json" | jq --arg key "$summary_key" --argjson value "$theme_json" '. + {($key): $value}')
    done
    
    # Сохраняем в файл
    local output_path="$SCRIPT_DIR/../../$SUMMARY_JSON_PATH"
    echo "$summary_json" | jq '.' > "$output_path"
    
    success "summary.json успешно сгенерирован"
    log "Путь: $output_path"
    log "Содержимое:"
    cat "$output_path" | jq '.'
}

# Запуск генерации
generate_summary_json

success "Генерация summary.json завершена"

