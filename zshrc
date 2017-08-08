ZSH=$HOME/.oh-my-zsh
ZSH_THEME="rbates"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"

plugins=(aws git brew gem vagrant bundler athompson themes battery npm nvm mvn)
source $ZSH/oh-my-zsh.sh

source $HOME/.github-token

# PATHS
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=~/bin:$PATH

# JAVA HOME
export JAVA7=/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
export JAVA8=/Library/Java/JavaVirtualMachines/jdk1.8.0_73.jdk/Contents/Home
export JAVA_HOME=$JAVA8

# CASSANDRA
export CASSANDRA_HOME=/Users/athompson/bin/dsc-cassandra-3.0.8
export PATH=$CASSANDRA_HOME/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# BUILDERATOR
alias build="bundle exec build"

# PACKER
export PATH=/usr/local/packer:$PATH

# Python Pip
# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true
export PATH=/usr/local/opt/python/libexec/bin:$PATH

# added by travis gem
[ -f /Users/athompson/.travis/travis.sh ] && source /Users/athompson/.travis/travis.sh

# GOLANG
export GOPATH=$HOME/code/gocode
export PATH=$GOPATH/bin:$PATH

# pdflatex
export PATH=/usr/local/texlive/2016/bin/x86_64-darwin:$PATH

# GAM (Google Account Management)
alias gam="/Users/athompson/bin/gam/gam"

# Brewfile
if [ -f $(brew --prefix)/etc/brew-wrap ];then
   source $(brew --prefix)/etc/brew-wrap
fi
