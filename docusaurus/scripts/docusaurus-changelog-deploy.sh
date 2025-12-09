#!/bin/bash

# docusaurus-changelog-deploy - Загружает changelog.json на S3
# Аналог gradle задачи changelogDeploy из Android проекта

set -e

# Подключаем общие функции
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/docusaurus.sh"

# Параметры
ARTIFACT_ID="${1:-}"
VERSION="${2:-}"
BRANCH_NAME="${3:-main}"
TARGET_TYPE="${4:-swiftui}"
S3_ACCESS_KEY_ID="${5:-}"
S3_SECRET_ACCESS_KEY="${6:-}"
S3_ENDPOINT="${7:-}"
S3_REGION="${8:-}"
S3_BUCKET="${9:-}"
CHANGELOG_JSON_PATH="${10:-build/changelog.json}"

# Функция для определения URL changelog.json на S3
get_changelog_url() {
    local artifact_id="$1"
    local branch_name="$2"
    local target_type="$3"
    
    # Убираем :tokens: префикс если есть
    local clean_artifact_id="${artifact_id#:tokens:}"
    
    # Определяем ветку для деплоя
    local deploy_branch
    if [[ "$branch_name" == "main" ]]; then
        deploy_branch="current"
    elif [[ "$branch_name" == "develop" ]]; then
        deploy_branch="dev"
    else
        deploy_branch="pr/${branch_name,,}"
    fi
    
    # Формируем путь к changelog.json (без версии, как в Android)
    if [[ "$artifact_id" == *":tokens:"* ]]; then
        # Для тем: /deploy-branch/ios/theme-name/changelog.json
        if [[ "$deploy_branch" == "current" ]]; then
            echo "ios/${clean_artifact_id}/changelog.json"
        else
            echo "${deploy_branch}/ios/${clean_artifact_id}/changelog.json"
        fi
    else
        # Для компонентов: /deploy-branch/target-type/artifact-id/changelog.json
        echo "${deploy_branch}/${target_type}/${clean_artifact_id}/changelog.json"
    fi
}

# Функция для загрузки changelog.json на S3
docusaurus_changelog_deploy() {
    log "Начинаю деплой changelog.json на S3"
    
    # Проверяем наличие changelog.json
    if [[ ! -f "$CHANGELOG_JSON_PATH" ]]; then
        warning "Файл changelog.json не найден: $CHANGELOG_JSON_PATH"
        warning "Пропускаю деплой changelog.json"
        return 0
    fi
    
    # Проверяем наличие всех необходимых параметров
    if [[ -z "$ARTIFACT_ID" ]] || [[ -z "$S3_ACCESS_KEY_ID" ]] || [[ -z "$S3_SECRET_ACCESS_KEY" ]] || \
       [[ -z "$S3_ENDPOINT" ]] || [[ -z "$S3_REGION" ]] || [[ -z "$S3_BUCKET" ]]; then
        warning "Не все параметры S3 указаны. Пропускаю деплой changelog.json"
        return 0
    fi
    
    # Проверяем наличие s3cmd
    if ! command -v s3cmd &> /dev/null; then
        error "s3cmd не установлен. Установите s3cmd для работы с S3"
        exit 1
    fi
    
    # Определяем URL changelog.json на S3
    local changelog_url=$(get_changelog_url "$ARTIFACT_ID" "$BRANCH_NAME" "$TARGET_TYPE")
    log "URL changelog.json на S3: $changelog_url"
    
    # Загружаем changelog.json на S3
    log "Загружаю changelog.json на S3..."
    if s3cmd put "$CHANGELOG_JSON_PATH" "s3://$S3_BUCKET/$changelog_url" \
        --access_key="$S3_ACCESS_KEY_ID" \
        --secret_key="$S3_SECRET_ACCESS_KEY" \
        --host="$S3_ENDPOINT" \
        --host-bucket="$S3_ENDPOINT" \
        --bucket-location="$S3_REGION" \
        --signature-v2 \
        --no-mime-magic \
        --acl-public; then
        success "changelog.json успешно загружен на S3"
        log "URL на S3: s3://$S3_BUCKET/$changelog_url"
    else
        error "Ошибка при загрузке changelog.json на S3"
        exit 1
    fi
}

# Запуск функции деплоя
docusaurus_changelog_deploy

success "Деплой changelog.json завершен"

