require 'open3'
require 'fileutils'
require 'json'

# Аргумент командной строки для пути до JSON файла
json_file_path = ARGV[0] || File.join(File.dirname(__FILE__), 'config.json')

# Чтение JSON файла
puts "Чтение JSON файла из #{json_file_path}..."
json_data = JSON.parse(File.read(json_file_path))

# Извлечение данных из JSON
themes = json_data['themes']
output_dir = json_data['output_dir']
source_project_path = json_data['source_project_path']
create_project_script_path = json_data['create_project_script_path']
xcframeworks = json_data['xcframeworks']
themes_output_dir = json_data['themes_output_dir']
executable_path = json_data['executable_path']

# Проверка наличия необходимых файлов и директорий
puts "Проверка наличия необходимых файлов и директорий..."
create_project_script_path = File.expand_path(create_project_script_path)
unless File.exist?(create_project_script_path)
  abort "Файл create_project.rb не найден по пути #{create_project_script_path}"
end

unless File.exist?(executable_path)
  abort "Файл #{executable_path} не найден."
end

xcframeworks.each do |framework|
  xcframework_path = framework['xcframework_path']
  unless File.exist?(xcframework_path)
    abort "Файл #{xcframework_path} не найден."
  end
end

# Удаление префикса "file://" из output_dir для использования в пути к Output
output_dir_for_clean = output_dir.sub(/^file:\/\//, '')
output_path = File.join(output_dir_for_clean, 'Output')

# Обработка каждой темы
themes.each do |theme|
  scheme_url = theme['scheme']
  palette_url = theme['palette']
  project_name = theme['name']

  # Команда для запуска исполняемого файла с параметрами
  executable_command = [
    executable_path,
    scheme_url,
    palette_url,
    output_dir
  ].join(' ')

  puts "Запуск исполняемого файла с параметрами для #{project_name}..."
  puts executable_command

  # Запуск исполняемого файла
  Open3.popen3(executable_command) do |stdin, stdout, stderr, wait_thr|
    stdout.each { |line| puts line }
    stderr.each { |line| puts line }

    exit_status = wait_thr.value
    unless exit_status.success?
      abort "Ошибка выполнения исполняемого файла для #{project_name}"
    end
  end

  puts "Исполняемый файл успешно выполнен для #{project_name}."

  # Удаление префикса "file://" из output_dir для использования в create_project.rb
  output_dir_for_create_project = output_dir.sub(/^file:\/\//, '')

  # Запуск скрипта create_project.rb
  create_project_command = [
    'ruby', create_project_script_path,
    "#{source_project_path}/SDDSThemeBuilder.xcodeproj",
    project_name,
    themes_output_dir,
    xcframeworks.first['xcframework_path']
  ].join(' ')

  puts "Запуск скрипта create_project.rb для #{project_name}..."
  puts create_project_command

  # Запуск create_project.rb
  Open3.popen3(create_project_command) do |stdin, stdout, stderr, wait_thr|
    stdout.each { |line| puts line }
    stderr.each { |line| puts line }

    exit_status = wait_thr.value
    unless exit_status.success?
      abort "Ошибка выполнения create_project.rb для #{project_name}"
    end
  end

  # Путь к сгенерированному фреймворку
  generated_framework_path = File.join(themes_output_dir, "#{project_name}.xcframework")

  # Дополнительные действия после генерации фреймворка (если необходимо)
  puts "Фреймворк сгенерирован по пути: #{generated_framework_path}"

  puts "Проект #{project_name} успешно создан."

  # Удаление содержимого папки Output
  puts "Удаление содержимого папки #{output_path}..."
  FileUtils.rm_rf(Dir.glob("#{output_path}/*"))
  puts "Содержимое папки #{output_path} удалено."
end

puts "Все проекты успешно созданы."
