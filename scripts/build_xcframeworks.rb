#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'
require_relative 'common' # Подключаем общий файл

def build_xcframeworks(project_root_dir, workspace_name, project_name, modules)
  print_info "Корневая директория проекта: #{project_root_dir}"

  # Добавляем SDDSComponentsPreview в список модулей, если он не указан пользователем
  if modules.empty?
    modules = ['SDDSComponents', 'SDDSIcons']
  end

  if workspace_name
    workspace_path = File.join(project_root_dir, workspace_name)
    print_info "Путь к XCWorkspace: #{workspace_path}"
  end

  if project_name
    project_path = File.join(project_root_dir, project_name)
    print_info "Путь к Xcode проекту: #{project_path}"
  end

  build_folder = "build"
  build_path = File.join(project_root_dir, build_folder)
  print_info "Артефакты будут сохранены в: #{build_path}"

  FileUtils.rm_rf(build_path)
  FileUtils.mkdir_p(build_path)

  print_info "Сборка XCFramework для всех модулей..."
  modules.each do |scheme|
    print_info "Сборка XCFramework для схемы #{scheme}"

    print_info "Создание архива для устройства iOS..."
    ios_archive_path = File.join(build_path, "#{scheme}-iphoneos.xcarchive")
    if workspace_name
      execute_command("xcodebuild archive -workspace #{workspace_path} -scheme #{scheme} -archivePath #{ios_archive_path} -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES")
    else
      execute_command("xcodebuild archive -project #{project_path} -scheme #{scheme} -archivePath #{ios_archive_path} -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES")
    end

    print_info "Создание архива для симулятора iOS..."
    ios_simulator_archive_path = File.join(build_path, "#{scheme}-iossimulator.xcarchive")
    if workspace_name
      execute_command("xcodebuild archive -workspace #{workspace_path} -scheme #{scheme} -archivePath #{ios_simulator_archive_path} -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES")
    else
      execute_command("xcodebuild archive -project #{project_path} -scheme #{scheme} -archivePath #{ios_simulator_archive_path} -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES")
    end

    print_info "Создание XCFramework..."
    xcframework_path = File.join(build_path, "#{scheme}.xcframework")
    execute_command("xcodebuild -create-xcframework -framework #{ios_archive_path}/Products/Library/Frameworks/#{scheme}.framework -framework #{ios_simulator_archive_path}/Products/Library/Frameworks/#{scheme}.framework -output #{xcframework_path}")

    print_success "Сборка успешно завершена для схемы #{scheme}"

    print_info "Очистка временных архивов..."
    FileUtils.rm_rf(ios_archive_path)
    FileUtils.rm_rf(ios_simulator_archive_path)
  end

  print_success "Все сборки успешно завершены"
end


# Парсинг аргументов командной строки для корневой директории проекта, workspace, проекта и модулей
options = {}
OptionParser.new do |opts|
  opts.banner = "Использование: build_xcframeworks.rb [опции]"

  opts.on("-dDIRECTORY", "--directory=DIRECTORY", "Корневая директория проекта") do |d|
    options[:directory] = d
  end

  opts.on("-wWORKSPACE", "--workspace=WORKSPACE", "Имя XCWorkspace файла (необязательно)") do |w|
    options[:workspace] = w
  end

  opts.on("-pPROJECT", "--project=PROJECT", "Имя Xcode проекта (необязательно, если указан workspace)") do |p|
    options[:project] = p
  end

  opts.on("-mMODULES", "--modules=MODULES", "Список модулей, разделенных запятыми") do |m|
    options[:modules] = m
  end
end.parse!

project_root_dir = options[:directory] || File.expand_path('..', __dir__)
workspace_name = options[:workspace]
project_name = options[:project]
modules = options[:modules] ? options[:modules].split(',') : []

print_info "Параметры, переданные скрипту:"
print_info "Корневая директория проекта: #{project_root_dir}"
print_info "Имя workspace: #{workspace_name}"
print_info "Имя проекта: #{project_name}"
print_info "Модули: #{modules.join(', ')}"

if !workspace_name && !project_name
  print_error "Не указан ни workspace, ни проект. Используйте -w или --workspace для указания workspace, или -p или --project для указания проекта."
  exit 1
end

build_xcframeworks(project_root_dir, workspace_name, project_name, modules)
