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
- Публикация релиза (с 2026-09-02) — один прогон `publish-release.yml` на `main`:
  `scripts/release/build_release.sh` → тег → draft-релиз → upload → снятие draft. Раннер
  `macos-26`, Xcode `26.6` закреплён явно (macos-latest потерял Xcode 16.x). Фан-аут через
  `repository_dispatch` (`release_components`, `publish-all-themes-release`, `release_all_frameworks`)
  удалён — он не публиковал ассеты никогда. `release_icons.yml` живёт: у иконок отдельный релиз
  по тегу `SDDSIcons-v*` (как на Android), в датный релиз `SDDSIcons.xcframework.zip` не кладём.
  Флоу иконок: PR «Release SDDSIcons-vX» с веба → мерж в main → `create_tag_release.yml` с тегом
  `SDDSIcons-vX.Y.Z` → `release_icons.yml` по тегу кладёт `SDDSIcons-vX.Y.Z.zip` → снять draft. Проверка воркфлоу с любой ветки — вход `dry_run`.
  Джоба идёт через окружение `release` (required reviewers: vkaltyrin, malilex, raininforest;
  достаточно одного), не `sdds` — `sdds` стоит на PR-сборках. Токен — `github.token`, PAT не нужен.
  Self-hosted раннер обсуждали и отложили (2026-09-02): публичный репо, риск чужих джоб.

**Как применять:** перед рефакторингом публичного appearance-API компонентов помни, что
это ломает сгенерированные `Themes/*` — регенерируй и проверяй сборку.
