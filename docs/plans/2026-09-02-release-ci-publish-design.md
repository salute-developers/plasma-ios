# Release CI publish — design

Дата: 2026-09-02. Ветка: `feature/release-ci-publish` (от `release/01-09-2026`).

## Проблема

Публикация релиза (`.github/workflows/publish-release.yml`) не проходит на CI с мая 2026,
ассеты релиза докладываются руками (`build_xcframeworks.rb`, `build_themes.rb`, `build_cli.sh`).

Установленные причины:

1. `runs-on: macos-latest` с 15.06.2026 указывает на образ macOS 26 (Xcode 26.0.1–26.6),
   а воркфлоу требует Xcode 16.4 → падение на `setup-xcode` (runs 32242715520, 29901570294,
   28944090350).
2. Фан-аут через `repository_dispatch` никогда не публиковал ассеты: `release_icons.yml`
   падает на опечатке `.chmod`; `release_components.yml` в dispatch-контексте берёт
   `github.ref_name` = `develop` вместо тега; `dispatch-publish.sh` шлёт `publish-themes`,
   а `publish-all-themes-release.yml` слушает `publish-all-themes-release`;
   `concurrency.group` во всех четырёх строится из пустого `github.head_ref`.
3. Тег и draft-релиз создаются до сборки: после падения остаётся тег, повторный запуск
   блокируется проверкой «tag exists».
4. `actions/create-release@v1` и `mukunku/tag-exists-action` заархивированы.

## Цель

Один запуск `Publish Release` (workflow_dispatch на `main`) собирает и выкладывает в
GitHub Release все ассеты, включая CLI `dsbuilder` и архив исходников. Тот же скрипт
запускается локально и даёт те же файлы.

## Контракт ассетов релиза

Имена фиксированы потребителями (`scripts/release_sync/release_sync.rb`,
`release-manifest.json`, `SourcesReleaseFetcher.swift`, README):

| Ассет | Источник |
|---|---|
| `SDDSThemeCore.xcframework.zip` | `DesignSystemBuilder/build/` |
| `InputMask.xcframework.zip` | `build/` |
| `SDDSComponents.xcframework.zip` | `build/` |
| `SDDSServTheme.xcframework.zip`, `PlasmaB2CTheme.xcframework.zip`, `PlasmaHomeDSTheme.xcframework.zip` | `Themes/build/` (по одному на `Themes/*/*.xcodeproj`) |
| `dsbuilder-cli-<tag>.zip` | бинарь `dsbuilder` + `ios-api-meta.json` |
| `SDDSSources-<tag>.zip` | `scripts/package_sources.sh` |

`SDDSIcons.xcframework` собирается (его линкуют проекты тем), но в датный релиз не кладётся:
у иконок отдельный релизный процесс `release_icons.yml` (тег `SDDSIcons-v*`), он остаётся.

Релиз после заливки всех ассетов публикуется (draft снимается): `--sources-version`
у клиентов скачивает по `releases/download/<tag>/…`, что для draft не работает.

## Компоненты

### `scripts/release/build_release.sh <tag> [--output <dir>] [--skip-cli]`

Единая точка сборки для CI и локального запуска. Запускается из корня репозитория,
`set -euo pipefail`, каждый шаг печатает заголовок.

1. `ruby scripts/build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore`
2. `ruby scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace` (InputMask, SDDSComponents, SDDSIcons — последний только как зависимость тем)
3. `ruby scripts/build_themes.rb` (сам зипует темы в `Themes/build/*.xcframework.zip`)
4. `DesignSystemBuilder/build_cli.sh` → `dsbuilder-cli-<tag>.zip` (бинарь + `ios-api-meta.json`,
   `ditto --keepParent`, как в текущем воркфлоу). Пропускается при `--skip-cli`.
5. `scripts/package_sources.sh <tag> <output>`
6. Зип xcframework'ов из `build/` (кроме `SDDSIcons.xcframework`) и `DesignSystemBuilder/build/`
   через `ditto -c -k --sequesterRsrc --keepParent`, копирование зипов тем.
7. Проверка: все файлы из контракта присутствуют в `<output>` (по умолчанию
   `release-artifacts/`, добавляется в `.gitignore`); иначе exit 1 с перечнем недостающих.
   Список тем вычисляется динамически по `Themes/*/*.xcodeproj`; имя zip темы равно имени
   схемы и может отличаться регистром от папки (`SDDSservTheme` → `SDDSServTheme`), поэтому
   проверка регистронезависимая.

Скрипт не трогает git и GitHub. `build_artifacts.rb` удаляется как дубликат.

### `.github/workflows/publish-release.yml`

`workflow_dispatch` с входами `tag_name` (required) и `dry_run` (boolean, default false).
`runs-on: macos-26`, `setup-xcode` с `xcode-version: '26.6'` (совпадает с локальным Xcode).
Шаг установки сертификата удаляется: все сборки идут с `CODE_SIGNING_ALLOWED=NO`.

Порядок шагов:

1. Checkout (`fetch-depth: 0`, `submodules: recursive`), Xcode, `bundle install`.
2. Проверка, что тег не существует: `git ls-remote --tags origin "refs/tags/<tag>"` пусто.
   Выполняется и в `dry_run`, чтобы ошибка ввода ловилась рано.
3. `scripts/release/build_release.sh <tag>`.
4. `actions/upload-artifact` с `release-artifacts/` (retention 30 дней).
5. Только при `dry_run == false`:
   - тег: `git tag -a` + `git push origin <tag>` (автор «Salute iOS Team», как сейчас);
   - changelog: `.github/actions/release-changelog` (`toTag: HEAD`, `fromTag` — предыдущий
     `release-*` по `git describe`), `continue-on-error: true`;
   - `gh release create <tag> --draft --title <tag> --notes-file changelog_artifacts.md`
     (если файла нет — `--generate-notes`);
   - `gh release upload <tag> release-artifacts/* --clobber`;
   - `gh release edit <tag> --draft=false`.

Джоба использует окружение `release` (required reviewers: vkaltyrin, malilex, raininforest;
создано 2026-09-02), а не `sdds`: `sdds` стоит на PR-сборках, reviewers там заблокировали бы
весь CI. Токен — встроенный `github.token` с `permissions: contents: write`: его хватает на тег,
релиз и ассеты, PAT `GH_TOKEN` не нужен (на теги/релизы не подписан ни один воркфлоу).

### Удаляемое

`release_components.yml`, `publish-all-themes-release.yml`, `release_all_frameworks.yml`,
`scripts/dispatch-publish.sh`, `scripts/build_artifacts.rb`. `release_icons.yml` остаётся (отдельный
релизный процесс иконок, как `publish-icons-release.yml` на Android: тег `SDDSIcons-vX.Y.Z` →
асcет `SDDSIcons-vX.Y.Z.zip`). В нём исправлены: опечатка `.chmod` (падал на каждом запуске с
2024-12), устаревший `::set-output` → `$GITHUB_OUTPUT`, образ закреплён как `macos-26` / Xcode 26.6.
Тег создаётся вручную через `create_tag_release.yml` после мержа PR «Release SDDSIcons-vX.Y.Z».
`scripts/changed-modules.sh` остаётся: его использует `create-release-pr.yml`.

### Документация

`scripts/CLAUDE.md`, `README.md` (раздел про ассеты релиза и локальный запуск),
`DesignSystemBuilder/README.md` при необходимости, память команды
(`.claude/memory/plasma-ios-decisions.md`: один воркфлоу вместо фан-аута, Xcode 26.6).

## Ошибки и откат

- Падение сборки в шаге 3 не оставляет ни тега, ни релиза; повторный запуск возможен без
  ручной чистки.
- Падение заливки ассетов оставляет draft-релиз и тег; релиз не публикуется. Повтор:
  удалить тег и draft вручную либо дозалить `gh release upload --clobber` и снять draft.
- `dry_run` — способ проверить воркфлоу на любой ветке без побочных эффектов.

## Проверка

1. Локально: `scripts/release/build_release.sh release-test` под Xcode 26.6 → каталог
   `release-artifacts/` содержит все файлы контракта (без `SDDSIcons.xcframework.zip`); `dsbuilder --help` из распакованного
   `dsbuilder-cli-*.zip` работает.
2. CI: `Publish Release` с ветки `feature/release-ci-publish`, `dry_run: true` → зелёный
   прогон, Actions-артефакт содержит все файлы контракта.
3. Боевой прогон: после PR в `release/01-09-2026` и релизной PR в `main` —
   `Publish Release` на `main` с `tag_name: release-01-09-2026`.

## Вне объёма

Автообновление `release-manifest.json` версиями модулей после релиза; добавление
`PlasmaHomeDSTheme` в манифест; параллельная матрица джобов.
