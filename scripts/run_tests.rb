#!/usr/bin/env ruby

require 'fileutils'
require_relative 'common' # Подключаем общий файл

def run_tests(project_root_dir, workspace_name, modules)
  print_info "Корневая директория проекта: #{project_root_dir}"

  workspace_path = File.join(project_root_dir, workspace_name)
  print_info "Путь к XCWorkspace: #{workspace_path}"

  print_info "Запуск тестов для всех модулей..."
  modules.each do |scheme|
    xcode_project_path = File.join(project_root_dir, scheme, "#{scheme}.xcodeproj")

    print_info "Запуск тестов для схемы #{scheme}"
    
    command = "xcodebuild -scheme #{scheme} -workspace #{workspace_path} -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 14 Pro Max' test"
    execute_command(command)
    
    print_success "Тесты успешно пройдены для схемы #{scheme}"
  end

  print_success "Все тесты успешно пройдены"
end

# Основная логика
project_root_dir = File.expand_path('..', __dir__)
workspace_name = "SDDS.xcworkspace"
modules = ["SDDSSwiftUI", "SDDSUIKit", "SDDSIcons", "SDDSCore"]

run_tests(project_root_dir, workspace_name, modules)
