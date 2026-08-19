#!/usr/bin/env ruby

require 'fileutils'
require 'open3'
require_relative 'common'

def run_tests(project_root_dir, workspace_name, modules)
  output, status = Open3.capture2e(File.join(__dir__, 'generate_api_meta.sh'))
  unless status.success?
    puts output
    abort('Не удалось сгенерировать ios-api-meta.json')
  end

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

  print_success "Все тесты успешно пройдены"
end

# Основная логика
project_root_dir = File.expand_path('..', __dir__)
workspace_name = "SDDS.xcworkspace"
modules = [
  {scheme: "SDDSThemeBuilderCoreTests", platform: "macOS", project_name: "SDDSThemeBuilder", project_dir: "#{project_root_dir}/SDDSThemeBuilder", use_workspace: false}
]

run_tests(project_root_dir, workspace_name, modules)
