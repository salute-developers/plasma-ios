#!/usr/bin/env ruby

require 'fileutils'
require 'xcodeproj'
require 'optparse'
require_relative 'common'

def get_product_version(project_path)
  project = Xcodeproj::Project.open(project_path)
  target = project.targets.first
  version = target.build_configuration_list.build_configurations.first.build_settings['MARKETING_VERSION']
  version || 'unknown'
end

def add_version_to_info_plist(xcframework_path, version)
  info_plist_path = File.join(xcframework_path, 'Info.plist')
  return unless File.exist?(info_plist_path)

  `defaults write "#{info_plist_path}" CFBundleShortVersionString "#{version}"`
  `plutil -convert xml1 "#{info_plist_path}"`
end

# Функция для сборки XCFramework
def build_xcframeworks(create_archives = true)
  project_root_dir = Dir.pwd
  print_info "Корневая директория проекта: #{project_root_dir}"
  print_info "Создание архивов: #{create_archives ? 'ДА' : 'НЕТ'}"

  build_folder = "Themes/build"
  build_path = File.join(project_root_dir, build_folder)
  print_info "Артефакты будут сохранены в: #{build_path}"

  FileUtils.rm_rf(build_path)
  FileUtils.mkdir_p(build_path)

  # Параметры для статической сборки
  build_settings = "SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES MACH_O_TYPE=staticlib"

  Dir.glob("Themes/**/*.xcodeproj") do |project_path|
    scheme = File.basename(project_path, ".xcodeproj")
    project_name = File.basename(project_path)
    project_dir = File.dirname(project_path)
    version = get_product_version(project_path)

    print_info "Сборка XCFramework для схемы #{scheme} в проекте #{project_name} (версия: #{version})..."

    print_info "Создание архива для устройства iOS..."
    ios_archive_path = File.join(build_path, "#{scheme}-iphoneos.xcarchive")
    execute_command("xcodebuild archive -project #{project_path} -scheme #{scheme} -archivePath #{ios_archive_path} -sdk iphoneos #{build_settings}")

    print_info "Создание архива для симулятора iOS..."
    ios_simulator_archive_path = File.join(build_path, "#{scheme}-iossimulator.xcarchive")
    execute_command("xcodebuild archive -project #{project_path} -scheme #{scheme} -archivePath #{ios_simulator_archive_path} -sdk iphonesimulator #{build_settings}")

    print_info "Создание XCFramework..."
    xcframework_path = File.join(build_path, "#{scheme}.xcframework")
    execute_command("xcodebuild -create-xcframework -framework #{ios_archive_path}/Products/Library/Frameworks/#{scheme}.framework -framework #{ios_simulator_archive_path}/Products/Library/Frameworks/#{scheme}.framework -output #{xcframework_path}")

    print_success "Сборка успешно завершена для схемы #{scheme}"

    print_info "Добавление версии в Info.plist XCFramework..."
    add_version_to_info_plist(xcframework_path, version)

    if create_archives
      print_info "Создание ZIP архива для XCFramework..."
      Dir.chdir(build_path) do
        execute_command("zip -r #{scheme}.xcframework.zip #{scheme}.xcframework")
      end

      print_success "ZIP архив успешно создан для #{scheme}.xcframework"

      print_info "Удаление папки XCFramework..."
      FileUtils.rm_rf(xcframework_path)

      print_success "Папка #{scheme}.xcframework успешно удалена"
    else
      print_info "XCFramework сохранен без архивирования: #{xcframework_path}"
    end

    print_info "Очистка временных архивов..."
    FileUtils.rm_rf(ios_archive_path)
    FileUtils.rm_rf(ios_simulator_archive_path)
  end

  if create_archives
    print_success "Все сборки и архивирование успешно завершены"
  else
    print_success "Все сборки успешно завершены (без архивирования)"
  end
end

# Парсинг аргументов командной строки
options = {}
OptionParser.new do |opts|
  opts.banner = "Использование: build_themes.rb [опции]"

  opts.on("-f", "--framework", "Создать только XCFramework без упаковки в архивы") do
    options[:framework_only] = true
  end
end.parse!

# Запуск функции для сборки XCFramework
build_xcframeworks(!options[:framework_only])
