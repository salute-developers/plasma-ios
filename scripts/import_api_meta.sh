#!/usr/bin/env bash
#
# Регистрирует версию iOS Core в DS Builder: отправляет ios-api-meta.json
# через `dsbuilder components import-api` с координатами Core и каналом.
#
# Версию и канал скрипт не угадывает: DS Builder хранит релиз Core неизменяемым
# по координатам libraryId/platform/version, поэтому их задают явно.
#
# Использование:
#   scripts/import_api_meta.sh --core-version 0.34.0 --channel stable            # план, ничего не пишется
#   scripts/import_api_meta.sh --core-version 0.34.0 --channel stable --apply    # запись
#   scripts/import_api_meta.sh --core-version 0.35.0-dev.1 --channel dev --apply --regenerate
#
# Опции:
#   --core-version <v>   версия SDDSComponents, из которой собрана мета (обязательна)
#   --channel stable|dev канал Core (обязателен)
#   --apply              записать релиз; без флага выполняется dry run
#   --regenerate         перед отправкой пересобрать мету scripts/generate_api_meta.sh
#   --meta <path>        другой файл меты (по умолчанию DesignSystemBuilder/.sdds/ios-api-meta.json)
#
# Нужны внешний `dsbuilder` (salute-developers/design-system-builder) с поддержкой
# релизов Core, DSBUILDER_API_URL и сессия системного администратора на этом URL:
#   dsbuilder auth login --username <admin>
#
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
LIBRARY_ID="sdds-swiftui"
META="$REPO_ROOT/DesignSystemBuilder/.sdds/ios-api-meta.json"
CORE_VERSION=""
CHANNEL=""
APPLY=0
REGENERATE=0

usage() {
    sed -n '2,25p' "$0" | sed 's/^# \{0,1\}//'
}

while [[ $# -gt 0 ]]; do
    if [[ "$1" == --core-version || "$1" == --channel || "$1" == --meta ]] && [[ $# -lt 2 ]]; then
        echo "$1 requires a value" >&2
        exit 2
    fi
    case "$1" in
        --core-version) CORE_VERSION="${2:-}"; shift 2 ;;
        --channel) CHANNEL="${2:-}"; shift 2 ;;
        --meta) META="${2:-}"; shift 2 ;;
        --apply) APPLY=1; shift ;;
        --regenerate) REGENERATE=1; shift ;;
        -h|--help) usage; exit 0 ;;
        *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
    esac
done

if [[ -z "$CORE_VERSION" ]]; then
    echo "--core-version is required: the SDDSComponents version the meta was built from" >&2
    exit 2
fi
if [[ "$CHANNEL" != "stable" && "$CHANNEL" != "dev" ]]; then
    echo "--channel must be stable or dev" >&2
    exit 2
fi
if ! command -v dsbuilder >/dev/null 2>&1; then
    echo "dsbuilder CLI not found in PATH (salute-developers/design-system-builder)" >&2
    exit 1
fi
if [[ -z "${DSBUILDER_API_URL:-}" ]]; then
    echo "DSBUILDER_API_URL is not set" >&2
    exit 1
fi

if [[ "$REGENERATE" == 1 ]]; then
    "$REPO_ROOT/scripts/generate_api_meta.sh"
fi
if [[ ! -s "$META" ]]; then
    echo "Meta not found: $META. Run scripts/generate_api_meta.sh or pass --regenerate" >&2
    exit 1
fi

args=(components import-api --from "$META" --platform swiftui
      --library-id "$LIBRARY_ID" --core-version "$CORE_VERSION" --channel "$CHANNEL")
if [[ "$APPLY" == 1 ]]; then
    args+=(--apply)
    echo "==> Registering $LIBRARY_ID $CORE_VERSION ($CHANNEL) on $DSBUILDER_API_URL"
else
    echo "==> Dry run: $LIBRARY_ID $CORE_VERSION ($CHANNEL) on $DSBUILDER_API_URL; add --apply to write"
fi
echo "    meta: $META (sha256 $(shasum -a 256 "$META" | cut -d' ' -f1))"

dsbuilder "${args[@]}"
