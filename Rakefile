require 'json'
require 'erb'

RUBIES = %w[
  '2.4.1'
  '2.3.3'
  '2.1.5'
]

DEFAULT_GEMS = %w[
  bundler
  rake
  builderator
]

def home
  ENV['INSTALL_HOME'] || ENV['HOME']
end

fl = FileList['*'].exclude do |p|
  %w[Rakefile README.md TODO.md LICENSE Brewfile].include?(p)
end
fl.each do |source|
  target = File.join(home, ".#{source}")
  src = File.expand_path(source)
  file target => source do
    unless File.exist?(target) || File.symlink?(target)
      ln_s src, target, :verbose => true
    end
  end
  task :install_files => target
end

task :brewfile do
  dir = File.join(home, '.brewfile')
  target = File.join(dir, 'Brewfile')
  src = File.expand_path('Brewfile')
  if File.exist?(dir)
    rm_r dir unless File.symlink?(target)
  else
    mkdir_p dir
    ln_s src, target, :verbose => true
  end
end

task :brew_install do
  unless File.exist?('/usr/local/Homebrew')
    sh '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
  end
end

task :brewfile_install do
  unless File.exists?('/usr/local/Homebrew/Library/Taps/rcmdnk/homebrew-file')
    sh 'brew install rcmdnk/file/brew-file'
  end
end

task :brewfile_run => [:brewfile] do
  sh 'brew file install'
end

task :brew => [:brew_install, :brewfile_install, :brewfile_run]

task :xcode_cli_tools do
  system('xcode-select --install 2>&1')
end

def rbenv_root
  `rbenv root`.chomp
end

task :rbenv_default_gems_install => [:brew] do
  sh "git clone https://github.com/rbenv/rbenv-default-gems.git #{rbenv_root}/plugins/rbenv-default-gems"
end

task :rbenv_default_gems => [:rbenv_default_gems_install] do
  path = "#{rbenv_root}/default-gems"
  if File.exist?(path)
    gems = File.readlines(path)
    unless gems == DEFAULT_GEMS
      File.open(path, 'w') do |file|
        DEFAULT_GEMS.each do |gem|
          file.puts(gem)
        end
      end
    end
  end
end

task :rubies => [:brew, :rbenv_default_gems] do
  RUBIES.each do |r|
    sh "rbenv install -s #{r}"
  end
end

desc 'Install packages'
task :packages => [:xcode_cli_tools, :brew, :rubies]

desc "install the dot files into user's home directory"
task :install => [:install_files]
