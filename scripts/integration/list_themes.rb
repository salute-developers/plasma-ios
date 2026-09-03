#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Список тем для интеграционного теста: по одной записи на Themes/<dir>/<dir>.xcodeproj.
#   dir    — папка темы (SDDSservTheme)
#   scheme — имя framework-таргета (SDDSServTheme); совпадает с именем xcframework и схемы
#
# Как библиотека: require_relative 'list_themes'; IntegrationThemes.list(repo_root)
# Как скрипт:     ruby scripts/integration/list_themes.rb  → JSON-массив в stdout
require 'json'
require 'xcodeproj'

module IntegrationThemes
  FRAMEWORK_PRODUCT_TYPE = 'com.apple.product-type.framework'

  def self.list(repo_root)
    # map + compact вместо filter_map: системный ruby на macOS — 2.6, filter_map с 2.7.
    Dir.glob(File.join(repo_root, 'Themes', '*', '*.xcodeproj')).sort.map do |project_path|
      dir = File.basename(File.dirname(project_path))
      next unless File.basename(project_path, '.xcodeproj') == dir

      project = Xcodeproj::Project.open(project_path)
      target = project.targets.find { |t| t.product_type == FRAMEWORK_PRODUCT_TYPE } || project.targets.first
      { 'dir' => dir, 'scheme' => target.name }
    end.compact
  end
end

if __FILE__ == $PROGRAM_NAME
  puts JSON.generate(IntegrationThemes.list(File.expand_path('../..', __dir__)))
end
