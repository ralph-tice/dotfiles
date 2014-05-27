require 'json'
require 'rake'
require 'erb'
require File.join(File.dirname(__FILE__), 'lib/tasks')

desc "install the dot files into user's home directory"
task :install do
  install_dotfiles
end

desc "install/update ssh config"
task :sshconfig do
  install_ssh_config
end
