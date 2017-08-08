require 'json'
require 'erb'

RUBIES = %w[
  '2.4.1'
  '2.3.3'
  '2.1.5'
]

def home
  ENV['INSTALL_HOME'] || ENV['HOME']
end

task :install_oh_my_zsh do
  if File.exist?(File.join(home, ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    puts "installing oh-my-zsh"
    sh "git clone https://github.com/robbyrussell/oh-my-zsh.git #{File.join(home, '.oh-my-zsh')}"
  end
end

task :switch_to_zsh do
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    puts "switching to zsh"
    sh 'chsh -s `which zsh`'
  end
end

fl = FileList['*'].exclude do |p|
  %w[Rakefile README.md LICENSE oh-my-zsh sshconfig.json sshconfig.erb Brewfile].include?(p)
end
fl << "oh-my-zsh/custom/plugins/athompson"
fl << "oh-my-zsh/custom/rbates.zsh-theme"
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

desc "install/update ssh config"
task :sshconfig do
  if File.exist?('sshconfig.json') && File.exist?(File.join(home, '.ssh'))
    @config = File.open('sshconfig.json', 'r')
    @config = JSON.parse(@config.read)
    File.open(File.join(home, '.ssh/config'), 'w') do |new_file|
      new_file.write ERB.new(File.read('sshconfig.erb')).result(binding)
    end
  end
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

task :rubies do
  RUBIES.each do |r|
    sh "rbenv install -s #{r}"
  end
end

desc 'Install packages'
task :packages => [:xcode_cli_tools, :brew, :rubies]

desc "install the dot files into user's home directory"
task :install => [:install_oh_my_zsh, :switch_to_zsh, :install_files, :sshconfig]
