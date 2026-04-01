#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'
require_relative 'common'

DEFAULT_MODULES = %w[SandboxCore SandboxSwiftUI SandboxDemoTheme].freeze

def build_xcframework_for_package(package_path, scheme, build_path, create_zip)
  build_configuration = 'Release'
  derived_data_path = File.join(build_path, "#{scheme}-derived-data")
  ios_products_path = File.join(derived_data_path, 'Build', 'Products', 'Release-iphoneos')
  ios_sim_products_path = File.join(derived_data_path, 'Build', 'Products', 'Release-iphonesimulator')
  ios_object_path = File.join(ios_products_path, "#{scheme}.o")
  ios_sim_object_path = File.join(ios_sim_products_path, "#{scheme}.o")
  ios_library_path = File.join(build_path, "lib#{scheme}-iphoneos.a")
  ios_sim_library_path = File.join(build_path, "lib#{scheme}-iossimulator.a")
  ios_swiftmodule_path = File.join(ios_products_path, "#{scheme}.swiftmodule")
  ios_sim_swiftmodule_path = File.join(ios_sim_products_path, "#{scheme}.swiftmodule")
  xcframework_path = File.join(build_path, "#{scheme}.xcframework")
  zip_path = File.join(build_path, "#{scheme}.xcframework.zip")

  FileUtils.rm_rf(ios_library_path)
  FileUtils.rm_rf(ios_sim_library_path)
  FileUtils.rm_rf(xcframework_path)
  FileUtils.rm_rf(zip_path)
  FileUtils.rm_rf(derived_data_path)

  common_flags = 'SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY="" CODE_SIGN_ENTITLEMENTS=""'
  build_base = "cd \"#{package_path}\" && xcodebuild build -scheme #{scheme} -configuration #{build_configuration} #{common_flags} -derivedDataPath \"#{derived_data_path}\""

  print_info "Сборка iOS для #{scheme}..."
  execute_command("#{build_base} -destination 'generic/platform=iOS' -sdk iphoneos")

  print_info "Сборка iOS Simulator для #{scheme}..."
  execute_command("#{build_base} -destination 'generic/platform=iOS Simulator' -sdk iphonesimulator")

  unless File.exist?(ios_object_path) && File.exist?(ios_sim_object_path)
    print_error "Артефакты сборки для схемы #{scheme} не найдены (ожидались #{scheme}.o)."
    exit 1
  end

  print_info "Упаковка статических библиотек для #{scheme}..."
  execute_command("libtool -static -o \"#{ios_library_path}\" \"#{ios_object_path}\"")
  execute_command("libtool -static -o \"#{ios_sim_library_path}\" \"#{ios_sim_object_path}\"")

  print_info "Создание XCFramework для #{scheme}..."
  execute_command("xcodebuild -create-xcframework -library \"#{ios_library_path}\" -library \"#{ios_sim_library_path}\" -output \"#{xcframework_path}\"")

  device_slice = Dir.glob(File.join(xcframework_path, '*')).find { |path| File.directory?(path) && !path.include?('simulator') && File.basename(path) != 'Info.plist' }
  simulator_slice = Dir.glob(File.join(xcframework_path, '*')).find { |path| File.directory?(path) && path.include?('simulator') }

  unless device_slice && simulator_slice
    print_error "Не удалось определить срезы XCFramework для #{scheme}."
    exit 1
  end

  unless File.directory?(ios_swiftmodule_path) && File.directory?(ios_sim_swiftmodule_path)
    print_error "Swift модули для схемы #{scheme} не найдены (ожидались папки #{scheme}.swiftmodule)."
    exit 1
  end

  print_info "Копирование Swift модулей для #{scheme}..."
  FileUtils.cp_r(ios_swiftmodule_path, File.join(device_slice, "#{scheme}.swiftmodule"))
  FileUtils.cp_r(ios_sim_swiftmodule_path, File.join(simulator_slice, "#{scheme}.swiftmodule"))

  if create_zip
    Dir.chdir(build_path) do
      print_info "Создание ZIP архива для #{scheme}.xcframework..."
      execute_command("zip -r \"#{scheme}.xcframework.zip\" \"#{scheme}.xcframework\"")
    end
    FileUtils.rm_rf(xcframework_path)
    print_success "Создан архив: #{zip_path}"
  else
    print_success "XCFramework сохранен: #{xcframework_path}"
  end

  FileUtils.rm_rf(ios_library_path)
  FileUtils.rm_rf(ios_sim_library_path)
  FileUtils.rm_rf(derived_data_path)
end

options = {
  create_zip: true,
  modules: []
}

OptionParser.new do |opts|
  opts.banner = 'Usage: build_integrationcore_xcframeworks.rb [options] [module_name...]'
  opts.on('-n', '--no-zip', 'Не создавать ZIP архивы') { options[:create_zip] = false }
  opts.on('-h', '--help', 'Показать помощь') do
    puts opts
    exit
  end
end.parse!

options[:modules] = ARGV.empty? ? DEFAULT_MODULES : ARGV

project_root_dir = File.expand_path('..', __dir__)
integration_core_dir = File.join(project_root_dir, 'IntegrationCore')
build_path = File.join(integration_core_dir, 'build')
FileUtils.mkdir_p(build_path)

print_info "Корневая директория проекта: #{project_root_dir}"
print_info "Модули IntegrationCore для сборки: #{options[:modules].join(', ')}"
print_info "Артефакты будут сохранены в: #{build_path}"

options[:modules].each do |module_name|
  package_path = File.join(integration_core_dir, module_name)
  package_file = File.join(package_path, 'Package.swift')

  unless File.exist?(package_file)
    print_error "Пакет #{module_name} не найден по пути #{package_path}"
    exit 1
  end

  print_info "Сборка XCFramework для #{module_name}..."
  build_xcframework_for_package(package_path, module_name, build_path, options[:create_zip])
end

print_success 'Сборка IntegrationCore XCFramework завершена'
