require 'json'
require 'fileutils'

def update_imageset(directory)
  # Чтение содержимого файла Contents.json
  contents_path = File.join(directory, 'Contents.json')
  contents = JSON.parse(File.read(contents_path))

  # Фильтрация изображений, оставляем только 36
  contents['images'].select! do |image|
    image['filename'].include?('36')
  end

  # Запись обновленного Contents.json
  File.write(contents_path, JSON.pretty_generate(contents))

  # Удаление ненужных файлов
  Dir.foreach(directory) do |filename|
    next if filename == '.' || filename == '..'
    next if filename == 'Contents.json'
    next if filename.include?('36')

    file_path = File.join(directory, filename)
    FileUtils.rm(file_path)
  end
end

def process_assets_xcassets(directory)
  # Проход по всем директориям в Assets.xcassets
  Dir.foreach(directory) do |entry|
    next if entry == '.' || entry == '..'

    entry_path = File.join(directory, entry)
    if File.directory?(entry_path) && entry.end_with?('.imageset')
      update_imageset(entry_path)
    end
  end
end

# Путь к директории Assets.xcassets относительно текущей директории
assets_xcassets_path = Dir.pwd
process_assets_xcassets(assets_xcassets_path)

puts 'Processing complete!'

