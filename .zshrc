##############################
# zgen setup
##############################
source "${HOME}/.zgen/zgen.zsh"

system_type=$(uname -s)
linux_type=$(uname -r)

# Setup zgen if init script does not exist
if ! zgen saved; then
  echo "Generating a zgen save"

  # Disable loading default Prezto modules
  # This is necessary due to a quirk of zgen that will load these plugins after
  # our custom plugins, overwriting our customizations
  # https://github.com/tarjoilija/zgen/issues/74
  export ZGEN_PREZTO_LOAD_DEFAULT=0

  # Load prezto
  zgen prezto

  # Default Plugins
  zgen load sorin-ionescu/prezto modules/environment
  zgen load sorin-ionescu/prezto modules/terminal
  zgen load sorin-ionescu/prezto modules/editor
  zgen load sorin-ionescu/prezto modules/history
  zgen load sorin-ionescu/prezto modules/directory
  zgen load sorin-ionescu/prezto modules/spectrum
  zgen load sorin-ionescu/prezto modules/utility
  zgen load sorin-ionescu/prezto modules/completion

  # Extra Plugins
  zgen load sorin-ionescu/prezto modules/history-substring-search

  # 3rd Party Plugins
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-completions
  zgen load chriskempson/base16-shell
  zgen load martinlindhe/base16-iterm2

  # After Custom Plugins Load
  zgen prezto ssh

  # Misc Plugins
  zgen load unixorn/autoupdate-zgen
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load denysdovhan/spaceship-prompt spaceship

  # Save the setup
  zgen save
fi

##############################
# General Environment
##############################

export EDITOR="vim"

##############################
# Aliases
##############################

# dit: Dotfiles Information Tracker
alias dit=yadm

##############################
# Extra Path Directories
##############################

if [ "$system_type" = "Darwin" ]; then
  export PATH="$HOME/.yadm/darwin-bin/:$PATH"
else
  export PATH="$HOME/.yadm/linux-bin/:$PATH"
fi
##############################
# Imports for language managers
##############################
if [ "$system_type" = "Darwin" ]; then
  export NVM_DIR="$HOME/.nvm"
  source $(brew --prefix nvm)/nvm.sh

  export PATH="$HOME/.rbenv/shims:$PATH"
else 
  export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

  if [[ $linux_type == *"microsoft"* ]]; then
    # WSL Specific Settings
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
fi

##############################
# Java settings for OS X to openjdk 1.8
##############################
if [  "$system_type" = "Darwin" ]; then
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
fi

##############################
# Replace default autocorrect for functions
##############################
unsetopt correct
unsetopt correctall
export DISABLE_CORRECTION="true"
eval $(thefuck --alias f)

##############################
# Spaceship prompt configuration
##############################
export SPACESHIP_PROMPT_ADD_NEWLINE="true"
export SPACESHIP_USER_SHOW="always"
export SPACESHIP_USER_COLOR="blue"

##############################
# Source any work specific configurations if available
##############################
if [ -f "$HOME/.workrc" ]; then
  source $HOME/.workrc
fi

