# Omarchy Dotfiles

My personal configuration files for Omarchy, managed with GNU Stow.

This directory is one of several setups in my main [dotfiles repo](..).

## Prerequisites

* [GNU Stow](https://www.gnu.org/software/stow/) (`sudo pacman -S stow`)
* `git`

## 🚀 Installation (on a New Machine)

1.  **Clone the repo:**
    ```bash
    # (Assuming you've cloned the parent repo one level up)
    # git clone <your-repo-url> ~/src/dotfiles
    ```

2.  **Go to this directory:**
    ```bash
    cd ~/src/dotfiles/omarchy
    ```

3.  **Stow all packages:**
    ```bash
    stow *
    ```

This will create symlinks for all configs in your home directory. The `.stowrc` file in this directory automatically sets the target to `/home/kenny` (or your home dir).

## 🔄 Syncing Local Configs (First-Time Setup)

To move all your existing local configs into this repo for the first time, use the `sync.sh` script.

**Warning:** Back up your configs first! This script *moves* (not copies) files from your home directory into this repo.

1.  **Make the script executable:**
    ```bash
    chmod +x sync.sh
    ```

2.  **Run the script:**
    ```bash
    ./sync.sh
    ```

3.  **Stow the newly synced files:**
    ```bash
    stow *
    ```

4.  **Commit your changes:**
    ```bash
    git status
    git commit -m "Add initial Omarchy config files"
    git push
    ```

## 📦 Adding a New Config (Manually)

To add a new config (e.g., `my-new-app`):

1.  Create the package and path:
    ```bash
    mkdir -p my-new-app/.config
    ```
2.  Move your config into the package:
    ```bash
    mv ~/.config/my-new-app my-new-app/.config/
    ```
3.  Stow it:
    ```bash
    stow my-new-app
    ```
4.  Commit it:
    ```bash
    git add my-new-app
    git commit -m "Add my-new-app config"
    ```
