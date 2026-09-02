# Release CI Publish Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** One `Publish Release` run builds every release asset (xcframeworks, themes, `dsbuilder` CLI, sources archive) and attaches them to a published GitHub Release; the same script runs locally.

**Architecture:** A single bash entry point `scripts/release/build_release.sh <tag>` chains the existing Ruby/bash build scripts and collects a verified `release-artifacts/` directory. `publish-release.yml` becomes thin: build first, then tag + release + upload, with a `dry_run` input that stops after the build. The broken `repository_dispatch` fan-out workflows are deleted.

**Tech Stack:** GitHub Actions (`macos-26`, `maxim-lobanov/setup-xcode@v1` with Xcode 26.6), bash, existing Ruby scripts (`build_xcframeworks.rb`, `build_themes.rb`), `gh` CLI, `ditto`.

Spec: `docs/superpowers/specs/2026-09-02-release-ci-publish-design.md`.

## Global Constraints

- Runner `macos-26`, `xcode-version: '26.6'` pinned (matches local Xcode 26.6).
- Asset names are a contract: `SDDSThemeCore.xcframework.zip`, `InputMask.xcframework.zip`, `SDDSComponents.xcframework.zip`, `<Theme>.xcframework.zip` per `Themes/*/*.xcodeproj` (zip name follows the Xcode scheme, e.g. `SDDSServTheme` for project dir `SDDSservTheme`), `dsbuilder-cli-<tag>.zip`, `SDDSSources-<tag>.zip`.
- No tag and no release may be created before the build succeeds.
- Release is published (draft removed) only after all assets are uploaded.
- Scripts run from the repo root; `set -euo pipefail`; comments in Russian like the neighbouring scripts.
- Commits: Conventional Commits, scope `sdds-ios/build-system`, no `Co-Authored-By`.

---

### Task 1: `scripts/release/build_release.sh`

**Files:**
- Create: `scripts/release/build_release.sh`
- Modify: `.gitignore` (add `release-artifacts/`)
- Delete: `scripts/build_artifacts.rb`

**Interfaces:**
- Produces: `scripts/release/build_release.sh <tag> [--output <dir>] [--skip-cli]`, exit 0 with all contract files in `<dir>` (default `<repo>/release-artifacts`), exit 1 otherwise. Task 2 calls it as `scripts/release/build_release.sh "${TAG}"`.

- [x] **Step 1: Write the script**

```bash
#!/usr/bin/env bash
#
# Собирает все ассеты GitHub Release в один каталог. Единая точка входа для CI
# (.github/workflows/publish-release.yml) и для локального запуска — набор файлов одинаковый.
#
#   scripts/release/build_release.sh <tag> [--output <dir>] [--skip-cli]
#
#   <tag>        тег релиза (release-01-09-2026): попадает в имена dsbuilder-cli-<tag>.zip
#                и SDDSSources-<tag>.zip
#   --output     куда сложить ассеты (по умолчанию <repo>/release-artifacts, в .gitignore)
#   --skip-cli   не собирать dsbuilder (быстрая проверка xcframework'ов)
#
# Шаги: SDDSThemeCore → InputMask/SDDSComponents/SDDSIcons → темы → CLI → архив исходников →
# zip xcframework'ов → проверка, что все ожидаемые файлы на месте. Git и GitHub скрипт не трогает.
set -euo pipefail

usage() {
  sed -n '2,14p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
}

TAG=""
OUTPUT=""
SKIP_CLI=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --output)   OUTPUT="${2:-}"; shift 2 ;;
    --skip-cli) SKIP_CLI=1; shift ;;
    -h|--help)  usage; exit 0 ;;
    -*)         echo "Неизвестный аргумент: $1" >&2; usage >&2; exit 1 ;;
    *)          if [[ -z "$TAG" ]]; then TAG="$1"; shift; else echo "Лишний аргумент: $1" >&2; exit 1; fi ;;
  esac
done

if [[ -z "$TAG" ]]; then
  usage >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$REPO_ROOT"

OUTPUT="${OUTPUT:-$REPO_ROOT/release-artifacts}"
mkdir -p "$OUTPUT"
OUTPUT="$(cd "$OUTPUT" && pwd)"
rm -rf "${OUTPUT:?}"/*

step() {
  echo
  echo "==> $*"
}

step "1/7 SDDSThemeCore.xcframework"
ruby scripts/build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore
test -d DesignSystemBuilder/build/SDDSThemeCore.xcframework || {
  echo "❌ DesignSystemBuilder/build/SDDSThemeCore.xcframework не собран" >&2; exit 1; }

step "2/7 InputMask, SDDSComponents, SDDSIcons"
ruby scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace

step "3/7 Темы (Themes/*/*.xcodeproj)"
ruby scripts/build_themes.rb

step "4/7 dsbuilder CLI"
if [[ "$SKIP_CLI" -eq 1 ]]; then
  echo "пропущено (--skip-cli)"
else
  (cd DesignSystemBuilder && ./build_cli.sh)
  test -x DesignSystemBuilder/build/dsbuilder/dsbuilder || { echo "❌ бинарник dsbuilder не собран" >&2; exit 1; }
  test -f DesignSystemBuilder/.sdds/ios-api-meta.json || { echo "❌ ios-api-meta.json не сгенерирован" >&2; exit 1; }
  CLI_STAGE="DesignSystemBuilder/build/dsbuilder-cli"
  rm -rf "$CLI_STAGE" && mkdir -p "$CLI_STAGE"
  cp DesignSystemBuilder/build/dsbuilder/dsbuilder "$CLI_STAGE/"
  cp DesignSystemBuilder/.sdds/ios-api-meta.json "$CLI_STAGE/"
  # --keepParent: в архиве остаётся папка dsbuilder-cli (так документировано в README).
  (cd DesignSystemBuilder/build && ditto -c -k --sequesterRsrc --keepParent dsbuilder-cli "$OUTPUT/dsbuilder-cli-$TAG.zip")
fi

step "5/7 Архив исходников SDDSSources-$TAG.zip"
scripts/package_sources.sh "$TAG" "$OUTPUT"

step "6/7 Zip xcframework'ов → $OUTPUT"
zip_xcframework() {
  local framework_path="$1"
  local name
  name="$(basename "$framework_path" .xcframework)"
  (cd "$(dirname "$framework_path")" && ditto -c -k --sequesterRsrc --keepParent "$name.xcframework" "$OUTPUT/$name.xcframework.zip")
  echo "  $name.xcframework.zip"
}
zip_xcframework DesignSystemBuilder/build/SDDSThemeCore.xcframework
for framework_path in build/*.xcframework; do
  zip_xcframework "$framework_path"
done
# Темы build_themes.rb зипует сам (Themes/build/<Scheme>.xcframework.zip).
for theme_zip in Themes/build/*.xcframework.zip; do
  cp "$theme_zip" "$OUTPUT/"
  echo "  $(basename "$theme_zip")"
done

step "7/7 Проверка состава"
MISSING=()
for name in SDDSThemeCore InputMask SDDSComponents; do
  [[ -f "$OUTPUT/$name.xcframework.zip" ]] || MISSING+=("$name.xcframework.zip")
done
# Имя zip темы = имя схемы, регистр может отличаться от папки (SDDSservTheme → SDDSServTheme).
for theme_project in Themes/*/*.xcodeproj; do
  theme_name="$(basename "$theme_project" .xcodeproj)"
  if [[ -z "$(find "$OUTPUT" -maxdepth 1 -iname "$theme_name.xcframework.zip")" ]]; then
    MISSING+=("$theme_name.xcframework.zip")
  fi
done
[[ "$SKIP_CLI" -eq 1 || -f "$OUTPUT/dsbuilder-cli-$TAG.zip" ]] || MISSING+=("dsbuilder-cli-$TAG.zip")
[[ -f "$OUTPUT/SDDSSources-$TAG.zip" ]] || MISSING+=("SDDSSources-$TAG.zip")

if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo "❌ В $OUTPUT нет ожидаемых ассетов:" >&2
  printf '   %s\n' "${MISSING[@]}" >&2
  exit 1
fi

echo
echo "✅ Ассеты релиза $TAG:"
ls -la "$OUTPUT"
```

- [x] **Step 2: Make it executable, ignore the output dir, drop the duplicate**

```bash
chmod +x scripts/release/build_release.sh
printf '\n## Ассеты релиза (scripts/release/build_release.sh)\nrelease-artifacts/\n' >> .gitignore
git rm -q scripts/build_artifacts.rb
```

- [x] **Step 3: Argument handling smoke test (no build)**

Run: `scripts/release/build_release.sh` → prints usage, exit 1.
Run: `scripts/release/build_release.sh --help` → prints usage, exit 0.
Run: `scripts/release/build_release.sh x --bogus` → `Неизвестный аргумент: --bogus`, exit 1.

- [x] **Step 4: Full local run under Xcode 26.6**

Run: `scripts/release/build_release.sh release-local-test`
Expected: ends with `✅ Ассеты релиза release-local-test:` and the listing contains 3 core zips (SDDSThemeCore, InputMask, SDDSComponents), 3 theme zips, `dsbuilder-cli-release-local-test.zip`, `SDDSSources-release-local-test.zip`.
Then: `cd /tmp && rm -rf cli-check && mkdir cli-check && cd cli-check && unzip -q <repo>/release-artifacts/dsbuilder-cli-release-local-test.zip && ./dsbuilder-cli/dsbuilder --help` → prints CLI help.

- [x] **Step 5: Commit**

```bash
git add scripts/release/build_release.sh .gitignore
git commit -m "feat(sdds-ios/build-system): add build_release.sh collecting all release assets"
```

---

### Task 2: Rewrite `publish-release.yml`

**Files:**
- Modify: `.github/workflows/publish-release.yml` (full rewrite)

**Interfaces:**
- Consumes: `scripts/release/build_release.sh "${TAG}"` (Task 1), `.github/actions/release-changelog` (existing, writes `${{ github.workspace }}/changelog_artifacts.md`).

- [x] **Step 1: Replace the file content**

```yaml
name: "Publish Release"

on:
  workflow_dispatch:
    inputs:
      tag_name:
        description: 'Название тэга (например release-01-09-2026)'
        required: true
      dry_run:
        description: 'Только собрать ассеты (без тега и релиза). Можно запускать с любой ветки.'
        type: boolean
        required: false
        default: false

# Один прогон: сборка всех ассетов → тег → draft-релиз → upload → снятие draft.
# Сборка идёт первой, поэтому упавший билд не оставляет ни тега, ни релиза.
jobs:
  publish-release:
    name: Build artifacts & publish release
    runs-on: macos-26
    environment: sdds
    permissions:
      contents: write
    env:
      TAG: ${{ github.event.inputs.tag_name }}
      GH_TOKEN: ${{ secrets.GH_TOKEN }}

    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
          submodules: recursive

      - name: Set up Xcode
        uses: maxim-lobanov/setup-xcode@v1
        with:
          xcode-version: '26.6'

      - name: Verify tag does not exist
        run: |
          if [ -n "$(git ls-remote --tags origin "refs/tags/${TAG}")" ]; then
            echo "::error::Tag ${TAG} already exists"
            exit 1
          fi

      - name: Install Ruby dependencies
        run: bundle install

      - name: Build release artifacts
        run: scripts/release/build_release.sh "${TAG}"

      - name: Upload build artifacts
        uses: actions/upload-artifact@v4
        with:
          name: release-artifacts
          path: release-artifacts/
          retention-days: 30

      - name: Dry run summary
        if: ${{ inputs.dry_run }}
        run: echo "dry_run: тег и релиз не создаются, ассеты — в Actions-артефакте release-artifacts"

      # Предыдущий release-тег считаем до создания нового — от него строится changelog.
      - name: Compute previous release tag
        if: ${{ !inputs.dry_run }}
        run: |
          FROM_TAG=$(git describe --tags --abbrev=0 --match 'release-*' 2>/dev/null || git rev-list --max-parents=0 HEAD | tail -1)
          echo "FROM_TAG=$FROM_TAG" >> "$GITHUB_ENV"
          echo "Changelog range: $FROM_TAG..HEAD"

      - name: Create and push tag
        if: ${{ !inputs.dry_run }}
        run: |
          git config --global user.email "salutedevs@gmail.com"
          git config --global user.name "Salute iOS Team"
          git tag -a "${TAG}" -m "Release ${TAG}"
          git push origin "${TAG}"

      - name: Build changelog
        if: ${{ !inputs.dry_run }}
        continue-on-error: true
        uses: ./.github/actions/release-changelog
        with:
          fromTag: ${{ env.FROM_TAG }}
          toTag: ${{ github.event.inputs.tag_name }}

      - name: Create draft release
        if: ${{ !inputs.dry_run }}
        run: |
          NOTES="${{ github.workspace }}/changelog_artifacts.md"
          if [ -s "$NOTES" ]; then
            gh release create "${TAG}" --draft --title "${TAG}" --notes-file "$NOTES"
          else
            echo "::warning::changelog не собрался, используем --generate-notes"
            gh release create "${TAG}" --draft --title "${TAG}" --generate-notes
          fi

      - name: Upload assets to release
        if: ${{ !inputs.dry_run }}
        run: gh release upload "${TAG}" release-artifacts/* --clobber

      - name: Publish release
        if: ${{ !inputs.dry_run }}
        run: gh release edit "${TAG}" --draft=false
```

- [x] **Step 2: Lint**

Run: `actionlint .github/workflows/publish-release.yml` if installed, otherwise `ruby -ryaml -e 'YAML.load_file(".github/workflows/publish-release.yml"); puts "yaml ok"'`.
Expected: no errors / `yaml ok`.

- [x] **Step 3: Commit**

```bash
git add .github/workflows/publish-release.yml
git commit -m "ci(sdds-ios/build-system): publish all release assets from a single workflow on Xcode 26.6"
```

---

### Task 3: Remove the broken fan-out

**Files:**
- Delete: `.github/workflows/release_components.yml`, `.github/workflows/publish-all-themes-release.yml`, `.github/workflows/release_all_frameworks.yml`, `scripts/dispatch-publish.sh`

- [x] **Step 1: Delete**

```bash
git rm -q .github/workflows/release_components.yml \
  .github/workflows/publish-all-themes-release.yml .github/workflows/release_all_frameworks.yml \
  scripts/dispatch-publish.sh
```

- [x] **Step 2: Verify nothing references them**

Run: `grep -rn "dispatch-publish\|publish-components\|publish-icons\|publish-themes\|publish-all-themes-release" --include='*.yml' --include='*.sh' --include='*.rb' --include='*.md' . | grep -v node_modules`
Expected: no output (the `publish-demo-app` event in `testflight_build.yml` stays; it is not dispatched anymore but harmless).

- [x] **Step 3: Commit**

```bash
git commit -m "ci(sdds-ios/build-system): drop repository_dispatch module publish workflows"
```

---

### Task 4: Docs and team memory

**Files:**
- Modify: `scripts/CLAUDE.md` (Сборка / Релиз sections), `README.md` (release assets paragraph), `.claude/memory/plasma-ios-decisions.md`

- [x] **Step 1: `scripts/CLAUDE.md`**

In «Сборка» replace the `build_artifacts.rb` mention with:
`- \`release/build_release.sh <tag>\` — все ассеты релиза в \`release-artifacts/\` (SDDSThemeCore, InputMask, SDDSComponents, SDDSIcons, темы, \`dsbuilder-cli-<tag>.zip\`, \`SDDSSources-<tag>.zip\`). Тот же скрипт запускает \`publish-release.yml\`.`
In «Релиз / версии» drop `dispatch-publish.sh`.

- [x] **Step 2: `README.md`**

After the sentence «Каждый релиз публикует два ассета…» reword to: each release publishes xcframework zips, theme zips, `dsbuilder-cli-<tag>.zip` and `SDDSSources-<tag>.zip`; locally the same set is produced by `scripts/release/build_release.sh <tag>`.

- [x] **Step 3: memory**

Append to `.claude/memory/plasma-ios-decisions.md` under «Процесс»: release is published by a single `publish-release.yml` run (build → tag → release → upload → un-draft), runner `macos-26` / Xcode 26.6 pinned, fan-out workflows removed on 2026-09-02; `dry_run` input for testing from any branch.

- [x] **Step 4: Commit**

```bash
git add scripts/CLAUDE.md README.md .claude/memory/plasma-ios-decisions.md
git commit -m "docs(sdds-ios/build-system): describe the single-run release publish flow"
```

---

### Task 5: CI dry run and PR

- [x] **Step 1: Push the branch**

```bash
git push -u origin feature/release-ci-publish
```

- [x] **Step 2: Dry run on CI**

```bash
gh workflow run publish-release.yml --ref feature/release-ci-publish -f tag_name=release-01-09-2026 -f dry_run=true
gh run list --workflow publish-release.yml --branch feature/release-ci-publish --limit 1
```

Watch with `gh run watch <id>`; expected: green, artifact `release-artifacts` lists all contract files. If red: fix, commit, re-run; do not open the PR until green.

- [x] **Step 3: PR into the release branch**

```bash
gh pr create --base release/01-09-2026 --head feature/release-ci-publish \
  --title "ci(sdds-ios/build-system): fix release publishing on CI" --body-file <body>
```

Body: root causes, what changed, link to the green dry run, and the runbook (release PR → main → Publish Release with `tag_name: release-01-09-2026`).
