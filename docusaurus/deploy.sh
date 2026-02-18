#!/bin/bash

# Универсальный скрипт для тестирования и деплоя документации Docusaurus
# Использование: 
#   ./deploy.sh [--local] [--s3] [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL] [--with-server] [--with-changelog]
#   ./deploy.sh [--local] [--s3] [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL] [S3_ACCESS_KEY_ID] [S3_SECRET_ACCESS_KEY] [S3_ENDPOINT] [S3_REGION] [S3_BUCKET] [--with-server] [--with-changelog]
# 
# S3 параметры можно передать либо как аргументы командной строки, либо через переменные окружения

set -e

# Определяем директорию скрипта
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Параметры по умолчанию
DEFAULT_ARTIFACT_ID="${DEFAULT_ARTIFACT_ID:-sddsserv-theme}"
DEFAULT_VERSION="${DEFAULT_VERSION:-1.0.0-test}"
DEFAULT_BRANCH="${DEFAULT_BRANCH:-test}"
DEFAULT_TARGET_TYPE="${DEFAULT_TARGET_TYPE:-swiftui}"
DEFAULT_THEME_NAME="${DEFAULT_THEME_NAME:-sddsserv}"
DEFAULT_CODE_REFERENCE="${DEFAULT_CODE_REFERENCE:-}"
DEFAULT_DOCS_URL="${DEFAULT_DOCS_URL:-https://plasma.sberdevices.ru}"

resolve_theme_metadata() {
    local theme_name="$1"
    local artifact_id="$2"
    local theme_key="$theme_name"
    local clean_artifact_id="${artifact_id#:tokens:}"

    if [[ -z "$theme_key" ]]; then
        case "$clean_artifact_id" in
            "sddsserv-theme") theme_key="sddsserv" ;;
            "styles-salute-theme") theme_key="styles-salute" ;;
            "plasma-b2c-theme") theme_key="plasma-b2c" ;;
            "plasma-home-ds-theme") theme_key="plasma-homeds" ;;
        esac
    fi

    case "$theme_key" in
        "sddsserv") echo "sddsserv|SDDSServTheme" ;;
        "styles-salute") echo "styles-salute|StylesSaluteTheme" ;;
        "plasma-b2c") echo "plasma-b2c|PlasmaB2CTheme" ;;
        "plasma-homeds") echo "plasma-homeds|PlasmaHomeDSTheme" ;;
        *) echo "$theme_key|" ;;
    esac
}

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

# Функция для инкрементации minor версии (0.19.0 -> 0.20.0)
increment_minor_version() {
    local version="$1"
    if [[ "$version" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
        local major="${BASH_REMATCH[1]}"
        local minor="${BASH_REMATCH[2]}"
        minor=$((minor + 1))
        echo "${major}.${minor}.0"
    else
        echo "$version"
    fi
}

# Функция для получения версии
get_version() {
    local artifact_id="$1"
    local version_input="$2"
    
    # Если version_input уже является версией (формат X.Y.Z), используем её
    if [[ "$version_input" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "$version_input"
        return
    fi
    
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
            theme_dir_name="PlasmaHomeDSTheme"
            ;;
        *)
            # Если тема не найдена в маппинге, пробуем найти по имени
            theme_dir_name=$(find "../Themes" -maxdepth 1 -type d -name "*${clean_artifact_id}*" -printf "%f\n" | head -1)
            ;;
    esac
    
    if [[ -n "$theme_dir_name" ]]; then
        local theme_dir="../Themes/$theme_dir_name"
        if [[ -d "$theme_dir" ]]; then
            # Сначала пытаемся получить последнюю версию из versionsArchived.json
            local versions_file="$theme_dir/override-docs/versionsArchived.json"
            if [[ -f "$versions_file" ]] && command -v jq &> /dev/null; then
                # Получаем все версии и находим максимальную (правильная сортировка версий)
                # Используем сортировку версий через sort -V (version sort)
                local last_version=$(jq -r 'keys[]' "$versions_file" 2>/dev/null | sort -V | tail -1)
                if [[ -n "$last_version" ]] && [[ "$last_version" != "null" ]] && [[ "$last_version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
                    # Инкрементируем minor версию (0.19.0 -> 0.20.0)
                    local new_version=$(increment_minor_version "$last_version")
                    echo "🔍 DEBUG: Найдена последняя версия в versionsArchived.json: $last_version, инкрементирую до: $new_version" >&2
                    echo "$new_version"
                    return
                else
                    echo "⚠️  DEBUG: Не удалось получить версию из versionsArchived.json или формат неверный" >&2
                fi
            else
                echo "🔍 DEBUG: Файл versionsArchived.json не найден или jq не установлен, пробую Xcode проект" >&2
            fi
            
            # Fallback: извлекаем версию из Xcode проекта темы на момент тега
            # Ищем .xcodeproj файл в найденной директории темы
            local xcodeproj_file=$(find "$theme_dir" -name "*.xcodeproj" -type d | head -1)
            if [[ -n "$xcodeproj_file" ]]; then
                local project_file="$xcodeproj_file/project.pbxproj"
                
                # Если version_input является тегом, пытаемся получить файл из тега через git show
                local project_content=""
                if [[ "$version_input" =~ ^release- ]] && git rev-parse --verify "$version_input" >/dev/null 2>&1; then
                    # Получаем файл из тега через git show
                    local relative_project_file="${project_file#../}"
                    echo "🔍 DEBUG: Получаю версию из тега $version_input, файл: $relative_project_file" >&2
                    project_content=$(git show "$version_input:$relative_project_file" 2>/dev/null || echo "")
                fi
                
                # Если не получилось из тега или файл существует локально, читаем локальный файл
                if [[ -z "$project_content" ]] && [[ -f "$project_file" ]]; then
                    echo "🔍 DEBUG: Читаю версию из локального файла: $project_file" >&2
                    project_content=$(cat "$project_file" 2>/dev/null || echo "")
                fi
                
                if [[ -n "$project_content" ]]; then
                    local marketing_version=$(echo "$project_content" | grep -o 'MARKETING_VERSION = [0-9]\+\.[0-9]\+\.[0-9]\+' | head -1 | sed 's/MARKETING_VERSION = //')
                    if [[ -n "$marketing_version" ]]; then
                        echo "🔍 DEBUG: Найдена версия в Xcode проекте: $marketing_version" >&2
                        echo "$marketing_version"
                        return
                    else
                        echo "⚠️  DEBUG: Версия не найдена в содержимом проекта" >&2
                    fi
                else
                    echo "⚠️  DEBUG: Не удалось получить содержимое файла проекта" >&2
                fi
            else
                echo "⚠️  DEBUG: .xcodeproj файл не найден в $theme_dir" >&2
            fi
        else
            echo "⚠️  DEBUG: Директория темы не найдена: $theme_dir" >&2
        fi
    else
        echo "⚠️  DEBUG: theme_dir_name не определен для $clean_artifact_id" >&2
    fi
    
    # Fallback на переданную версию или значение по умолчанию
    echo "${version_input:-1.0.0}"
}

# Получаем параметры из аргументов или используем значения по умолчанию
ARTIFACT_ID="${ARGS[0]:-$DEFAULT_ARTIFACT_ID}"
VERSION_INPUT="${ARGS[1]:-${VERSION_INPUT:-$DEFAULT_VERSION}}"
BRANCH_NAME="${ARGS[2]:-$DEFAULT_BRANCH}"
TARGET_TYPE="${ARGS[3]:-$DEFAULT_TARGET_TYPE}"
THEME_NAME="${ARGS[4]:-$DEFAULT_THEME_NAME}"
CODE_REFERENCE="${ARGS[5]:-$DEFAULT_CODE_REFERENCE}"
DOCS_URL="${ARGS[6]:-$DEFAULT_DOCS_URL}"

THEME_METADATA="$(resolve_theme_metadata "$THEME_NAME" "$ARTIFACT_ID")"
RESOLVED_THEME_NAME="$(echo "$THEME_METADATA" | cut -d'|' -f1)"
RESOLVED_CODE_REFERENCE="$(echo "$THEME_METADATA" | cut -d'|' -f2)"

if [[ -n "$RESOLVED_THEME_NAME" ]]; then
    THEME_NAME="$RESOLVED_THEME_NAME"
fi

if [[ -z "$CODE_REFERENCE" ]] && [[ -n "$RESOLVED_CODE_REFERENCE" ]]; then
    CODE_REFERENCE="$RESOLVED_CODE_REFERENCE"
fi

if [[ -z "$CODE_REFERENCE" ]]; then
    echo "❌ CODE_REFERENCE не определен. Передайте параметр [CODE_REFERENCE] или используйте известную тему."
    exit 1
fi

# Получаем актуальную версию
VERSION=$(get_version "$ARTIFACT_ID" "$VERSION_INPUT")
echo "🔍 DEBUG: VERSION_INPUT='$VERSION_INPUT', VERSION='$VERSION'"
echo "🔍 DEBUG: Текущий git ref: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || git describe --tags --exact-match HEAD 2>/dev/null || echo 'unknown')"
echo "🔍 DEBUG: Текущий git commit: $(git rev-parse HEAD 2>/dev/null || echo 'unknown')"

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
    echo "🔍 Размер файла release-changelog.md: $(wc -c < ../release-changelog.md) байт"
    echo "🔍 Первые 500 строк markdown:"
    head -500 ../release-changelog.md || echo "Файл пуст или нечитаем"
    echo ""
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

# Работа с changelog.json (аналог Android: changelogSync, generateChangelog, changelogDeploy)
if [[ "$DEPLOY_MODE" == "s3" ]] && [[ -n "$S3_ACCESS_KEY_ID" ]] && [[ -n "$S3_SECRET_ACCESS_KEY" ]]; then
    echo "📋 Работа с changelog.json..."
    
    # 1. Синхронизация: загружаем существующий changelog.json с S3
    if [[ -f "../release-changelog.json" ]]; then
        echo "🔄 Синхронизация changelog.json с S3..."
        "$SCRIPT_DIR/scripts/docusaurus-changelog-sync.sh" \
            "$ARTIFACT_ID" \
            "$VERSION" \
            "$BRANCH_NAME" \
            "$TARGET_TYPE" \
            "$S3_ACCESS_KEY_ID" \
            "$S3_SECRET_ACCESS_KEY" \
            "$S3_ENDPOINT" \
            "$S3_REGION" \
            "$S3_BUCKET" \
            "build" || echo "⚠️  Ошибка при синхронизации changelog.json, продолжаю..."
        
        # 2. Обновление: добавляем новую версию в changelog.json
        echo "📝 Обновление changelog.json с версией $VERSION..."
        "$SCRIPT_DIR/scripts/docusaurus-changelog-update.sh" \
            "$ARTIFACT_ID" \
            "$VERSION" \
            "../release-changelog.md" \
            "build/changelog.json" \
            "sdds-uikit" || echo "⚠️  Ошибка при обновлении changelog.json, продолжаю..."
    else
        echo "ℹ️  release-changelog.json не найден, пропускаю обновление changelog.json"
    fi
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
    # Примечание: Деплой changelog.json выполняется отдельным шагом в workflow (как на Android)
    
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
