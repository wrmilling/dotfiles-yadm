#!/bin/sh

function print_header() {
  echo ##########
  echo $1
  echo ##########
}

print_header "Ensure system is up to date"
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

print_header "Install yadm and clone the dotfiles repo"
sudo apt-get install yadm -y
yadm clone https://github.com/wrmilling/dotfiles.git
yadm submodule update --recursive

print_header "Install zsh and set as default shell"
sudo apt-get install zsh
chsh -s /bin/zsh

print_header "Install vim"
sudo apt-get install vim
~/.vim/install.sh

print_header "Setup git"
~/.scripts/setupGit.sh
