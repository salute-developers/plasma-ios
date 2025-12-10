#!/bin/bash

# Скрипт для локального тестирования работы с changelog.json
# Имитирует работу GitHub CI workflow

set -e

# Цвета для вывода
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Локальное тестирование работы с changelog.json${NC}"
echo ""

# Проверяем, что мы в корне проекта
if [[ ! -d "docusaurus" ]] || [[ ! -d ".github" ]]; then
    echo -e "${RED}❌ Запустите скрипт из корня проекта plasma-ios${NC}"
    exit 1
fi

# Проверяем наличие файла с переменными окружения
ENV_FILE=".env.local"
if [[ ! -f "$ENV_FILE" ]]; then
    echo -e "${YELLOW}⚠️  Файл $ENV_FILE не найден${NC}"
    echo "Создаю шаблон файла..."
    cat > "$ENV_FILE" << 'EOF'
# S3 настройки (получите из GitHub Secrets)
S3_ACCESS_KEY_ID=your_access_key_here
S3_SECRET_ACCESS_KEY=your_secret_key_here
S3_ENDPOINT=your_endpoint_here
S3_REGION=your_region_here
S3_BUCKET=your_bucket_here

# Параметры деплоя
ARTIFACT_ID=:tokens:styles-salute-theme
VERSION_INPUT=1.0.0
BRANCH_NAME=main
TARGET_TYPE=swiftui
THEME_NAME=styles-salute
CODE_REFERENCE=StylesSaluteTheme
DOCS_URL=https://plasma.sberdevices.ru
EOF
    echo -e "${GREEN}✅ Создан файл $ENV_FILE${NC}"
    echo -e "${YELLOW}📝 Заполните его своими значениями и запустите скрипт снова${NC}"
    exit 0
fi

# Загружаем переменные окружения
echo "📋 Загружаю переменные из $ENV_FILE..."
source "$ENV_FILE"

# Проверяем обязательные переменные
REQUIRED_VARS=("S3_ACCESS_KEY_ID" "S3_SECRET_ACCESS_KEY" "S3_ENDPOINT" "S3_REGION" "S3_BUCKET")
MISSING_VARS=()

for var in "${REQUIRED_VARS[@]}"; do
    if [[ -z "${!var}" ]] || [[ "${!var}" == "your_*_here" ]]; then
        MISSING_VARS+=("$var")
    fi
done

if [[ ${#MISSING_VARS[@]} -gt 0 ]]; then
    echo -e "${RED}❌ Не заполнены обязательные переменные:${NC}"
    for var in "${MISSING_VARS[@]}"; do
        echo "  - $var"
    done
    echo ""
    echo "Отредактируйте файл $ENV_FILE"
    exit 1
fi

# Проверяем зависимости
echo "🔍 Проверка зависимостей..."
MISSING_DEPS=()

if ! command -v node &> /dev/null; then
    MISSING_DEPS+=("node")
fi

if ! command -v yarn &> /dev/null; then
    MISSING_DEPS+=("yarn")
fi

if ! command -v jq &> /dev/null; then
    MISSING_DEPS+=("jq")
fi

if ! command -v s3cmd &> /dev/null; then
    MISSING_DEPS+=("s3cmd")
fi

if [[ ${#MISSING_DEPS[@]} -gt 0 ]]; then
    echo -e "${YELLOW}⚠️  Отсутствуют зависимости: ${MISSING_DEPS[*]}${NC}"
    echo "Установите их:"
    echo "  brew install node yarn jq s3cmd"
    exit 1
fi

echo -e "${GREEN}✅ Все зависимости установлены${NC}"
echo ""

# Проверяем наличие release-changelog.json
if [[ ! -f "release-changelog.json" ]]; then
    echo -e "${YELLOW}⚠️  Файл release-changelog.json не найден${NC}"
    echo "Создаю тестовый файл..."
    cat > release-changelog.json << 'EOF'
{
  "sections": [
    {
      "h2": "SDDSComponents",
      "type": "common",
      "themes": ["styles-salute-theme", "sddsserv-theme", "plasma-b2c-theme", "plasma-homeds-theme"],
      "content": [
        {
          "h3": "Button",
          "items": ["Добавлена поддержка новых размеров кнопки"],
          "prs": ["https://github.com/org/repo/pull/123"]
        }
      ]
    }
  ],
  "themes": {
    "styles-salute-theme": {
      "sections": ["SDDSComponents"]
    }
  }
}
EOF
    echo -e "${GREEN}✅ Создан тестовый release-changelog.json${NC}"
    echo ""
fi

# Показываем параметры
echo "📋 Параметры запуска:"
echo "  Artifact ID: ${ARTIFACT_ID:-:tokens:styles-salute-theme}"
echo "  Version Input: ${VERSION_INPUT:-1.0.0}"
echo "  Branch: ${BRANCH_NAME:-main}"
echo "  Target Type: ${TARGET_TYPE:-swiftui}"
echo "  Theme Name: ${THEME_NAME:-styles-salute}"
echo "  Code Reference: ${CODE_REFERENCE:-StylesSaluteTheme}"
echo "  Docs URL: ${DOCS_URL:-https://plasma.sberdevices.ru}"
echo ""

# Спрашиваем подтверждение
read -p "Продолжить? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Отменено"
    exit 0
fi

# Переходим в директорию docusaurus
cd docusaurus

# Запускаем deploy.sh с параметрами
echo ""
echo -e "${GREEN}🚀 Запускаю deploy.sh...${NC}"
echo ""

./deploy.sh --s3 \
    "${ARTIFACT_ID:-:tokens:styles-salute-theme}" \
    "${VERSION_INPUT:-1.0.0}" \
    "${BRANCH_NAME:-main}" \
    "${TARGET_TYPE:-swiftui}" \
    "${THEME_NAME:-styles-salute}" \
    "${CODE_REFERENCE:-StylesSaluteTheme}" \
    "${DOCS_URL:-https://plasma.sberdevices.ru}" \
    "$S3_ACCESS_KEY_ID" \
    "$S3_SECRET_ACCESS_KEY" \
    "$S3_ENDPOINT" \
    "$S3_REGION" \
    "$S3_BUCKET"

echo ""
echo -e "${GREEN}✅ Тестирование завершено!${NC}"


