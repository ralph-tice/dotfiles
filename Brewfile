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
brew cask install yubiswitch

brew tap homebrew/core
brew install autoconf
brew install awscli
brew install hub
brew install jq
brew install mas
brew install oniguruma
brew install openssl
brew install openssl@1.1
brew install pkg-config
brew install rbenv
brew install ruby-build
brew install wget

brew tap rcmdnk/file
brew install brew-file

# Other Homebrew packages
brew install caskroom/cask/chefdk

# Cask applications
brew cask install https://raw.githubusercontent.com/rapid7/awsaml/master/brew/cask/awsaml.rb
