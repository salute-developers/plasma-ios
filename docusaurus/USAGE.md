# Краткая справка по использованию скриптов Docusaurus

## Быстрый старт

### 1. Генерация документации

```bash
# Для sddsserv-theme (по умолчанию)
./docusaurus/generate-docs.sh

# Для Styles Salute Theme
./docusaurus/generate-docs.sh styles-salute-theme 1.0.0-test test swiftui styles-salute
```

### 2. Тестирование документации

```bash
# Быстрое тестирование (без сервера)
./docusaurus/test-docs.sh

# Тестирование с локальным сервером
./docusaurus/test-docs.sh --with-server

# Тестирование конкретной темы
./docusaurus/test-docs.sh styles-salute-theme 1.0.0-test test swiftui "Styles Salute Theme" StylesSaluteTheme --with-server
```

## Параметры

| Параметр | Описание | По умолчанию |
|----------|----------|--------------|
| `ARTIFACT_ID` | ID артефакта | `sddsserv-theme` |
| `VERSION` | Версия | `1.0.0-test` |
| `BRANCH` | Ветка | `test` |
| `TARGET_TYPE` | Тип цели | `swiftui` |
| `THEME_NAME` | Ключ темы | `sddsserv` |
| `CODE_REFERENCE` | Ссылка на код | Авто для известных тем |
| `DOCS_URL` | URL документации | `https://plasma.sberdevices.ru` |

## Примеры использования

### sddsserv-theme (по умолчанию)
```bash
./docusaurus/generate-docs.sh
./docusaurus/test-docs.sh
```

### SDDSComponents
```bash
./docusaurus/generate-docs.sh SDDSComponents 1.0.0-test test swiftui "SDDS iOS Components" SDDSComponents
./docusaurus/test-docs.sh SDDSComponents 1.0.0-test test swiftui "SDDS iOS Components" SDDSComponents
```

### Styles Salute Theme
```bash
./docusaurus/generate-docs.sh styles-salute-theme 1.0.0-test test swiftui "Styles Salute Theme" StylesSaluteTheme
./docusaurus/test-docs.sh styles-salute-theme 1.0.0-test test swiftui "Styles Salute Theme" StylesSaluteTheme
```

### Другая тема
```bash
./docusaurus/generate-docs.sh my-theme 2.0.0 main swiftui "My Theme" MyTheme
./docusaurus/test-docs.sh my-theme 2.0.0 main swiftui "My Theme" MyTheme --with-server
```

## Результат

После выполнения скриптов документация будет сгенерирована в `build/generated/docusaurus/`.

Для локального просмотра:
```bash
cd build/generated/docusaurus
yarn install
yarn start
```
