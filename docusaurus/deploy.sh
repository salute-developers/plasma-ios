#!/bin/bash

# Универсальный скрипт для тестирования и деплоя документации Docusaurus
# Использование: 
#   ./deploy.sh [--local] [--s3] [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [--with-server]

set -e

# Загружаем настройки из файла конфигурации
CONFIG_FILE="deploy.env"
if [[ -f "$CONFIG_FILE" ]]; then
    echo "📋 Загружаю настройки из $CONFIG_FILE..."
    source "$CONFIG_FILE"
else
    echo "❌ Файл конфигурации $CONFIG_FILE не найден"
    echo "   Создайте файл $CONFIG_FILE с настройками деплоя"
    exit 1
fi

# S3 настройки (из файла конфигурации)
S3_BUCKET="$AWS_S3_BUCKET"
S3_ENDPOINT="$AWS_ENDPOINT"
S3_REGION="$AWS_REGION"

# Флаги
DEPLOY_MODE="local"  # local или s3
WITH_SERVER=false
ARGS=()

# Парсим аргументы
for arg in "$@"; do
    case $arg in
        --local)
            DEPLOY_MODE="local"
            ;;
        --s3)
            DEPLOY_MODE="s3"
            ;;
        --with-server)
            WITH_SERVER=true
            ;;
        *)
            ARGS+=("$arg")
            ;;
    esac
done

# Получаем параметры из аргументов или используем значения по умолчанию
ARTIFACT_ID="${ARGS[0]:-$DEFAULT_ARTIFACT_ID}"
VERSION="${ARGS[1]:-$DEFAULT_VERSION}"
BRANCH_NAME="${ARGS[2]:-$DEFAULT_BRANCH}"
TARGET_TYPE="${ARGS[3]:-$DEFAULT_TARGET_TYPE}"
THEME_NAME="${ARGS[4]:-$DEFAULT_THEME_NAME}"
CODE_REFERENCE="${ARGS[5]:-$DEFAULT_CODE_REFERENCE}"
DOCS_URL="${ARGS[6]:-$DEFAULT_DOCS_URL}"

# Проверяем ограничения для S3 деплоя
if [[ "$DEPLOY_MODE" == "s3" ]]; then
    echo "🚀 Режим деплоя: S3"
else
    echo "🧪 Режим деплоя: Локальный тест"
fi

echo ""
echo "📋 Параметры:"
echo "  Artifact ID: $ARTIFACT_ID"
echo "  Version: $VERSION"
echo "  Branch: $BRANCH_NAME"
echo "  Target Type: $TARGET_TYPE"
echo "  Theme Name: $THEME_NAME"
echo "  Code Reference: $CODE_REFERENCE"
echo "  Docs URL: $DOCS_URL"
echo "  With Server: $WITH_SERVER"
echo ""

# Проверяем зависимости
echo "🔍 Проверка зависимостей..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js не установлен"
    exit 1
fi

if ! command -v yarn &> /dev/null; then
    echo "❌ Yarn не установлен"
    exit 1
fi

if ! command -v jq &> /dev/null; then
    echo "❌ jq не установлен"
    exit 1
fi

if [[ "$DEPLOY_MODE" == "s3" ]]; then
    if ! command -v s3cmd &> /dev/null; then
        echo "❌ s3cmd не установлен. Устанавливаю через Homebrew..."
        brew install s3cmd
    fi
fi

if [[ "$WITH_SERVER" == true ]]; then
    if ! command -v curl &> /dev/null; then
        echo "❌ curl не установлен"
        exit 1
    fi
fi

echo "✅ Все зависимости установлены"
echo ""

# Генерируем документацию
echo "🔧 Генерация документации..."
./generate-docs.sh "$ARTIFACT_ID" "$VERSION" "$BRANCH_NAME" "$TARGET_TYPE" "$THEME_NAME" "$CODE_REFERENCE" "$DOCS_URL"

if [[ -d "build/generated/docusaurus" ]]; then
    echo "✅ Генерация прошла успешно"
else
    echo "❌ Ошибка генерации"
    exit 1
fi
echo ""

# Тестируем сборку
echo "🔨 Тестирование сборки документации..."
cd build/generated/docusaurus
yarn install --silent
yarn build

if [[ -d "build" ]]; then
    echo "✅ Сборка прошла успешно"
else
    echo "❌ Ошибка сборки"
    exit 1
fi
echo ""

# Проверяем структуру сгенерированной документации
echo "📁 Проверка структуры документации..."
if [[ -f "docusaurus.config.ts" ]]; then
    echo "✅ Конфигурация Docusaurus найдена"
else
    echo "❌ Конфигурация Docusaurus не найдена"
    exit 1
fi

if [[ -f "package.json" ]]; then
    echo "✅ package.json найден"
else
    echo "❌ package.json не найден"
    exit 1
fi

if [[ -d "docs" ]]; then
    echo "✅ Директория docs найдена"
    doc_count=$(find docs -name "*.md" | wc -l)
    echo "  📄 Найдено $doc_count MD файлов"
else
    echo "❌ Директория docs не найдена"
    exit 1
fi

if [[ -d "docs/components" ]]; then
    echo "✅ Директория компонентов найдена"
    component_count=$(find docs/components -name "*.md" | wc -l)
    echo "  🧩 Найдено $component_count компонентов"
else
    echo "❌ Директория компонентов не найдена"
    exit 1
fi

if [[ -d "docs/theme" ]]; then
    echo "✅ Директория темы найдена"
    theme_count=$(find docs/theme -name "*.md" | wc -l)
    echo "  🎨 Найдено $theme_count файлов темы"
else
    echo "❌ Директория темы не найдена"
    exit 1
fi

# Локальный запуск или деплой на S3
if [[ "$DEPLOY_MODE" == "local" ]]; then
    # Локальный режим - тестируем запуск если требуется
    if [[ "$WITH_SERVER" == true ]]; then
        echo ""
        echo "🌐 Тестирование локального запуска документации..."
        echo "  Запускаю локальный сервер для проверки..."
        
        # Запускаем сервер в фоновом режиме
        yarn start > /dev/null 2>&1 &
        SERVER_PID=$!
        
        # Функция для очистки при выходе
        cleanup() {
            echo "  Останавливаю тестовый сервер..."
            kill $SERVER_PID 2>/dev/null || true
            wait $SERVER_PID 2>/dev/null || true
        }
        
        # Устанавливаем trap для очистки при выходе
        trap cleanup EXIT
        
        # Ждем, пока сервер запустится (максимум 30 секунд)
        echo "  Ожидание запуска сервера..."
        for i in {1..30}; do
            if curl -s http://localhost:3000 > /dev/null 2>&1; then
                echo "✅ Локальный сервер запустился успешно"
                echo "  📱 Документация доступна по адресу: http://localhost:3000"
                echo "  ⏱️  Сервер будет работать 3 секунды для проверки..."
                sleep 3
                echo "✅ Тестирование сервера завершено успешно"
                break
            fi
            
            if ! kill -0 $SERVER_PID 2>/dev/null; then
                echo "❌ Сервер завершился с ошибкой"
                exit 1
            fi
            
            sleep 1
        done
    fi
    
    cd ../..
    echo ""
    echo "🎉 Локальное тестирование прошло успешно!"
    echo ""
    echo "📁 Результаты:"
    echo "  - Документация сгенерирована: build/generated/docusaurus/"
    echo "  - Собранные артефакты: build/generated/docusaurus/build/"
    echo ""
    echo "🚀 Для локального просмотра выполните:"
    echo "  cd build/generated/docusaurus && yarn install && yarn start"
    
else
    # S3 режим - деплоим на S3
    echo ""
    echo "☁️  Деплой на S3..."
    
    # Определяем путь для деплоя
    if [[ "$BRANCH_NAME" == "main" ]]; then
        DEPLOY_PATH="current/ios/$ARTIFACT_ID/$VERSION/CHANGELOG/"
    elif [[ "$BRANCH_NAME" == "develop" ]]; then
        DEPLOY_PATH="dev/ios/$ARTIFACT_ID/$VERSION/"
    else
        DEPLOY_PATH="pr/$BRANCH_NAME/ios/$ARTIFACT_ID/$VERSION/"
    fi
    
    echo "  Deploy Path: $DEPLOY_PATH"
    
    # Настраиваем s3cmd если нужно
    if [[ ! -f ~/.s3cfg ]]; then
        echo "🔧 Настраиваю s3cmd..."
        cat > ~/.s3cfg << EOF
[default]
access_key = $AWS_ACCESS_KEY_ID
secret_key = $AWS_SECRET_ACCESS_KEY
host_base = $S3_HOST_BASE
host_bucket = $S3_HOST_BUCKET
use_https = $S3_USE_HTTPS
bucket_location = $S3_BUCKET_LOCATION
signature_v2 = $S3_SIGNATURE_V2
EOF
    fi
    
    # Деплоим на S3
    echo "📤 Загружаю файлы на S3..."
    s3cmd sync build/ s3://$S3_BUCKET/$DEPLOY_PATH \
        --delete-removed \
        --acl-public \
        --recursive \
        --exclude=".DS_Store" \
        --exclude="*.log"
    
    cd ../..
    echo ""
    echo "✅ Деплой на S3 завершен успешно!"
    echo "🌐 Документация доступна по адресу:"
    echo "   $S3_ENDPOINT/$S3_BUCKET/$DEPLOY_PATH"
fi

echo ""
echo "📖 Примеры использования:"
echo ""
echo "  # Локальное тестирование (по умолчанию):"
echo "  ./deploy.sh"
echo "  ./deploy.sh --local"
echo ""
echo "  # Локальное тестирование с сервером:"
echo "  ./deploy.sh --local --with-server"
echo ""
echo "  # Деплой на S3:"
echo "  ./deploy.sh --s3"
echo "  ./deploy.sh --s3 SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents"
echo ""
echo "  # Деплой на S3 с кастомными параметрами:"
echo "  ./deploy.sh --s3 styles-salute-theme 1.0.0-dev develop swiftui \"Styles Salute Theme\" StylesSaluteTheme"
echo ""
echo "  # Локальное тестирование с кастомными параметрами:"
echo "  ./deploy.sh --local SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents --with-server"
