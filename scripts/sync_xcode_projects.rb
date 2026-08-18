#!/usr/bin/env ruby

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8


require 'xcodeproj'
require 'optparse'

IGNORED_FOLDERS = %w[docs override-docs].freeze

check_only = ARGV.include?('--check')
root = File.expand_path('..', __dir__)
stale = false

Dir.glob(File.join(root, 'Themes', '*', '*.xcodeproj')).sort.each do |project_path|
  theme_path = File.dirname(project_path)
  theme_name = File.basename(theme_path)

  project = Xcodeproj::Project.open(project_path)
  target = project.targets.first
  next unless target

  groups = target.file_system_synchronized_groups
  next unless groups
  in_project = groups.map { |group| group.path.to_s }

  on_disk = Dir.entries(theme_path).select do |entry|
    next false if entry.start_with?('.') || entry.end_with?('.xcodeproj')
    next false if IGNORED_FOLDERS.include?(entry)
    File.directory?(File.join(theme_path, entry))
  end

  missing = (on_disk - in_project).sort
  obsolete = (in_project - on_disk).sort
  if missing.empty? && obsolete.empty?
    puts "#{theme_name}: up to date (#{in_project.size} folders)"
    next
  end

  stale = true
  puts "#{theme_name}: +#{missing.size} missing, -#{obsolete.size} obsolete"
  puts "  missing:  #{missing.join(', ')}" unless missing.empty?
  puts "  obsolete: #{obsolete.join(', ')}" unless obsolete.empty?
  next if check_only

  missing.each do |folder|
    group = project.new(Xcodeproj::Project::Object::PBXFileSystemSynchronizedRootGroup)
    group.path = folder
    group.source_tree = '<group>'
    group.explicit_file_types = {}
    group.explicit_folders = []
    project.main_group.children << group
    groups << group
  end

  obsolete.each do |folder|
    group = groups.find { |candidate| candidate.path.to_s == folder }
    next unless group
    groups.delete(group)
    project.main_group.children.delete(group)
    group.remove_from_project
  end

  project.save
end

components_project_path = File.join(root, 'SDDSComponents', 'SDDSComponents.xcodeproj')
if File.exist?(components_project_path)
  project = Xcodeproj::Project.open(components_project_path)
  target = project.targets.find { |candidate| candidate.name == 'SDDSComponents' }
  sources_root = File.join(root, 'SDDSComponents', 'Sources', 'SDDSComponents')

  if target
    in_project = target.source_build_phase.files.map { |file| file.file_ref&.real_path.to_s }.compact
    on_disk = Dir.glob(File.join(sources_root, '**', '*.swift')).map { |file| File.expand_path(file) }
    missing = (on_disk - in_project).sort

    if missing.empty?
      puts "SDDSComponents: up to date (#{in_project.size} files)"
    else
      stale = true
      puts "SDDSComponents: +#{missing.size} missing"
      missing.each { |file| puts "  missing: #{file.sub(sources_root + '/', '')}" }

      unless check_only
        sources_group = project.main_group.find_subpath('Sources/SDDSComponents', false)
        missing.each do |file|
          relative = file.sub(sources_root + '/', '')
          group = sources_group
          File.dirname(relative).split('/').each do |part|
            next if part == '.'
            group = group.find_subpath(part, true).tap { |found| found.set_path(part) }
          end
          reference = group.new_file(File.basename(relative))
          reference.path = File.basename(relative)
          target.source_build_phase.add_file_reference(reference)
        end
        project.save
      end
    end
  end
end

exit(1) if check_only && stale
