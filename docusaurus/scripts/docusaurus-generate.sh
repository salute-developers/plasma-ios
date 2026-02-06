#!/bin/bash

# docusaurusGenerate - Создает экземпляр Docusaurus из шаблонов

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

docusaurus_generate() {
    log "Начинаю генерацию экземпляра Docusaurus..."
    
    # Инициализация
    check_dependencies
    get_project_info
    
    # Корень репозитория и каталог сниппетов (единый для extract и replace)
    local repo_root
    repo_root=$(cd "$SCRIPT_DIR/../.." && pwd)
    export REPO_ROOT="$repo_root"
    SNIPPETS_DIR="${SNIPPETS_DIR:-$repo_root/docusaurus/build/docs}"
    mkdir -p "$SNIPPETS_DIR"
    
    # 1. Извлечь сниппеты из SDDSComponentsFixtures и (при THEME_NAME) из Themes/.../docs/Samples
    if [[ -f "$SCRIPT_DIR/extract-snippets.sh" ]]; then
        log "Извлечение Swift-сниппетов..."
        THEME_NAME="${THEME_NAME:-}" SNIPPETS_DIR="$SNIPPETS_DIR" bash "$SCRIPT_DIR/extract-snippets.sh"
    else
        warning "extract-snippets.sh не найден, подстановка @sample пропущена"
    fi
    
    # Определяем пути
    local template_root_dir="$SCRIPT_DIR/../"
    local destination_dir="$PWD/build/generated/docusaurus"
    local common_template="$template_root_dir/common-template"
    local swiftui_template="$template_root_dir/swiftui-template"
    local override_docs="$PWD/override-docs"
    
    # Создаем директорию назначения
    mkdir -p "$destination_dir"
    
    # Копируем common-template
    log "Копирование common-template..."
    cp -r "$common_template"/* "$destination_dir/"
    
    # Копируем swiftui-template
    log "Копирование swiftui-template..."
    cp -r "$swiftui_template"/* "$destination_dir/"
    
    # Копируем override-docs если существует (до transform, чтобы подстановки применились ко всем)
    if [[ -d "$override_docs" ]]; then
        log "Копирование override-docs..."
        cp -r "$override_docs"/* "$destination_dir/"
    fi
    
    # Мерж +*.md в соответствующие *.md
    if [[ -d "$destination_dir/docs" ]]; then
        merge_plus_prefixed_docs "$destination_dir/docs"
    fi
    
    # Копируем MD файлы из SDDSComponents (до transform, чтобы в них тоже подставились @sample)
    copy_component_docs "$destination_dir"
    
    # Преобразуем шаблоны (плейсхолдеры + подстановка // @sample: из SNIPPETS_DIR)
    transform_template "$destination_dir" "$SNIPPETS_DIR"
    
    success "Экземпляр Docusaurus создан в $destination_dir"
}

# Функция для копирования документации компонентов
copy_component_docs() {
    local destination_dir="$1"
    local components_docs_dir="$destination_dir/docs/components"
    
    log "Копирование документации компонентов из SDDSComponents..."
    
    # Создаем директорию для компонентов
    mkdir -p "$components_docs_dir"
    
    # Ищем все MD файлы в SDDSComponents
    local components_dir="$PWD/SDDSComponents/Sources/SDDSComponents/Components"
    
    if [[ -d "$components_dir" ]]; then
        find "$components_dir" -name "*.md" -type f | while read -r md_file; do
            # Получаем имя компонента из пути
            local component_name=$(basename "$(dirname "$md_file")")
            local filename=$(basename "$md_file")
            
            # Создаем имя файла для Docusaurus
            local docusaurus_filename="${component_name}Usage.md"
            
            # Копируем файл
            cp "$md_file" "$components_docs_dir/$docusaurus_filename"
            log "  Скопирован: $component_name -> $docusaurus_filename"
        done
    else
        warning "Директория SDDSComponents не найдена: $components_dir"
    fi
    
    success "Документация компонентов скопирована"
}

# Запуск функции генерации
docusaurus_generate
