#!/usr/bin/env ruby

require 'fileutils'

# Функция для определения корневой директории проекта
def find_project_root
  current_dir = Dir.pwd
  while current_dir != "/"
    if File.exist?(File.join(current_dir, "scripts", "build_xcframeworks.rb"))
      return current_dir
    end
    current_dir = File.dirname(current_dir)
  end
  nil
end

# Основная функция
def build_all(framework_name = nil)
  project_root = find_project_root
  exit 1 unless project_root
  
  Dir.chdir(project_root)
  
  if framework_name
    system("ruby scripts/build_themes.rb -f")
  else
    system("ruby scripts/build_xcframeworks.rb --force") && system("ruby scripts/build_themes.rb -f")
  end
end

# Запуск
build_all(ARGV[0])
