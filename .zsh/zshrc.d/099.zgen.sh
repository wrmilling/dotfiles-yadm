source "${HOME}/.zgen/zgen.zsh"

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
