require 'rake'
require 'mustache'
require 'highline/import'
require 'yaml'

SKIP_FILES = [
  'settings.yml', 'Gemfile', 'Gemfile.lock', 'vendor',
  'LICENSE', 'README', 'Rakefile', '*.mustache'
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
  rcrc_file = File.join ENV['HOME'], '.rcrc'
  File.open rcrc_file, 'w+', 0644 do |f|
    f.write <<-EOF
EXCLUDES="#{SKIP_FILES.join(' ')}"
DOTFILES_DIRS="#{dotfile_dir}"
    EOF
  end

  settings_file = File.expand_path('../settings.yml', __FILE__)

  if File.exist? settings_file
    puts "Edit the settings file #{settings_file} to edit configuration values"
  else
    git_full_name   = ask "#{HighLine.color("Git Full Name", HighLine::BOLD)}  "
    git_email       = ask "#{HighLine.color("Git Email Address", HighLine::BOLD)}  "
    github_username = ask "#{HighLine.color("GitHub username", HighLine::BOLD)}  "

    File.open settings_file, 'w+', 0644 do |f|
      f.write <<-EOF
---
git_full_name: #{git_full_name}
git_email: #{git_email}
github_username: #{github_username}
      EOF
    end
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
