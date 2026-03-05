#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'yaml'
require 'optparse'
require 'uri'
require 'net/http'
require 'tempfile'
require 'fileutils'
require 'time'
require 'open3'

class SyncError < StandardError; end

Library = Struct.new(:name, :version, :asset_file_name, :download_url, :release_tag, keyword_init: true)

DEFAULT_SOURCE_OWNER = 'salute-developers'
DEFAULT_SOURCE_REPO = 'plasma-ios'
DEFAULT_MANIFEST_FILE = 'release-manifest.json'
DEFAULT_MANIFEST_SCHEMA_FILE = 'release-manifest.schema.json'
DEFAULT_THIRD_PARTY_SCHEMA_FILE = 'scripts/schemas/third_party_upload_list.schema.json'
DEFAULT_MONO_SCHEMA_FILE = 'scripts/schemas/mono_dependencies.schema.json'
DEFAULT_CONFIG_PATH = '~/.plasma-release-sync.json'
DEFAULT_GITLAB_URL = 'https://gitlab.com'
DEFAULT_BRANCH_TEMPLATE = 'chore/sync-plasma-{release_tag}'
DEFAULT_COMMIT_TEMPLATE = 'chore: sync plasma artifacts {release_tag}'
DEFAULT_MR_TITLE_TEMPLATE = 'chore: sync plasma artifacts {release_tag}'
DEFAULT_MR_BODY_TEMPLATE = "Automated sync for `{release_tag}`.\n\nUpdated dependencies and artifacts."

def parse_args(argv)
  opts = {
    source_owner: DEFAULT_SOURCE_OWNER,
    source_repo: DEFAULT_SOURCE_REPO,
    config_path: DEFAULT_CONFIG_PATH,
    manifest_ref: 'main',
    gitlab_url: ENV.fetch('GITLAB_URL', DEFAULT_GITLAB_URL),
    gitlab_project_id: ENV['GITLAB_PROJECT_ID']
  }

  parser = OptionParser.new do |o|
    o.banner = 'Использование: ruby scripts/release_sync/release_sync.rb [опции]'
    o.separator ''
    o.separator 'Режимы:'
    o.separator '  third-party: upload_list + артефакты'
    o.separator '  mono: только YAML зависимости'
    o.separator '  без --mode: автоматически запускает third-party, потом mono'
    o.separator ''
    o.separator 'Важное:'
    o.separator '  Перед запуском задайте GITLAB_TOKEN'
    o.separator '  export GITLAB_TOKEN="glpat-..."'
    o.separator ''
    o.separator "Кэш настроек: #{DEFAULT_CONFIG_PATH}"
    o.separator '  Можно переопределить через --config-path'
    o.separator ''
    o.separator 'Примеры:'
    o.separator '  ruby scripts/release_sync/release_sync.rb'
    o.separator '  ruby scripts/release_sync/release_sync.rb --mode mono'
    o.separator '  ruby scripts/release_sync/release_sync.rb --dry-run'

    o.on('--mode MODE', %w[third-party mono], 'Режим: third-party или mono (если не задан, запускаются оба)') { |v| opts[:mode] = v }
    o.on('--release-tag TAG', 'Тег-релиз якорь') { |v| opts[:release_tag] = v }
    o.on('--repo-path PATH', 'Путь к локальному git-репозиторию') { |v| opts[:repo_path] = v }
    o.on('--upload-list-path PATH', 'Путь к upload_list.sh (third-party)') { |v| opts[:upload_list_path] = v }
    o.on('--artifacts-dir PATH', 'Папка артефактов (third-party)') { |v| opts[:artifacts_dir] = v }
    o.on('--mono-yaml-path PATH', 'Путь к YAML (mono)') { |v| opts[:mono_yaml_path] = v }
    o.on('--target-branch NAME', 'Целевая ветка MR') { |v| opts[:target_branch] = v }
    o.on('--branch-name NAME', 'Source ветка commit/push') { |v| opts[:branch_name] = v }
    o.on('--commit-message MSG', 'Сообщение коммита') { |v| opts[:commit_message] = v }
    o.on('--config-path PATH', 'Путь к кэшу настроек') { |v| opts[:config_path] = v }
    o.on('--manifest-path PATH', 'Локальный release-manifest.json') { |v| opts[:manifest_path] = v }
    o.on('--manifest-schema-path PATH', 'Схема manifest (override)') { |v| opts[:manifest_schema_path] = v }
    o.on('--third-party-schema-path PATH', 'Схема third-party (override)') { |v| opts[:third_party_schema_path] = v }
    o.on('--mono-schema-path PATH', 'Схема mono (override)') { |v| opts[:mono_schema_path] = v }
    o.on('--manifest-ref REF', 'Git ref для manifest/schemas') { |v| opts[:manifest_ref] = v }
    o.on('--manifest-url URL', 'Полный URL manifest JSON') { |v| opts[:manifest_url] = v }
    o.on('--source-owner OWNER', 'GitHub owner') { |v| opts[:source_owner] = v }
    o.on('--source-repo REPO', 'GitHub repo') { |v| opts[:source_repo] = v }
    o.on('--gitlab-url URL', 'Базовый URL GitLab') { |v| opts[:gitlab_url] = v }
    o.on('--gitlab-project-id ID', 'ID проекта GitLab (число или group%2Frepo)') { |v| opts[:gitlab_project_id] = v }
    o.on('--non-interactive', 'Без интерактивных вопросов') { opts[:non_interactive] = true }
    o.on('--dry-run', 'Показать изменения без записи/пуша') { opts[:dry_run] = true }
  end

  parser.parse!(argv)
  opts
end

def ask_if_missing(value, prompt, default: nil, required: false, non_interactive: false)
  return value unless value.nil? || value.to_s.empty?

  if non_interactive
    raise SyncError, "Отсутствует обязательный параметр: #{prompt}" if required && default.nil?
    return default
  end

  suffix = default.nil? ? '' : " [#{default}]"
  print("#{prompt}#{suffix}: ")
  entered = $stdin.gets&.strip
  return entered unless entered.nil? || entered.empty?
  return default unless default.nil?
  raise SyncError, "Не задано значение: #{prompt}" if required

  nil
end

def ask_yes_no(prompt, default: true, non_interactive: false)
  return default if non_interactive

  suffix = default ? ' [Y/n]' : ' [y/N]'
  print("#{prompt}#{suffix}: ")
  input = $stdin.gets&.strip&.downcase
  return default if input.nil? || input.empty?
  return true if %w[y yes].include?(input)
  return false if %w[n no].include?(input)

  raise SyncError, "Некорректный ответ: #{input}"
end

def load_config(path)
  return {} unless File.exist?(path)

  data = JSON.parse(File.read(path))
  raise SyncError, "Некорректный формат кэша: #{path}" unless data.is_a?(Hash)

  data.transform_values(&:to_s)
rescue JSON::ParserError => e
  raise SyncError, "Некорректный JSON в кэше #{path}: #{e.message}"
end

def save_config(path, data)
  FileUtils.mkdir_p(File.dirname(path))
  merged = load_config(path).merge(data.transform_values { |v| v.nil? ? '' : v.to_s })
  File.write(path, JSON.pretty_generate(merged) + "\n")
end

def normalize_optional_path(path)
  return '' if path.nil? || path.empty?
  File.expand_path(path)
end

def github_headers(token)
  headers = {
    'Accept' => 'application/vnd.github+json',
    'User-Agent' => 'plasma-release-sync/1.0'
  }
  headers['Authorization'] = "Bearer #{token}" unless token.to_s.empty?
  headers
end

def http_get_json(url, headers = {})
  uri = URI(url)
  req = Net::HTTP::Get.new(uri)
  headers.each { |k, v| req[k] = v }
  res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request(req) }
  raise SyncError, "HTTP #{res.code} для #{url}: #{res.body}" unless res.is_a?(Net::HTTPSuccess)

  JSON.parse(res.body)
rescue JSON::ParserError => e
  raise SyncError, "Не удалось распарсить JSON из #{url}: #{e.message}"
end

def load_manifest(opts, github_token)
  if opts[:manifest_path]
    path = File.expand_path(opts[:manifest_path])
    raise SyncError, "Manifest не найден: #{path}" unless File.exist?(path)
    return JSON.parse(File.read(path))
  end

  if opts[:manifest_url]
    return http_get_json(opts[:manifest_url], github_headers(github_token))
  end

  url = "https://raw.githubusercontent.com/#{opts[:source_owner]}/#{opts[:source_repo]}/#{opts[:manifest_ref]}/#{DEFAULT_MANIFEST_FILE}"
  http_get_json(url, github_headers(github_token))
end

def load_schema_definition(local_path:, fallback_repo_path:, opts:, github_token:, label:)
  if local_path && !local_path.empty?
    path = File.expand_path(local_path)
    raise SyncError, "#{label} не найден: #{path}" unless File.exist?(path)
    data = JSON.parse(File.read(path))
    raise SyncError, "#{label} должен быть JSON объектом" unless data.is_a?(Hash)
    return data
  end

  url = "https://raw.githubusercontent.com/#{opts[:source_owner]}/#{opts[:source_repo]}/#{opts[:manifest_ref]}/#{fallback_repo_path}"
  data = http_get_json(url, github_headers(github_token))
  raise SyncError, "Скачанный #{label} не JSON объект: #{url}" unless data.is_a?(Hash)
  data
end

def validate_json_schema(data, schema, label)
  errors = []
  validate_schema_node(data, schema, '$', errors)
  raise SyncError, "#{label} validation failed: #{errors.first}" unless errors.empty?
end

def validate_schema_node(data, schema, path, errors)
  type = schema['type']
  case type
  when 'object'
    unless data.is_a?(Hash)
      errors << "#{path} must be object"
      return
    end
    Array(schema['required']).each do |key|
      unless data.key?(key)
        errors << "#{path}.#{key} is required"
        return
      end
    end
    props = schema['properties'] || {}
    additional = schema.fetch('additionalProperties', true)
    data.each do |k, v|
      if props.key?(k)
        validate_schema_node(v, props[k], "#{path}.#{k}", errors)
        return unless errors.empty?
      elsif additional == false
        errors << "#{path}.#{k} is not allowed"
        return
      end
    end
  when 'array'
    unless data.is_a?(Array)
      errors << "#{path} must be array"
      return
    end
    min_items = schema['minItems']
    if min_items.is_a?(Integer) && data.length < min_items
      errors << "#{path} must contain at least #{min_items} items"
      return
    end
    item_schema = schema['items']
    if item_schema.is_a?(Hash)
      data.each_with_index do |item, idx|
        validate_schema_node(item, item_schema, "#{path}[#{idx}]", errors)
        return unless errors.empty?
      end
    end
  when 'string'
    unless data.is_a?(String)
      errors << "#{path} must be string"
      return
    end
    min_len = schema['minLength']
    if min_len.is_a?(Integer) && data.length < min_len
      errors << "#{path} length must be >= #{min_len}"
      return
    end
    pattern = schema['pattern']
    if pattern.is_a?(String) && Regexp.new(pattern) !~ data
      errors << "#{path} does not match pattern"
    end
  end
end

def to_libraries(manifest)
  libs = manifest['libraries']
  raise SyncError, 'Manifest has no libraries' unless libs.is_a?(Array) && !libs.empty?
  libs.map do |raw|
    %w[name version assetFileName downloadUrl releaseTag].each do |f|
      raise SyncError, "Manifest entry misses '#{f}': #{raw}" if raw[f].to_s.empty?
    end
    Library.new(
      name: raw['name'].to_s,
      version: raw['version'].to_s,
      asset_file_name: raw['assetFileName'].to_s,
      download_url: raw['downloadUrl'].to_s,
      release_tag: raw['releaseTag'].to_s
    )
  end
end

def fetch_releases(owner, repo, github_token)
  releases = []
  page = 1
  loop do
    url = "https://api.github.com/repos/#{owner}/#{repo}/releases?per_page=100&page=#{page}"
    chunk = http_get_json(url, github_headers(github_token))
    raise SyncError, 'Unexpected GitHub releases response' unless chunk.is_a?(Array)
    break if chunk.empty?
    releases.concat(chunk)
    page += 1
  end
  releases
end

def select_release_window(releases, anchor_tag)
  return [releases, releases.first['tag_name'].to_s] if anchor_tag.to_s.empty? || anchor_tag == 'latest'
  idx = releases.index { |r| r['tag_name'].to_s == anchor_tag }
  raise SyncError, "Release tag '#{anchor_tag}' not found in GitHub releases" if idx.nil?
  [releases[idx..], anchor_tag]
end

def newest_asset_map(releases)
  mapping = {}
  releases.each do |release|
    tag = release['tag_name'].to_s
    Array(release['assets']).each do |asset|
      name = asset['name'].to_s
      next if name.empty? || mapping.key?(name)
      url = asset['browser_download_url'].to_s
      next if url.empty?
      mapping[name] = { release_tag: tag, download_url: url }
    end
  end
  mapping
end

def resolve_libraries_with_fallback(libraries, owner:, repo:, github_token:, anchor_release_tag:)
  releases = fetch_releases(owner, repo, github_token)
  raise SyncError, "No releases found in #{owner}/#{repo}" if releases.empty?
  selected, resolved_anchor = select_release_window(releases, anchor_release_tag)
  assets = newest_asset_map(selected)
  resolved = libraries.map do |lib|
    asset = assets[lib.asset_file_name]
    if asset
      Library.new(
        name: lib.name,
        version: lib.version,
        asset_file_name: lib.asset_file_name,
        download_url: asset[:download_url],
        release_tag: asset[:release_tag]
      )
    else
      lib
    end
  end
  [resolved, resolved_anchor]
end

def parse_upload_list_entries(lines)
  entries = []
  rx = /^\s*(\S+)\s+(\S+)\s*$/
  lines.each do |line|
    stripped = line.strip
    next if stripped.empty? || stripped.start_with?('#')
    match = rx.match(stripped)
    raise SyncError, "Invalid upload_list line format: '#{line.rstrip}'" unless match
    entries << { 'name' => match[1], 'version' => match[2] }
  end
  entries
end

def update_upload_list(path, libraries, schema, dry_run)
  by_name = libraries.to_h { |lib| [lib.name, lib] }
  lines = File.readlines(path, chomp: false)
  validate_json_schema({ 'dependencies' => parse_upload_list_entries(lines) }, schema, 'third-party upload list')

  changed = []
  out = []
  rx = /^(\s*)(\S+)(\s+)(\S+)(.*)$/
  lines.each do |line|
    stripped = line.strip
    if stripped.empty? || stripped.start_with?('#')
      out << line
      next
    end
    m = rx.match(line.chomp)
    unless m
      out << line
      next
    end
    lead, name, gap, version, tail = m.captures
    lib = by_name[name]
    unless lib
      out << line
      next
    end
    changed << [name, version, lib.version] if version != lib.version
    out << "#{lead}#{name}#{gap}#{lib.version}#{tail}\n"
  end
  File.write(path, out.join) if !dry_run && !changed.empty?
  changed
end

def update_mono_yaml(path, libraries, source_owner:, source_repo:, mono_schema:, dry_run:)
  data = YAML.safe_load(File.read(path), aliases: true)
  validate_json_schema(data, mono_schema, 'mono dependencies yaml')
  raise SyncError, 'Mono YAML root must be array' unless data.is_a?(Array)

  by_name = libraries.to_h { |lib| [lib.name, lib] }
  url_re = %r{(https://github\.com/#{Regexp.escape(source_owner)}/#{Regexp.escape(source_repo)}/releases/tag/)([^\s/]+)}i
  changes = []

  data.each do |item|
    next unless item.is_a?(Hash)
    name = item['name'].to_s
    lib = by_name[name]
    next unless lib

    old_version = item['version'].to_s
    descriptor = item['descriptor']
    old_tag = descriptor.to_s[url_re, 2].to_s
    changed = false

    if !old_version.empty? && old_version != lib.version
      item['version'] = lib.version
      changed = true
    end
    if descriptor.is_a?(String)
      new_desc = descriptor.gsub(url_re, "\\1#{lib.release_tag}")
      if new_desc != descriptor
        item['descriptor'] = new_desc
        changed = true
      end
    end

    if changed
      changes << [name, old_version.empty? ? lib.version : old_version, lib.version, old_tag.empty? ? lib.release_tag : old_tag, lib.release_tag]
    end
  end

  File.write(path, YAML.dump(data)) if !dry_run && !changes.empty?
  changes
end

def local_artifact_file_name(asset_file_name)
  asset_file_name.sub(/\.xcframework(?=\.zip$)/i, '')
end

def download_file(url, target_path, github_token)
  uri = URI(url)
  FileUtils.mkdir_p(File.dirname(target_path))
  Tempfile.create([File.basename(target_path), '.tmp'], File.dirname(target_path)) do |tmp|
    req = Net::HTTP::Get.new(uri)
    github_headers(github_token).each { |k, v| req[k] = v }
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.request(req) do |res|
        raise SyncError, "Download failed #{res.code} for #{url}" unless res.is_a?(Net::HTTPSuccess)
        res.read_body { |chunk| tmp.write(chunk) }
      end
    end
    tmp.flush
    FileUtils.mv(tmp.path, target_path, force: true)
  end
end

def download_artifacts(dir, libraries, github_token, dry_run)
  downloaded = []
  libraries.each do |lib|
    out = File.join(dir, local_artifact_file_name(lib.asset_file_name))
    if dry_run
      puts "[DRY-RUN] #{lib.name}: #{lib.download_url} -> #{out}"
      downloaded << [lib.name, out]
      next
    end
    puts "Downloading #{lib.name} (#{lib.version}) from #{lib.release_tag}"
    puts "  URL: #{lib.download_url}"
    puts "  OUT: #{out}"
    download_file(lib.download_url, out, github_token)
    downloaded << [lib.name, out]
  end
  downloaded
end

def git(repo_path, args)
  cmd = ['git', '-C', repo_path, *args]
  out, err, status = Open3.capture3(*cmd)
  raise SyncError, "Git command failed: #{cmd.join(' ')}\n#{out}#{err}" unless status.success?
  out
end

def remote_branch_exists?(repo_path, branch)
  _out, _err, status = Open3.capture3('git', '-C', repo_path, 'ls-remote', '--exit-code', '--heads', 'origin', branch)
  status.success?
end

def ensure_git_repo(repo_path)
  raise SyncError, "Repository path does not exist: #{repo_path}" unless Dir.exist?(repo_path)
  inside = git(repo_path, ['rev-parse', '--is-inside-work-tree']).strip
  raise SyncError, "Not a git repository: #{repo_path}" unless inside == 'true'
end

def preflight_git(repo_path)
  status = git(repo_path, ['status', '--porcelain']).strip
  raise SyncError, 'Client repository has uncommitted changes. Commit/stash before sync.' unless status.empty?
end

def relpath(path, root)
  abs_path = File.expand_path(path)
  abs_root = File.expand_path(root)
  raise SyncError, "Path '#{abs_path}' must be inside repository '#{abs_root}'" unless abs_path.start_with?(abs_root + '/')
  abs_path.delete_prefix(abs_root + '/')
end

def git_commit_and_push(repo_path:, target_branch:, branch_name:, stage_paths:, commit_message:, non_interactive:)
  if remote_branch_exists?(repo_path, target_branch)
    git(repo_path, ['fetch', 'origin', target_branch])
    git(repo_path, ['checkout', target_branch])
    git(repo_path, ['pull', '--ff-only', 'origin', target_branch])
  else
    current = git(repo_path, ['rev-parse', '--abbrev-ref', 'HEAD']).strip
    message = "Target branch '#{target_branch}' not found on origin. Current local branch: '#{current}'."
    raise SyncError, message if non_interactive
    raise SyncError, message unless ask_yes_no('Target branch not found. Continue from current branch?', default: false)
    puts "Continuing from branch: #{current}"
  end

  git(repo_path, ['checkout', '-B', branch_name])
  git(repo_path, ['add', *stage_paths])
  changed = git(repo_path, ['status', '--porcelain']).lines.map { |l| l[3..].strip }.reject(&:empty?)
  return [] if changed.empty?

  git(repo_path, ['commit', '-m', commit_message])
  git(repo_path, ['push', '-u', 'origin', branch_name])
  changed
end

def create_gitlab_mr(gitlab_url:, project_id:, private_token:, source_branch:, target_branch:, title:, description:)
  encoded_project = URI.encode_www_form_component(project_id)
  uri = URI("#{gitlab_url}/api/v4/projects/#{encoded_project}/merge_requests")
  req = Net::HTTP::Post.new(uri)
  req['PRIVATE-TOKEN'] = private_token
  req.set_form_data(
    'source_branch' => source_branch,
    'target_branch' => target_branch,
    'title' => title,
    'description' => description,
    'remove_source_branch' => 'false'
  )
  res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request(req) }
  raise SyncError, "GitLab MR creation failed: HTTP #{res.code} #{res.body}" unless res.is_a?(Net::HTTPSuccess)
  JSON.parse(res.body).fetch('web_url', '')
end

def build_template_context(input_release_tag, resolved_anchor_tag)
  now = Time.now.utc
  {
    'release_tag' => (input_release_tag == 'latest' ? resolved_anchor_tag : input_release_tag),
    'resolved_release_tag' => resolved_anchor_tag,
    'date' => now.strftime('%Y-%m-%d'),
    'timestamp' => now.to_i.to_s,
    'datetime' => now.iso8601
  }
end

def render_template(template, context)
  template.gsub(/\{([a-z_]+)\}/) { |m| context.fetch(Regexp.last_match(1), m) }
end

def print_resolution_log(libraries)
  puts "\nResolved libraries and sources"
  puts '------------------------------'
  libraries.each do |lib|
    puts "- #{lib.name} #{lib.version}"
    puts "  release: #{lib.release_tag}"
    puts "  asset:   #{lib.asset_file_name}"
    puts "  url:     #{lib.download_url}"
  end
end

def print_summary(changed_versions, downloaded, dry_run)
  mode = dry_run ? 'DRY-RUN' : 'APPLIED'
  puts "\nSummary (#{mode})"
  puts '----------------'
  if changed_versions.empty?
    puts 'Version changes: none'
  else
    puts 'Version changes:'
    changed_versions.each { |name, old_v, new_v| puts "  - #{name}: #{old_v} -> #{new_v}" }
  end
  if downloaded.empty?
    puts 'Artifacts: none'
  else
    puts 'Artifacts:'
    downloaded.each { |name, path| puts "  - #{name}: #{path}" }
  end
end

def print_mono_summary(changes, dry_run)
  mode = dry_run ? 'DRY-RUN' : 'APPLIED'
  puts "\nSummary (#{mode})"
  puts '----------------'
  if changes.empty?
    puts 'YAML changes: none'
    return
  end
  puts 'YAML changes:'
  changes.each do |name, old_v, new_v, old_t, new_t|
    puts "  - #{name}: version #{old_v} -> #{new_v}; release tag #{old_t} -> #{new_t}"
  end
end

def run_third_party_mode(opts, config_path, config)
  repo_path = File.expand_path(
    ask_if_missing(opts[:repo_path] || config['third_party_repo_path'] || config['repo_path'],
                   'Path to client git repository', required: true, non_interactive: opts[:non_interactive])
  )
  ensure_git_repo(repo_path)

  upload_list_path = File.expand_path(
    ask_if_missing(opts[:upload_list_path] || config['third_party_upload_list_path'] || config['upload_list_path'],
                   'Path to upload_list.sh', required: true, non_interactive: opts[:non_interactive])
  )
  raise SyncError, "upload list file not found: #{upload_list_path}" unless File.exist?(upload_list_path)

  artifacts_dir = File.expand_path(
    ask_if_missing(opts[:artifacts_dir] || config['third_party_artifacts_dir'] || config['artifacts_dir'],
                   'Path to artifacts directory', required: true, non_interactive: opts[:non_interactive])
  )
  FileUtils.mkdir_p(artifacts_dir) unless opts[:dry_run]

  target_branch = ask_if_missing(opts[:target_branch] || config['third_party_target_branch'] || config['target_branch'],
                                 'Target branch for MR', default: 'develop', non_interactive: opts[:non_interactive])
  release_tag = ask_if_missing(opts[:release_tag] || config['third_party_release_tag'] || config['release_tag'],
                               "Release tag anchor (or 'latest')", default: 'latest', non_interactive: opts[:non_interactive])
  gitlab_project_id = ask_if_missing(opts[:gitlab_project_id] || config['third_party_gitlab_project_id'] || config['gitlab_project_id'],
                                     'GitLab project id (numeric id or group%2Frepo path)', required: true, non_interactive: opts[:non_interactive])

  github_token = ENV.fetch('GITHUB_TOKEN', '')
  gitlab_token = ENV.fetch('GITLAB_TOKEN', '')
  raise SyncError, 'GITLAB_TOKEN is required' if gitlab_token.empty?

  manifest_schema = load_schema_definition(local_path: opts[:manifest_schema_path], fallback_repo_path: DEFAULT_MANIFEST_SCHEMA_FILE, opts: opts, github_token: github_token, label: 'manifest schema')
  third_schema = load_schema_definition(local_path: opts[:third_party_schema_path], fallback_repo_path: DEFAULT_THIRD_PARTY_SCHEMA_FILE, opts: opts, github_token: github_token, label: 'third-party schema')

  save_config(config_path, {
                'third_party_repo_path' => repo_path,
                'third_party_upload_list_path' => upload_list_path,
                'third_party_artifacts_dir' => artifacts_dir,
                'third_party_release_tag' => release_tag,
                'third_party_gitlab_project_id' => gitlab_project_id,
                'third_party_target_branch' => target_branch,
                'gitlab_url' => opts[:gitlab_url],
                'source_owner' => opts[:source_owner],
                'source_repo' => opts[:source_repo],
                'manifest_ref' => opts[:manifest_ref]
              })

  preflight_git(repo_path)
  puts "\nLoading release manifest..."
  manifest = load_manifest(opts.merge(release_tag: release_tag), github_token)
  validate_json_schema(manifest, manifest_schema, 'release-manifest')
  libraries = to_libraries(manifest)

  puts 'Resolving asset URLs from releases...'
  resolved_libraries, resolved_tag = resolve_libraries_with_fallback(
    libraries,
    owner: opts[:source_owner],
    repo: opts[:source_repo],
    github_token: github_token,
    anchor_release_tag: release_tag
  )
  print_resolution_log(resolved_libraries)

  upload_rel = relpath(upload_list_path, repo_path)
  artifacts_rel = relpath(artifacts_dir, repo_path)

  changed_versions = update_upload_list(upload_list_path, resolved_libraries, third_schema, opts[:dry_run])
  downloaded = download_artifacts(artifacts_dir, resolved_libraries, github_token, opts[:dry_run])
  return print_summary(changed_versions, downloaded, true) if opts[:dry_run]

  ctx = build_template_context(release_tag, resolved_tag)
  branch_name = ask_if_missing(opts[:branch_name], 'Branch name for commit/MR',
                               default: render_template(ENV.fetch('SYNC_BRANCH_TEMPLATE', DEFAULT_BRANCH_TEMPLATE), ctx),
                               non_interactive: opts[:non_interactive])
  commit_message = ask_if_missing(opts[:commit_message], 'Commit message',
                                  default: render_template(ENV.fetch('SYNC_COMMIT_TEMPLATE', DEFAULT_COMMIT_TEMPLATE), ctx),
                                  non_interactive: opts[:non_interactive])
  mr_title = render_template(ENV.fetch('SYNC_MR_TITLE_TEMPLATE', DEFAULT_MR_TITLE_TEMPLATE), ctx)
  mr_body = render_template(ENV.fetch('SYNC_MR_BODY_TEMPLATE', DEFAULT_MR_BODY_TEMPLATE), ctx)

  changed_files = git_commit_and_push(
    repo_path: repo_path,
    target_branch: target_branch,
    branch_name: branch_name,
    stage_paths: [upload_rel, artifacts_rel],
    commit_message: commit_message,
    non_interactive: opts[:non_interactive]
  )
  if changed_files.empty?
    print_summary(changed_versions, downloaded, false)
    puts "\nNo git changes detected, MR was not created."
    return
  end

  unless ask_yes_no('Open Merge Request now?', default: true, non_interactive: opts[:non_interactive])
    print_summary(changed_versions, downloaded, false)
    puts "\nChanges were pushed, MR creation skipped.\nSource branch: #{branch_name}\nTarget branch: #{target_branch}"
    return
  end

  mr_url = create_gitlab_mr(
    gitlab_url: opts[:gitlab_url],
    project_id: gitlab_project_id,
    private_token: gitlab_token,
    source_branch: branch_name,
    target_branch: target_branch,
    title: mr_title,
    description: mr_body
  )
  print_summary(changed_versions, downloaded, false)
  puts "\nCreated GitLab MR: #{mr_url}"
end

def run_mono_mode(opts, config_path, config)
  repo_path = File.expand_path(
    ask_if_missing(opts[:repo_path] || config['mono_repo_path'] || config['repo_path'],
                   'Path to mono git repository', required: true, non_interactive: opts[:non_interactive])
  )
  ensure_git_repo(repo_path)

  mono_yaml_path = File.expand_path(
    ask_if_missing(opts[:mono_yaml_path] || config['mono_yaml_path'],
                   'Path to mono dependencies YAML', required: true, non_interactive: opts[:non_interactive])
  )
  raise SyncError, "mono yaml file not found: #{mono_yaml_path}" unless File.exist?(mono_yaml_path)

  target_branch = ask_if_missing(opts[:target_branch] || config['mono_target_branch'] || config['target_branch'],
                                 'Target branch for MR', default: 'develop', non_interactive: opts[:non_interactive])
  release_tag = ask_if_missing(opts[:release_tag] || config['mono_release_tag'] || config['release_tag'],
                               "Release tag anchor (or 'latest')", default: 'latest', non_interactive: opts[:non_interactive])
  gitlab_project_id = ask_if_missing(opts[:gitlab_project_id] || config['mono_gitlab_project_id'] || config['gitlab_project_id'],
                                     'GitLab project id (numeric id or group%2Frepo path)', required: true, non_interactive: opts[:non_interactive])

  github_token = ENV.fetch('GITHUB_TOKEN', '')
  gitlab_token = ENV.fetch('GITLAB_TOKEN', '')
  raise SyncError, 'GITLAB_TOKEN is required' if gitlab_token.empty?

  manifest_schema = load_schema_definition(local_path: opts[:manifest_schema_path], fallback_repo_path: DEFAULT_MANIFEST_SCHEMA_FILE, opts: opts, github_token: github_token, label: 'manifest schema')
  mono_schema = load_schema_definition(local_path: opts[:mono_schema_path], fallback_repo_path: DEFAULT_MONO_SCHEMA_FILE, opts: opts, github_token: github_token, label: 'mono schema')

  save_config(config_path, {
                'mono_repo_path' => repo_path,
                'mono_yaml_path' => mono_yaml_path,
                'mono_release_tag' => release_tag,
                'mono_gitlab_project_id' => gitlab_project_id,
                'mono_target_branch' => target_branch,
                'gitlab_url' => opts[:gitlab_url],
                'source_owner' => opts[:source_owner],
                'source_repo' => opts[:source_repo],
                'manifest_ref' => opts[:manifest_ref]
              })

  preflight_git(repo_path)
  puts "\nLoading release manifest..."
  manifest = load_manifest(opts.merge(release_tag: release_tag), github_token)
  validate_json_schema(manifest, manifest_schema, 'release-manifest')
  libraries = to_libraries(manifest)

  puts 'Resolving asset URLs from releases...'
  resolved_libraries, resolved_tag = resolve_libraries_with_fallback(
    libraries,
    owner: opts[:source_owner],
    repo: opts[:source_repo],
    github_token: github_token,
    anchor_release_tag: release_tag
  )
  print_resolution_log(resolved_libraries)

  yaml_rel = relpath(mono_yaml_path, repo_path)
  yaml_changes = update_mono_yaml(
    mono_yaml_path,
    resolved_libraries,
    source_owner: opts[:source_owner],
    source_repo: opts[:source_repo],
    mono_schema: mono_schema,
    dry_run: opts[:dry_run]
  )
  return print_mono_summary(yaml_changes, true) if opts[:dry_run]

  ctx = build_template_context(release_tag, resolved_tag)
  branch_name = ask_if_missing(opts[:branch_name], 'Branch name for commit/MR',
                               default: render_template(ENV.fetch('SYNC_BRANCH_TEMPLATE', DEFAULT_BRANCH_TEMPLATE), ctx),
                               non_interactive: opts[:non_interactive])
  commit_message = ask_if_missing(opts[:commit_message], 'Commit message',
                                  default: render_template(ENV.fetch('SYNC_COMMIT_TEMPLATE', DEFAULT_COMMIT_TEMPLATE), ctx),
                                  non_interactive: opts[:non_interactive])
  mr_title = render_template(ENV.fetch('SYNC_MR_TITLE_TEMPLATE', DEFAULT_MR_TITLE_TEMPLATE), ctx)
  mr_body = render_template(ENV.fetch('SYNC_MR_BODY_TEMPLATE', DEFAULT_MR_BODY_TEMPLATE), ctx)

  changed_files = git_commit_and_push(
    repo_path: repo_path,
    target_branch: target_branch,
    branch_name: branch_name,
    stage_paths: [yaml_rel],
    commit_message: commit_message,
    non_interactive: opts[:non_interactive]
  )
  if changed_files.empty?
    print_mono_summary(yaml_changes, false)
    puts "\nNo git changes detected, MR was not created."
    return
  end

  unless ask_yes_no('Open Merge Request now?', default: true, non_interactive: opts[:non_interactive])
    print_mono_summary(yaml_changes, false)
    puts "\nChanges were pushed, MR creation skipped.\nSource branch: #{branch_name}\nTarget branch: #{target_branch}"
    return
  end

  mr_url = create_gitlab_mr(
    gitlab_url: opts[:gitlab_url],
    project_id: gitlab_project_id,
    private_token: gitlab_token,
    source_branch: branch_name,
    target_branch: target_branch,
    title: mr_title,
    description: mr_body
  )
  print_mono_summary(yaml_changes, false)
  puts "\nCreated GitLab MR: #{mr_url}"
end

def run(argv)
  opts = parse_args(argv)
  puts 'Plasma release sync utility'
  puts '=========================='

  config_path = File.expand_path(opts[:config_path])
  config = load_config(config_path)

  opts[:manifest_schema_path] ||= config['manifest_schema_path']
  opts[:third_party_schema_path] ||= config['third_party_schema_path']
  opts[:mono_schema_path] ||= config['mono_schema_path']
  modes = if opts[:mode].nil? || opts[:mode].empty?
            %w[third-party mono]
          else
            raise SyncError, "Unsupported mode: #{opts[:mode]}" unless %w[third-party mono].include?(opts[:mode])
            [opts[:mode]]
          end

  save_config(config_path, {
                'mode' => (opts[:mode] || 'auto'),
                'manifest_schema_path' => normalize_optional_path(opts[:manifest_schema_path]),
                'third_party_schema_path' => normalize_optional_path(opts[:third_party_schema_path]),
                'mono_schema_path' => normalize_optional_path(opts[:mono_schema_path])
              })
  puts "Selected mode: #{modes.join(' + ')}"

  modes.each do |mode|
    puts "\n=== Running #{mode} flow ==="
    mode == 'mono' ? run_mono_mode(opts, config_path, config) : run_third_party_mode(opts, config_path, config)
  end
end

begin
  run(ARGV)
rescue Interrupt
  puts "\nInterrupted."
  exit 130
rescue SyncError => e
  warn "ERROR: #{e.message}"
  exit 1
end
