#!/bin/bash
# Extract Swift doc samples marked with // @DocSample from fixtures and theme samples.
# Output: one .swift file per sample in OUTPUT_DIR (e.g. build/docs).
# Sources: core = SDDSComponentsFixtures/Sources/.../Samples/; theme = Themes/THEME_NAME/docs/Samples/ (if THEME_NAME set).

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Repo root: from docusaurus/scripts go up twice
REPO_ROOT="${REPO_ROOT:-$(cd "$SCRIPT_DIR/../.." && pwd)}"
OUTPUT_DIR="${SNIPPETS_DIR:-${OUTPUT_DIR:-$REPO_ROOT/docusaurus/build/docs}}"
THEME_NAME="${THEME_NAME:-}"

log() { echo "[extract-snippets] $*"; }

# Extract one sample from a Swift file: body of "var body: some View { ... }" for struct Name: View after // @DocSample
# Writes to stdout: sample_name and snippet content (with placeholder replaced, indent normalized).
# Usage: extract_one_file <swift_file> <output_prefix_path>
extract_from_file() {
    local file="$1"
    local prefix_path="$2"
    local dir
    dir="$(dirname "$file")"
    local base
    base="$(basename "$file" .swift)"
    # Prefix path for output: e.g. SDDSComponentsFixtures/Samples/Button or ThemeName/docs/Samples/Button
    local out_prefix="$prefix_path"

    # Find lines with // @DocSample
    local line_num
    while read -r line_num; do
        [ -z "$line_num" ] && continue
        # Next non-empty, non-comment line should be "struct Name: View" or "func Name()"
        local name=""
        local start_body_line=""
        local i="$((line_num + 1))"
        local total_lines
        total_lines=$(wc -l < "$file" | tr -d ' ')
        while [ "$i" -le "$total_lines" ]; do
            local line
            line=$(sed -n "${i}p" "$file")
            if echo "$line" | grep -qE '^\s*struct\s+([A-Za-z0-9_]+)\s*:\s*View'; then
                name=$(echo "$line" | sed -nE 's/^[[:space:]]*struct[[:space:]]+([A-Za-z0-9_]+)[[:space:]]*:[[:space:]]*View.*/\1/p')
                # Find "var body: some View {"
                local j="$((i + 1))"
                while [ "$j" -le "$total_lines" ]; do
                    local body_line
                    body_line=$(sed -n "${j}p" "$file")
                    if echo "$body_line" | grep -qE 'var\s+body\s*:\s*some\s+View\s*\{'; then
                        start_body_line="$j"
                        break
                    fi
                    j=$((j + 1))
                done
                break
            fi
            if echo "$line" | grep -qE '^\s*func\s+([A-Za-z0-9_]+)\s*\('; then
                name=$(echo "$line" | sed -nE 's/^[[:space:]]*func[[:space:]]+([A-Za-z0-9_]+)[[:space:]]*\(.*/\1/p')
                # For func, take body after first { on same or next lines
                start_body_line="$i"
                while [ "$start_body_line" -le "$total_lines" ]; do
                    line=$(sed -n "${start_body_line}p" "$file")
                    if echo "$line" | grep -q '{'; then
                        break
                    fi
                    start_body_line=$((start_body_line + 1))
                done
                break
            fi
            # Skip empty lines and comments
            if echo "$line" | grep -qE '^[[:space:]]*$' || echo "$line" | grep -qE '^[[:space:]]*//'; then
                i=$((i + 1))
                continue
            fi
            break
        done

        if [ -z "$name" ] || [ -z "$start_body_line" ]; then
            continue
        fi

        # Extract body inside "var body: some View { ... }" (brace balance; exclude closing })
        local content
        content=$(awk -v start="$start_body_line" '
            NR < start { next }
            NR == start {
                idx = index($0, "{")
                if (idx <= 0) exit
                balance = 1
                rest = substr($0, idx + 1)
                gsub(/^[ \t]+|[ \t]+$/, "", rest)
                buf = rest
                next
            }
            balance > 0 {
                for (i=1; i<=length($0); i++) {
                    c = substr($0,i,1)
                    if (c == "{") balance++
                    if (c == "}") balance--
                }
                if (balance == 0) { print buf; exit }
                if (buf != "") buf = buf "\n"
                buf = buf $0
                next
            }
        ' "$file")

        if [ -z "$content" ]; then
            continue
        fi

        # If body is swiftCodeSnippet { ... }, extract only the inner closure content
        if echo "$content" | head -1 | grep -qE '^\s*swiftCodeSnippet\s*\{'; then
            content=$(echo "$content" | awk '
                BEGIN { balance = 0; capturing = 0 }
                capturing == 0 {
                    idx = index($0, "{")
                    if (idx > 0) {
                        balance = 1
                        capturing = 1
                        tail = substr($0, idx + 1)
                        gsub(/^[ \t]+|[ \t]+$/, "", tail)
                        if (tail != "") buf = tail; else buf = ""
                        next
                    }
                }
                capturing > 0 {
                    if (buf != "") buf = buf "\n"
                    buf = buf $0
                    for (i=1; i<=length($0); i++) {
                        c = substr($0,i,1)
                        if (c == "{") balance++
                        if (c == "}") balance--
                    }
                    if (balance == 0) {
                        sub(/\n[^\n]*$/, "", buf)
                        gsub(/^\n+|\n+$/, "", buf)
                        print buf
                        exit
                    }
                    next
                }
            ')
        fi

        # Normalize indent: strip minimum leading spaces from non-empty lines
        content=$(echo "$content" | awk '
            /[^[:space:]]/ {
                match($0, /[^[:space:]]/)
                n = RSTART - 1
                if (min == "" || n < min) min = n
            }
            { line[NR] = $0 }
            END {
                if (min == "") min = 0
                for (i=1; i<=NR; i++) {
                    s = line[i]
                    if (length(s) > min) s = substr(s, min+1)
                    print s
                }
            }
        ')

        # Replace placeholder(..., "text") with "text"
        content=$(echo "$content" | sed -E 's/placeholder[[:space:]]*\([^)]*,[[:space:]]*"([^"]*)"[[:space:]]*\)/"\1"/g')

        # Trim trailing blank lines
        content=$(echo "$content" | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}')

        # Write output file
        local out_dir="$OUTPUT_DIR/$out_prefix"
        local out_file="$out_dir/${name}.swift"
        mkdir -p "$out_dir"
        echo "$content" > "$out_file"
        log "  $out_file"
    done < <(grep -n '// @DocSample' "$file" | cut -d: -f1)
}

# --- Core: SDDSComponentsFixtures
CORE_SAMPLES="$REPO_ROOT/SDDSComponentsFixtures/Sources/SDDSComponentsFixtures/Samples"
if [ -d "$CORE_SAMPLES" ]; then
    log "Extracting core samples from $CORE_SAMPLES"
    while IFS= read -r -d '' f; do
        # Relative path from Samples: e.g. Button/ButtonSamples.swift -> Button
        rel="${f#$CORE_SAMPLES/}"
        subdir=$(dirname "$rel")
        prefix="SDDSComponentsFixtures/Samples/$subdir"
        extract_from_file "$f" "$prefix"
    done < <(find "$CORE_SAMPLES" -name "*.swift" -type f -print0 2>/dev/null || true)
else
    log "Core samples dir not found: $CORE_SAMPLES (skipping)"
fi

# --- Theme: Themes/THEME_NAME/docs/Samples
if [ -n "$THEME_NAME" ]; then
    THEME_SAMPLES="$REPO_ROOT/Themes/$THEME_NAME/docs/Samples"
    if [ -d "$THEME_SAMPLES" ]; then
        log "Extracting theme samples from $THEME_SAMPLES"
        while IFS= read -r -d '' f; do
            rel="${f#$THEME_SAMPLES/}"
            subdir=$(dirname "$rel")
            prefix="$THEME_NAME/docs/Samples/$subdir"
            extract_from_file "$f" "$prefix"
        done < <(find "$THEME_SAMPLES" -name "*.swift" -type f -print0 2>/dev/null || true)
    else
        log "Theme samples dir not found: $THEME_SAMPLES (skipping)"
    fi
fi

log "Snippets written to $OUTPUT_DIR"
