#!/usr/bin/env bash

function print_header() {
  echo "##############################"
  echo $1
  echo "##############################"
}

# OS Specific Setup with yadm
if [[ "$OSTYPE" == "darwin"* ]]; then
  print_header "Install Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  print_header "Install yadm and clone the dotfiles repo"
  brew install yadm
  yadm clone https://github.com/wrmilling/dotfiles.git --no-bootstrap
  yadm submodule update --recursive
  
  ~/.scripts/components/osx.sh
else
  print_header "Install yadm and clone the dotfiles repo"
  sudo apt-get install yadm -y
  yadm clone git@github.com:WRMilling/dotfiles.git
  yadm submodule update --init --recursive

  ~/.scripts/components/linux.sh
fi

# General Setup
print_header "Setup git"
~/.scripts/components/git.sh

print_header "Using yadm bootstrap to complete setup"
yadm bootstrap
