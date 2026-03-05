# release_sync

Скрипт обновляет клиентские зависимости Plasma и может создать Merge Request в GitLab.

## Быстрый запуск

```bash
python3 scripts/release_sync/release_sync.py
```

Режимы:

- `third-party` (по умолчанию): обновляет `upload_list.sh` и скачивает zip-артефакты.
- `mono`: обновляет только YAML-файл зависимостей.

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
python3 scripts/release_sync/release_sync.py --help
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
python3 scripts/release_sync/release_sync.py --config-path /path/to/config.json
```

Скрипт сохраняет введенные настройки и использует их в следующих запусках.
