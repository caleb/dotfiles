require 'rake'
require 'mustache'
require 'yaml'

SKIP_FILES = [
  'settings.yml', 'settings.yml.sample', 'Gemfile', 'Gemfile.lock'
]

# set this to true to do a dry run
DRY = ENV['DRY'] || false

desc "install the dot files into user's home directory"
task :install do
  unless File.exist?('settings.yml')
    puts "Rename settings.yml.sample => settings.yml and fill it out"
    exit 1
  end

  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      place_file(file)
    end
  end
end

def settings
  return @settings if @settings

  @settings = {}

  settings = YAML.load(open('settings.yml'))
  settings.each_pair do |key, value|
    @settings[key.to_sym] = value
  end

  @settings
end

# This decides what to do with a given file
def place_file file
  return if SKIP_FILES.include? file

  if file =~ /\.mustache$/
    create_file_from_template file
  else
    link_file file
  end
end

# This method removes the old file, and places a new one
def replace_file file
  system %Q{rm "$HOME/.#{file}"}
  place_file(file)
end

# This method runs the program through 
def create_file_from_template file
  file_without_mustache = file.gsub(/\.mustache/, '')
  contents = Mustache.render(open(file).read, settings)

  home_file = "#{ENV['HOME']}/.#{file_without_mustache}"

  puts "Writing #{home_file}"
  unless DRY
    File.open(home_file, 'w') do |w|
      w.write(contents)
    end
  end
end

def link_file file
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"} unless DRY
end
