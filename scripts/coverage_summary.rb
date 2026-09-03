#!/usr/bin/env ruby
# frozen_string_literal: true

# Печатает markdown-таблицу покрытия по всем .xcresult из build/test-results.
# Используется и локально, и в CI (вывод уходит в summary джобы).
#
# Покрытие порогом не является: xccov считает его по объектникам, которые втянул
# тестовый бинарь, а SDDSComponents линкуется статически — в отчёт попадает лишь
# часть библиотеки, поэтому процент завышен относительно реального.

require 'json'

bundles = Dir.glob(File.join(__dir__, '..', 'build', 'test-results', '*.xcresult')).sort
if bundles.empty?
  puts 'No .xcresult bundles produced'
  exit 0
end

puts '### Code coverage'
puts
puts '| Target | Coverage | Covered / executable lines |'
puts '|---|---:|---:|'

bundles.each do |bundle|
  json = `xcrun xccov view --report --json "#{bundle}" 2>/dev/null`
  next if json.strip.empty?

  begin
    report = JSON.parse(json)
  rescue JSON::ParserError
    next
  end

  Array(report['targets']).each do |target|
    executable = target['executableLines'].to_i
    next if executable.zero?

    percent = (target['lineCoverage'].to_f * 100).round(1)
    puts format('| %s | %.1f%% | %d / %d |', target['name'], percent, target['coveredLines'].to_i, executable)
  end
end
