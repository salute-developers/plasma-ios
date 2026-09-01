#!/usr/bin/env ruby

require 'fileutils'
require 'open3'
require_relative 'common'

def generate_api_meta
  output, status = Open3.capture2e(File.join(__dir__, 'generate_api_meta.sh'))
  unless status.success?
    puts output
    abort('Не удалось сгенерировать ios-api-meta.json')
  end
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

    sdk = case platform
          when 'iOS'
            'iphonesimulator'
          when 'macOS'
            'macosx'
          else
            raise "Неизвестная платформа: #{platform}"
          end

    destination = case platform
                  when 'iOS'
                    "platform=iOS Simulator,name=iPhone 16 Pro Max"
                  when 'macOS'
                    "platform=macOS,arch=arm64"
                  else
                    raise "Неизвестная платформа: #{platform}"
                  end

    command = "xcodebuild -scheme #{scheme} #{type_flag} #{project_or_workspace_path} -sdk #{sdk} -destination '#{destination}' test"
    execute_command(command)

    print_success "Тесты успешно пройдены для схемы #{scheme}"
  end
end

# SwiftPM-пакеты тестируются через `swift test` (они вне xcworkspace).
def run_spm_tests(project_root_dir, packages)
  packages.each do |package|
    print_info "Запуск swift test для #{package}"
    execute_command("swift test --package-path #{File.join(project_root_dir, package)}")
    print_success "Тесты успешно пройдены для #{package}"
  end
end

# Основная логика
project_root_dir = File.expand_path('..', __dir__)
workspace_name = "SDDS.xcworkspace"

# Xcode-схемы: сюда добавляются наборы, которые невозможно прогнать через SwiftPM
# (iOS-симулятор, ресурсы .xcassets и т.п.).
modules = []

generate_api_meta
run_xcode_tests(project_root_dir, workspace_name, modules)
# dsbuilder: генерация тем + документационный бандл.
run_spm_tests(project_root_dir, ["DesignSystemBuilder"])

print_success "Все тесты успешно пройдены"
