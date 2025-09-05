#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'
require_relative 'common' # Подключаем общий файл

def build_xcframeworks(project_root_dir, workspace_name, project_name, modules, force = false)
  print_info "Корневая директория проекта: #{project_root_dir}"

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

  # Создаем папку build, если она не существует
  FileUtils.mkdir_p(build_path)

  print_info "Сборка XCFramework для всех модулей..."
  modules.each do |scheme|
    # Определяем имя XCFramework для проверки существования
    xcframework_name = scheme == 'SDDSThemeCore' ? 'SDDSThemeCore' : scheme
    xcframework_path = File.join(build_path, "#{xcframework_name}.xcframework")
    
    # Проверяем, существует ли уже XCFramework (если не указан флаг force)
    if !force && File.exist?(xcframework_path)
      print_info "XCFramework #{xcframework_name} уже существует в #{xcframework_path}, пропускаем сборку"
      next
    elsif force && File.exist?(xcframework_path)
      print_info "XCFramework #{xcframework_name} уже существует, но принудительно пересобираем (флаг -force)"
    end
    
    print_info "Сборка XCFramework для схемы #{scheme}"
    
    # Определяем проект для конкретного модуля
    current_workspace = workspace_name
    current_project = project_name
    
    # SDDSThemeCore должен собираться из SDDSThemeBuilder проекта
    if scheme == 'SDDSThemeCore'
      current_workspace = nil
      current_project = 'SDDSThemeBuilder/SDDSThemeBuilder.xcodeproj'
      scheme = 'SDDSThemeCore (SDDSThemeBuilder project)'
    # SDDSIcons и SDDSComponents должны собираться из workspace
    elsif scheme == 'SDDSIcons' || scheme == 'SDDSComponents'
      current_workspace = 'SDDS.xcworkspace'
      current_project = nil
    end
    
    current_workspace_path = current_workspace ? File.join(project_root_dir, current_workspace) : nil
    current_project_path = current_project ? File.join(project_root_dir, current_project) : nil
    
    print_info "Используется workspace: #{current_workspace}" if current_workspace
    print_info "Используется проект: #{current_project}" if current_project
    
    print_info "Создание архива для устройства iOS..."
    # Используем безопасное имя для архива (заменяем пробелы и скобки)
    safe_scheme_name = scheme.gsub(/[() ]/, '_')
    ios_archive_path = File.join(build_path, "#{safe_scheme_name}-iphoneos.xcarchive")
    if current_workspace
      # Все фреймворки собираются как статические библиотеки
      execute_command("xcodebuild archive -workspace \"#{current_workspace_path}\" -scheme \"#{scheme}\" -archivePath \"#{ios_archive_path}\" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib")
    else
      # SDDSThemeCore должен собираться как статическая библиотека
      execute_command("xcodebuild archive -project \"#{current_project_path}\" -scheme \"#{scheme}\" -archivePath \"#{ios_archive_path}\" -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib")
    end

    print_info "Создание архива для симулятора iOS..."
    ios_simulator_archive_path = File.join(build_path, "#{safe_scheme_name}-iossimulator.xcarchive")
    if current_workspace
      # Все фреймворки собираются как статические библиотеки
      execute_command("xcodebuild archive -workspace \"#{current_workspace_path}\" -scheme \"#{scheme}\" -archivePath \"#{ios_simulator_archive_path}\" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib")
    else
      # SDDSThemeCore должен собираться как статическая библиотека
      execute_command("xcodebuild archive -project \"#{current_project_path}\" -scheme \"#{scheme}\" -archivePath \"#{ios_simulator_archive_path}\" -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib")
    end

    print_info "Создание XCFramework..."
    # Определяем правильное имя framework (без скобок)
    framework_name = scheme.include?('SDDSThemeCore') ? 'SDDSThemeCore' : scheme
    execute_command("xcodebuild -create-xcframework -framework \"#{ios_archive_path}/Products/Library/Frameworks/#{framework_name}.framework\" -framework \"#{ios_simulator_archive_path}/Products/Library/Frameworks/#{framework_name}.framework\" -output \"#{xcframework_path}\"")

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

  opts.on("-f", "--force", "Принудительно пересобрать все фреймворки, даже если они уже существуют") do
    options[:force] = true
  end
end.parse!

project_root_dir = options[:directory] || File.expand_path('..', __dir__)
workspace_name = options[:workspace]
project_name = options[:project]
modules = options[:modules] ? options[:modules].split(',') : []

# Если модули не указаны, устанавливаем значения по умолчанию
if modules.empty?
  modules = ['SDDSComponents', 'SDDSIcons', 'SDDSThemeCore']
end

# Если проект не указан, пытаемся определить автоматически
if !workspace_name && !project_name
  # Если есть SDDSThemeCore в модулях, используем SDDSThemeBuilder проект
  if modules.include?('SDDSThemeCore') && File.exist?(File.join(project_root_dir, 'SDDSThemeBuilder', 'SDDSThemeBuilder.xcodeproj'))
    project_name = 'SDDSThemeBuilder/SDDSThemeBuilder.xcodeproj'
  # Если есть только SDDSIcons или SDDSComponents, используем workspace
  elsif (modules.include?('SDDSIcons') || modules.include?('SDDSComponents')) && !modules.include?('SDDSThemeCore') && File.exist?(File.join(project_root_dir, 'SDDS.xcworkspace'))
    workspace_name = 'SDDS.xcworkspace'
  # Если есть модули из workspace и SDDSThemeCore, используем workspace для первых и отдельно проект для SDDSThemeCore
  elsif (modules.include?('SDDSIcons') || modules.include?('SDDSComponents')) && modules.include?('SDDSThemeCore')
    workspace_name = 'SDDS.xcworkspace'
  # Проверяем наличие workspace как fallback
  elsif File.exist?(File.join(project_root_dir, 'SDDS.xcworkspace'))
    workspace_name = 'SDDS.xcworkspace'
  end
end

print_info "Параметры, переданные скрипту:"
print_info "Корневая директория проекта: #{project_root_dir}"
print_info "Имя workspace: #{workspace_name}"
print_info "Имя проекта: #{project_name}"
print_info "Модули: #{modules.join(', ')}"
print_info "Принудительная пересборка: #{options[:force] ? 'да' : 'нет'}"

if !workspace_name && !project_name
  print_error "Не удалось автоматически определить workspace или проект. Используйте -w или --workspace для указания workspace, или -p или --project для указания проекта."
  exit 1
end

build_xcframeworks(project_root_dir, workspace_name, project_name, modules, options[:force])
