#!/usr/bin/env ruby

require 'fileutils'
require 'open3'
require 'json'
require_relative 'common'

def generate_api_meta
  output, status = Open3.capture2e(File.join(__dir__, 'generate_api_meta.sh'))
  unless status.success?
    puts output
    abort('Не удалось сгенерировать ios-api-meta.json')
  end
end

# Подбирает конкретный симулятор вместо `name=...`: имя устройства без OS резолвится в
# `OS:latest`, а на свежих рантаймах половины моделей просто нет (на iOS 26 нет
# «iPhone 16 Pro Max»). Берём самый новый рантайм, где есть хоть одно подходящее устройство.
PREFERRED_SIMULATORS = ['iPhone 16 Pro Max', 'iPhone 16 Pro', 'iPhone 16', 'iPhone'].freeze

def runtime_sort_key(runtime_id)
  runtime_id.split('.').last.to_s.scan(/\d+/).map(&:to_i)
end

def resolve_ios_simulator
  json = `xcrun simctl list devices available --json 2>/dev/null`
  raise 'Не удалось получить список симуляторов' if json.strip.empty?

  devices = JSON.parse(json)['devices']
  runtimes = devices.keys.select { |k| k.include?('iOS') }.sort_by { |k| runtime_sort_key(k) }.reverse

  PREFERRED_SIMULATORS.each do |wanted|
    runtimes.each do |runtime|
      match = devices[runtime].find { |d| d['name'].start_with?(wanted) && d['isAvailable'] }
      next unless match

      print_info "Симулятор: #{match['name']} (#{runtime.split('.').last}, #{match['udid']})"
      return match['udid']
    end
  end

  raise 'Не найден ни один доступный iOS-симулятор'
end

def run_xcode_tests(project_root_dir, workspace_name, modules)
  return if modules.empty?

  workspace_path = File.join(project_root_dir, workspace_name)
  print_info "Путь к XCWorkspace: #{workspace_path}"

  modules.each do |module_info|
    scheme = module_info[:scheme]
    platform = module_info[:platform]
    project_dir = module_info.fetch(:project_dir, project_root_dir)
    project_or_workspace_path = module_info[:use_workspace] ? workspace_path : File.join(project_dir, "#{module_info[:project_name]}.xcodeproj")
    type_flag = module_info[:use_workspace] ? "-workspace" : "-project"

    print_info "Запуск тестов для схемы #{scheme} на платформе #{platform}"

    destination = case platform
                  when 'iOS'
                    "platform=iOS Simulator,id=#{resolve_ios_simulator}"
                  when 'macOS'
                    "platform=macOS,arch=arm64"
                  else
                    raise "Неизвестная платформа: #{platform}"
                  end

    # Платформу задаём только через -destination. Глобальный -sdk применился бы ко всем
    # таргетам графа, включая macro-плагин SDDSApiInfo, и сломал бы его сборку.
    # resultBundlePath нужен, чтобы потом достать покрытие через `xcrun xccov`.
    result_bundle = File.join(project_root_dir, 'build', 'test-results', "#{scheme}.xcresult")
    FileUtils.rm_rf(result_bundle)
    FileUtils.mkdir_p(File.dirname(result_bundle))

    command = "xcodebuild -scheme #{scheme} #{type_flag} #{project_or_workspace_path} " \
              "-destination '#{destination}' -enableCodeCoverage YES " \
              "-resultBundlePath '#{result_bundle}' test"
    execute_command(command)

    print_success "Тесты успешно пройдены для схемы #{scheme}"
  end
end

# SwiftPM-пакеты тестируются через `swift test` (они вне xcworkspace).
def run_spm_tests(project_root_dir, packages)
  packages.each do |package|
    print_info "Запуск swift test для #{package}"
    execute_command("swift test --enable-code-coverage --package-path #{File.join(project_root_dir, package)}")
    print_success "Тесты успешно пройдены для #{package}"
  end
end

# Печатает покрытие по каждому .xcresult. Не влияет на код возврата: покрытие — это
# наблюдение, а не гейт, порогов мы не вводим.
def report_coverage(project_root_dir)
  bundles = Dir.glob(File.join(project_root_dir, 'build', 'test-results', '*.xcresult'))
  return if bundles.empty?

  print_info 'Покрытие кода'
  bundles.each do |bundle|
    json = `xcrun xccov view --report --json "#{bundle}" 2>/dev/null`
    next if json.strip.empty?

    begin
      report = JSON.parse(json)
    rescue JSON::ParserError
      next
    end

    Array(report['targets']).each do |target|
      name = target['name'].to_s
      next if name.end_with?('.xctest')

      percent = (target['lineCoverage'].to_f * 100).round(1)
      puts format('  %-40s %5.1f%%', name, percent)
    end
  end
end

# Основная логика
project_root_dir = File.expand_path('..', __dir__)
workspace_name = "SDDS.xcworkspace"

# Xcode-схемы: сюда добавляются наборы, которые невозможно прогнать через SwiftPM
# (iOS-симулятор, ресурсы .xcassets и т.п.).
modules = [
  { scheme: 'SDDSComponentsTests', platform: 'iOS', use_workspace: true }
]

generate_api_meta
run_xcode_tests(project_root_dir, workspace_name, modules)
# dsbuilder: генерация тем + документационный бандл.
run_spm_tests(project_root_dir, ["DesignSystemBuilder", "IntegrationCore/SandboxCore"])
report_coverage(project_root_dir)

print_success "Все тесты успешно пройдены"
