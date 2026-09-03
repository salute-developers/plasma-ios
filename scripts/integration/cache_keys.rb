#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Ключи слоёв кэша артефактов для .github/workflows/integration-test.yml.
# Слой = набор путей; хэш слоя = sha256 от git-tree-хэшей этих путей (git rev-parse HEAD:<path>)
# + хэш нижнего слоя. Пересборка слоя нужна только когда меняется он сам или что-то ниже.
#
# Печатает строки для GITHUB_OUTPUT:
#   core=core-<prefix>-<h>
#   components=components-<prefix>-<coreh>-<h>
#   themes=[{"dir":"SDDSservTheme","scheme":"SDDSServTheme","key":"theme-SDDSServTheme-<prefix>-<componentsh>-<h>"}]
# prefix = CACHE_VERSION (ручная инвалидация) + XCODE_VERSION.
require 'digest'
require 'json'
require_relative 'list_themes'

REPO_ROOT = File.expand_path('../..', __dir__)

CORE_PATHS = %w[
  DesignSystemBuilder/SDDSThemeCore
  DesignSystemBuilder/DesignSystemBuilder.xcodeproj
  scripts/build_xcframeworks.rb
  scripts/common.rb
].freeze

COMPONENTS_PATHS = %w[
  SDDSComponents
  SDDSIcons
  SDDSApiInfo
  Vendor
  SDDS.xcworkspace
  Package.swift
  scripts/build_inputmask.rb
].freeze

def tree_hash(paths)
  hashes = paths.map do |path|
    hash = `git -C "#{REPO_ROOT}" rev-parse HEAD:#{path}`.strip
    abort("git rev-parse HEAD:#{path} не удался — путь не в HEAD?") unless $?.success? && !hash.empty?
    hash
  end
  Digest::SHA256.hexdigest(hashes.join)[0, 16]
end

prefix = "#{ENV.fetch('CACHE_VERSION', 'v1')}-xcode#{ENV.fetch('XCODE_VERSION', 'local')}"

core_hash = tree_hash(CORE_PATHS)
components_hash = tree_hash(COMPONENTS_PATHS)
themes = IntegrationThemes.list(REPO_ROOT).map do |theme|
  theme_hash = tree_hash(["Themes/#{theme['dir']}", 'scripts/build_themes.rb'])
  theme.merge('key' => "theme-#{theme['scheme']}-#{prefix}-#{components_hash}-#{theme_hash}")
end

puts "core=core-#{prefix}-#{core_hash}"
puts "components=components-#{prefix}-#{core_hash}-#{components_hash}"
puts "themes=#{JSON.generate(themes)}"
