require 'xcodeproj'
require 'fileutils'

# Аргументы командной строки
source_project_path = ARGV[0]
target_project_name = ARGV[1]
target_project_path = File.join(ARGV[2], target_project_name)
source_target_name = 'SDDSTheme'
xcframework_path = ARGV[3]

# Создаем новый проект
puts "Создание нового проекта #{target_project_name}..."
new_project = Xcodeproj::Project.new("#{target_project_path}/#{target_project_name}.xcodeproj")

# Создаем новый таргет
puts "Создание нового таргета #{target_project_name}..."
framework_target = new_project.new_target(:framework, target_project_name, :ios, '9.0')

# Открываем исходный проект
puts "Открытие исходного проекта..."
source_project = Xcodeproj::Project.open(source_project_path)
source_target = source_project.targets.find { |t| t.name == source_target_name }

if source_target.nil?
  puts "Не удалось найти таргет '#{source_target_name}' в исходном проекте."
  exit 1
end

# Копирование файлов и директорий
def copy_files_and_directories(src, dst)
  puts "Копирование файлов и директорий из #{src} в #{dst}..."
  FileUtils.mkdir_p(dst) unless Dir.exist?(dst)
  Dir.foreach(src) do |entry|
    next if entry == '.' || entry == '..' || entry == '.DS_Store'
    src_path = File.join(src, entry)
    dst_path = File.join(dst, entry)
    if File.directory?(src_path)
      copy_files_and_directories(src_path, dst_path)
    else
      puts "Копирование файла #{src_path} в #{dst_path}"
      FileUtils.cp(src_path, dst_path)
    end
  end
end

# Путь к папке SDDSTheme в исходном проекте
source_theme_path = File.join(File.dirname(source_project_path), source_target_name)

# Копируем все файлы и директории из папки SDDSTheme в новую папку
copy_files_and_directories(source_theme_path, target_project_path)

# Получение списка корневых файлов и директорий
def get_root_files_and_directories(path)
  puts "Получение списка корневых файлов и директорий в #{path}..."
  entries = Dir.entries(path).select { |entry| entry != '.' && entry != '..' && entry != '.DS_Store' }
  files = entries.select { |entry| File.file?(File.join(path, entry)) }
  directories = entries.select { |entry| File.directory?(File.join(path, entry)) }
  return files, directories
end

# Добавление файлов и директорий в проект
def add_files_and_directories_to_project(project, target, root_path, files, directories)
  puts "Добавление корневых файлов в проект..."
  # Добавляем корневые файлы
  files.each do |file|
    file_path = File.join(root_path, file)
    file_ref = project.new_file(file_path)
    target.add_file_references([file_ref])
  end

  puts "Добавление директорий в проект..."
  # Добавляем директории
  directories.each do |directory|
    dir_path = File.join(root_path, directory)
    group = project.main_group.new_group(directory, directory)
    add_files_to_group(group, dir_path, project, target, directory == 'Fonts')
  end
end

# Добавление файлов в группу проекта
def add_files_to_group(group, dir, project, target, copy_resources = false)
  puts "Добавление файлов в группу #{group.display_name}..."
  Dir.foreach(dir) do |entry|
    next if entry == '.' || entry == '..' || entry == '.DS_Store'
    path = File.join(dir, entry)
    if File.directory?(path)
      sub_group = group.new_group(entry, entry)
      add_files_to_group(sub_group, path, project, target, copy_resources)
    else
      file_ref = group.new_file(path)
      target.add_file_references([file_ref])
      if copy_resources
        target.add_resources([file_ref])
      end
    end
  end
end

# Получаем корневые файлы и директории
root_files, root_directories = get_root_files_and_directories(target_project_path)

# Добавляем корневые файлы и директории в проект
add_files_and_directories_to_project(new_project, framework_target, target_project_path, root_files, root_directories)

# Копирование зависимостей
puts "Копирование зависимостей..."
source_target.dependencies.each do |dependency|
  next if dependency.target.name == 'SDDSThemeCore'  # Пропускаем зависимость от SDDSThemeCore
  puts "Копирование зависимости #{dependency.target.name}..."
  dependent_target = new_project.new_target(:framework, dependency.target.name, :ios, '9.0')
  framework_target.add_dependency(dependent_target)
end

# Копирование конфигураций сборки и настроек
puts "Копирование конфигураций сборки и настроек проекта..."
source_project.build_configurations.each do |config|
  puts "Копирование конфигурации сборки #{config.name}..."
  new_config = new_project.add_build_configuration(config.name, config.type)
  new_config.build_settings.update(config.build_settings)
end

# Копирование конфигураций таргета
puts "Копирование конфигураций таргета..."
source_target.build_configurations.each do |config|
  puts "Копирование конфигурации таргета #{config.name}..."
  new_config = framework_target.add_build_configuration(config.name, config.type)
  new_config.build_settings.update(config.build_settings)
end

# Копирование данных из Info.plist
puts "Копирование данных из Info.plist..."
plist_path = source_target.resolved_build_setting('INFOPLIST_FILE').values.first
if plist_path
  source_plist = File.join(File.dirname(source_project_path), plist_path)
  target_plist = File.join(target_project_path, 'Info.plist')
  FileUtils.cp(source_plist, target_plist)
  framework_target.build_configurations.each do |config|
    config.build_settings['INFOPLIST_FILE'] = 'Info.plist'
  end
end

# Добавление XCFramework в проект
if xcframework_path && File.exist?(xcframework_path)
  puts "Добавление XCFramework #{xcframework_path} в проект..."
  xcframework_ref = new_project.new_file(xcframework_path)
  framework_target.frameworks_build_phases.add_file_reference(xcframework_ref)
else
  puts "XCFramework #{xcframework_path} не найден."
end

# Сохраняем новый проект
puts "Сохранение нового проекта..."
new_project.save

puts "Проект #{target_project_name} успешно создан в #{target_project_path}"
