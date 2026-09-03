# CLAUDE.md — Themes

Сгенерированные пакеты тем SDDS. Коммитятся в git.

**Полное описание, список тем, структура и регенерация — [README.md](README.md).**

## Что нужно помнить агенту

- **Файлы сгенерированы — руками не править.** Меняй токены-источник или Stencil-шаблоны и
  регенерируй, иначе правки затрутся.
- Зависимости двухуровневые: токены (`Tokens/`, `Fonts/`, `Theme.swift`) — только
  `SDDSThemeCore`; appearance-вариации — весь `SDDSComponents` и `SDDSIcons`.
- Изменение публичного appearance-API компонентов ломает эти пакеты — регенерируй после таких
  изменений (см. [../DesignSystemBuilder/CLAUDE.md](../DesignSystemBuilder/CLAUDE.md)).
- Имя каталога и имя модуля различаются (`SDDSservTheme/` → модуль `SDDSServTheme`).
- Коммит-скоуп: `sdds-ilibs/${libName}`.
