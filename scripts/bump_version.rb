require 'plist'

def bump_version(plist_path)
  # Проверяем, существует ли файл по заданному пути
  unless File.exist?(plist_path)
    puts "File not found: #{plist_path}"
    return
  end

  # Загружаем plist файл
  plist_data = Plist.parse_xml(plist_path)

  # Проверяем, что ключ CFBundleShortVersionString существует
  unless plist_data.key?('CFBundleShortVersionString')
    puts "CFBundleShortVersionString not found in #{plist_path}"
    return
  end

  # Разбираем версию и увеличиваем минорную часть
  current_version = plist_data['CFBundleShortVersionString']
  major, minor, patch = current_version.split('.').map(&:to_i)
  new_version = "#{major}.#{minor + 1}.#{patch}"

  # Обновляем значение в plist
  plist_data['CFBundleShortVersionString'] = new_version

  # Сохраняем изменения обратно в файл
  File.open(plist_path, 'wb') do |f|
    f.write(plist_data.to_plist)
  end

  puts "Version updated from #{current_version} to #{new_version}"
end

# Проверяем, передан ли аргумент с путем к plist файлу
if ARGV.empty?
  puts "Usage: ruby bump_version.rb path/to/Info.plist"
else
  plist_path = ARGV[0]
  bump_version(plist_path)
end
