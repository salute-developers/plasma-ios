# Release Artifacts Integration Test — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** После мержа в `develop` и на PR в `main` CI подключает релизные xcframework'и в чистое iOS-приложение (по одному на тему), собирает его и гоняет hosted-XCTest на симуляторе; слои артефактов кэшируются по хэшам исходников.

**Architecture:** Ruby-генератор (`xcodeproj`) создаёт коммитимый проект `IntegrationTests/XCFrameworkIntegration` с app+test таргетами на тему; bash-скрипт раскладывает xcframework'и в `Frameworks/` и запускает `xcodebuild test`; воркфлоу `integration-test.yml` строит слои `core → components → theme` с `actions/cache` (ключи = git-tree-хэши) и матрицей по темам.

**Tech Stack:** Ruby 3 + гем `xcodeproj` (в `Gemfile.lock`), bash, SwiftUI/XCTest, GitHub Actions (`macos-26`, Xcode 26.6, `actions/cache/restore|save@v4`).

**Spec:** `docs/superpowers/specs/2026-09-03-release-artifacts-integration-test-design.md`

## Global Constraints

- Скрипты запускаются из корня репозитория; Ruby-зависимости через Bundler (`bundle exec` не обязателен: `xcodeproj` стоит глобально, но `bundle install` делает CI).
- Статические xcframework'и (`SDDSThemeCore`, `SDDSComponents`, темы) подключаются только **Do Not Embed**; динамические (`InputMask`, `SDDSIcons`) — **Embed & Sign**.
- Deployment target приложения: `15.0`. Xcode на CI: `26.6`, раннер `macos-26`.
- Коммиты — Conventional Commits, скоуп `sdds-ios/build-system`, без `Co-Authored-By`.
- Никаких SPM-ссылок на исходники репозитория из интеграционного проекта.
- Имена тем: `<dir>` — папка в `Themes/`, `<Scheme>` — имя таргета из `Themes/<dir>/<dir>.xcodeproj` (`SDDSservTheme` → `SDDSServTheme`).
- Пути, которые не коммитятся: `IntegrationTests/XCFrameworkIntegration/Frameworks/`, `IntegrationTests/TestResults/`.

---

### Task 1: `scripts/integration/list_themes.rb` — список тем

**Files:**
- Create: `scripts/integration/list_themes.rb`

**Interfaces:**
- Produces: модуль `IntegrationThemes` с `IntegrationThemes.list(repo_root) -> [{ 'dir' => String, 'scheme' => String }]` (сортировка по `dir`); при запуске как скрипт печатает тот же массив в JSON.

- [ ] **Step 1: Написать скрипт**

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Список тем для интеграционного теста: по одной записи на Themes/<dir>/<dir>.xcodeproj.
#   dir    — папка темы (SDDSservTheme)
#   scheme — имя framework-таргета (SDDSServTheme); совпадает с именем xcframework и схемы
#
# Как библиотека: require_relative 'list_themes'; IntegrationThemes.list(repo_root)
# Как скрипт:     ruby scripts/integration/list_themes.rb  → JSON-массив в stdout
require 'json'
require 'xcodeproj'

module IntegrationThemes
  FRAMEWORK_PRODUCT_TYPE = 'com.apple.product-type.framework'

  def self.list(repo_root)
    Dir.glob(File.join(repo_root, 'Themes', '*', '*.xcodeproj')).sort.filter_map do |project_path|
      dir = File.basename(File.dirname(project_path))
      next unless File.basename(project_path, '.xcodeproj') == dir

      project = Xcodeproj::Project.open(project_path)
      target = project.targets.find { |t| t.product_type == FRAMEWORK_PRODUCT_TYPE } || project.targets.first
      { 'dir' => dir, 'scheme' => target.name }
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts JSON.generate(IntegrationThemes.list(File.expand_path('../..', __dir__)))
end
```

- [ ] **Step 2: Проверить вывод**

Run: `ruby scripts/integration/list_themes.rb`
Expected: `[{"dir":"PlasmaB2CTheme","scheme":"PlasmaB2CTheme"},{"dir":"PlasmaHomeDSTheme","scheme":"PlasmaHomeDSTheme"},{"dir":"SDDSservTheme","scheme":"SDDSServTheme"}]`

- [ ] **Step 3: Commit**

```bash
git add scripts/integration/list_themes.rb
git commit -m "chore(sdds-ios/build-system): list themes for integration test"
```

---

### Task 2: Исходники интеграционного приложения и шаблоны

**Files:**
- Create: `IntegrationTests/XCFrameworkIntegration/Shared/App/IntegrationApp.swift`
- Create: `IntegrationTests/XCFrameworkIntegration/Shared/App/ContentView.swift`
- Create: `IntegrationTests/XCFrameworkIntegration/Templates/ThemeEntry.swift.erb`
- Create: `IntegrationTests/XCFrameworkIntegration/Templates/IntegrationTests.swift.erb`

**Interfaces:**
- Produces: `enum IntegrationTheme` (из шаблона) с `name: String`, `initialize(onComplete:)`, `buttonAppearance: ButtonAppearance`, `primaryTextColor: ColorToken`; `struct ContentView: View`; тестовый класс `IntegrationTests`.
- Consumes: `SDDSComponents.BasicButton(title:subtitle:appearance:action:)`, `<Scheme>.BasicButton.l.default.appearance`, `ColorToken.textDefaultPrimary` (есть во всех трёх темах), `ColorToken.color(for:)` из `SDDSThemeCore`, `SDDSIcons.Asset.addFill24.image/uiImage`.

- [ ] **Step 1: `IntegrationApp.swift`**

```swift
import SwiftUI

@main
struct IntegrationApp: App {
    init() {
        IntegrationTheme.initialize {}
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

- [ ] **Step 2: `ContentView.swift`** — использует все пять модулей, кроме темы (её прячет `IntegrationTheme`)

```swift
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import SDDSIcons

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("SDDS integration: \(IntegrationTheme.name)")
                .foregroundColor(IntegrationTheme.primaryTextColor.color(for: .light))
            Asset.addFill24.image
            BasicButton(
                title: "Button",
                subtitle: "",
                appearance: IntegrationTheme.buttonAppearance,
                action: {}
            )
        }
        .padding()
    }
}
```

- [ ] **Step 3: `Templates/ThemeEntry.swift.erb`** — единственное место, где известно имя модуля темы

```erb
// Сгенерировано scripts/integration/generate_integration_project.rb — не править руками.
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import <%= scheme %>

enum IntegrationTheme {
    static let name = "<%= scheme %>"

    static func initialize(onComplete: @escaping () -> Void) {
        <%= scheme %>.Theme.initialize(onComplete: onComplete)
    }

    static var buttonAppearance: ButtonAppearance {
        <%= scheme %>.BasicButton.l.default.appearance
    }

    static var primaryTextColor: ColorToken {
        ColorToken.textDefaultPrimary
    }
}
```

- [ ] **Step 4: `Templates/IntegrationTests.swift.erb`** — hosted-тесты; `@testable import` нужен ради `IntegrationTheme`/`ContentView`

```erb
// Сгенерировано scripts/integration/generate_integration_project.rb — не править руками.
import XCTest
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import SDDSIcons
@testable import Integration<%= scheme %>

/// Hosted-тесты: процесс — само приложение Integration<%= scheme %>. Падение на старте
/// (Theme.initialize, рендер ContentView) валит xcodebuild test целиком.
final class IntegrationTests: XCTestCase {
    func testThemeInitializes() {
        let done = expectation(description: "Theme.initialize completes")
        IntegrationTheme.initialize { done.fulfill() }
        // Шрифты FontsService качает с CDN; успех загрузки не проверяем — только завершение.
        wait(for: [done], timeout: 60)
    }

    func testColorTokenResolves() {
        let color = UIColor(IntegrationTheme.primaryTextColor.color(for: .light))
        var alpha: CGFloat = 0
        XCTAssertTrue(color.getRed(nil, green: nil, blue: nil, alpha: &alpha))
        XCTAssertGreaterThan(alpha, 0, "textDefaultPrimary должен быть непрозрачным")
    }

    @MainActor
    func testComponentsRender() {
        let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 390, height: 844))
        let host = UIHostingController(rootView: ContentView())
        window.rootViewController = host
        window.makeKeyAndVisible()
        host.view.layoutIfNeeded()
        XCTAssertGreaterThan(host.view.bounds.width, 0)
        XCTAssertGreaterThan(host.view.bounds.height, 0)
    }

    func testIconAssetLoads() {
        // SwiftGen падает fatalError, если ресурс не доехал в бандл SDDSIcons.framework.
        XCTAssertGreaterThan(Asset.addFill24.uiImage.size.width, 0)
    }
}
```

- [ ] **Step 5: Синтаксическая проверка**

Run: `xcrun swiftc -parse IntegrationTests/XCFrameworkIntegration/Shared/App/*.swift && ruby -rerb -e 'scheme="SDDSServTheme"; Dir["IntegrationTests/XCFrameworkIntegration/Templates/*.erb"].each{|f| File.write("/tmp/#{File.basename(f,".erb")}", ERB.new(File.read(f)).result(binding))}' && xcrun swiftc -parse /tmp/ThemeEntry.swift /tmp/IntegrationTests.swift`
Expected: без ошибок (parse не проверяет импорты).

- [ ] **Step 6: Commit**

```bash
git add IntegrationTests/XCFrameworkIntegration/Shared IntegrationTests/XCFrameworkIntegration/Templates
git commit -m "feat(sdds-ios/build-system): add xcframework integration app sources"
```

---

### Task 3: Генератор проекта `generate_integration_project.rb`

**Files:**
- Create: `scripts/integration/generate_integration_project.rb`
- Create (генерируются и коммитятся): `IntegrationTests/XCFrameworkIntegration/XCFrameworkIntegration.xcodeproj/`, `IntegrationTests/XCFrameworkIntegration/Generated/<Scheme>/ThemeEntry.swift`, `.../Generated/<Scheme>/IntegrationTests.swift`
- Modify: `.gitignore` (добавить `Frameworks/` и `TestResults/`)

**Interfaces:**
- Consumes: `IntegrationThemes.list` (Task 1), шаблоны (Task 2).
- Produces: проект со схемами `Integration<Scheme>` (shared), app-таргет `Integration<Scheme>`, тест-таргет `Integration<Scheme>Tests` (hosted), file references `Frameworks/<Name>.xcframework`.

- [ ] **Step 1: Добавить в `.gitignore`**

```
## Интеграционный тест xcframework'ов (scripts/integration/run_integration_test.sh)
IntegrationTests/XCFrameworkIntegration/Frameworks/
IntegrationTests/TestResults/
```

- [ ] **Step 2: Написать генератор**

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Генерирует IntegrationTests/XCFrameworkIntegration/XCFrameworkIntegration.xcodeproj —
# приложение-потребитель релизных xcframework'ов. На каждую тему из Themes/*/*.xcodeproj:
#   Integration<Scheme>       — iOS app (SwiftUI), линкует SDDSThemeCore/SDDSComponents/<Scheme>
#                               (статические, Do Not Embed) и InputMask/SDDSIcons (динамические,
#                               Embed & Sign) из Frameworks/<Name>.xcframework
#   Integration<Scheme>Tests  — XCTest, hosted в приложении
# Файлы с именем темы (Generated/<Scheme>/*.swift) рендерятся из Templates/*.erb.
#
# Запуск из корня репозитория: ruby scripts/integration/generate_integration_project.rb
# Повторный запуск даёт тот же pbxproj (UUID детерминированы). Frameworks/ наполняет
# scripts/integration/run_integration_test.sh; в git папка не попадает.
require 'erb'
require 'fileutils'
require 'xcodeproj'
require_relative 'list_themes'

REPO_ROOT = File.expand_path('../..', __dir__)
ROOT = File.join(REPO_ROOT, 'IntegrationTests', 'XCFrameworkIntegration')
PROJECT_PATH = File.join(ROOT, 'XCFrameworkIntegration.xcodeproj')
DEPLOYMENT_TARGET = '15.0'
BUNDLE_PREFIX = 'ru.sberdevices.sdds.integration'

# Общие фреймворки: имя => встраивать ли (true только для динамических).
COMMON_FRAMEWORKS = {
  'SDDSThemeCore' => false,
  'SDDSComponents' => false,
  'InputMask' => true,
  'SDDSIcons' => true
}.freeze

SHARED_APP_FILES = %w[IntegrationApp.swift ContentView.swift].freeze
TEMPLATES = %w[ThemeEntry.swift IntegrationTests.swift].freeze

def render_template(name, scheme)
  template = File.read(File.join(ROOT, 'Templates', "#{name}.erb"))
  ERB.new(template, trim_mode: '-').result_with_hash(scheme: scheme)
end

def project_settings
  {
    'IPHONEOS_DEPLOYMENT_TARGET' => DEPLOYMENT_TARGET,
    'SWIFT_VERSION' => '5.0',
    'TARGETED_DEVICE_FAMILY' => '1',
    # Симулятор и CI: подпись не нужна, сертификатов на раннере нет.
    'CODE_SIGNING_ALLOWED' => 'NO',
    'CODE_SIGNING_REQUIRED' => 'NO',
    'CODE_SIGN_IDENTITY' => '',
    'FRAMEWORK_SEARCH_PATHS' => ['$(inherited)', '$(PROJECT_DIR)/Frameworks'],
    'LD_RUNPATH_SEARCH_PATHS' => ['$(inherited)', '@executable_path/Frameworks']
  }
end

def app_settings(scheme)
  {
    'PRODUCT_NAME' => '$(TARGET_NAME)',
    'PRODUCT_BUNDLE_IDENTIFIER' => "#{BUNDLE_PREFIX}.#{scheme.downcase}",
    'GENERATE_INFOPLIST_FILE' => 'YES',
    'INFOPLIST_KEY_UIApplicationSceneManifest_Generation' => 'YES',
    'INFOPLIST_KEY_UILaunchScreen_Generation' => 'YES',
    'INFOPLIST_KEY_UISupportedInterfaceOrientations' => 'UIInterfaceOrientationPortrait',
    'CURRENT_PROJECT_VERSION' => '1',
    'MARKETING_VERSION' => '1.0',
    'ENABLE_TESTABILITY' => 'YES'
  }
end

def test_settings(scheme, app_name)
  {
    'PRODUCT_NAME' => '$(TARGET_NAME)',
    'PRODUCT_BUNDLE_IDENTIFIER' => "#{BUNDLE_PREFIX}.#{scheme.downcase}.tests",
    'GENERATE_INFOPLIST_FILE' => 'YES',
    'TEST_HOST' => "$(BUILT_PRODUCTS_DIR)/#{app_name}.app/#{app_name}",
    'BUNDLE_LOADER' => '$(TEST_HOST)',
    'LD_RUNPATH_SEARCH_PATHS' => ['$(inherited)', '@executable_path/Frameworks', '@loader_path/Frameworks']
  }
end

themes = IntegrationThemes.list(REPO_ROOT)
abort('Не найдено ни одной темы в Themes/*/*.xcodeproj') if themes.empty?

FileUtils.rm_rf(PROJECT_PATH)
FileUtils.rm_rf(File.join(ROOT, 'Generated'))
project = Xcodeproj::Project.new(PROJECT_PATH)
project.build_configurations.each { |config| config.build_settings.merge!(project_settings) }

shared_group = project.main_group.new_group('Shared', 'Shared')
app_group = shared_group.new_group('App', 'App')
app_refs = SHARED_APP_FILES.map { |file| app_group.new_file(file) }
generated_group = project.main_group.new_group('Generated', 'Generated')
frameworks_group = project.main_group.new_group('Frameworks', 'Frameworks')

framework_refs = {}
(COMMON_FRAMEWORKS.keys + themes.map { |t| t['scheme'] }).each do |name|
  framework_refs[name] = frameworks_group.new_file("#{name}.xcframework")
end

themes.each do |theme|
  scheme = theme['scheme']
  app_name = "Integration#{scheme}"

  theme_dir = File.join(ROOT, 'Generated', scheme)
  FileUtils.mkdir_p(theme_dir)
  TEMPLATES.each { |name| File.write(File.join(theme_dir, name), render_template(name, scheme)) }
  theme_group = generated_group.new_group(scheme, scheme)
  theme_entry_ref = theme_group.new_file('ThemeEntry.swift')
  tests_ref = theme_group.new_file('IntegrationTests.swift')

  app = project.new_target(:application, app_name, :ios, DEPLOYMENT_TARGET)
  app.add_file_references(app_refs + [theme_entry_ref])
  app.build_configurations.each { |config| config.build_settings.merge!(app_settings(scheme)) }
  (COMMON_FRAMEWORKS.keys + [scheme]).each do |name|
    app.frameworks_build_phase.add_file_reference(framework_refs[name])
  end
  embed = app.new_copy_files_build_phase('Embed Frameworks')
  embed.symbol_dst_subfolder_spec = :frameworks
  COMMON_FRAMEWORKS.select { |_, embedded| embedded }.each_key do |name|
    build_file = embed.add_file_reference(framework_refs[name])
    build_file.settings = { 'ATTRIBUTES' => %w[CodeSignOnCopy RemoveHeadersOnCopy] }
  end

  tests = project.new_target(:unit_test_bundle, "#{app_name}Tests", :ios, DEPLOYMENT_TARGET)
  tests.add_dependency(app)
  tests.add_file_references([tests_ref])
  tests.build_configurations.each { |config| config.build_settings.merge!(test_settings(scheme, app_name)) }

  xcscheme = Xcodeproj::XCScheme.new
  xcscheme.add_build_target(app)
  xcscheme.add_test_target(tests)
  xcscheme.set_launch_target(app)
  xcscheme.save_as(PROJECT_PATH, app_name, true)
end

project.predictabilize_uuids
project.save
puts "Сгенерирован #{PROJECT_PATH}: #{themes.map { |t| "Integration#{t['scheme']}" }.join(', ')}"
```

- [ ] **Step 3: Сгенерировать и проверить схемы**

Run: `ruby scripts/integration/generate_integration_project.rb && xcodebuild -list -project IntegrationTests/XCFrameworkIntegration/XCFrameworkIntegration.xcodeproj`
Expected: Targets — `IntegrationPlasmaB2CTheme`, `IntegrationPlasmaB2CThemeTests`, `IntegrationPlasmaHomeDSTheme`, …, `IntegrationSDDSServTheme`, `IntegrationSDDSServThemeTests`; Schemes — три `Integration<Scheme>`.

- [ ] **Step 4: Проверить идемпотентность**

Run: `git add -A IntegrationTests && ruby scripts/integration/generate_integration_project.rb && git status --porcelain IntegrationTests`
Expected: пустой вывод (повторная генерация ничего не меняет).

- [ ] **Step 5: Commit**

```bash
git add .gitignore scripts/integration/generate_integration_project.rb IntegrationTests
git commit -m "feat(sdds-ios/build-system): generate xcframework integration project"
```

Сборку с реальными фреймворками проверяет Task 5 (нужны артефакты).

---

### Task 4: `scripts/integration/cache_keys.rb` — ключи слоёв кэша

**Files:**
- Create: `scripts/integration/cache_keys.rb`

**Interfaces:**
- Consumes: `IntegrationThemes.list`; env `CACHE_VERSION` (default `v1`), `XCODE_VERSION` (default `local`).
- Produces: stdout в формате `GITHUB_OUTPUT`: `core=<key>`, `components=<key>`, `themes=<json>` где json — `[{"dir","scheme","key"}]`. Ключи: `core-<prefix>-<h>`, `components-<prefix>-<coreh>-<h>`, `theme-<Scheme>-<prefix>-<componentsh>-<h>`; `<h>` — первые 16 hex sha256 от конкатенации `git rev-parse HEAD:<path>`.

- [ ] **Step 1: Написать скрипт**

```ruby
#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Ключи слоёв кэша артефактов для .github/workflows/integration-test.yml.
# Слой = набор путей; хэш слоя = sha256 от git-tree-хэшей этих путей (git rev-parse HEAD:<path>,
# для submodule Vendor/InputMask — его commit) + хэш нижнего слоя. Пересборка слоя нужна только
# когда меняется он сам или что-то ниже.
#
# Печатает строки для GITHUB_OUTPUT:
#   core=core-<prefix>-<h>
#   components=components-<prefix>-<coreh>-<h>
#   themes=[{"dir":"SDDSservTheme","scheme":"SDDSServTheme","key":"theme-SDDSServTheme-<prefix>-<componentsh>-<h>"}]
# prefix = CACHE_VERSION (ручная инвалидация) + XCODE_VERSION.
require 'digest'
require 'json'
require_relative 'list_themes'

REPO_ROOT = File.expand_path('../..', __dir__)

CORE_PATHS = %w[
  DesignSystemBuilder/SDDSThemeCore
  DesignSystemBuilder/DesignSystemBuilder.xcodeproj
  scripts/build_xcframeworks.rb
  scripts/common.rb
].freeze

COMPONENTS_PATHS = %w[
  SDDSComponents
  SDDSIcons
  SDDSApiInfo
  Vendor
  SDDS.xcworkspace
  Package.swift
  scripts/build_inputmask.rb
].freeze

def tree_hash(paths)
  hashes = paths.map do |path|
    hash = `git -C "#{REPO_ROOT}" rev-parse HEAD:#{path}`.strip
    abort("git rev-parse HEAD:#{path} не удался — путь не в HEAD?") unless $?.success? && !hash.empty?
    hash
  end
  Digest::SHA256.hexdigest(hashes.join)[0, 16]
end

prefix = "#{ENV.fetch('CACHE_VERSION', 'v1')}-xcode#{ENV.fetch('XCODE_VERSION', 'local')}"

core_hash = tree_hash(CORE_PATHS)
components_hash = tree_hash(COMPONENTS_PATHS)
themes = IntegrationThemes.list(REPO_ROOT).map do |theme|
  theme_hash = tree_hash(["Themes/#{theme['dir']}", 'scripts/build_themes.rb'])
  theme.merge('key' => "theme-#{theme['scheme']}-#{prefix}-#{components_hash}-#{theme_hash}")
end

puts "core=core-#{prefix}-#{core_hash}"
puts "components=components-#{prefix}-#{core_hash}-#{components_hash}"
puts "themes=#{JSON.generate(themes)}"
```

- [ ] **Step 2: Проверить формат и детерминизм**

Run: `ruby scripts/integration/cache_keys.rb | tee /tmp/keys1 && ruby scripts/integration/cache_keys.rb > /tmp/keys2 && diff /tmp/keys1 /tmp/keys2 && echo SAME`
Expected: три строки `core=…`, `components=…`, `themes=[…]` и `SAME`.

- [ ] **Step 3: Проверить чувствительность к слою**

Run: `CACHE_VERSION=v2 ruby scripts/integration/cache_keys.rb | head -1`
Expected: ключ начинается с `core-v2-xcodelocal-`, хэш тот же, что в `/tmp/keys1`.

- [ ] **Step 4: Commit**

```bash
git add scripts/integration/cache_keys.rb
git commit -m "chore(sdds-ios/build-system): compute artifact cache keys by git tree hashes"
```

---

### Task 5: `scripts/integration/run_integration_test.sh`

**Files:**
- Create: `scripts/integration/run_integration_test.sh` (chmod +x)

**Interfaces:**
- Consumes: проект из Task 3, `list_themes.rb` (Task 1).
- Produces: `IntegrationTests/XCFrameworkIntegration/Frameworks/<Name>.xcframework`, `<results>/<Scheme>.xcresult`, exit 0 только если все темы прошли.

- [ ] **Step 1: Написать скрипт**

```bash
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
  rm -rf "$FRAMEWORKS_DIR/$name"
  cp -R "$src" "$FRAMEWORKS_DIR/$name"
  echo "  $name  ← $src"
}

unpack_zip() {
  local zip="$1" tmp
  tmp="$(mktemp -d)"
  ditto -x -k "$zip" "$tmp"
  local found=0
  while IFS= read -r framework; do
    place_xcframework "$framework"
    found=1
  done < <(find "$tmp" -maxdepth 2 -name '*.xcframework' -type d)
  rm -rf "$tmp"
  [[ $found -eq 1 ]] || { echo "  ⚠️  в $zip нет *.xcframework" >&2; }
}

add_source() {
  local path="$1"
  if [[ -d "$path" && "$path" == *.xcframework ]]; then
    place_xcframework "$path"
  elif [[ -f "$path" && "$path" == *.xcframework.zip ]]; then
    unpack_zip "$path"
  elif [[ -d "$path" ]]; then
    local entry
    for entry in "$path"/*.xcframework "$path"/*.xcframework.zip; do
      [[ -e "$entry" ]] && add_source "$entry"
    done
  else
    echo "Не артефакт и не каталог: $path" >&2
    exit 1
  fi
}

step "1/3 Раскладка xcframework'ов → $FRAMEWORKS_DIR"
rm -rf "$FRAMEWORKS_DIR"
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

step "2/3 Проверка состава: ${COMMON_FRAMEWORKS[*]} + темы ${THEMES[*]}"
MISSING=()
for name in "${COMMON_FRAMEWORKS[@]}" "${THEMES[@]}"; do
  [[ -d "$FRAMEWORKS_DIR/$name.xcframework" ]] || MISSING+=("$name.xcframework")
done
if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo "❌ В $FRAMEWORKS_DIR нет ожидаемых артефактов:" >&2
  printf '   %s\n' "${MISSING[@]}" >&2
  exit 1
fi
echo "✅ все артефакты на месте"

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
declare -a REPORT=()
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
    REPORT+=("✅ $scheme")
  else
    REPORT+=("❌ $scheme  ($result_bundle)")
    FAILED=1
  fi
done

echo
echo "Итог:"
printf '  %s\n' "${REPORT[@]}"
exit $FAILED
```

- [ ] **Step 2: Негативная проверка (без артефактов)**

Run: `chmod +x scripts/integration/run_integration_test.sh && mkdir -p /tmp/empty-artifacts && scripts/integration/run_integration_test.sh /tmp/empty-artifacts; echo "exit=$?"`
Expected: список из `SDDSThemeCore.xcframework … SDDSServTheme.xcframework`, `exit=1`, `xcodebuild` не запускался.

- [ ] **Step 3: Позитивная проверка (нужны артефакты `scripts/release/build_release.sh local --skip-cli`)**

Run: `scripts/integration/run_integration_test.sh release-artifacts build`
Expected: три строки `✅`, exit 0. Второй путь `build` нужен ради `SDDSIcons.xcframework`: в
`release-artifacts/` его нет (у иконок отдельный релиз `SDDSIcons-v*`). Если падает компоновка/тест — это и есть находка: чинить проект/скрипт (не артефакты), результат зафиксировать в README (Task 7).

- [ ] **Step 4: Проверить, что артефакты можно давать и каталогами сборки**

Run: `scripts/integration/run_integration_test.sh --theme SDDSServTheme build DesignSystemBuilder/build Themes/build`
Expected: `✅ SDDSServTheme`, exit 0.

- [ ] **Step 5: Commit**

```bash
git add scripts/integration/run_integration_test.sh
git commit -m "feat(sdds-ios/build-system): run xcframework integration test per theme"
```

---

### Task 6: Воркфлоу `.github/workflows/integration-test.yml`

**Files:**
- Create: `.github/workflows/integration-test.yml`

**Interfaces:**
- Consumes: `cache_keys.rb` (Task 4), `run_integration_test.sh` (Task 5), сборочные скрипты `build_xcframeworks.rb`, `build_themes.rb`.
- Produces: check `Integration test (all themes)` (для ruleset), артефакты `integration-<Scheme>-xcresult` при падении.

- [ ] **Step 1: Написать воркфлоу**

```yaml
name: Release artifacts integration

# Проверяет, что релизные xcframework'и подключаются в чистое приложение и оно запускается —
# после мержа в develop и на PR в main (required check, см. ruleset). Артефакты кэшируются
# слоями core → components → theme (ключи — git-tree-хэши, scripts/integration/cache_keys.rb):
# пересобирается только изменившийся слой, тесты идут матрицей по темам.
on:
  push:
    branches: [develop]
  pull_request:
    branches: [main]
  workflow_dispatch:

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

env:
  # Тот же Xcode, что в publish-release.yml. Входит в ключ кэша.
  XCODE_VERSION: '26.6'
  # Ручная инвалидация кэша артефактов: поменять, если изменился формат сборки.
  CACHE_VERSION: v1

jobs:
  keys:
    name: Cache keys
    runs-on: ubuntu-latest
    outputs:
      core: ${{ steps.keys.outputs.core }}
      core_hit: ${{ steps.core_lookup.outputs.cache-hit }}
      components: ${{ steps.keys.outputs.components }}
      components_hit: ${{ steps.components_lookup.outputs.cache-hit }}
      themes: ${{ steps.keys.outputs.themes }}
    steps:
      - uses: actions/checkout@v4
      - name: Install xcodeproj gem
        run: gem install xcodeproj --no-document
      - name: Compute layer keys
        id: keys
        run: ruby scripts/integration/cache_keys.rb | tee -a "$GITHUB_OUTPUT"
      - name: Lookup SDDSThemeCore cache
        id: core_lookup
        uses: actions/cache/restore@v4
        with:
          path: DesignSystemBuilder/build/SDDSThemeCore.xcframework
          key: ${{ steps.keys.outputs.core }}
          lookup-only: true
      - name: Lookup components cache
        id: components_lookup
        uses: actions/cache/restore@v4
        with:
          path: build/*.xcframework
          key: ${{ steps.keys.outputs.components }}
          lookup-only: true

  core:
    name: SDDSThemeCore
    needs: keys
    if: needs.keys.outputs.core_hit != 'true'
    runs-on: macos-26
    timeout-minutes: 60
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: recursive
      - uses: maxim-lobanov/setup-xcode@v1
        with:
          xcode-version: ${{ env.XCODE_VERSION }}
      - name: Build SDDSThemeCore.xcframework
        run: ruby scripts/build_xcframeworks.rb -d DesignSystemBuilder -p DesignSystemBuilder.xcodeproj -m SDDSThemeCore
      - uses: actions/cache/save@v4
        with:
          path: DesignSystemBuilder/build/SDDSThemeCore.xcframework
          key: ${{ needs.keys.outputs.core }}

  components:
    name: InputMask, SDDSComponents, SDDSIcons
    needs: [keys, core]
    # core может быть skipped (кэш) — !failure() пропускает skipped, но не failure/cancelled.
    if: ${{ !failure() && !cancelled() && needs.keys.outputs.components_hit != 'true' }}
    runs-on: macos-26
    timeout-minutes: 90
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: recursive
      - uses: maxim-lobanov/setup-xcode@v1
        with:
          xcode-version: ${{ env.XCODE_VERSION }}
      - name: Restore SDDSThemeCore.xcframework
        uses: actions/cache/restore@v4
        with:
          path: DesignSystemBuilder/build/SDDSThemeCore.xcframework
          key: ${{ needs.keys.outputs.core }}
          fail-on-cache-miss: true
      - name: Build InputMask, SDDSComponents, SDDSIcons
        run: ruby scripts/build_xcframeworks.rb -d . -w SDDS.xcworkspace
      - uses: actions/cache/save@v4
        with:
          path: build/*.xcframework
          key: ${{ needs.keys.outputs.components }}

  integration:
    name: Integration test
    needs: [keys, core, components]
    if: ${{ !failure() && !cancelled() }}
    runs-on: macos-26
    timeout-minutes: 90
    strategy:
      fail-fast: false
      matrix:
        include: ${{ fromJson(needs.keys.outputs.themes) }}
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: recursive
      - uses: maxim-lobanov/setup-xcode@v1
        with:
          xcode-version: ${{ env.XCODE_VERSION }}
      - name: Install Ruby dependencies
        run: bundle install
      - name: Restore SDDSThemeCore.xcframework
        uses: actions/cache/restore@v4
        with:
          path: DesignSystemBuilder/build/SDDSThemeCore.xcframework
          key: ${{ needs.keys.outputs.core }}
          fail-on-cache-miss: true
      - name: Restore components xcframeworks
        uses: actions/cache/restore@v4
        with:
          path: build/*.xcframework
          key: ${{ needs.keys.outputs.components }}
          fail-on-cache-miss: true
      - name: Restore ${{ matrix.scheme }}.xcframework.zip
        id: theme_cache
        uses: actions/cache/restore@v4
        with:
          path: Themes/build/${{ matrix.scheme }}.xcframework.zip
          key: ${{ matrix.key }}
      - name: Build ${{ matrix.scheme }}.xcframework
        if: steps.theme_cache.outputs.cache-hit != 'true'
        run: ruby scripts/build_themes.rb ${{ matrix.dir }}
      - name: Save ${{ matrix.scheme }}.xcframework.zip
        if: steps.theme_cache.outputs.cache-hit != 'true'
        uses: actions/cache/save@v4
        with:
          path: Themes/build/${{ matrix.scheme }}.xcframework.zip
          key: ${{ matrix.key }}
      - name: Run integration test
        run: >
          scripts/integration/run_integration_test.sh
          --theme ${{ matrix.scheme }}
          --results IntegrationTests/TestResults
          DesignSystemBuilder/build build Themes/build
      - name: Upload xcresult
        if: failure()
        uses: actions/upload-artifact@v4
        with:
          name: integration-${{ matrix.scheme }}-xcresult
          path: IntegrationTests/TestResults/${{ matrix.scheme }}.xcresult
          retention-days: 14
          if-no-files-found: ignore

  # Единый required status check для ruleset main: имя не зависит от списка тем.
  integration-test:
    name: Integration test (all themes)
    needs: [keys, core, components, integration]
    if: always()
    runs-on: ubuntu-latest
    steps:
      - name: Verdict
        run: |
          echo "keys=${{ needs.keys.result }} core=${{ needs.core.result }} components=${{ needs.components.result }} integration=${{ needs.integration.result }}"
          if [[ "${{ needs.integration.result }}" != "success" ]]; then
            echo "::error::интеграционный тест не прошёл (integration=${{ needs.integration.result }})"
            exit 1
          fi
```

- [ ] **Step 2: Проверить синтаксис YAML и (если есть) actionlint**

Run: `ruby -ryaml -e 'YAML.load_file(".github/workflows/integration-test.yml"); puts "yaml ok"' && (command -v actionlint >/dev/null && actionlint .github/workflows/integration-test.yml || echo "actionlint не установлен")`
Expected: `yaml ok`; actionlint без ошибок либо сообщение, что не установлен.

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/integration-test.yml
git commit -m "ci(sdds-ios/build-system): integration test of release xcframeworks with layered cache"
```

---

### Task 7: Документация и память команды

**Files:**
- Create: `IntegrationTests/CLAUDE.md`
- Modify: `CLAUDE.md` (таблица «Карта пакетов»), `scripts/CLAUDE.md` (раздел «Тесты»), `README.md` (после раздела про релизные ассеты), `.claude/memory/plasma-ios-decisions.md`

- [ ] **Step 1: `IntegrationTests/CLAUDE.md`**

```markdown
# CLAUDE.md — IntegrationTests

Интеграционный тест релизных xcframework'ов: чистое iOS-приложение на каждую тему подключает
`SDDSThemeCore`, `SDDSComponents`, `InputMask`, `SDDSIcons` и `<Scheme>.xcframework` так, как
это делает внешний клиент, и гоняет hosted-XCTest на симуляторе (`Theme.initialize`, токены,
рендер `BasicButton`, иконки).

## Структура

- `XCFrameworkIntegration/XCFrameworkIntegration.xcodeproj` — сгенерирован, коммитится.
- `XCFrameworkIntegration/Shared/App/` — общие исходники приложения.
- `XCFrameworkIntegration/Templates/*.erb` — шаблоны файлов с именем темы.
- `XCFrameworkIntegration/Generated/<Scheme>/` — `ThemeEntry.swift`, `IntegrationTests.swift`
  (сгенерированы, коммитятся).
- `XCFrameworkIntegration/Frameworks/` — xcframework'и (в `.gitignore`, наполняет скрипт).
- `TestResults/` — `<Scheme>.xcresult` (в `.gitignore`).

## Запуск локально

```sh
scripts/release/build_release.sh local --skip-cli          # ~50 мин, все артефакты
# release-artifacts + build: SDDSIcons.xcframework в ассеты релиза не входит (отдельный
# релиз SDDSIcons-v*), поэтому берём его из build/
scripts/integration/run_integration_test.sh release-artifacts build
# или только одна тема из каталогов сборки:
scripts/integration/run_integration_test.sh --theme SDDSServTheme build DesignSystemBuilder/build Themes/build
```

CI: `.github/workflows/integration-test.yml` (push в `develop`, PR в `main`, ручной запуск).

## Перегенерация проекта

Добавили тему в `Themes/` — запусти `ruby scripts/integration/generate_integration_project.rb`
и закоммить `XCFrameworkIntegration/`. Шаблоны и общие исходники правь руками, `Generated/` и
`.xcodeproj` — нет.

## Грабли

- Статические фреймворки — только Do Not Embed; динамические (`InputMask`, `SDDSIcons`) —
  Embed & Sign. Это правило проекта, генератор его кодирует.
- Схема `Integration<Scheme>` использует имя таргета темы (`SDDSServTheme`), а не папки
  (`SDDSservTheme`).
- Коммит-скоуп: `sdds-ios/build-system`.
```

- [ ] **Step 2: Корневой `CLAUDE.md`** — строка в таблицу после `IntegrationCore/`:

```markdown
| `IntegrationTests/` | Интеграционный тест релизных xcframework'ов (приложение на тему + CI) | [CLAUDE.md](IntegrationTests/CLAUDE.md) |
```

- [ ] **Step 3: `scripts/CLAUDE.md`** — в раздел «Тесты» после `run_tests.rb`:

```markdown
- `integration/run_integration_test.sh <path>...` — раскладывает релизные xcframework'и в
  `IntegrationTests/XCFrameworkIntegration/Frameworks/` и гоняет hosted-тесты приложения на
  тему (`xcodebuild test`). `integration/generate_integration_project.rb` — генератор проекта,
  `integration/cache_keys.rb` — ключи слоёв кэша для `integration-test.yml`,
  `integration/list_themes.rb` — список тем (`dir`/`scheme`).
```

- [ ] **Step 4: `README.md`** — после абзаца про `build_release.sh`:

```markdown
### Интеграционный тест релизных артефактов

`.github/workflows/integration-test.yml` после мержа в `develop` и на PR в `main` подключает
собранные xcframework'и в чистое приложение на каждую тему
([IntegrationTests/](IntegrationTests/CLAUDE.md)) и гоняет тесты на симуляторе. Слои
артефактов кэшируются по хэшам исходников — пересобирается только изменившийся. Локально:

```
scripts/release/build_release.sh local --skip-cli
scripts/integration/run_integration_test.sh release-artifacts build
```

`SDDSIcons.xcframework` берётся из `build/`: в ассеты датного релиза он не входит (у иконок
отдельный релиз `SDDSIcons-v*`).

Как подключать xcframework'и в приложение: статические (`SDDSThemeCore`, `SDDSComponents`,
темы) — **Do Not Embed**, динамические (`InputMask`, `SDDSIcons`) — **Embed & Sign**.
```

Если Task 5 показал, что ресурсам `SDDSComponents` нужен отдельный шаг (copy-resources),
дописать его здесь же.

- [ ] **Step 5: `.claude/memory/plasma-ios-decisions.md`** — абзац в раздел «Процесс»:

```markdown
- Интеграционный тест релизных артефактов (с 2026-09-03) — `integration-test.yml`: push в
  `develop`, PR в `main`, `workflow_dispatch`. Слои `core → components → theme` в
  `actions/cache` по git-tree-хэшам (`scripts/integration/cache_keys.rb`), тесты матрицей по
  темам; required check для ruleset `main` — `Integration test (all themes)`. В
  `publish-release.yml` тест не вставляли (релиз идёт с уже проверенного `main`), `build.yml`
  не трогали. Статические фреймворки в клиентских проектах — только Do Not Embed.
```

- [ ] **Step 6: Commit**

```bash
git add IntegrationTests/CLAUDE.md CLAUDE.md scripts/CLAUDE.md README.md .claude/memory/plasma-ios-decisions.md
git commit -m "docs(sdds-ios/build-system): document xcframework integration test"
```

---

### Task 8: Прогон на CI и PR в `develop`

**Files:** нет (git/GitHub).

- [ ] **Step 1: Push ветки и ручной запуск**

```bash
git push -u origin feature/release-artifacts-integration-test
gh workflow run integration-test.yml --ref feature/release-artifacts-integration-test
```

- [ ] **Step 2: Дождаться холодного прогона**

Run: `gh run list --workflow integration-test.yml --branch feature/release-artifacts-integration-test --limit 1` → `gh run watch <id> --exit-status`
Expected: `core`, `components`, три `integration` и `Integration test (all themes)` зелёные; общее время ≈ 55–60 мин.

- [ ] **Step 3: Тёплый прогон**

Run: `gh workflow run integration-test.yml --ref feature/release-artifacts-integration-test` → `gh run watch`
Expected: `core` и `components` — `skipped`, в каждом `integration` шаг «Restore <Scheme>.xcframework.zip» — cache hit, шаг сборки темы пропущен; общее время ≈ 10–15 мин.

- [ ] **Step 4: PR в `develop`** (мерж — только владелец)

```bash
gh pr create --base develop --title "ci(sdds-ios/build-system): integration test of release xcframeworks" --body-file <(cat <<'EOF'
### What/why changed
Интеграционный тест релизных xcframework'ов: чистое приложение на каждую тему подключает артефакты как внешний клиент и гоняет hosted-XCTest на симуляторе. Воркфлоу `integration-test.yml` — push в `develop`, PR в `main`, слои артефактов в `actions/cache` по git-tree-хэшам.

Спека: `docs/superpowers/specs/2026-09-03-release-artifacts-integration-test-design.md`.

### После мержа
Ruleset на `main` (required check `Integration test (all themes)` + PR-only) — команда в описании ниже, выполняет владелец после первого зелёного прогона на `develop`.
EOF
)
```

---

### Task 9: Ruleset на `main` (после мержа в `develop`, выполняет владелец)

- [ ] **Step 1: Убедиться, что прогон на `develop` зелёный**

Run: `gh run list --workflow integration-test.yml --branch develop --limit 1`
Expected: `success`.

- [ ] **Step 2: Создать ruleset**

```bash
gh api -X POST repos/salute-developers/plasma-ios/rulesets --input - <<'EOF'
{
  "name": "main: PR + integration test",
  "target": "branch",
  "enforcement": "active",
  "conditions": { "ref_name": { "include": ["refs/heads/main"], "exclude": [] } },
  "rules": [
    {
      "type": "pull_request",
      "parameters": {
        "required_approving_review_count": 0,
        "dismiss_stale_reviews_on_push": false,
        "require_code_owner_review": false,
        "require_last_push_approval": false,
        "required_review_thread_resolution": false
      }
    },
    {
      "type": "required_status_checks",
      "parameters": {
        "strict_required_status_checks_policy": false,
        "required_status_checks": [
          { "context": "Integration test (all themes)" }
        ]
      }
    }
  ]
}
EOF
```

- [ ] **Step 3: Проверить**

Run: `gh api repos/salute-developers/plasma-ios/rulesets --jq '.[] | "\(.name) \(.enforcement)"'`
Expected: `main: PR + integration test active`. На следующем PR в `main` в списке checks появляется required `Integration test (all themes)`.
