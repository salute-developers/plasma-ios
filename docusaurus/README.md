# Документация Docusaurus для iOS

Этот репозиторий содержит универсальные скрипты для генерации и тестирования документации Docusaurus для различных тем iOS.

## Скрипты

### 1. `generate-docs.sh` - Генерация документации

Универсальный скрипт для генерации документации Docusaurus для любой темы.

#### Использование

```bash
./docusaurus/generate-docs.sh [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL]
```

#### Параметры

- `ARTIFACT_ID` - ID артефакта (по умолчанию: `SDDSServTheme`)
- `VERSION` - Версия (по умолчанию: `1.0.0-test`)
- `BRANCH` - Ветка (по умолчанию: `test`)
- `TARGET_TYPE` - Тип цели (по умолчанию: `swiftui`)
- `THEME_NAME` - Название темы (по умолчанию: `SDDS Serv Theme`)
- `CODE_REFERENCE` - Ссылка на код (по умолчанию: `SDDSServTheme`)
- `DOCS_URL` - URL документации (по умолчанию: `https://plasma.sberdevices.ru`)

#### Примеры

```bash
# Для SDDSServTheme (по умолчанию)
./docusaurus/generate-docs.sh

# Для Styles Salute Theme
./docusaurus/generate-docs.sh styles-salute-theme 1.0.0-test test swiftui "Styles Salute Theme" StylesSaluteTheme

# Для другой темы
./docusaurus/generate-docs.sh my-theme 2.0.0 main swiftui "My Theme" MyTheme
```

### 2. `test-docs.sh` - Тестирование документации

Универсальный скрипт для тестирования сгенерированной документации.

#### Использование

```bash
./docusaurus/test-docs.sh [ARTIFACT_ID] [VERSION] [BRANCH] [TARGET_TYPE] [THEME_NAME] [CODE_REFERENCE] [DOCS_URL] [--with-server]
```

#### Параметры

Те же, что и для `generate-docs.sh`, плюс:
- `--with-server` - Запустить локальный сервер для тестирования

#### Примеры

```bash
# Быстрое тестирование (без сервера)
./docusaurus/test-docs.sh

# Тестирование с локальным сервером
./docusaurus/test-docs.sh --with-server

# Тестирование конкретной темы с сервером
./docusaurus/test-docs.sh styles-salute-theme 1.0.0-test test swiftui "Styles Salute Theme" StylesSaluteTheme --with-server
```

## Структура

```
docusaurus/
├── common-template/          # Общие шаблоны
├── swiftui-template/         # SwiftUI-специфичные шаблоны
├── generate-docs.sh          # Универсальный скрипт генерации
├── test-docs.sh             # Универсальный скрипт тестирования
└── README.md                # Этот файл
```

## Зависимости

- Node.js
- Yarn
- jq (для тестирования)
- curl (для тестирования с сервером)

## Результат

После выполнения скриптов документация будет сгенерирована в директории `build/generated/docusaurus/`.

Для локального просмотра:

```bash
cd build/generated/docusaurus
yarn install
yarn start
```

## Особенности

- Автоматическое исправление MDX ошибок
- Поддержка различных тем и конфигураций
- Универсальные параметры для любых проектов
- Проверка структуры и валидности документации
- Опциональное тестирование с локальным сервером