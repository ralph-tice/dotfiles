require 'json'
require 'erb'

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
  %w[Rakefile README.md LICENSE oh-my-zsh sshconfig.json sshconfig.erb].include?(p)
end
fl << "oh-my-zsh/custom/plugins/athompson"
fl << "oh-my-zsh/custom/rbates.zsh-theme"
fl.each do |source|
  target = File.join(home, ".#{source}")
  src = File.join(home, source)
  file target => source do
    unless File.exist?(target) || File.symlink?(target)
      ln_s src, target, :verbose => true
    end
  end
  task :install_files => target
end

desc "install the dot files into user's home directory"
task :install => [:install_oh_my_zsh, :switch_to_zsh, :install_files, :sshconfig]

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
