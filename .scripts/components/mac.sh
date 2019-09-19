#!/usr/bin/env bash

function print_header() {
  echo "##############################"
  echo $1
  echo "##############################"
}

print_header "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

print_header "Install yadm and clone the dotfiles repo"
brew install yadm
yadm clone https://github.com/wrmilling/dotfiles.git --no-bootstrap
yadm submodule update --recursive

print_header "Install zsh and set as default shell"
brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

print_header "Installing vim"
brew install vim
~/.vim/install.sh

print_header "Setup git"
~/.scripts/setupGit.sh

print_header "Using yadm bootstrap to complete setup"
yadm bootstrap

