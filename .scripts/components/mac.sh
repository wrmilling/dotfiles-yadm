#!/usr/bin/env bash

source ~/.scripts/components/common.sh

print_header "Install zsh and set as default shell"
brew install zsh
~/.zsh/install.sh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh


print_header "Installing vim"
brew install vim
~/.vim/install.sh

