#!/usr/bin/env bash

#BREWFILE_IGNORE
if ! which brew >& /dev/null;then
  brew_installed=0
  echo Homebrew is not installed!
  echo Install now...
  echo ruby -e \"\$\(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install\)\"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo
fi
#BREWFILE_ENDIGNORE

# tap repositories and their packages

brew tap caskroom/cask
brew cask install keybase

brew tap caskroom/drivers

brew tap davepgreene/cask-upgrade

brew tap homebrew/core
brew install autoconf
brew install awscli
brew install caskroom/cask/docker
brew install elasticsearch
brew install fontconfig
brew install freetype
brew install gd
brew install gdbm
brew install gettext
brew install graphviz
brew install groovy
brew install hub
brew install icu4c
brew install imagemagick
brew install imagemagick@6
brew install jpeg
brew install jq
brew install libpng
brew install libtiff
brew install libtool
brew install libyaml
brew install mas
brew install maven
brew install mysql
brew install node
brew install oniguruma
brew install openssl
brew install openssl@1.1
brew install pandoc
brew install perl
brew install pkg-config
brew install pre-commit
brew install python
brew install python3
brew install rbenv
brew install readline
brew install ruby
brew install ruby-build
brew install sqlite
brew install telnet
brew install terraform
brew install tfenv
brew install todolist
brew install vault
brew install vim
brew install watch
brew install webp
brew install wget
brew install xz
brew install yarn

brew tap rcmdnk/file
brew install brew-file

brew tap wata727/tflint
brew install tflint

# Other Homebrew packages
brew install caskroom/cask/chefdk
brew install caskroom/cask/spotify
brew install caskroom/cask/vagrant
brew install caskroom/cask/virtualbox
brew install hg
brew install kubectl
brew install npm

# Cask applications
brew cask install yubiswitch
brew cask install https://raw.githubusercontent.com/rapid7/awsaml/master/brew/cask/awsaml.rb
