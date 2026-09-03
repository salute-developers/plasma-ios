# CLAUDE.md — SDDSDemoApp

Демо-приложение / песочница компонентов. Два режима: общая песочница со всеми темами и
DS-изолированные схемы (одна схема = одна тема).

**Запуск, список схем, выбор DS и пошаговое подключение новой темы — [README.md](README.md).**

## Что нужно помнить агенту

- Требуются установленные iOS Simulator runtime и заранее собранные зависимости
  (`scripts/build_all_static_dependencies.sh`).
- DS-изолированные схемы завязаны на конкретную тему из `Themes/*` — тема должна быть
  сгенерирована и подключена.
- Выбор DS — через `SANDBOX_DS_PROFILE` и compile-флаги `SANDBOX_DS_*`; разбор профиля в
  `Common/Sandbox/SandboxDesignSystemProfile.swift`, регистрация в `SandboxBootstrap.swift`.
- Stories генерируются `scripts/generate_sandbox_stories.py` (он же в Build Phases) — новый
  экран без регистрации в песочнице не появится.
- Коммит-скоуп: `sdds-icore/sandbox`.
