#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'
require_relative 'common'

def build_inputmask_xcframework(project_root_dir)
  print_info "Building InputMask as dynamic XCFramework"
  print_info "Project root directory: #{project_root_dir}"

  # Пути
  vendor_dir = File.join(project_root_dir, "Vendor")
  project_path = File.join(vendor_dir, "InputMask.xcodeproj")
  build_path = File.join(project_root_dir, "build")
  
  unless File.exist?(project_path)
    print_error "Проект InputMask.xcodeproj не найден по пути: #{project_path}"
    exit 1
  end

  print_info "Путь к проекту: #{project_path}"
  print_info "Артефакты будут сохранены в: #{build_path}"

  FileUtils.mkdir_p(build_path)
  FileUtils.chmod(0755, build_path)

  scheme = "InputMask"
  
  print_info "Building InputMask as dynamic framework..."
  
  print_info "Creating archive for iOS device..."
  ios_archive_path = File.join(build_path, "#{scheme}-iphoneos.xcarchive")
  archive_command = "xcodebuild archive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY=\"\" CODE_SIGN_ENTITLEMENTS=\"\" -project \"#{project_path}\" -scheme #{scheme} -archivePath \"#{ios_archive_path}\" -sdk iphoneos"
  execute_command(archive_command)

  print_info "Creating archive for iOS simulator..."
  ios_simulator_archive_path = File.join(build_path, "#{scheme}-iossimulator.xcarchive")
  simulator_archive_command = "xcodebuild archive SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY=\"\" CODE_SIGN_ENTITLEMENTS=\"\" -project \"#{project_path}\" -scheme #{scheme} -archivePath \"#{ios_simulator_archive_path}\" -sdk iphonesimulator"
  execute_command(simulator_archive_command)

  print_info "Создание XCFramework..."
  xcframework_path = File.join(build_path, "#{scheme}.xcframework")
  
  # Удаляем старый XCFramework, если он существует
  if File.exist?(xcframework_path)
    print_info "Удаление существующего XCFramework: #{xcframework_path}"
    rm_result = system("rm -rf \"#{xcframework_path}\"")
    unless rm_result
      begin
        FileUtils.chmod_R(0755, xcframework_path) if File.directory?(xcframework_path)
        FileUtils.rm_rf(xcframework_path)
      rescue => e
        print_warning "Не удалось удалить существующий XCFramework: #{e.message}"
      end
    end
  end
  
  # Создаём XCFramework из статических библиотек
  framework_ios = File.join(ios_archive_path, "Products/Library/Frameworks/#{scheme}.framework")
  framework_sim = File.join(ios_simulator_archive_path, "Products/Library/Frameworks/#{scheme}.framework")
  
  # Проверяем наличие фреймворков
  unless File.exist?(framework_ios)
    print_error "Фреймворк для iOS не найден: #{framework_ios}"
    exit 1
  end
  
  unless File.exist?(framework_sim)
    print_error "Фреймворк для симулятора не найден: #{framework_sim}"
    exit 1
  end
  
  create_xcframework_command = "xcodebuild -create-xcframework -framework \"#{framework_ios}\" -framework \"#{framework_sim}\" -output \"#{xcframework_path}\""
  execute_command(create_xcframework_command)

  print_success "Dynamic XCFramework successfully created: #{xcframework_path}"

  print_info "Очистка временных архивов..."
  FileUtils.rm_rf(ios_archive_path)
  FileUtils.rm_rf(ios_simulator_archive_path)

  print_success "Сборка InputMask завершена успешно!"
end

# Парсинг аргументов командной строки
options = {}
OptionParser.new do |opts|
  opts.banner = "Использование: build_inputmask.rb [опции]"

  opts.on("-d DIRECTORY", "--directory=DIRECTORY", "Корневая директория проекта") do |d|
    options[:directory] = d
  end

  opts.on("-h", "--help", "Показать справку") do
    puts opts
    exit
  end
end.parse!

project_root_dir = options[:directory] || File.expand_path('..', __dir__)

print_info "Параметры сборки:"
print_info "Корневая директория проекта: #{project_root_dir}"

build_inputmask_xcframework(project_root_dir)

