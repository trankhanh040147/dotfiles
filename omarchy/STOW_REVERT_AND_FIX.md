# What happened and how to fix it

## What you saw

- **Screen blinked black and refreshed** – Hyprland (or the session) reloaded and re-read config from disk. After we stowed, `~/.config/hypr` (and others) point at the repo, so the compositor is now using the **repo’s** hypr config.
- **Hotkeys not working** – The stowed **hypr** config uses Omarchy’s layout:
  - It **sources** `~/.local/share/omarchy/default/hypr/*` for base keybinds (workspaces, tiling, etc.).
  - Your own keybinds are in `~/.config/hypr/bindings.conf` and use `bindd` (Omarchy’s helper).
  If those default files are missing, or a `source` fails, Hyprland can load only part of the config and **hotkeys from the default set can disappear**. Also, if the repo’s hypr is an **older snapshot** than what you had live, you may have “lost” keybinds you had added or fixed after the merge.
- **Tabs look different** – That’s from **Kitty**. The stowed kitty config sets:
  - `tab_bar_style powerline`
  - `tab_bar_edge bottom`
  - `tab_powerline_style slanted`
  So terminal tabs now use that style instead of whatever you had before (e.g. default or CachyOS kitty).

So: **hotkeys** = Hyprland config (stowed hypr + Omarchy defaults). **Tabs** = stowed Kitty config.

---

## Option A: Revert to pre-stow (get back to how it was)

Use your backup so hotkeys and tabs are as they were before stow.

1. Unstow the packages we stowed:
   ```bash
   cd ~/src/0_github/dotfiles/omarchy
   stow -D hypr fish kitty tmux nvim git
   ```
2. Restore from your backup (replace `YYYYMMDD` with the backup date, e.g. from `ls ~/dotfiles-backup-*`):
   ```bash
   BACKUP=~/dotfiles-backup-YYYYMMDD
   cp -a "$BACKUP/config/hypr" ~/.config/
   cp -a "$BACKUP/config/fish" ~/.config/
   cp -a "$BACKUP/config/kitty" ~/.config/
   cp -a "$BACKUP/config/tmux" ~/.config/
   cp -a "$BACKUP/config/nvim" ~/.config/
   cp -a "$BACKUP/config/git" ~/.config/
   ```
3. Reload Hyprland (or log out and back in):
   ```bash
   hyprctl reload
   ```
4. Restart Kitty and tmux so they use the restored configs.

After this, hotkeys and tabs should match the state from when the backup was made.

---

## Option B: Fix forward (keep stow, fix hotkeys and/or tabs)

### Hotkeys (Hyprland)

- **Check Omarchy default sources**  
  The stowed `hyprland.conf` does:
  ```text
  source = ~/.local/share/omarchy/default/hypr/autostart.conf
  source = ~/.local/share/omarchy/default/hypr/bindings/media.conf
  ...
  ```
  If those paths don’t exist, keybinds from those files never load. Ensure the Omarchy default hypr files are installed (e.g. from the Omarchy/CachyOS package or docs). If you’re not using Omarchy’s defaults, you’d need to stop sourcing them and define your keybinds in `~/.config/hypr/` (e.g. with standard `bind` in a file that Hyprland actually loads).

- **Use your latest hypr from backup**  
  To make the repo (and thus stow) match what worked before the blink:
  1. Copy your backup hypr over the repo and re-stow:
     ```bash
     BACKUP=~/dotfiles-backup-YYYYMMDD
     cp -a "$BACKUP/config/hypr" ~/src/0_github/dotfiles/omarchy/hypr/.config/
     cd ~/src/0_github/dotfiles/omarchy && stow -D hypr && stow hypr
     ```
  2. Run `hyprctl reload` (or re-login).  
  Then hotkeys should match the backup; you can later diff and edit the repo version as needed.

### Tabs (Kitty)

- To make tabs look like before (e.g. simpler or default), edit the stowed kitty config:
  - File: `~/src/0_github/dotfiles/omarchy/kitty/.config/kitty/kitty.conf`
  - Change or remove the tab bar block (around lines 41–45), e.g.:
    - `tab_bar_style` → `hidden` or `fade` or `separator`
    - or delete the `tab_bar_*` and `tab_title_template` lines to use Kitty defaults.
- Restart Kitty so it picks up the change (symlink means the file is already “live” under `~/.config/kitty`).

---

## Summary

| Symptom        | Cause                    | Revert (A)              | Fix forward (B)                          |
|----------------|--------------------------|-------------------------|------------------------------------------|
| Hotkeys broken | Stowed hypr + Omarchy sources | Restore hypr from backup | Ensure omarchy default hypr files exist; or overwrite repo hypr with backup and re-stow |
| Tabs different | Stowed Kitty tab_bar_*   | Restore kitty from backup | Edit `omarchy/kitty/.../kitty.conf` tab bar and restart Kitty |

If you tell me whether you prefer “revert everything” or “keep stow and fix hypr/kitty,” I can give you exact commands for your backup date next.
