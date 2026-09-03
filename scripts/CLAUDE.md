# CLAUDE.md — scripts

Сборочные, релизные и генерационные скрипты. Общие хелперы — `common.rb`.

**Полный каталог скриптов с описаниями — [README.md](README.md).**

## Что нужно помнить агенту

- Скрипты рассчитаны на запуск **из корня репозитория** (пути относительные).
- Ruby-зависимости — через Bundler (`Gemfile`) плюс отдельно `gem install xcodeproj json`.
- `.sdds/`-данные эфемерны и в git не коммитятся, кроме `config.json`.
- Список путей в `package_sources.sh` держи синхронным с `App.sourcesRootURL`
  (см. [../DesignSystemBuilder/CLAUDE.md](../DesignSystemBuilder/CLAUDE.md)) — иначе
  standalone-режим не соберётся у клиента.
- `fetch_sdds.sh` зовёт **внешний** Kotlin/Native `dsbuilder`, не наш бинарник того же имени.
- Коммит-скоуп изменений в сборке: `sdds-ios/build-system`.
