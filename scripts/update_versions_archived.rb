#!/usr/bin/env ruby

require 'json'

def semver_key(value)
  match = value.match(/\A(\d+)\.(\d+)\.(\d+)\z/)
  if match
    [0, match[1].to_i, match[2].to_i, match[3].to_i]
  else
    [1, value]
  end
end

if ARGV.length != 3
  warn 'Usage: ruby scripts/update_versions_archived.rb <versions_file> <version> <url>'
  exit 1
end

versions_file = ARGV[0]
version = ARGV[1]
url = ARGV[2]

data = {}

if File.exist?(versions_file)
  content = File.read(versions_file, encoding: 'UTF-8').strip
  data = JSON.parse(content) unless content.empty?
end

data[version] = url

ordered = data.keys
              .sort_by { |key| semver_key(key) }
              .each_with_object({}) { |key, result| result[key] = data[key] }

File.write(versions_file, JSON.pretty_generate(ordered) + "\n")
puts "Updated #{versions_file}: #{version} -> #{url}"
