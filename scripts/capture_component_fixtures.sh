#!/bin/bash
set -euo pipefail

BASE="https://github.com/salute-developers/theme-converter/raw/refs/heads/main/components"
SCHEMES=(sdds_serv plasma_b2c plasma_homeds plasma_giga plasma_giga_app plasma_stards sdds_sbcom)

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FIXTURES="$ROOT/DesignSystemBuilder/DesignSystemBuilderCoreTests/Fixtures/ComponentConfigs"

REFRESH=0
[ "${1:-}" = "--refresh" ] && REFRESH=1

mkdir -p "$FIXTURES"
INDEXES=$(mktemp -d)
trap 'rm -rf "$INDEXES"' EXIT

for scheme in "${SCHEMES[@]}"; do
    curl -sfL -o "$INDEXES/$scheme.json" "$BASE/$scheme/meta.json" || echo "  meta.json missing for $scheme"
done

FILES=$(python3 - "$INDEXES" <<'PY'
import json, sys, pathlib
names = []
for path in sorted(pathlib.Path(sys.argv[1]).glob("*.json")):
    for entry in json.loads(path.read_text())["components"]:
        names.append(entry["config"])
print("\n".join(sorted(set(names))))
PY
)

python3 - "$INDEXES" "$FIXTURES/meta.json" <<'MERGE'
import json, sys, pathlib
merged = {}
for path in sorted(pathlib.Path(sys.argv[1]).glob("*.json")):
    for entry in json.loads(path.read_text())["components"]:
        merged.setdefault(entry["styleName"], entry)
data = {"name": "fixtures", "components": [merged[k] for k in sorted(merged)]}
json.dump(data, open(sys.argv[2], "w"), indent=4, ensure_ascii=False)
print("  meta.json  <- %d styles" % len(merged))
MERGE

ok=0; miss=0
for file in $FILES; do
    target="$FIXTURES/$file"
    if [ -f "$target" ] && [ $REFRESH -eq 0 ]; then
        ok=$((ok + 1))
        continue
    fi
    captured=0
    for scheme in "${SCHEMES[@]}"; do
        [ -f "$INDEXES/$scheme.json" ] || continue
        grep -q "\"$file\"" "$INDEXES/$scheme.json" || continue
        tmp=$(mktemp)
        code=$(curl -sL -o "$tmp" -w "%{http_code}" "$BASE/$scheme/$file")
        if [ "$code" = "200" ] && python3 -c "
import json
json.dump(json.load(open('$tmp')), open('$target', 'w'), separators=(',', ':'), ensure_ascii=False)
" 2>/dev/null; then
            echo "  $file  <- $scheme"
            captured=1
        fi
        rm -f "$tmp"
        [ $captured -eq 1 ] && break
    done
    if [ $captured -eq 1 ]; then ok=$((ok + 1)); else echo "  $file  -- not found in any scheme"; miss=$((miss + 1)); fi
done

stale=0
for existing in "$FIXTURES"/*_config.json; do
    name=$(basename "$existing")
    if ! echo "$FILES" | grep -qx "$name"; then
        rm -f "$existing"
        echo "  $name  -- removed (not in DS index)"
        stale=$((stale + 1))
    fi
done

echo "Fixtures: $ok, missing: $miss, removed: $stale"
du -sh "$FIXTURES"
