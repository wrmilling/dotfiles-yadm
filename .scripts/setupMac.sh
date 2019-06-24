#!/bin/sh

function print_header() {
  echo ##########
  echo $1
  echo ##########
}

print_header "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

print_header "Install yadm and clone the dotfiles repo"
brew install yadm
yadm clone https://github.com/wrmilling/dotfiles.git

print_header "Install zshi and set as default shell"
brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
