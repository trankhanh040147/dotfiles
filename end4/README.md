# end-4 / CachyOS Dotfiles

My personal configuration files for a CachyOS setup with end-4/illogical-impulse Hyprland, managed with GNU Stow.

This directory is one of several setups in my main [dotfiles repo](..).

## Prerequisites

* [GNU Stow](https://www.gnu.org/software/stow/) (`sudo pacman -S stow`)
* `git`

## Installation (on a New Machine)

1.  **Clone the repo:**
    ```bash
    git clone <your-repo-url> ~/src/github/dotfiles
    ```

2.  **Go to this directory:**
    ```bash
    cd ~/src/github/dotfiles/end4
    ```

3.  **Stow all packages:**
    ```bash
    stow */
    ```

This will create symlinks for all configs in your home directory.

## Syncing Local Configs

To copy all your existing local configs into this repo, use the `sync.sh` script.

```bash
chmod +x sync.sh
./sync.sh
```

Then review and commit:

```bash
git status
git add -A
git commit -m "Sync end-4 configs"
git push
```

## Packages

| Package | Description |
|---|---|
| alacritty | Alacritty terminal |
| autostart | XDG autostart entries |
| bash | Shell dotfiles (.bashrc, .bash_profile) |
| cava | Audio visualizer |
| chrome-flags | Chrome flags |
| code-flags | VS Code flags |
| fcitx5 | Input method framework |
| fish | Fish shell |
| fontconfig | Font configuration |
| foot | Foot terminal |
| fuzzel | App launcher |
| hypr | Hyprland, hyprlock, hypridle |
| illogical-impulse | end-4 Hyprland config framework |
| kitty | Kitty terminal |
| MangoHud | Game performance overlay |
| matugen | Material You color generation |
| micro | Micro text editor |
| mpv | Media player |
| nvim | Neovim (LazyVim) |
| quickshell | Quickshell (Hyprland widget framework) |
| starship | Starship prompt |
| systemd | User systemd services |
| tmux | Terminal multiplexer |
| thorium-flags | Thorium browser flags |
| user-dirs | XDG user directories |
| wlogout | Logout menu |
| xdg-desktop-portal | Desktop portal config |
| xsettingsd | X settings daemon |
