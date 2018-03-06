
#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Install Cask
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Node
brew install node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Golang
brew install golang

# Java and its IDE
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" Caskroom/versions/intellij-idea-ce

# Rust
brew install rustup

# Install Docker
brew install docker docker-machine

# The fuck
brew install thefuck

# Remove outdated versions from the cellar.
brew cleanup