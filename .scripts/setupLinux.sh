#!/bin/bash

function print_header() {
  echo "##############################"
  echo $1
  echo "##############################"
}

print_header "Ensure system is up to date"
grep -qxF 'deb http://deb.debian.org/debian buster-backports main contrib non-free' /etc/apt/sources.list || sudo echo 'deb http://deb.debian.org/debian buster-backports main contrib non-free' >> /etc/apt/sources.list
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get install git curl -y

print_header "Install yadm and clone the dotfiles repo"
sudo apt-get -t stretch-backports install yadm -y
yadm clone git@github.com:WRMilling/dotfiles.git
yadm submodule update --init --recursive

print_header "Install zsh and set as default shell"
sudo apt-get install zsh
chsh -s /bin/zsh

print_header "Install vim"
sudo apt-get install vim
~/.vim/install.sh

print_header "Install linux brew"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

print_header "Setup git"
~/.scripts/setupGit.sh

print_header "Using yadm bootstrap to complete setup"
yadm bootstrap
