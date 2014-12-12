require 'rake'
require 'mustache'
require 'highline/import'
require 'yaml'

SKIP_FILES = [
  'settings.yml', 'Gemfile', 'Gemfile.lock',
  'LICENSE', 'README.md', 'Rakefile', '*.mustache',
  'Brewfile', '#*#'
]

# set this to true to do a dry run
DRY = ENV['DRY'] || false

def settings
  return @settings if @settings

  @settings = {}

  settings = YAML.load(open('settings.yml'))
  settings.each_pair do |key, value|
    @settings[key.to_sym] = value
  end

  @settings
end

desc "sets up the rcrc environment"
task :setup do
  dotfile_dir = File.dirname __FILE__
  settings_file = File.expand_path 'settings.yml', dotfile_dir

  if File.exist? settings_file
    puts "Edit the settings file #{settings_file} to edit configuration values"
  else
    git_full_name   = ask "#{HighLine.color("Full name used for git", HighLine::BOLD)}: "
    git_email       = ask "#{HighLine.color("Email address used for git", HighLine::BOLD)}: "
    github_username = ask "#{HighLine.color("GitHub username", HighLine::BOLD)}: "
    rcm_excludes    = ask "#{HighLine.color("dotfiles/globs to exclude from your home directory separated by spaces (e.x. vim*)", HighLine::BOLD)}: "

    File.open settings_file, 'w+', 0644 do |f|
      f.write <<-EOF
---
git_full_name: #{git_full_name}
git_email: #{git_email}
github_username: #{github_username}
rcm_excludes: #{rcm_excludes}
      EOF

      # force a re-read of the configuration file
      @settings = nil
    end
  end

  rcrc_file = File.join ENV['HOME'], '.rcrc'
  skip_files = SKIP_FILES + (settings[:rcm_excludes].nil? ? [] : settings[:rcm_excludes].split(/\s+/))

  File.open rcrc_file, 'w+', 0644 do |f|
    f.write <<-EOF
EXCLUDES="#{skip_files.join(' ')}"
DOTFILES_DIRS="#{dotfile_dir}"
    EOF
  end

  Dir.chdir File.dirname(__FILE__) do
    Dir['*.mustache'].each do |file|
      output_file = file.gsub /\.mustache$/, ''
      rendered = Mustache.render(open(file).read, settings)
      File.open output_file, 'w+' do |f|
        f << rendered
      end
    end
  end
end
