#!/usr/bin/env ruby
# frozen_string_literal: true

# Regenerates release-manifest.json from a published release.
#
# Versions come from MARKETING_VERSION of each module's Xcode target at the released tag,
# asset names and download URLs come from the release itself, so the manifest can never
# claim a version or a URL that was not actually published.
#
#   scripts/release/update_release_manifest.rb <tag> [--check]
#
# --check does not write anything: it exits 1 and prints a diff when the manifest on disk
# differs from what the release says. Used in CI to catch a stale manifest.

require 'json'
require 'open3'
require 'time'
require 'optparse'
require 'tmpdir'
require 'fileutils'
require 'xcodeproj'

REPO = 'salute-developers/plasma-ios'
MANIFEST = 'release-manifest.json'

# asset file name => [display name, Xcode project, target name]
LIBRARIES = {
  'SDDSThemeCore.xcframework.zip' =>
    ['SDDSThemeCore', 'DesignSystemBuilder/DesignSystemBuilder.xcodeproj', 'SDDSThemeCore'],
  'SDDSComponents.xcframework.zip' =>
    ['SDDSComponents', 'SDDSComponents/SDDSComponents.xcodeproj', 'SDDSComponents'],
  'SDDSIcons.xcframework.zip' =>
    ['SDDSIcons', 'SDDSIcons/SDDSIcons.xcodeproj', 'SDDSIcons'],
  'InputMask.xcframework.zip' =>
    ['InputMask', 'Vendor/InputMask.xcodeproj', 'InputMask'],
  'SDDSServTheme.xcframework.zip' =>
    ['SDDSServTheme', 'Themes/SDDSservTheme/SDDSservTheme.xcodeproj', 'SDDSServTheme'],
  'PlasmaB2CTheme.xcframework.zip' =>
    ['PlasmaB2CTheme', 'Themes/PlasmaB2CTheme/PlasmaB2CTheme.xcodeproj', 'PlasmaB2CTheme'],
  'PlasmaHomeDSTheme.xcframework.zip' =>
    ['PlasmaHomeDSTheme', 'Themes/PlasmaHomeDSTheme/PlasmaHomeDSTheme.xcodeproj', 'PlasmaHomeDSTheme']
}.freeze

CLI_NAME = 'design-system-builder-cli'
CLI_NOTE = 'The dsbuilder CLI has no version of its own, so the release tag is used. ' \
           'The asset name embeds the tag, so release_sync cannot carry it forward to a ' \
           'newer release automatically.'

def run!(*cmd)
  out, err, status = Open3.capture3(*cmd)
  raise "Command failed: #{cmd.join(' ')}\n#{err}" unless status.success?

  out
end

# MARKETING_VERSION of a specific target, read from the project as it was at `tag`.
# The project is extracted from git into a temp dir so Xcodeproj can parse it properly —
# grepping project.pbxproj picks up whichever target happens to come first.
def project_versions(tag, project_path)
  @version_cache ||= {}
  key = [tag, project_path]
  return @version_cache[key] if @version_cache.key?(key)

  versions = {}
  Dir.mktmpdir do |dir|
    archive, = Open3.capture2('git', 'archive', tag, project_path, binmode: true)
    IO.popen(['tar', '-x', '-C', dir], 'wb') { |io| io.write(archive) }
    extracted = File.join(dir, project_path)
    if File.exist?(extracted)
      project = Xcodeproj::Project.open(extracted)
      project.targets.each do |target|
        settings = target.build_configuration_list.build_configurations.first&.build_settings
        value = settings && settings['MARKETING_VERSION']
        versions[target.name] = value.to_s.delete('"') if value
      end
    end
  end

  @version_cache[key] = versions
end

def marketing_version(tag, project_path, target_name)
  project_versions(tag, project_path)[target_name]
end

def release_assets(tag)
  json = run!('gh', 'release', 'view', tag, '--repo', REPO, '--json', 'assets')
  JSON.parse(json)['assets'].to_h { |a| [a['name'], a['url']] }
end

# Assets of the newest release that still carries this asset name, so a library dropped
# from the current release (icons) keeps pointing at the last release that had it.
def newest_release_with(asset_name, tags)
  tags.each do |tag|
    assets = release_assets(tag)
    return [tag, assets[asset_name]] if assets.key?(asset_name)
  end
  [nil, nil]
end

def recent_tags(limit)
  json = run!('gh', 'release', 'list', '--repo', REPO, '--limit', limit.to_s,
              '--json', 'tagName,publishedAt')
  JSON.parse(json)
      .reject { |r| r['tagName'].start_with?('SDDSIcons-') }
      .sort_by { |r| r['publishedAt'] }
      .reverse
      .map { |r| r['tagName'] }
end

def build_manifest(tag)
  tags = ([tag] + recent_tags(30)).uniq
  assets = release_assets(tag)

  libraries = LIBRARIES.map do |asset_name, (name, project, target)|
    found_tag, url = assets.key?(asset_name) ? [tag, assets[asset_name]] : newest_release_with(asset_name, tags)
    next warn("skip #{name}: no #{asset_name} in any recent release") unless found_tag

    version = marketing_version(found_tag, project, target)
    next warn("skip #{name}: no MARKETING_VERSION for #{target} at #{found_tag}") unless version

    entry = {
      'name' => name,
      'version' => version,
      'assetFileName' => asset_name,
      'downloadUrl' => url,
      'releaseTag' => found_tag
    }
    if found_tag != tag
      entry['notes'] = "Not attached to #{tag}; this is the newest published build, from #{found_tag}."
    end
    entry
  end.compact

  cli_asset = "dsbuilder-cli-#{tag}.zip"
  if assets.key?(cli_asset)
    libraries << {
      'name' => CLI_NAME,
      'version' => tag,
      'assetFileName' => cli_asset,
      'downloadUrl' => assets[cli_asset],
      'releaseTag' => tag,
      'notes' => CLI_NOTE
    }
  else
    warn "skip #{CLI_NAME}: no #{cli_asset} in #{tag}"
  end

  {
    'generatedAt' => Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ'),
    'sourceRepo' => REPO,
    'libraries' => libraries
  }
end

check_only = false
OptionParser.new do |o|
  o.banner = 'Usage: update_release_manifest.rb <tag> [--check]'
  o.on('--check', 'Do not write; exit 1 if the manifest is out of date') { check_only = true }
end.parse!

tag = ARGV.shift
abort 'Usage: update_release_manifest.rb <tag> [--check]' if tag.nil? || tag.empty?

manifest = build_manifest(tag)
rendered = "#{JSON.pretty_generate(manifest)}\n"

if check_only
  current = File.exist?(MANIFEST) ? File.read(MANIFEST) : ''
  # generatedAt always differs, so compare everything else.
  strip = ->(text) { text.gsub(/"generatedAt": "[^"]*"/, '"generatedAt": "*"') }
  if strip.call(current) == strip.call(rendered)
    puts "#{MANIFEST} is up to date for #{tag}"
    exit 0
  end
  warn "#{MANIFEST} is out of date for #{tag}. Expected:"
  warn rendered
  exit 1
end

File.write(MANIFEST, rendered)
puts "#{MANIFEST} updated for #{tag} (#{manifest['libraries'].size} entries)"
