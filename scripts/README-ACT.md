# Локальный запуск GitHub Actions через act

`act` позволяет запускать GitHub Actions локально, используя Docker контейнеры.

## Быстрый старт

1. **Убедитесь, что Docker запущен:**
   ```bash
   docker info
   ```

2. **Создайте файл `.secrets` с вашими секретами:**
   ```bash
   ./scripts/run-act.sh
   ```
   Скрипт автоматически создаст шаблон, если файла нет.

3. **Заполните `.secrets`** значениями из GitHub Secrets

4. **Запустите workflow:**
   ```bash
   ./scripts/run-act.sh
   ```

## Ручной запуск

### Запуск конкретного workflow

```bash
# Запуск deploy-token-docs-common
act workflow_call \
  -W .github/workflows/deploy-token-docs-common.yml \
  --input modules='["styles-salute-theme"]' \
  --input ref='HEAD' \
  --input branch='main' \
  --secret-file .secrets \
  --container-architecture linux/amd64
```

### Запуск с конкретным job

```bash
# Запуск только job "changelog"
act workflow_call \
  -W .github/workflows/deploy-token-docs-common.yml \
  --job changelog \
  --input modules='["styles-salute-theme"]' \
  --input ref='HEAD' \
  --secret-file .secrets
```

### Запуск с переменными окружения

```bash
act workflow_call \
  -W .github/workflows/deploy-token-docs-common.yml \
  --input modules='["styles-salute-theme"]' \
  --input ref='HEAD' \
  --secret-file .secrets \
  --env ARTIFACT_ID=":tokens:styles-salute-theme" \
  --env BRANCH_NAME="main"
```

## Полезные команды act

### Просмотр доступных workflow

```bash
act -l
```

### Сухой прогон (dry-run)

```bash
act workflow_call \
  -W .github/workflows/deploy-token-docs-common.yml \
  --dryrun \
  --input modules='["styles-salute-theme"]' \
  --input ref='HEAD'
```

### Запуск с выводом в реальном времени

```bash
act workflow_call \
  -W .github/workflows/deploy-token-docs-common.yml \
  --input modules='["styles-salute-theme"]' \
  --input ref='HEAD' \
  --secret-file .secrets \
  --verbose
```

### Использование конкретного образа

```bash
act workflow_call \
  -W .github/workflows/deploy-token-docs-common.yml \
  -P ubuntu-latest=catthehacker/ubuntu:act-latest \
  --input modules='["styles-salute-theme"]' \
  --input ref='HEAD' \
  --secret-file .secrets
```

## Структура файла .secrets

```bash
# S3 настройки
S3_ACCESS_KEY_ID=your_key
S3_SECRET_ACCESS_KEY=your_secret
S3_ENDPOINT=your_endpoint
S3_REGION=your_region
S3_BUCKET=your_bucket

# Apple сертификаты (для iOS билдов)
BUILD_CERTIFICATE_BASE64=your_cert
P12_PASSWORD=your_password
BUILD_PROVISION_PROFILE_BASE64=your_profile
KEYCHAIN_PASSWORD=your_keychain_password

# GitHub токен
GH_TOKEN=your_github_token
```

## Ограничения act

1. **macOS runners**: act не поддерживает нативные macOS runners. Для iOS билдов может потребоваться реальный CI.

2. **Некоторые actions**: Не все GitHub Actions работают локально (особенно те, что требуют специфичные окружения).

3. **Docker**: Требуется запущенный Docker Desktop.

## Отладка

### Проблемы с Docker

```bash
# Проверка статуса Docker
docker info

# Перезапуск Docker
# (через Docker Desktop GUI)
```

### Проблемы с образами

```bash
# Просмотр загруженных образов
docker images | grep act

# Удаление старых образов
docker image prune -a
```

### Логи act

```bash
# Подробный вывод
act --verbose

# Сохранение логов
act workflow_call -W .github/workflows/deploy-token-docs-common.yml ... 2>&1 | tee act.log
```

## Примеры использования

### Тестирование changelog генерации

```bash
act workflow_dispatch \
  -W .github/workflows/generate-changelog.yml \
  --input tag_name='release-30-10-2025' \
  --input artifact_id='SDDSComponents' \
  --input version='1.0.0' \
  --secret-file .secrets \
  --job generate-changelog
```

### Тестирование деплоя документации

```bash
act workflow_call \
  -W .github/workflows/deploy-token-docs-common.yml \
  --input modules='["styles-salute-theme"]' \
  --input ref='HEAD' \
  --input branch='main' \
  --secret-file .secrets \
  --job deploy
```

## Альтернативы

Если act не подходит, можно использовать:

1. **Локальный запуск скриптов напрямую** (см. `scripts/test-changelog-local.sh`)
2. **GitHub Codespaces** для более точного воспроизведения CI окружения
3. **Docker Compose** для создания локального окружения

## Дополнительные ресурсы

- [Документация act](https://github.com/nektos/act)
- [GitHub Actions документация](https://docs.github.com/en/actions)


