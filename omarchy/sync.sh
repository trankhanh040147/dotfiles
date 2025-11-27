#!/bin/bash

# ---
# Syncs local Omarchy configs into this dotfiles repo for 'stow'.
#
# This script MOVES configs from your $HOME and $HOME/.config
# into their respective package folders (e.g., 'hypr', 'nvim').
#
# Run this from inside the 'omarchy' directory.
# ---

# Ensure the script runs from its own directory
cd "$(dirname "$0")" || exit

echo "--- Starting Omarchy Config Sync ---"

# ---
# 1. Config DIRECTORIES from $HOME/.config
# ---
# List of "safe" directories to move.
# Add or remove package names from this list as needed.
CONFIG_DIRS=(
  alacritty
  autostart
  btop
  eza
  fastfetch
  fcitx5
  fontconfig
  ghostty
  git
  htop
  hypr
  kitty
  lazydocker
  lazygit
  mako
  mise
  nvim
  omarchy
  swayosd
  systemd
  walker
  waybar
  xournalpp
  git
)

echo " "
echo "Syncing config directories from ~/.config..."
for dir in "${CONFIG_DIRS[@]}"; do
  if [ -d "$HOME/.config/$dir" ]; then
    echo "  Syncing '$dir'..."
    mkdir -p "$dir/.config"
    mv "$HOME/.config/$dir" "$dir/.config/"
    git add "$dir"
  else
    echo "  Skipping '$dir' (Not found)"
  fi
done

# ---
# 2. Config FILES from $HOME/.config
# ---
# List of "safe" loose files to move.
# They will be put into their own packages (e.g., 'starship.toml' -> 'starship' package)
CONFIG_FILES=(
  brave-flags.conf
  chromium-flags.conf
  mimeapps.list
  omarchy.ttf
  starship.toml
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
    mv "$HOME/.config/$file" "$pkg_name/.config/"
    git add "$pkg_name"
  else
    echo "  Skipping '$file' (Not found)"
  fi
done

# ---
# 3. Config FILES from $HOME
# ---
# We will put these into the existing 'bash' package.
HOME_FILES=(
  .ideavimrc
  .profile
  .XCompose
  .xprofile
)

echo " "
echo "Syncing loose files from ~ into 'bash' package..."
for file in "${HOME_FILES[@]}"; do
  if [ -f "$HOME/$file" ]; then
    echo "  Syncing '$file'..."
    mv "$HOME/$file" "bash/"
  else
    echo "  Skipping '$file' (Not found)"
  fi
done

# Add any changes to the 'bash' package
git add bash

echo " "
echo "-----------------------------------"
echo "✅ Sync complete!"
echo " "
echo "Run 'git status' to see all changes."
echo " "
echo "--- Next Steps ---"
echo "1. Run 'stow *' to create all the symlinks."
echo "2. Run 'git commit -m \"Initial Omarchy config sync\"' to save."
echo "3. Run 'git push' to back them up."
