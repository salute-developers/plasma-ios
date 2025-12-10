#!/bin/bash

# Скрипт для запуска GitHub Actions локально через act

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}🚀 Запуск GitHub Actions локально через act${NC}"
echo ""

# Проверяем наличие act
if ! command -v act &> /dev/null; then
    echo -e "${RED}❌ act не установлен${NC}"
    echo "Установите: brew install act"
    exit 1
fi

# Проверяем наличие Docker
if ! command -v docker &> /dev/null; then
    echo -e "${RED}❌ Docker не установлен${NC}"
    exit 1
fi

if ! docker info &> /dev/null; then
    echo -e "${RED}❌ Docker не запущен${NC}"
    echo "Запустите Docker Desktop"
    exit 1
fi

# Проверяем наличие файла с секретами
SECRETS_FILE=".secrets"
if [[ ! -f "$SECRETS_FILE" ]]; then
    echo -e "${YELLOW}⚠️  Файл $SECRETS_FILE не найден${NC}"
    echo "Создаю шаблон..."
    cat > "$SECRETS_FILE" << 'EOF'
# GitHub Secrets для локального запуска через act
# Получите значения из GitHub Secrets или у администратора

S3_ACCESS_KEY_ID=your_access_key_here
S3_SECRET_ACCESS_KEY=your_secret_key_here
S3_ENDPOINT=your_endpoint_here
S3_REGION=your_region_here
S3_BUCKET=your_bucket_here

BUILD_CERTIFICATE_BASE64=your_certificate_here
P12_PASSWORD=your_password_here
BUILD_PROVISION_PROFILE_BASE64=your_profile_here
KEYCHAIN_PASSWORD=your_keychain_password_here

GH_TOKEN=your_github_token_here
EOF
    echo -e "${GREEN}✅ Создан файл $SECRETS_FILE${NC}"
    echo -e "${YELLOW}📝 Заполните его своими значениями и запустите скрипт снова${NC}"
    exit 0
fi

# Показываем доступные workflow
echo -e "${BLUE}📋 Доступные workflow:${NC}"
echo "  1. deploy-token-docs-common.yml"
echo "  2. generate-changelog.yml"
echo ""

# Выбираем workflow
read -p "Выберите workflow (1-2) или введите путь к workflow файлу: " choice

case "$choice" in
    1)
        WORKFLOW=".github/workflows/deploy-token-docs-common.yml"
        echo ""
        echo -e "${BLUE}📝 Параметры для deploy-token-docs-common:${NC}"
        read -p "  modules (JSON array, например [\"styles-salute-theme\"]): " modules
        read -p "  ref (тег или коммит, например release-30-10-2025): " ref
        read -p "  branch (опционально): " branch
        read -p "  custom_deploy_path (опционально): " custom_path
        
        modules="${modules:-[\"styles-salute-theme\"]}"
        ref="${ref:-HEAD}"
        
        ACT_CMD="act workflow_call"
        ACT_CMD="$ACT_CMD -W $WORKFLOW"
        ACT_CMD="$ACT_CMD --input modules='$modules'"
        ACT_CMD="$ACT_CMD --input ref='$ref'"
        
        if [[ -n "$branch" ]]; then
            ACT_CMD="$ACT_CMD --input branch='$branch'"
        fi
        
        if [[ -n "$custom_path" ]]; then
            ACT_CMD="$ACT_CMD --input custom_deploy_path='$custom_path'"
        fi
        ;;
    2)
        WORKFLOW=".github/workflows/generate-changelog.yml"
        echo ""
        echo -e "${BLUE}📝 Параметры для generate-changelog:${NC}"
        read -p "  tag_name (например release-30-10-2025): " tag_name
        read -p "  artifact_id (по умолчанию SDDSComponents): " artifact_id
        read -p "  version (по умолчанию 1.0.0): " version
        read -p "  target_type (по умолчанию swiftui): " target_type
        read -p "  theme_name (по умолчанию SDDS iOS Components): " theme_name
        read -p "  code_reference (по умолчанию SDDSComponents): " code_reference
        
        tag_name="${tag_name:-release-30-10-2025}"
        artifact_id="${artifact_id:-SDDSComponents}"
        version="${version:-1.0.0}"
        target_type="${target_type:-swiftui}"
        theme_name="${theme_name:-SDDS iOS Components}"
        code_reference="${code_reference:-SDDSComponents}"
        
        ACT_CMD="act workflow_dispatch"
        ACT_CMD="$ACT_CMD -W $WORKFLOW"
        ACT_CMD="$ACT_CMD --input tag_name='$tag_name'"
        ACT_CMD="$ACT_CMD --input artifact_id='$artifact_id'"
        ACT_CMD="$ACT_CMD --input version='$version'"
        ACT_CMD="$ACT_CMD --input target_type='$target_type'"
        ACT_CMD="$ACT_CMD --input theme_name='$theme_name'"
        ACT_CMD="$ACT_CMD --input code_reference='$code_reference'"
        ;;
    *)
        if [[ -f "$choice" ]]; then
            WORKFLOW="$choice"
            ACT_CMD="act -W $WORKFLOW"
        else
            echo -e "${RED}❌ Неверный выбор или файл не найден${NC}"
            exit 1
        fi
        ;;
esac

# Добавляем секреты
ACT_CMD="$ACT_CMD --secret-file $SECRETS_FILE"

# Добавляем флаги
ACT_CMD="$ACT_CMD --container-architecture linux/amd64"  # Для macOS используем amd64
ACT_CMD="$ACT_CMD --verbose"

# Показываем команду
echo ""
echo -e "${BLUE}🔧 Команда для выполнения:${NC}"
echo "$ACT_CMD"
echo ""

# Спрашиваем подтверждение
read -p "Продолжить? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Отменено"
    exit 0
fi

# Запускаем
echo ""
echo -e "${GREEN}🚀 Запускаю act...${NC}"
echo ""

eval $ACT_CMD


