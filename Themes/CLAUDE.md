# CLAUDE.md — Themes

Сгенерированные пакеты тем SDDS. Каждая папка — отдельная тема, собранная CLI
`DesignSystemBuilder` из токенов и палитры. Содержимое **коммитится** в git (в отличие от
эфемерной `.sdds/`).

## Темы

- `PlasmaB2CTheme/`
- `PlasmaHomeDSTheme/`
- `SDDSservTheme/`

Внутри темы — сгенерированные Swift-файлы: `Tokens/` (цвета, типографика, тени, формы,
отступы, градиенты), `Fonts/`, `Theme.swift`, плюс appearance-вариации компонентов.

## Зависимости (двухуровневые)

- **Токены** (`Tokens/`, `Fonts/`, `Theme.swift`) зависят **только** от `SDDSThemeCore` —
  самодостаточны, бандлятся отдельно.
- **Компоненты** (appearance-вариации) зависят от всего `SDDSComponents` и `SDDSIcons`.

## Как регенерировать

Через CLI `DesignSystemBuilder` (одна тема) или конвейер `scripts/generate_themes/` +
`scripts/create_project/` (все темы + Xcode-проекты). См.
[../DesignSystemBuilder/CLAUDE.md](../DesignSystemBuilder/CLAUDE.md) и
[../scripts/CLAUDE.md](../scripts/CLAUDE.md).

## Грабли

- **Файлы сгенерированы — руками не править.** Меняй токены-источник / Stencil-шаблоны и
  регенерируй, иначе правки затрутся.
- Изменение публичного appearance-API компонентов ломает эти пакеты — регенерируй после
  таких изменений.
- Коммит-скоуп: `sdds-ilibs/${libName}` (библиотека вертикали).
