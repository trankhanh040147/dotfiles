# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Load custom aliases
if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

### ------- EXPORTS -------
export PATH=$PATH:$(go env GOPATH)/bin:$HOME/go/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### BASH EXTS
shopt -s extglob

### ------- SECRETS ------
# Load secrets
if [ -f ~/.secrets ]; then
  . ~/.secrets
fi

