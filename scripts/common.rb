# common.rb

# Цвета и форматирование текста
RED = "\033[0;31m"
GREEN = "\033[0;32m"
YELLOW = "\033[0;33m"
BLUE = "\033[0;34m"
NC = "\033[0m" # Без цвета
BOLD = "\033[1m"

# Функции для вывода сообщений
def print_success(message)
  puts "#{GREEN}✔ #{message}#{NC}"
end

def print_error(message)
  puts "#{RED}✘ #{message}#{NC}"
end

def print_warning(message)
  puts "#{YELLOW}⚠ #{message}#{NC}"
end

def print_info(message)
  puts "#{BLUE}#{message}#{NC}"
end

def execute_command(command)
  print_info "Выполнение команды: #{command}"
  system(command)
  if $?.exitstatus != 0
    print_error "Команда завершилась с ошибкой: #{command}"
    exit 1
  end
end
