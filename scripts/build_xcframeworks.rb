#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'
require_relative 'common' # Подключаем общий файл

def build_xcframeworks(project_root_dir, workspace_name, project_name, modules, static_modules = [])
  print_info "Корневая директория проекта: #{project_root_dir}"

  # Step 0: Build InputMask
  print_info "Step 0: Building InputMask..."
  inputmask_script = File.join(__dir__, 'build_inputmask.rb')
  if File.exist?(inputmask_script)
    system("ruby \"#{inputmask_script}\" -d \"#{project_root_dir}\"")
    if $?.exitstatus != 0
      print_warning "InputMask build failed, continuing with other modules..."
    end
  else
    print_warning "InputMask build script not found, skipping..."
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

  FileUtils.mkdir_p(build_path)
  # Устанавливаем права на запись для директории build
  FileUtils.chmod(0755, build_path)

  print_info "Сборка XCFramework для всех модулей..."
  print_info "Статические модули: #{static_modules.join(', ')}" unless static_modules.empty?
  
  modules.each do |scheme|
    is_static = static_modules.include?(scheme)
    framework_type = is_static ? "статический" : "динамический"
    print_info "Сборка #{framework_type} XCFramework для схемы #{scheme}"
    
    # Определяем проект для каждого модуля
    scheme_project_path = nil
    if workspace_name
      # Если указан workspace, используем его
      scheme_project_path = nil
    else
      # Определяем путь к проекту на основе имени модуля
      if File.exist?(File.join(project_root_dir, scheme, "#{scheme}.xcodeproj"))
        scheme_project_path = File.join(project_root_dir, scheme, "#{scheme}.xcodeproj")
      elsif project_path
        scheme_project_path = project_path
      end
    end
    
    # Дополнительные параметры для статических фреймворков
    static_build_settings = is_static ? "MACH_O_TYPE=staticlib " : ""
    
    print_info "Создание архива для устройства iOS..."
    ios_archive_path = File.join(build_path, "#{scheme}-iphoneos.xcarchive")
    archive_command_base = "xcodebuild archive #{static_build_settings}SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY=\"\" CODE_SIGN_ENTITLEMENTS=\"\""
    if workspace_name
      execute_command("#{archive_command_base} -workspace #{workspace_path} -scheme #{scheme} -archivePath #{ios_archive_path} -sdk iphoneos")
    elsif scheme_project_path
      execute_command("#{archive_command_base} -project #{scheme_project_path} -scheme #{scheme} -archivePath #{ios_archive_path} -sdk iphoneos")
    else
      print_error "Не удалось определить проект для схемы #{scheme}"
      next
    end

    print_info "Создание архива для симулятора iOS..."
    ios_simulator_archive_path = File.join(build_path, "#{scheme}-iossimulator.xcarchive")
    simulator_archive_command_base = "xcodebuild archive #{static_build_settings}SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY=\"\" CODE_SIGN_ENTITLEMENTS=\"\""
    if workspace_name
      execute_command("#{simulator_archive_command_base} -workspace #{workspace_path} -scheme #{scheme} -archivePath #{ios_simulator_archive_path} -sdk iphonesimulator")
    elsif scheme_project_path
      execute_command("#{simulator_archive_command_base} -project #{scheme_project_path} -scheme #{scheme} -archivePath #{ios_simulator_archive_path} -sdk iphonesimulator")
    else
      print_error "Не удалось определить проект для схемы #{scheme}"
      next
    end

    print_info "Создание XCFramework..."
    xcframework_path = File.join(build_path, "#{scheme}.xcframework")
    # Удаляем старый XCFramework для этого модуля, если он существует
    if File.exist?(xcframework_path)
      print_info "Удаление существующего XCFramework: #{xcframework_path}"
      # Используем shell-команду для более надежного удаления
      rm_result = system("rm -rf \"#{xcframework_path}\"")
      unless rm_result
        # Если не удалось удалить, пробуем через Ruby
        begin
          FileUtils.chmod_R(0755, xcframework_path) if File.directory?(xcframework_path)
          FileUtils.rm_rf(xcframework_path)
        rescue => e
          print_warning "Не удалось удалить существующий XCFramework: #{e.message}. Пробую продолжить - xcodebuild может перезаписать файл."
        end
      end
    end
    execute_command("xcodebuild -create-xcframework -framework #{ios_archive_path}/Products/Library/Frameworks/#{scheme}.framework -framework #{ios_simulator_archive_path}/Products/Library/Frameworks/#{scheme}.framework -output #{xcframework_path}")

    print_success "Сборка #{framework_type} XCFramework успешно завершена для схемы #{scheme}"

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

  opts.on("-sSTATIC", "--static=STATIC", "Список статических модулей, разделенных запятыми") do |s|
    options[:static_modules] = s
  end
end.parse!

project_root_dir = options[:directory] || File.expand_path('..', __dir__)
workspace_name = options[:workspace]
project_name = options[:project]
modules = options[:modules] ? options[:modules].split(',') : []
static_modules = options[:static_modules] ? options[:static_modules].split(',') : []

# По умолчанию: SDDSComponents (статический) и SDDSIcons (динамический)
if modules.empty?
  modules = ['SDDSComponents', 'SDDSIcons']
end

# Если статические модули не указаны явно, и в списке модулей есть SDDSComponents, делаем его статическим по умолчанию
if static_modules.empty? && modules.include?('SDDSComponents')
  static_modules = ['SDDSComponents']
end

print_info "Параметры, переданные скрипту:"
print_info "Корневая директория проекта: #{project_root_dir}"
print_info "Имя workspace: #{workspace_name}"
print_info "Имя проекта: #{project_name}"
print_info "Модули: #{modules.join(', ')}"
print_info "Статические модули: #{static_modules.join(', ')}" unless static_modules.empty?

# Проверяем, можно ли определить проекты автоматически
can_auto_detect = false
if !workspace_name && !project_name
  can_auto_detect = modules.all? do |scheme|
    File.exist?(File.join(project_root_dir, scheme, "#{scheme}.xcodeproj"))
  end
end

if !workspace_name && !project_name && !can_auto_detect
  print_error "Не указан ни workspace, ни проект, и невозможно автоматически определить проекты для всех модулей. Используйте -w или --workspace для указания workspace, или -p или --project для указания проекта."
  exit 1
end

build_xcframeworks(project_root_dir, workspace_name, project_name, modules, static_modules)
