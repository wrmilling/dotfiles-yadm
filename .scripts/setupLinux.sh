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

