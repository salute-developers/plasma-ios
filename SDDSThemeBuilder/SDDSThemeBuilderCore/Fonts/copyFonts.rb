require 'xcodeproj'

# Проверяем, переданы ли аргументы
if ARGV.length < 2
  puts "Использование: ruby add_files_to_project.rb <путь_к_проекту> <путь_к_папке>"
  exit 1
end

# Путь к проекту Xcode
project_path = ARGV[0]

# Путь к папке с файлами, которые вы хотите добавить
files_folder_path = ARGV[1]

# Проверяем, существует ли указанный проект
unless File.exist?(project_path)
  puts "Файл проекта не найден по указанному пути '#{project_path}'."
  exit 1
end

# Проверяем, существует ли указанная папка с файлами
unless Dir.exist?(files_folder_path)
  puts "Папка с файлами не найдена по указанному пути '#{files_folder_path}'."
  exit 1
end

# Открываем проект
project = Xcodeproj::Project.open(project_path)

# Путь к папке с файлами в проекте
files_group_path = File.dirname(files_folder_path)

# Имя таргета, в который вы хотите добавить файлы
target_name = 'SDDSTheme'

# Находим нужный таргет
target = project.targets.find { |t| t.name == target_name }

unless target
  puts "Таргет с именем '#{target_name}' не найден."
  exit 1
end

# Найдем группу (или создадим, если её нет), в которую добавим файлы
sdds_theme_group = project.main_group.find_subpath('SDDSTheme', true)
fonts_group = sdds_theme_group['Fonts']

# Удаляем папку Fonts и ее содержимое, если они уже есть
if fonts_group
  fonts_group.clear()
else
  fonts_group = sdds_theme_group.new_group('Fonts')
end

# Удаляем файлы из Copy Bundle Resources, если они уже там
target.resources_build_phase.files.each do |file|
  if file.display_name && File.basename(file.display_name) != "Info.plist"
    file_ref = fonts_group.files.find { |f| f.path == file.display_name }
    target.resources_build_phase.remove_file_reference(file_ref) if file_ref
  end
end

# Получим список файлов в папке
Dir.glob("#{files_folder_path}/*").each do |file_path|
  # Добавляем файл в проект и в таргет
  file_ref = fonts_group.new_reference(file_path)
  target.add_file_references([file_ref])

  # Если файл еще не был добавлен в Copy Bundle Resources, добавим его туда
  unless target.resources_build_phase.files_references.include?(file_ref)
    target.add_resources([file_ref])
  end
end

# Сохраняем изменения в проекте
project.save
