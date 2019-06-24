#!/bin/sh

function print_header() {
  echo ##########
  echo $1
  echo ##########
}

print_header "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

print_header "Install a few basic utils (including yadm)"
brew cask install spectacle slack iterm2
brew install vim zsh htop yadm

print_header "Pulling dotfiles repo"
yadm clone https://github.com/wrmilling/dotfiles.git
