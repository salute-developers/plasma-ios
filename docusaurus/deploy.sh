#!/bin/bash

# Универсальный скрипт для тестирования и деплоя документации Docusaurus
# Использование: 
#   ./deploy.sh [--local] [--s3] [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL] [--with-server] [--with-changelog]
#   ./deploy.sh [--local] [--s3] [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL] [S3_ACCESS_KEY_ID] [S3_SECRET_ACCESS_KEY] [S3_ENDPOINT] [S3_REGION] [S3_BUCKET] [--with-server] [--with-changelog]
# 
# S3 параметры можно передать либо как аргументы командной строки, либо через переменные окружения

set -e

# Параметры по умолчанию для S3
S3_ACCESS_KEY_ID=""
S3_SECRET_ACCESS_KEY=""
S3_ENDPOINT=""
S3_REGION=""
S3_BUCKET=""

# Флаги
DEPLOY_MODE="${DEPLOY_MODE:-local}"  # local или s3 (можно переопределить через переменную окружения)
WITH_SERVER=false
WITH_CHANGELOG=false
CUSTOM_DEPLOY_PATH=""
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
        --with-changelog)
            WITH_CHANGELOG=true
            ;;
        --deploy-path=*)
            CUSTOM_DEPLOY_PATH="${arg#*=}"
            ;;
        *)
            ARGS+=("$arg")
            ;;
    esac
done

# Функция для получения версии
get_version() {
    local artifact_id="$1"
    local version="$2"
    
    # Извлекаем версию из Xcode проекта темы
    # Убираем :tokens: префикс из artifact_id
    local clean_artifact_id="${artifact_id#:tokens:}"
    
    # Маппинг artifact_id -> название директории темы
    local theme_dir_name=""
    case "$clean_artifact_id" in
        "sddsserv-theme")
            theme_dir_name="SDDSservTheme"
            ;;
        "styles-salute-theme")
            theme_dir_name="StylesSaluteTheme"
            ;;
        "plasma-b2c-theme")
            theme_dir_name="PlasmaB2CTheme"
            ;;
        "plasma-home-ds-theme")
            theme_dir_name="PlasmaHomeDsTheme"
            ;;
        *)
            # Если тема не найдена в маппинге, пробуем найти по имени
            theme_dir_name=$(find "../Themes" -maxdepth 1 -type d -name "*${clean_artifact_id}*" -printf "%f\n" | head -1)
            ;;
    esac
    
    if [[ -n "$theme_dir_name" ]]; then
        local theme_dir="../Themes/$theme_dir_name"
        if [[ -d "$theme_dir" ]]; then
            # Ищем .xcodeproj файл в найденной директории темы
            local xcodeproj_file=$(find "$theme_dir" -name "*.xcodeproj" -type d | head -1)
            if [[ -n "$xcodeproj_file" ]]; then
                local project_file="$xcodeproj_file/project.pbxproj"
                if [[ -f "$project_file" ]]; then
                    local marketing_version=$(grep -o 'MARKETING_VERSION = [0-9]\+\.[0-9]\+\.[0-9]\+' "$project_file" | head -1 | sed 's/MARKETING_VERSION = //')
                    if [[ -n "$marketing_version" ]]; then
                        echo "$marketing_version"
                        return
                    fi
                fi
            fi
        fi
    fi
    
    # Fallback на переданную версию или значение по умолчанию
    echo "${version:-1.0.0}"
}

# Получаем параметры из аргументов или используем значения по умолчанию
ARTIFACT_ID="${ARGS[0]:-$DEFAULT_ARTIFACT_ID}"
VERSION_INPUT="${ARGS[1]:-${VERSION_INPUT:-$DEFAULT_VERSION}}"
BRANCH_NAME="${ARGS[2]:-$DEFAULT_BRANCH}"
TARGET_TYPE="${ARGS[3]:-$DEFAULT_TARGET_TYPE}"
THEME_NAME="${ARGS[4]:-$DEFAULT_THEME_NAME}"
CODE_REFERENCE="${ARGS[5]:-$DEFAULT_CODE_REFERENCE}"
DOCS_URL="${ARGS[6]:-$DEFAULT_DOCS_URL}"

# Получаем актуальную версию
VERSION=$(get_version "$ARTIFACT_ID" "$VERSION_INPUT")
echo "🔍 DEBUG: VERSION_INPUT='$VERSION_INPUT', VERSION='$VERSION'"

# Получаем S3 параметры из аргументов (если переданы)
if [[ ${#ARGS[@]} -ge 12 ]]; then
    S3_ACCESS_KEY_ID="${ARGS[7]:-}"
    S3_SECRET_ACCESS_KEY="${ARGS[8]:-}"
    S3_ENDPOINT="${ARGS[9]:-}"
    S3_REGION="${ARGS[10]:-}"
    S3_BUCKET="${ARGS[11]:-}"
    
    # Проверяем, что параметры не пустые (не просто пустые строки)
    if [[ -n "$S3_ACCESS_KEY_ID" ]] && [[ -n "$S3_SECRET_ACCESS_KEY" ]] && [[ -n "$S3_ENDPOINT" ]] && [[ -n "$S3_REGION" ]] && [[ -n "$S3_BUCKET" ]]; then
        echo "📋 Использую настройки S3 из параметров командной строки..."
    else
        echo "⚠️  S3 параметры из командной строки пустые, ищем альтернативы..."
        # Сбрасываем пустые параметры
        S3_ACCESS_KEY_ID=""
        S3_SECRET_ACCESS_KEY=""
        S3_ENDPOINT=""
        S3_REGION=""
        S3_BUCKET=""
    fi
fi

# Проверяем ограничения для S3 деплоя
if [[ "$DEPLOY_MODE" == "s3" ]]; then
    echo "🚀 Режим деплоя: S3"
    
    # Проверяем, что все S3 параметры доступны
    if [[ -z "$S3_ACCESS_KEY_ID" ]] || [[ -z "$S3_SECRET_ACCESS_KEY" ]] || [[ -z "$S3_ENDPOINT" ]] || [[ -z "$S3_REGION" ]] || [[ -z "$S3_BUCKET" ]]; then
        echo "❌ Не найдены полные настройки S3"
        echo "   Передайте S3 параметры в команду или установите переменные окружения:"
        echo "   S3_ACCESS_KEY_ID, S3_SECRET_ACCESS_KEY, S3_ENDPOINT, S3_REGION, S3_BUCKET"
        exit 1
    else
        echo "✅ S3 параметры найдены и готовы к использованию"
    fi
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
echo "  With Changelog: $WITH_CHANGELOG"
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

# Проверяем наличие release-changelog.md для автоматической генерации changelog
if [[ -f "../release-changelog.md" ]]; then
    echo "✅ Найден release-changelog.md, генерирую документацию с changelog"
    ./generate-docs.sh "$ARTIFACT_ID" "$VERSION" "$BRANCH_NAME" "$TARGET_TYPE" "$THEME_NAME" "$CODE_REFERENCE" "$DOCS_URL" --with-changelog
    WITH_CHANGELOG=true
elif [[ "$WITH_CHANGELOG" == true ]]; then
    echo "✅ Генерация с changelog (флаг --with-changelog)"
    ./generate-docs.sh "$ARTIFACT_ID" "$VERSION" "$BRANCH_NAME" "$TARGET_TYPE" "$THEME_NAME" "$CODE_REFERENCE" "$DOCS_URL" --with-changelog
else
    echo "ℹ️  Генерация без changelog"
    ./generate-docs.sh "$ARTIFACT_ID" "$VERSION" "$BRANCH_NAME" "$TARGET_TYPE" "$THEME_NAME" "$CODE_REFERENCE" "$DOCS_URL"
fi

if [[ -d "build/generated/docusaurus" ]]; then
    echo "✅ Генерация прошла успешно"
else
    echo "❌ Ошибка генерации"
    exit 1
fi

# Обновляем versionsArchived.json для конкретной темы
echo "📝 Обновление versionsArchived.json для темы $THEME_NAME..."

# Определяем путь к папке темы
case "$THEME_NAME" in
    "sddsserv")
        THEME_DIR="../Themes/SDDSservTheme"
        ;;
    "styles-salute")
        THEME_DIR="../Themes/StylesSaluteTheme"
        ;;
    "plasma-b2c")
        THEME_DIR="../Themes/PlasmaB2CTheme"
        ;;
    "plasma-homeds")
        THEME_DIR="../Themes/PlasmaHomeDSTheme"
        ;;
    *)
        echo "❌ Неизвестная тема: $THEME_NAME"
        exit 1
        ;;
esac

echo "🎯 Папка темы: $THEME_DIR"

# Переходим в папку темы и обновляем versionsArchived.json
cd "$THEME_DIR"
echo "🔍 DEBUG: Передаю VERSION='$VERSION' в docusaurus-bump.sh"
ARTIFACT_ID="$ARTIFACT_ID" VERSION="$VERSION" BRANCH_NAME="$BRANCH_NAME" TARGET_TYPE="$TARGET_TYPE" DOCS_URL="$DOCS_URL" ../../docusaurus/scripts/docusaurus-bump.sh bump
cd - > /dev/null

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
echo "🔍 Текущая директория: $(pwd)"
echo "🔍 Проверяем файл: docusaurus.config.ts"
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

# Создаем deploy.json для всех режимов
echo "📝 Создаю deploy.json..."
mkdir -p build/generated/docusaurus
if [[ "$DEPLOY_MODE" == "s3" ]]; then
    # Для S3 режима используем S3 URL
    cat > build/generated/docusaurus/deploy.json << EOF
{
  "deployUrl": "$S3_ENDPOINT/$S3_BUCKET/$DEPLOY_PATH"
}
EOF
else
    # Для локального режима используем локальный URL
    cat > build/generated/docusaurus/deploy.json << EOF
{
  "deployUrl": "http://localhost:3000"
}
EOF
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
    
    clean_artifact_id="${ARTIFACT_ID#:tokens:}"
    
    # Определяем путь для деплоя
    if [[ -n "$CUSTOM_DEPLOY_PATH" ]]; then
        DEPLOY_PATH="$CUSTOM_DEPLOY_PATH"
        echo "  Используется кастомный путь деплоя: $DEPLOY_PATH"
    elif [[ "$BRANCH_NAME" == "main" ]]; then
        DEPLOY_PATH="current/ios/$clean_artifact_id/$VERSION/"
    elif [[ "$BRANCH_NAME" == "develop" ]]; then
        DEPLOY_PATH="dev/ios/$clean_artifact_id/$VERSION/"
    else
        DEPLOY_PATH="pr/$BRANCH_NAME/ios/$clean_artifact_id/$VERSION/"
    fi
    
    echo "  Deploy Path: $DEPLOY_PATH"
    
    # Деплоим на S3
    echo "📤 Загружаю файлы на S3..."
    s3cmd sync build/ s3://$S3_BUCKET/$DEPLOY_PATH \
        --access_key="$S3_ACCESS_KEY_ID" \
        --secret_key="$S3_SECRET_ACCESS_KEY" \
        --host="$S3_ENDPOINT" \
        --host-bucket="$S3_ENDPOINT" \
        --bucket-location="$S3_REGION" \
        --signature-v2 \
        --delete-removed \
        --no-mime-magic \
        --acl-public \
        --recursive \
        --exclude=".DS_Store" \
        --exclude="*.log"
    
    # deploy.json уже создан выше
    
    cd ../..
    echo ""
    echo "✅ Деплой на S3 завершен успешно!"
    echo ""
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
echo "  # Локальное тестирование с changelog:"
echo "  ./deploy.sh --local --with-changelog"
echo ""
echo "  # Деплой на S3 (автоматический путь по ветке):"
echo "  ./deploy.sh --s3"
echo "  ./deploy.sh --s3 SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents"
echo ""
echo "  # Деплой на S3 с кастомным путем:"
echo "  ./deploy.sh --s3 --deploy-path=\"test/custom/path/\" SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents"
echo "  ./deploy.sh --s3 --deploy-path=\"experimental/ios/components/\" SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents"
echo ""
echo "  # Деплой на S3 с changelog:"
echo "  ./deploy.sh --s3 --with-changelog SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents"
echo ""
echo "  # Деплой на S3 с кастомными параметрами:"
echo "  ./deploy.sh --s3 styles-salute-theme 1.0.0-dev develop swiftui \"Styles Salute Theme\" StylesSaluteTheme"
echo ""
echo "  # Локальное тестирование с кастомными параметрами:"
echo "  ./deploy.sh --local SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents --with-server"
echo ""
echo "  # Локальное тестирование с changelog и сервером:"
echo "  ./deploy.sh --local --with-changelog --with-server SDDSComponents 1.0.0 test swiftui \"SDDS iOS Components\" SDDSComponents"
