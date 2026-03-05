# release_sync

Скрипт обновляет клиентские зависимости Plasma и может создать Merge Request в GitLab.

## Быстрый запуск

```bash
ruby scripts/release_sync/release_sync.rb
```

Режимы:

- `third-party` (по умолчанию): обновляет `upload_list.sh` и скачивает zip-артефакты.
- `mono`: обновляет только YAML-файл зависимостей.
- без `--mode`: скрипт запускает подряд оба flow (`third-party`, затем `mono`).

## Токен GitLab

Обязательно перед запуском:

```bash
export GITLAB_TOKEN="glpat-..."
```

Опционально:

```bash
export GITHUB_TOKEN="ghp_..."
```

## Help

Подробная русская справка:

```bash
ruby scripts/release_sync/release_sync.rb --help
```

В help есть:

- как запускать скрипт;
- какие параметры доступны;
- что такое `GITLAB_TOKEN`;
- где лежит кэш настроек.

## Кэш настроек

По умолчанию:

`~/.plasma-release-sync.json`

Можно переопределить:

```bash
ruby scripts/release_sync/release_sync.rb --config-path /path/to/config.json
```

Скрипт сохраняет введенные настройки и использует их в следующих запусках.

## Совместимый запуск из scripts

```bash
ruby scripts/release_sync.rb
```
