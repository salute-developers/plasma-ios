#!/usr/bin/env ruby
# frozen_string_literal: true

# Проверяет, что сгенерированный swiftgen enum IconName согласован с asset-каталогом.
#
# Запускать после swiftgen (см. .github/workflows/update_icons.yml). Ловит ситуации,
# когда upstream присылает иконку, ломающую предположения шаблона:
#   * имя с "16"/"24"/"36" внутри строки — базовое имя вырежется неправильно;
#   * новый акроним (вроде QRCode), для которого upperFirstLetter не даёт имя каталога;
#   * иконка, у которой есть не все три размера.
#
# Проверка не переиспользует трансформацию имён из шаблона, а сверяет множества
# базовых имён в обе стороны, поэтому не зависит от деталей swiftIdentifier.

require_relative '../../scripts/common.rb'

# Имена ассетов и сам файл — UTF-8 независимо от локали окружения (в CI LANG может быть не задан).
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ICONS_DIR = File.expand_path('..', __dir__)
GENERATED = File.join(ICONS_DIR, 'Generated', 'Assets.swift')
CATALOG   = File.join(ICONS_DIR, 'SDDSIcons', 'Assets.xcassets')

CYRILLIC_C = "С" # заглавная кириллическая С — опечатка upstream в Сurrency*
SIZES = %w[16 24 36].freeze

errors = []
def fail!(errors, message)
  errors << message
  print_error message
end

abort_unless = lambda do |cond, message|
  next if cond

  print_error message
  exit 1
end

abort_unless.call(File.exist?(GENERATED), "Не найден #{GENERATED} — сначала прогони swiftgen")
abort_unless.call(Dir.exist?(CATALOG), "Не найден asset-каталог #{CATALOG}")

source = File.read(GENERATED, encoding: 'UTF-8')

# --- 1. Разбираем сгенерированный код -------------------------------------------------

icon_block = source[/^public enum IconName: [^\n]*\{\n(.*?)^\}$/m, 1]
abort_unless.call(icon_block, 'В Generated/Assets.swift не найден enum IconName')
cases = icon_block.scan(/^\s*case\s+`?([A-Za-z_][A-Za-z0-9_]*)`?\s*$/).flatten

overrides_block = source[/catalogNameOverrides: \[String: String\] = \[\n(.*?)^\s*\]$/m, 1] || ''
overrides = overrides_block.scan(/"([^"]+)":\s*"([^"]+)"/).to_h

raw_names_block = source[/private static let rawNames = """\n(.*?)^\s*"""$/m, 1]
abort_unless.call(raw_names_block, 'В Generated/Assets.swift не найден литерал rawNames')
raw_names = raw_names_block.lines.map(&:strip).reject(&:empty?)

print_info "Сгенерировано: #{cases.size} кейсов IconName, #{overrides.size} override-записей, #{raw_names.size} имён в rawNames"

# --- 2. Собираем истину из asset-каталога ---------------------------------------------

catalog_names = Dir.children(CATALOG)
                   .map { |entry| entry.dup.force_encoding('UTF-8') }
                   .select { |entry| entry.end_with?('.imageset') }
                   .map { |entry| File.basename(entry, '.imageset') }

# базовые имена, у которых есть все три размера
by_base = Hash.new { |hash, key| hash[key] = [] }
catalog_names.each do |name|
  next unless (match = name.match(/\A(.+?)(16|24|36)\z/))

  by_base[match[1]] << match[2]
end
complete_bases = by_base.select { |_, sizes| SIZES.all? { |s| sizes.include?(s) } }.keys
incomplete_bases = by_base.reject { |_, sizes| SIZES.all? { |s| sizes.include?(s) } }.keys

cyrillic_bases = complete_bases.select { |base| base.start_with?(CYRILLIC_C) }
expected_bases = complete_bases - cyrillic_bases

print_info "В каталоге: #{catalog_names.size} ассетов, #{complete_bases.size} полных троек, " \
           "из них #{cyrillic_bases.size} кириллических (исключаются)"

# --- 3. Сверяем ------------------------------------------------------------------------

if raw_names.size != cases.size
  fail!(errors, "rawNames (#{raw_names.size}) и кейсы IconName (#{cases.size}) разошлись")
end
if raw_names != cases
  diff = (raw_names - cases) | (cases - raw_names)
  fail!(errors, "rawNames и кейсы IconName содержат разные имена: #{diff.first(10).join(', ')}")
end

# имя в каталоге по тому же правилу, что и в Swift: override, иначе первая буква в верхний регистр
resolved = cases.to_h do |name|
  base = overrides[name] || (name[0].upcase + name[1..])
  [name, base]
end

# 3a. каждый кейс существует на диске во всех трёх размерах
resolved.each do |name, base|
  missing = SIZES.reject { |size| Dir.exist?(File.join(CATALOG, "#{base}#{size}.imageset")) }
  next if missing.empty?

  fail!(errors, "IconName.#{name} -> \"#{base}\": нет ассетов для размеров #{missing.join(', ')}")
end

# 3b. биекция между кейсами и полными тройками каталога
covered = resolved.values
(expected_bases - covered).each do |base|
  fail!(errors, "Иконка \"#{base}\" есть в каталоге, но не попала в IconName")
end
(covered - expected_bases).each do |base|
  fail!(errors, "IconName ссылается на \"#{base}\", которого нет среди полных троек каталога")
end
if covered.size != covered.uniq.size
  dupes = covered.tally.select { |_, count| count > 1 }.keys
  fail!(errors, "Несколько кейсов IconName ведут на одно имя каталога: #{dupes.join(', ')}")
end

# 3c. таблица override содержит только реальные расхождения и ничего не забыла
overrides.each do |name, base|
  next unless (name[0].upcase + name[1..]) == base

  fail!(errors, "Лишняя запись в catalogNameOverrides: \"#{name}\" -> \"#{base}\"")
end

# 3d. у каждой пропущенной кириллической базы есть латинский двойник
cyrillic_bases.each do |base|
  twin = "C#{base[1..]}" # латинская C
  next if complete_bases.include?(twin)

  fail!(errors, "Кириллическая иконка \"#{base}\" исключена, но латинского двойника \"#{twin}\" нет")
end

# 3e. предупреждаем про неполные тройки — не ошибка, но стоит знать
unless incomplete_bases.empty?
  print_warning "Иконки без полного набора размеров (в IconName не попадут): #{incomplete_bases.sort.join(', ')}"
end

# --- 4. Итог ---------------------------------------------------------------------------

if errors.empty?
  print_success "IconName согласован с asset-каталогом: #{cases.size} иконок × #{SIZES.size} размера"
  exit 0
else
  print_error "Проверка не пройдена: #{errors.size} ошибок"
  exit 1
end
