# Локальное тестирование changelog.json

Инструкция по локальному запуску скриптов работы с `changelog.json`, как в GitHub CI.

## Быстрый старт

1. **Создайте файл `.env.local` в корне проекта:**

```bash
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
```

2. **Заполните значения S3** (можно получить из GitHub Secrets или у администратора)

3. **Запустите скрипт:**

```bash
./scripts/test-changelog-local.sh
```

Скрипт автоматически:
- Проверит зависимости
- Создаст тестовый `release-changelog.json` если его нет
- Запустит полный цикл работы с changelog.json

## Установка зависимостей

Если у вас не установлены зависимости, установите их:

```bash
brew install node yarn jq s3cmd
```

## Ручной запуск

Если хотите запустить вручную, выполните:

```bash
cd docusaurus

./deploy.sh --s3 \
    ":tokens:styles-salute-theme" \
    "1.0.0" \
    "main" \
    "swiftui" \
    "styles-salute" \
    "StylesSaluteTheme" \
    "https://plasma.sberdevices.ru" \
    "$S3_ACCESS_KEY_ID" \
    "$S3_SECRET_ACCESS_KEY" \
    "$S3_ENDPOINT" \
    "$S3_REGION" \
    "$S3_BUCKET"
```

Или через переменные окружения:

```bash
export S3_ACCESS_KEY_ID="your_key"
export S3_SECRET_ACCESS_KEY="your_secret"
export S3_ENDPOINT="your_endpoint"
export S3_REGION="your_region"
export S3_BUCKET="your_bucket"

cd docusaurus
./deploy.sh --s3 \
    ":tokens:styles-salute-theme" \
    "1.0.0" \
    "main" \
    "swiftui" \
    "styles-salute" \
    "StylesSaluteTheme" \
    "https://plasma.sberdevices.ru"
```

## Тестирование отдельных скриптов

### 1. Синхронизация changelog.json с S3

```bash
cd docusaurus
./scripts/docusaurus-changelog-sync.sh \
    ":tokens:styles-salute-theme" \
    "1.0.0" \
    "main" \
    "swiftui" \
    "$S3_ACCESS_KEY_ID" \
    "$S3_SECRET_ACCESS_KEY" \
    "$S3_ENDPOINT" \
    "$S3_REGION" \
    "$S3_BUCKET" \
    "build"
```

### 2. Обновление changelog.json

```bash
cd docusaurus
./scripts/docusaurus-changelog-update.sh \
    ":tokens:styles-salute-theme" \
    "1.0.0" \
    "../release-changelog.json" \
    "build/changelog.json"
```

### 3. Деплой changelog.json на S3

```bash
cd docusaurus
./scripts/docusaurus-changelog-deploy.sh \
    ":tokens:styles-salute-theme" \
    "1.0.0" \
    "main" \
    "swiftui" \
    "$S3_ACCESS_KEY_ID" \
    "$S3_SECRET_ACCESS_KEY" \
    "$S3_ENDPOINT" \
    "$S3_REGION" \
    "$S3_BUCKET" \
    "build/changelog.json"
```

## Локальное тестирование без S3

Для тестирования без реального деплоя на S3, используйте локальный режим:

```bash
cd docusaurus
./deploy.sh --local \
    ":tokens:styles-salute-theme" \
    "1.0.0" \
    "main" \
    "swiftui" \
    "styles-salute" \
    "StylesSaluteTheme" \
    "https://plasma.sberdevices.ru" \
    --with-changelog
```

В этом режиме скрипты changelog не будут работать (требуется S3), но вы можете протестировать генерацию документации.

## Получение S3 credentials

S3 credentials можно получить:
1. Из GitHub Secrets (если у вас есть доступ к репозиторию)
2. У администратора проекта
3. Из настроек S3 хранилища

**Важно:** Не коммитьте файл `.env.local` в git! Он уже должен быть в `.gitignore`.

## Структура changelog.json

После работы скриптов, `changelog.json` будет иметь структуру:

```json
{
  "1.0.0": {
    "date": "2025-01-15",
    "data": {
      "sections": [...],
      "themes": {...}
    }
  },
  "1.1.0": {
    "date": "2025-02-20",
    "data": {...}
  }
}
```

## Отладка

Если что-то не работает:

1. **Проверьте переменные окружения:**
   ```bash
   echo $S3_ACCESS_KEY_ID
   echo $S3_BUCKET
   ```

2. **Проверьте доступ к S3:**
   ```bash
   s3cmd ls s3://$S3_BUCKET/ --access_key="$S3_ACCESS_KEY_ID" --secret_key="$S3_SECRET_ACCESS_KEY" --host="$S3_ENDPOINT"
   ```

3. **Проверьте логи скриптов:**
   Все скрипты выводят подробную информацию о своих действиях.

4. **Проверьте наличие файлов:**
   ```bash
   ls -la release-changelog.json
   ls -la docusaurus/build/changelog.json
   ```


