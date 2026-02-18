#!/usr/bin/env ruby

require 'fileutils'
require 'xcodeproj'
require_relative 'common'
require 'optparse'

def detect_scheme_name(project_path, fallback_name)
  list_output = `xcodebuild -list -project "#{project_path}" 2>/dev/null`
  return fallback_name if list_output.to_s.strip.empty?

  lines = list_output.lines.map(&:chomp)
  schemes_index = lines.index { |line| line.strip == "Schemes:" }
  return fallback_name unless schemes_index

  schemes = []
  lines[(schemes_index + 1)..].each do |line|
    break if line.strip.empty?
    schemes << line.strip
  end

  return fallback_name if schemes.empty?

  matched = schemes.find { |scheme| scheme.casecmp?(fallback_name) }
  matched || schemes.first
end

def get_product_version(project_path)
  begin
    project = Xcodeproj::Project.open(project_path)
    target = project.targets.first
    version = target.build_configuration_list.build_configurations.first.build_settings['MARKETING_VERSION']
    version || 'unknown'
  rescue => e
    # Fallback: extract version from project.pbxproj directly
    pbxproj_path = File.join(project_path, 'project.pbxproj')
    if File.exist?(pbxproj_path)
      version_match = `grep -m 1 'MARKETING_VERSION' "#{pbxproj_path}"`.match(/MARKETING_VERSION = ([^;]+);/)
      if version_match
        return version_match[1].strip
      end
    end
    'unknown'
  end
end

def add_version_to_info_plist(xcframework_path, version)
  info_plist_path = File.join(xcframework_path, 'Info.plist')
  return unless File.exist?(info_plist_path)

  `defaults write "#{info_plist_path}" CFBundleShortVersionString "#{version}"`
  `plutil -convert xml1 "#{info_plist_path}"`
end

# Функция для сборки XCFramework
def build_xcframeworks(modules = nil, create_zip = true)
  project_root_dir = Dir.pwd
  build_configuration = "Release"
  print_info "Корневая директория проекта: #{project_root_dir}"

  build_folder = "Themes/build"
  build_path = File.join(project_root_dir, build_folder)
  print_info "Артефакты будут сохранены в: #{build_path}"

  FileUtils.mkdir_p(build_path)

  # Определяем, какие проекты собирать
  projects_to_build = []
  if modules && !modules.empty?
    modules.each do |module_name|
      project_path = File.join(project_root_dir, "Themes", module_name, "#{module_name}.xcodeproj")
      if File.exist?(project_path)
        projects_to_build << project_path
      else
        print_warning "Проект #{module_name}.xcodeproj не найден в Themes/#{module_name}/"
      end
    end
  else
    projects_to_build = Dir.glob("Themes/**/*.xcodeproj").select do |project_path|
      File.basename(project_path, ".xcodeproj") == File.basename(File.dirname(project_path))
    end
  end

  if projects_to_build.empty?
    print_error "Не найдено проектов для сборки"
    return
  end

  print_info "Найдено проектов для сборки: #{projects_to_build.length}"

  projects_to_build.each do |project_path|
    folder_name = File.basename(project_path, ".xcodeproj")
    scheme = detect_scheme_name(project_path, folder_name)
    project_name = File.basename(project_path)
    project_dir = File.dirname(project_path)
    version = get_product_version(project_path)

    print_info "Сборка статического XCFramework для схемы #{scheme} в проекте #{project_name} (версия: #{version})..."

    # Удаляем только конкретный XCFramework и архивы для этого модуля
    ios_archive_path = File.join(build_path, "#{scheme}-iphoneos.xcarchive")
    ios_simulator_archive_path = File.join(build_path, "#{scheme}-iossimulator.xcarchive")
    xcframework_path = File.join(build_path, "#{scheme}.xcframework")
    zip_path = File.join(build_path, "#{scheme}.xcframework.zip")

    FileUtils.rm_rf(ios_archive_path)
    FileUtils.rm_rf(ios_simulator_archive_path)
    FileUtils.rm_rf(xcframework_path)
    FileUtils.rm_rf(zip_path)

    # Настройки для статической сборки
    static_build_settings = "MACH_O_TYPE=staticlib"

    print_info "Создание архива для устройства iOS..."
    archive_command_base = "xcodebuild archive -project #{project_path} -scheme #{scheme} -configuration #{build_configuration} SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY=\"\" CODE_SIGN_ENTITLEMENTS=\"\" #{static_build_settings}"
    execute_command("#{archive_command_base} -sdk iphoneos -archivePath #{ios_archive_path}")

    print_info "Создание архива для симулятора iOS..."
    execute_command("#{archive_command_base} -sdk iphonesimulator -archivePath #{ios_simulator_archive_path}")

    print_info "Создание XCFramework..."
    execute_command("xcodebuild -create-xcframework -framework #{ios_archive_path}/Products/Library/Frameworks/#{scheme}.framework -framework #{ios_simulator_archive_path}/Products/Library/Frameworks/#{scheme}.framework -output #{xcframework_path}")

    print_success "Сборка статического XCFramework успешно завершена для схемы #{scheme}"

    print_info "Добавление версии в Info.plist XCFramework..."
    add_version_to_info_plist(xcframework_path, version)

    if create_zip
      print_info "Создание ZIP архива для XCFramework..."
      Dir.chdir(build_path) do
        execute_command("zip -r #{scheme}.xcframework.zip #{scheme}.xcframework")
      end

      print_success "ZIP архив успешно создан для #{scheme}.xcframework"

      print_info "Удаление папки XCFramework..."
      FileUtils.rm_rf(xcframework_path)

      print_success "Папка #{scheme}.xcframework успешно удалена"
    else
      print_info "ZIP архив не создается по запросу пользователя"
      print_success "XCFramework сохранен в: #{xcframework_path}"
    end

    print_info "Очистка временных архивов..."
    FileUtils.rm_rf(ios_archive_path)
    FileUtils.rm_rf(ios_simulator_archive_path)
  end

  print_success "Все сборки и архивирование успешно завершены"
end

# Парсинг аргументов командной строки
modules = []
create_zip = true
OptionParser.new do |opts|
  opts.banner = "Usage: #{$0} [options] [module_name...]"
  opts.on("-h", "--help", "Показать помощь") do
    puts opts
    exit
  end
  opts.on("--no-zip", "-n", "Не создавать ZIP архив, оставить только XCFramework") do
    create_zip = false
  end
end.parse!

# Если есть аргументы командной строки, используем их как имена модулей
modules = ARGV unless ARGV.empty?

# Запуск функции для сборки XCFramework
build_xcframeworks(modules.empty? ? nil : modules, create_zip)
