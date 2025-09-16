# Краткая справка по использованию скриптов Docusaurus

## Быстрый старт

### 1. Генерация документации

```bash
# Для SDDSComponents (по умолчанию)
./docusaurus/generate-docs.sh

# Для Styles Salute Theme
./docusaurus/generate-docs.sh styles-salute-theme 1.0.0-test test swiftui "Styles Salute Theme" StylesSaluteTheme
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
| `ARTIFACT_ID` | ID артефакта | `SDDSServTheme` |
| `VERSION` | Версия | `1.0.0-test` |
| `BRANCH` | Ветка | `test` |
| `TARGET_TYPE` | Тип цели | `swiftui` |
| `THEME_NAME` | Название темы | `SDDS Serv Theme` |
| `CODE_REFERENCE` | Ссылка на код | `SDDSServTheme` |
| `DOCS_URL` | URL документации | `https://plasma.sberdevices.ru` |

## Примеры использования

### SDDSServTheme (по умолчанию)
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
