#!/usr/bin/env bash
#
# Наполняет SDDSThemeBuilder/.sdds/ данными дизайн-системы через DS Builder CLI.
#
# Идентификаторы и ключ читаются из окружения (в CI — из GitHub Secrets/Variables):
#   DSBUILDER_API_KEY          (secret, обязателен)   — project API key; CLI читает его сам из env
#   DSBUILDER_PROJECT_ID       (нужен для init)       — id проекта DS Builder
#   DSBUILDER_DESIGN_SYSTEM_ID (нужен для init)       — id дизайн-системы внутри проекта
#   DSBUILDER_BIN              (опционально)          — путь к бинарю dsbuilder (по умолчанию из PATH)
#
# Что делает:
#   1. Если .sdds/config.json отсутствует — выполняет `dsbuilder init` (создаёт config с
#      projectId/designSystemId/credential, где credential.name = DSBUILDER_API_KEY).
#   2. Выполняет `dsbuilder theme fetch` — скачивает токены в .sdds/tenants/<tenant>/ios/*.json
#      и палитру в .sdds/tenants/palette.json, обновляя список tenants в config.json.
#
# Токены/палитра попадают под .gitignore (**/.sdds/**/); config.json остаётся отслеживаемым.
# После наполнения SDDSThemeBuilder читает .sdds/ как источник темы (PlasmaHomeDS); если .sdds/
# пуст — откатывается на zip-снапшот (localSchemePath).
set -euo pipefail

DSBUILDER_BIN="${DSBUILDER_BIN:-dsbuilder}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SDDS_PARENT="$REPO_ROOT/SDDSThemeBuilder"
CONFIG="$SDDS_PARENT/.sdds/config.json"

# Локальный .env (если есть) — удобно для запуска вне CI. В CI переменные приходят из workflow,
# .env там отсутствует. Файл в .gitignore, ключ в гит не попадает.
if [ -f "$REPO_ROOT/.env" ]; then
  set -a
  # shellcheck disable=SC1091
  . "$REPO_ROOT/.env"
  set +a
fi

: "${DSBUILDER_API_KEY:?Set DSBUILDER_API_KEY (project API key) in env or .env}"

if ! command -v "$DSBUILDER_BIN" >/dev/null 2>&1 && [ ! -x "$DSBUILDER_BIN" ]; then
  echo "❌ dsbuilder CLI not found ('$DSBUILDER_BIN')." >&2
  echo "   Установите: склонируйте salute-developers/design-system-builder-kt и запустите" >&2
  echo "   dsbuilder-frontend/install-local-cli.sh, либо задайте DSBUILDER_BIN=<путь к бинарю>." >&2
  exit 1
fi

# DS Builder CLI пишет/читает .sdds относительно текущей директории.
cd "$SDDS_PARENT"

if [ ! -f "$CONFIG" ]; then
  : "${DSBUILDER_PROJECT_ID:?Set DSBUILDER_PROJECT_ID to run 'dsbuilder init'}"
  : "${DSBUILDER_DESIGN_SYSTEM_ID:?Set DSBUILDER_DESIGN_SYSTEM_ID to run 'dsbuilder init'}"
  echo "📝 .sdds/config.json не найден — запускаю 'dsbuilder init'..."
  "$DSBUILDER_BIN" init \
    --project-id "$DSBUILDER_PROJECT_ID" \
    --design-system-id "$DSBUILDER_DESIGN_SYSTEM_ID"
fi

echo "⬇️  Наполняю .sdds/ через 'dsbuilder theme fetch'..."
"$DSBUILDER_BIN" theme fetch

echo "✅ .sdds/ наполнен. Токены — в .sdds/tenants/ (gitignored), config.json — отслеживается."
