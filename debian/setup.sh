#!/bin/bash
# setup.sh

# The .stowrc file handles the target (~/) and ignored files.
# We explicitly list packages to avoid stowing garbage or backups.

stow --restow \
    bash \
    git \
    mimeapps \
    nvim \
    tmux \
    user-dirs

echo "✅ Debian dotfiles stowed!"
