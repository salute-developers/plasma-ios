require 'xcodeproj'
require 'plist'

# Проверяем, переданы ли аргументы
if ARGV.length < 3
  puts "Использование: ruby update_info_plist.rb <путь_к_проекту> <путь_к_папке_с_шрифтами> <путь_к_info_plist>"
  exit 1
end

# Путь к проекту Xcode
project_path = ARGV[0]

# Путь к папке с файлами шрифтов
fonts_folder_path = ARGV[1]

# Путь к файлу Info.plist
info_plist_path = ARGV[2]

# Открываем проект
project = Xcodeproj::Project.open(project_path)

# Находим таргет
target = project.targets.find { |t| t.name == 'SDDSTheme' }

# Если таргет не найден, выходим с ошибкой
unless target
  puts "Таргет с именем 'SDDSTheme' не найден в проекте."
  exit 1
end

# Получаем список конфигураций сборки
build_configurations = ['Debug', 'Release']

# Для каждой конфигурации сборки
build_configurations.each do |config_name|
  # Получаем настройки сборки для конфигурации
  build_settings = target.build_settings(config_name)

  # Получаем содержимое Info.plist
  info_plist_content = File.read(info_plist_path)

  # Преобразуем содержимое в объект Plist
  info_plist = Plist.parse_xml(info_plist_content)

  # Получаем путь к папке с шрифтами относительно Info.plist
  fonts_relative_path = Pathname.new(fonts_folder_path).relative_path_from(Pathname.new(File.dirname(info_plist_path))).to_s

  # Получаем список файлов шрифтов
  font_files = Dir.glob(File.join(fonts_folder_path, '*.ttf')) + Dir.glob(File.join(fonts_folder_path, '*.otf'))
  font_files = font_files.map { |file| File.basename(file) }

  # Добавляем шрифты в UIAppFonts
  info_plist['UIAppFonts'] = font_files

  # Сохраняем изменения в Info.plist
  File.write(info_plist_path, Plist::Emit.dump(info_plist))

  puts "Шрифты успешно зарегистрированы в Info.plist для конфигурации сборки '#{config_name}'."
end
