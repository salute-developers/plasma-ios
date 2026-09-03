#!/usr/bin/env bash
#
# Интеграционный тест релизных xcframework'ов: раскладывает артефакты в
# IntegrationTests/XCFrameworkIntegration/Frameworks/ и гоняет hosted-тесты приложения
# Integration<Scheme> на симуляторе — по одной схеме на тему. Тот же скрипт запускает
# .github/workflows/integration-test.yml.
#
#   scripts/integration/run_integration_test.sh [--theme <Scheme>]... [--destination <dest>]
#                                               [--results <dir>] <path>...
#
#   <path>         *.xcframework.zip (распаковывается), *.xcframework (копируется) или каталог,
#                  где лежат те и другие (без рекурсии). Можно несколько путей: например
#                  release-artifacts build (в release-artifacts нет SDDSIcons — у иконок
#                  отдельный релиз SDDSIcons-v*, локально они лежат в build/)
#                  или build DesignSystemBuilder/build Themes/build
#   --theme        схема темы (SDDSServTheme); можно несколько; по умолчанию — все темы из
#                  scripts/integration/list_themes.rb
#   --destination  destination для xcodebuild; по умолчанию первый доступный iPhone с самой
#                  новой iOS (xcrun simctl)
#   --results      куда класть <Scheme>.xcresult (по умолчанию IntegrationTests/TestResults)
#
# Локально: scripts/release/build_release.sh local --skip-cli, затем
#           scripts/integration/run_integration_test.sh release-artifacts build
set -euo pipefail

usage() {
  sed -n '2,22p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
INTEGRATION_DIR="$REPO_ROOT/IntegrationTests/XCFrameworkIntegration"
PROJECT="$INTEGRATION_DIR/XCFrameworkIntegration.xcodeproj"
FRAMEWORKS_DIR="$INTEGRATION_DIR/Frameworks"
COMMON_FRAMEWORKS=(SDDSThemeCore InputMask SDDSComponents SDDSIcons)

THEMES=()
DESTINATION=""
RESULTS="$REPO_ROOT/IntegrationTests/TestResults"
SOURCES=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --theme)       THEMES+=("${2:?--theme требует значение}"); shift 2 ;;
    --destination) DESTINATION="${2:?--destination требует значение}"; shift 2 ;;
    --results)     RESULTS="${2:?--results требует значение}"; shift 2 ;;
    -h|--help)     usage; exit 0 ;;
    -*)            echo "Неизвестный аргумент: $1" >&2; usage >&2; exit 1 ;;
    *)             SOURCES+=("$1"); shift ;;
  esac
done

if [[ ${#SOURCES[@]} -eq 0 ]]; then
  echo "Не указано ни одного пути с артефактами" >&2
  usage >&2
  exit 1
fi

step() { echo; echo "==> $*"; }

# --- 1. Раскладка артефактов -------------------------------------------------------------

place_xcframework() {
  local src="$1" name
  name="$(basename "$src")"
  rm -rf "${FRAMEWORKS_DIR:?}/${name:?}"
  cp -R "$src" "$FRAMEWORKS_DIR/$name"
  echo "  $name  <- $src"
}

unpack_zip() {
  local zip="$1" tmp found=0 framework
  tmp="$(mktemp -d)"
  ditto -x -k "$zip" "$tmp"
  while IFS= read -r framework; do
    place_xcframework "$framework"
    found=1
  done < <(find "$tmp" -maxdepth 2 -name '*.xcframework' -type d)
  rm -rf "$tmp"
  [[ $found -eq 1 ]] || echo "  warning: в $zip нет *.xcframework" >&2
}

add_source() {
  local path="$1" entry
  if [[ -d "$path" && "$path" == *.xcframework ]]; then
    place_xcframework "$path"
  elif [[ -f "$path" && "$path" == *.xcframework.zip ]]; then
    unpack_zip "$path"
  elif [[ -d "$path" ]]; then
    # Незаматченный glob остаётся literal-строкой: проверяем через if, иначе false из
    # последнего [[ -e ]] в теле цикла уронил бы скрипт под set -e.
    for entry in "$path"/*.xcframework "$path"/*.xcframework.zip; do
      if [[ -e "$entry" ]]; then
        add_source "$entry"
      fi
    done
  else
    echo "Не артефакт и не каталог: $path" >&2
    exit 1
  fi
}

step "1/3 Раскладка xcframework'ов -> $FRAMEWORKS_DIR"
rm -rf "${FRAMEWORKS_DIR:?}"
mkdir -p "$FRAMEWORKS_DIR"
for source in "${SOURCES[@]}"; do
  add_source "$source"
done

# --- 2. Проверка состава ------------------------------------------------------------------

if [[ ${#THEMES[@]} -eq 0 ]]; then
  while IFS= read -r scheme; do
    THEMES+=("$scheme")
  done < <(ruby "$SCRIPT_DIR/list_themes.rb" | ruby -rjson -e 'JSON.parse(STDIN.read).each { |t| puts t["scheme"] }')
fi

if [[ ${#THEMES[@]} -eq 0 ]]; then
  echo "Не найдено ни одной темы: проверь Themes/*/*.xcodeproj и --theme" >&2
  exit 1
fi

step "2/3 Проверка состава: ${COMMON_FRAMEWORKS[*]} + темы ${THEMES[*]}"
MISSING=()
for name in "${COMMON_FRAMEWORKS[@]}" "${THEMES[@]}"; do
  if [[ ! -d "$FRAMEWORKS_DIR/$name.xcframework" ]]; then
    MISSING+=("$name.xcframework")
  fi
done
if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo "FAIL: в $FRAMEWORKS_DIR нет ожидаемых артефактов:" >&2
  printf '   %s\n' "${MISSING[@]}" >&2
  exit 1
fi
echo "OK: все артефакты на месте"

# --- 3. Тесты -----------------------------------------------------------------------------

if [[ -z "$DESTINATION" ]]; then
  DESTINATION="$(xcrun simctl list -j devices available | python3 -c '
import json, re, sys
data = json.load(sys.stdin)
best = None
for runtime, devices in data["devices"].items():
    match = re.search(r"iOS-(\d+)-(\d+)", runtime)
    if not match:
        continue
    version = (int(match.group(1)), int(match.group(2)))
    for device in devices:
        if "iPhone" in device["name"] and device.get("isAvailable", True):
            if best is None or version > best[0]:
                best = (version, device["udid"], device["name"])
if best is None:
    sys.exit("нет доступного симулятора iPhone")
print(f"platform=iOS Simulator,id={best[1]}", end="")
sys.stderr.write(f"симулятор: {best[2]} (iOS {best[0][0]}.{best[0][1]})\n")
')"
fi

step "3/3 xcodebuild test, destination: $DESTINATION"
mkdir -p "$RESULTS"
REPORT=()
FAILED=0
for scheme in "${THEMES[@]}"; do
  result_bundle="$RESULTS/$scheme.xcresult"
  rm -rf "$result_bundle"
  echo
  echo "--- Integration$scheme"
  if xcodebuild test \
      -project "$PROJECT" \
      -scheme "Integration$scheme" \
      -destination "$DESTINATION" \
      -resultBundlePath "$result_bundle" \
      -quiet; then
    REPORT+=("OK   $scheme")
  else
    REPORT+=("FAIL $scheme  ($result_bundle)")
    FAILED=1
  fi
done

echo
echo "Итог:"
printf '  %s\n' "${REPORT[@]}"
exit $FAILED
