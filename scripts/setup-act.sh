#!/bin/bash

# Скрипт для установки и настройки act (локальный GitHub Actions runner)

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}🚀 Установка act для локального запуска GitHub Actions${NC}"
echo ""

# Проверяем наличие Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${RED}❌ Homebrew не установлен${NC}"
    echo "Установите Homebrew: https://brew.sh"
    exit 1
fi

# Проверяем наличие Docker
if ! command -v docker &> /dev/null; then
    echo -e "${YELLOW}⚠️  Docker не установлен${NC}"
    echo "Устанавливаю Docker Desktop..."
    echo "Скачайте и установите Docker Desktop: https://www.docker.com/products/docker-desktop"
    echo "После установки запустите Docker Desktop и повторите скрипт"
    exit 1
fi

# Проверяем, запущен ли Docker
if ! docker info &> /dev/null; then
    echo -e "${RED}❌ Docker не запущен${NC}"
    echo "Запустите Docker Desktop и повторите скрипт"
    exit 1
fi

# Устанавливаем act
if command -v act &> /dev/null; then
    echo -e "${GREEN}✅ act уже установлен${NC}"
    act --version
else
    echo "📦 Устанавливаю act..."
    brew install act
fi

echo ""
echo -e "${GREEN}✅ Установка завершена!${NC}"
echo ""
echo "📋 Следующие шаги:"
echo "  1. Создайте файл .secrets с вашими секретами (см. .secrets.example)"
echo "  2. Запустите: ./scripts/run-act.sh"
echo ""


