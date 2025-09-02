#!/usr/bin/env ruby

require 'fileutils'
require 'optparse'

# Функция для вывода информационных сообщений
def print_info(message)
  puts "ℹ️  #{message}"
end

# Функция для вывода сообщений об успехе
def print_success(message)
  puts "✅ #{message}"
end

# Функция для вывода сообщений об ошибках
def print_error(message)
  puts "❌ #{message}"
end

# Функция для выполнения команды
def run_command(command, description)
  print_info "Выполняется: #{description}"
  print_info "Команда: #{command}"
  
  result = system(command)
  
  if result
    print_success "#{description} завершено успешно"
    return true
  else
    print_error "#{description} завершено с ошибкой"
    return false
  end
end

# Функция для проверки существования проекта
def project_exists?(project_name)
  project_path = "Themes/#{project_name}Theme/#{project_name}Theme.xcodeproj"
  File.exist?(project_path)
end

# Основная функция
def build_demo(framework_name = nil)
  if framework_name
    print_info "Начинаем сборку фреймворка: #{framework_name}"
    
    # Проверяем существование проекта
    unless project_exists?(framework_name)
      print_error "Проект #{framework_name}Theme не найден в папке Themes/"
      print_info "Доступные проекты:"
      Dir.glob("Themes/*Theme").each do |theme_dir|
        theme_name = File.basename(theme_dir, "Theme")
        puts "  - #{theme_name}"
      end
      exit 1
    end
    
    # Сборка только одного фреймворка
    themes_command = "ruby scripts/build_themes.rb -f"
    if !run_command(themes_command, "Сборка темы #{framework_name}")
      print_error "Не удалось собрать тему #{framework_name}. Остановка."
      exit 1
    end
    
    print_success "Сборка фреймворка #{framework_name} завершена успешно!"
    print_info "Результат: Themes/build/#{framework_name}Theme.xcframework"
  else
    print_info "Начинаем сборку зависимостей песочницы"
    print_info "Сначала собираем XCFrameworks, затем темы"
    
    # Шаг 1: Сборка XCFrameworks
    xcframework_command = "ruby scripts/build_xcframeworks.rb --force"
    if !run_command(xcframework_command, "Сборка XCFrameworks")
      print_error "Не удалось собрать XCFrameworks. Остановка."
      exit 1
    end
    
    # Шаг 2: Сборка тем
    themes_command = "ruby scripts/build_themes.rb -f"
    if !run_command(themes_command, "Сборка тем")
      print_error "Не удалось собрать темы. Остановка."
      exit 1
    end
    
    print_success "Сборка завершена успешно!"
    print_info "Результаты:"
    print_info "- XCFrameworks: build/"
    print_info "- Темы: Themes/build/"
  end
end

# Парсинг аргументов командной строки
options = {}
OptionParser.new do |opts|
  opts.banner = "Использование: build_demo.rb [фреймворк] [опции]"
  opts.separator ""
  opts.separator "Примеры:"
  opts.separator "  build_demo.rb                    # Собрать все фреймворки"
  opts.separator "  build_demo.rb PlasmaB2C          # Собрать только PlasmaB2CTheme"
  opts.separator "  build_demo.rb SDDSserv           # Собрать только SDDSservTheme"
  opts.separator ""
  opts.separator "Опции:"
  
  opts.on("-h", "--help", "Показать эту справку") do
    puts opts
    exit
  end
end.parse!

# Получаем имя фреймворка из аргументов
framework_name = ARGV[0]

# Запуск основной функции
if __FILE__ == $0
  build_demo(framework_name)
end
