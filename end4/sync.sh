#!/bin/bash

# ---
# Syncs local end-4/CachyOS configs into this dotfiles repo for 'stow'.
#
# This script COPIES configs from your $HOME and $HOME/.config
# into their respective package folders (e.g., 'hypr', 'nvim').
#
# Run this from inside the 'end4' directory.
# ---

# Ensure the script runs from its own directory
cd "$(dirname "$0")" || exit

echo "--- Starting end-4 Config Sync ---"

# ---
# 1. Config DIRECTORIES from $HOME/.config
# ---
CONFIG_DIRS=(
  alacritty
  autostart
  cava
  fcitx5
  fish
  fontconfig
  foot
  fuzzel
  hypr
  illogical-impulse
  kitty
  MangoHud
  matugen
  micro
  mpv
  nvim
  quickshell
  systemd
  tmux
  wlogout
  xdg-desktop-portal
  xsettingsd
)

echo " "
echo "Syncing config directories from ~/.config..."
for dir in "${CONFIG_DIRS[@]}"; do
  if [ -d "$HOME/.config/$dir" ]; then
    echo "  Syncing '$dir'..."
    mkdir -p "$dir/.config"
    rm -rf "$dir/.config/$dir"
    cp -r "$HOME/.config/$dir" "$dir/.config/"
  else
    echo "  Skipping '$dir' (Not found)"
  fi
done

# ---
# 2. Config FILES from $HOME/.config
# ---
CONFIG_FILES=(
  chrome-flags.conf
  code-flags.conf
  starship.toml
  thorium-flags.conf
  user-dirs.dirs
)

echo " "
echo "Syncing loose files from ~/.config..."
for file in "${CONFIG_FILES[@]}"; do
  if [ -f "$HOME/.config/$file" ]; then
    # Creates a package name from the file (e.g., "starship.toml" -> "starship")
    pkg_name=$(echo "$file" | cut -d'.' -f1)

    echo "  Syncing '$file' into package '$pkg_name'..."
    mkdir -p "$pkg_name/.config"
    cp "$HOME/.config/$file" "$pkg_name/.config/"
  else
    echo "  Skipping '$file' (Not found)"
  fi
done

# ---
# 3. Config FILES from $HOME
# ---
HOME_FILES=(
  .bashrc
  .bash_profile
)

echo " "
echo "Syncing dotfiles from ~ into 'bash' package..."
mkdir -p bash
for file in "${HOME_FILES[@]}"; do
  if [ -f "$HOME/$file" ]; then
    echo "  Syncing '$file'..."
    cp "$HOME/$file" "bash/"
  else
    echo "  Skipping '$file' (Not found)"
  fi
done

echo " "
echo "-----------------------------------"
echo "Sync complete!"
echo " "
echo "Run 'git status' to see all changes."
echo " "
echo "--- Next Steps ---"
echo "1. Review the synced files."
echo "2. Run 'git add -A && git commit -m \"Initial end-4 config sync\"' to save."
echo "3. To activate stow, remove the originals and run 'stow */'."
echo "   Or use 'stow --adopt */' to adopt existing files in-place."
