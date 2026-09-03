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

# Наборы вариаций BasicButton у тем разные (PlasmaHomeDSTheme, например, без `l`), поэтому
# размер берём из самой темы: первый существующий из этого списка предпочтений.
SIZE_VARIATION_PREFERENCE = %w[m s xs l xl].freeze

def size_variation_for(theme_dir)
  path = File.join(REPO_ROOT, 'Themes', theme_dir, 'BasicButton', 'BasicButton+BaseVariations.swift')
  abort("Не найден #{path} — у темы #{theme_dir} нет BasicButton?") unless File.exist?(path)

  available = File.read(path).scan(/public static var ([A-Za-z][A-Za-z0-9]*)\b/).flatten
  variation = SIZE_VARIATION_PREFERENCE.find { |name| available.include?(name) }
  abort("У темы #{theme_dir} нет ни одной из вариаций BasicButton #{SIZE_VARIATION_PREFERENCE.join(', ')} (есть: #{available.join(', ')})") unless variation

  variation
end

def render_template(name, scheme, size_variation)
  template = File.read(File.join(ROOT, 'Templates', "#{name}.erb"))
  ERB.new(template, trim_mode: '-').result_with_hash(scheme: scheme, size_variation: size_variation)
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

targets_by_scheme = {}

themes.each do |theme|
  scheme = theme['scheme']
  app_name = "Integration#{scheme}"

  size_variation = size_variation_for(theme['dir'])
  theme_dir = File.join(ROOT, 'Generated', scheme)
  FileUtils.mkdir_p(theme_dir)
  TEMPLATES.each do |name|
    File.write(File.join(theme_dir, name), render_template(name, scheme, size_variation))
  end
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

  targets_by_scheme[scheme] = { app: app, tests: tests }
end

# Два прохода: UUID объекта считается из «пути», а путь PBXContainerItemProxy включает
# remoteGlobalIDString — на первом проходе это ещё случайный UUID таргета. Второй проход
# считает пути уже от стабильных UUID, поэтому повторная генерация даёт тот же pbxproj.
2.times { project.predictabilize_uuids }
project.save

# Схемы сохраняются после predictabilize_uuids: BlueprintIdentifier ссылается на UUID таргета.
targets_by_scheme.each do |scheme, targets|
  app_name = "Integration#{scheme}"
  xcscheme = Xcodeproj::XCScheme.new
  xcscheme.add_build_target(targets[:app])
  xcscheme.add_test_target(targets[:tests])
  xcscheme.set_launch_target(targets[:app])
  xcscheme.save_as(PROJECT_PATH, app_name, true)
end

puts "Сгенерирован #{PROJECT_PATH}: #{themes.map { |t| "Integration#{t['scheme']}" }.join(', ')}"
