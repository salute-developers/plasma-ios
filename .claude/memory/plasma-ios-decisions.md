---
name: plasma-ios-decisions
description: Ключевые архитектурные и процессные решения plasma-ios
metadata:
  type: project
---

Ключевые решения по проекту plasma-ios (дописывай при принятии новых).

**Архитектура тем — двухуровневая зависимость:**
- Токены темы (`Themes/*/Tokens`, `Fonts`, `Theme.swift`) зависят **только** от
  `SDDSThemeCore` (портируемое ядро, ~46 файлов, без внутренних зависимостей) — их можно
  бандлить standalone.
- Компоненты (appearance-вариации) зависят от всего `SDDSComponents` + `SDDSIcons` —
  отделяются тяжело.

**Генерация — источник истины не в сгенерированных файлах:**
- `Themes/*` и `SDDSIcons/Generated/*` — артефакты (Stencil / swiftgen). Правь
  токены-источник / шаблоны и регенерируй; ручные правки затрутся.
- Источник темы: локальная `.sdds/` (DS Builder CLI, `scripts/fetch_sdds.sh`) → fallback
  на zip-снапшот. Токены/палитра `.sdds/` в `.gitignore`, `config.json` трекается.

**Процесс:**
- Conventional Commits, скоуп = target (см. `CONTRIBUTING.md`). Без `Co-Authored-By`
  (форсится `.claude/settings.json`).
- GitFlow: `feature/` из `develop`; в `develop`/`main` не мержить без разрешения владельца.
- Spec-driven workflow для фич — **OpenSpec** (`@fission-ai/openspec`, слэш-команды
  `/opsx:*`, спеки в `openspec/`). Выбран как единственный spec-инструмент; spec-kit не
  используем (избегаем двух перекрывающихся систем).
- Локальный режим биллинга — см. [[local-mode-billing]].

**Как применять:** перед рефакторингом публичного appearance-API компонентов помни, что
это ломает сгенерированные `Themes/*` — регенерируй и проверяй сборку.
