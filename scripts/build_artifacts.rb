#!/usr/bin/env ruby

require 'fileutils'
require 'open3'
require 'zip'

# Скрипт для сборки артефактов
# Выполняет сборку в следующем порядке:
# 1. Build XCFramework в SDDSThemeBuilder
# 2. build_xcframeworks.rb
# 3. build_themes.rb
# 4. Копирование артефактов тем в artifacts
# 5. Создание zip-архивов из XCFramework

class ArtifactBuilder
  def initialize
    @project_root = File.expand_path('..', __dir__)
    @build_dir = File.join(@project_root, 'build')
    @artifacts_dir = File.join(@project_root, 'artifacts')
    @theme_builder_dir = File.join(@project_root, 'SDDSThemeBuilder')
  end

  def run
    puts "🚀 Начинаю сборку артефактов..."
    
    # Создаем папки если их нет
    FileUtils.mkdir_p(@build_dir) unless Dir.exist?(@build_dir)
    FileUtils.mkdir_p(@artifacts_dir) unless Dir.exist?(@artifacts_dir)
    
    # Шаг 1: Build XCFramework в SDDSThemeBuilder
    puts "📦 Шаг 1: Сборка XCFramework в SDDSThemeBuilder..."
    build_xcframework
    
    # Шаг 2: Запуск build_xcframeworks.rb
    puts "📦 Шаг 2: Запуск build_xcframeworks.rb..."
    build_xcframeworks
    
    # Шаг 3: Запуск build_themes.rb
    puts "📦 Шаг 3: Запуск build_themes.rb..."
    build_themes
    
    # Шаг 4: Копирование артефактов тем в artifacts
    puts "📦 Шаг 4: Копирование артефактов тем в artifacts..."
    copy_theme_artifacts
    
    # Шаг 5: Создание zip-архивов из XCFramework
    puts "📦 Шаг 5: Создание zip-архивов из XCFramework..."
    create_xcframework_zips
    
    puts "✅ Сборка артефактов завершена!"
    list_artifacts
  end

  private

  def build_xcframework
    Dir.chdir(@theme_builder_dir) do
      puts "  Очищаю DerivedData для избежания конфликтов..."
      system("xcodebuild clean -scheme 'Build XCFramework' -project SDDSThemeBuilder.xcodeproj")
      
      puts "  Выполняю: xcodebuild -scheme 'Build XCFramework' -configuration Release"
      
      # Используем popen3 для отображения вывода в реальном времени
      Open3.popen3('xcodebuild', '-scheme', 'Build XCFramework', '-configuration', 'Release', '-project', 'SDDSThemeBuilder.xcodeproj') do |stdin, stdout, stderr, wait_thr|
        # Читаем stdout в отдельном потоке
        stdout_thread = Thread.new do
          stdout.each_line do |line|
            puts "    #{line.chomp}"
          end
        end
        
        # Читаем stderr в отдельном потоке
        stderr_thread = Thread.new do
          stderr.each_line do |line|
            puts "    [ERROR] #{line.chomp}"
          end
        end
        
        # Ждем завершения процесса
        exit_status = wait_thr.value
        
        # Ждем завершения потоков чтения
        stdout_thread.join
        stderr_thread.join
        
        if exit_status.success?
          puts "  ✅ XCFramework собран успешно"
        else
          puts "  ❌ Ошибка сборки XCFramework (код: #{exit_status.exitstatus})"
          exit 1
        end
      end
    end
  end

  def build_xcframeworks
    Dir.chdir(@project_root) do
      puts "  Выполняю: ruby scripts/build_xcframeworks.rb -w SDDS.xcworkspace"
      
      # Используем popen3 для отображения вывода в реальном времени
      Open3.popen3('ruby', 'scripts/build_xcframeworks.rb', '-w', 'SDDS.xcworkspace') do |stdin, stdout, stderr, wait_thr|
        # Читаем stdout в отдельном потоке
        stdout_thread = Thread.new do
          stdout.each_line do |line|
            puts "    #{line.chomp}"
          end
        end
        
        # Читаем stderr в отдельном потоке
        stderr_thread = Thread.new do
          stderr.each_line do |line|
            puts "    [ERROR] #{line.chomp}"
          end
        end
        
        # Ждем завершения процесса
        exit_status = wait_thr.value
        
        # Ждем завершения потоков чтения
        stdout_thread.join
        stderr_thread.join
        
        if exit_status.success?
          puts "  ✅ build_xcframeworks.rb выполнен успешно"
        else
          puts "  ❌ Ошибка выполнения build_xcframeworks.rb (код: #{exit_status.exitstatus})"
          exit 1
        end
      end
    end
  end

  def build_themes
    Dir.chdir(@project_root) do
      puts "  Выполняю: ruby scripts/build_themes.rb"
      
      # Используем popen3 для отображения вывода в реальном времени
      Open3.popen3('ruby', 'scripts/build_themes.rb') do |stdin, stdout, stderr, wait_thr|
        # Читаем stdout в отдельном потоке
        stdout_thread = Thread.new do
          stdout.each_line do |line|
            puts "    #{line.chomp}"
          end
        end
        
        # Читаем stderr в отдельном потоке
        stderr_thread = Thread.new do
          stderr.each_line do |line|
            puts "    [ERROR] #{line.chomp}"
          end
        end
        
        # Ждем завершения процесса
        exit_status = wait_thr.value
        
        # Ждем завершения потоков чтения
        stdout_thread.join
        stderr_thread.join
        
        if exit_status.success?
          puts "  ✅ build_themes.rb выполнен успешно"
        else
          puts "  ❌ Ошибка выполнения build_themes.rb (код: #{exit_status.exitstatus})"
          exit 1
        end
      end
    end
  end

  def copy_theme_artifacts
    source_dir = File.join(@project_root, 'Themes', 'build')
    destination_dir = @artifacts_dir

    if Dir.exist?(source_dir)
      puts "  Копирую файлы из #{source_dir} в #{destination_dir}..."
      FileUtils.cp_r(source_dir, destination_dir)
      puts "  ✅ Артефакты тем скопированы в artifacts"
    else
      puts "  ⚠️  Папка Themes/build не найдена. Артефакты тем не скопированы."
    end
  end

  def create_xcframework_zips
    if Dir.exist?(@build_dir)
      Dir.glob(File.join(@build_dir, '*.xcframework')).each do |xcframework_path|
        framework_name = File.basename(xcframework_path, '.xcframework')
        zip_path = File.join(@artifacts_dir, "#{framework_name}.xcframework.zip")
        
        puts "  Создаю zip-архив: #{framework_name}.xcframework.zip"
        
        # Создаем zip-архив
        Zip::File.open(zip_path, Zip::File::CREATE) do |zipfile|
          Dir.glob(File.join(xcframework_path, '**/*')).each do |file|
            next if File.directory?(file)
            relative_path = file.sub(xcframework_path + '/', '')
            zipfile.add(relative_path, file)
          end
        end
        
        puts "  ✅ Создан zip-архив: #{framework_name}.xcframework.zip"
      end
    else
      puts "  ⚠️  Папка build не найдена. Zip-архивы не созданы."
    end
  end

  def list_artifacts
    puts "\n📋 Список созданных артефактов в папке artifacts:"
    
    if Dir.exist?(@artifacts_dir)
      Dir.glob(File.join(@artifacts_dir, '**/*')).each do |file|
        next if File.directory?(file)
        relative_path = file.sub(@project_root + '/', '')
        puts "  📄 #{relative_path}"
      end
    else
      puts "  ⚠️  Папка artifacts не найдена"
    end
  end
end

# Запуск скрипта
if __FILE__ == $0
  builder = ArtifactBuilder.new
  builder.run
end 