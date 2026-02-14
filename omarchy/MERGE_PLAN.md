# Local-first Omarchy Dotfiles Merge — Implementation Plan

Merge local (new Omarchy OS) configs with dotfiles/omarchy and end4. Local is source of truth where specified; nothing is removed accidentally.

**Repo:** `dotfiles` at `~/src/0_github/dotfiles`  
**Stow:** From `omarchy/`, run `stow *` to deploy.

---

## Phase 0: Backup (do first)

| Step | Action |
|------|--------|
| 0.1 | `mkdir -p ~/dotfiles-backup-$(date +%Y%m%d)` |
| 0.2 | `cp -a ~/.config ~/dotfiles-backup-YYYYMMDD/config` |
| 0.3 | Copy `~/.bashrc`, `~/.bash_profile`, `~/.profile`, `~/.xprofile`, `~/.XCompose`, `~/.ideavimrc`, `~/.aliases` into backup (e.g. `backup/home/`) |
| 0.4 | Optional: `git checkout -b backup-before-merge-YYYYMMDD` and commit |

---

## Phase 1: Hyprland — local only

- Copy local over repo: `cp -a ~/.config/hypr omarchy/hypr/.config/`
- Optional: re-add only desired omarchy bindings/scripts into the copied files
- Commit: e.g. "Replace omarchy hypr with local config"

---

## Phase 2: Fish — local + end4, add to omarchy

- `mkdir -p omarchy/fish/.config/fish`
- Copy local: `cp -a ~/.config/fish/* omarchy/fish/.config/fish/`
- Merge from `end4/fish/.config/fish/config.fish`: add abbr and alias blocks (lines ~21–80) into `omarchy/fish/.config/fish/config.fish`; keep local prompt, starship, zoxide, PATH
- Keep local `conf.d/`; optionally add end4 conf.d if desired
- Add `fish` to `omarchy/sync.sh` in CONFIG_DIRS
- From `omarchy/`: `stow fish`
- Commit: e.g. "Add fish config (local + end4 merge)"

---

## Phase 3: Kitty — local + end4

- Copy local: `cp -a ~/.config/kitty omarchy/kitty/.config/`
- Merge from `end4/kitty/.config/kitty/kitty.conf`: cursor block (lines 5–11: `cursor_shape`, `cursor_beam_thickness`, `cursor_blink_interval`, `cursor_trail`, `cursor_trail_decay`, `cursor_trail_start_threshold`) and any desired keymaps
- Keep or add at top: `include ~/.config/omarchy/current/theme/kitty.conf` if using omarchy theme
- Commit: e.g. "Kitty: local + end4 cursor animation and keybindings"

---

## Phase 4: Tmux — omarchy keybindings/plugins, local theme

- Backup local tmux (or rely on Phase 0)
- Keep local theme: all `@catppuccin_*` (or your theme) and theme plugin from `~/.config/tmux`
- Keybindings: use `omarchy/tmux/.config/tmux/tmux.reset.conf`
- Options + plugins: from `omarchy/tmux/.config/tmux/tmux.conf` — copy options and TPM plugin list + plugin options, **exclude** theme plugin and all `@catppuccin_*` lines
- Set `@sessionx-custom-paths` and `@sessionx-x-path` to `~/src/0_github/dotfiles`
- Write merged result to `omarchy/tmux/.config/tmux/tmux.conf`; keep `tmux.reset.conf` as-is
- Commit: e.g. "Tmux: omarchy keybindings/plugins, keep local theme"

---

## Phase 5a: Git — take omarchy

- Do **not** overwrite `omarchy/git/` with localz
- Leave `omarchy/git/.config/git/config` unchanged
- Include `stow git` when stowing

---

## Phase 5b: Nvim — local base, omarchy options/keymaps/plugins/LSPs, local themes, add avante

- Save avante before overwrite: `cp omarchy/nvim/.config/nvim/lua/plugins/avante.lua /tmp/avante.lua`
- Copy local over repo: `cp -a ~/.config/nvim omarchy/nvim/.config/`
- From omarchy (use git show or a saved copy), copy into merged tree:
  - `lua/config/options.lua`
  - `lua/config/keymaps.lua`
  - `lua/config/autocmds.lua`, `lua/config/lazy.lua` (merge LSP/plugin loading)
  - Plugins to add: restore `/tmp/avante.lua` → `lua/plugins/avante.lua`; optionally `disable-news-alert.lua`, `snacks-animated-scrolling-off.lua`, `example.lua`
- Do **not** copy: `all-themes.lua`, `omarchy-theme-hotreload.lua` (themes = local)
- Merge LSP config from omarchy into merged tree
- Commit: e.g. "Nvim: local base, omarchy options/keymaps/plugins/lsps, local themes, add avante"

---

## Phase 5c: Other packages

| Package | Action |
|---------|--------|
| bash | Keep omarchy structure; merge local `.aliases`, `.secrets`, tail of `.bashrc` if desired |
| waybar, walker | Replace with local (`cp -a ~/.config/waybar omarchy/waybar/.config/` etc.) if using local |
| alacritty, ghostty, starship, fastfetch, btop, fcitx5, mise, systemd, swayosd, mako, autostart, fontconfig, xournalpp, mimeapps, user-dirs, brave-flags, chromium-flags, cursor | Replace with local if customized, else leave omarchy |

---

## Phase 6: Stow and verify

- From repo: `cd ~/src/0_github/dotfiles/omarchy && stow *`
- Test: Hyprland, fish (abbrs), kitty (cursor blink), tmux (keybindings + theme), git (`git config -l`), nvim (theme, avante, LSPs)

---

## Key paths

| Item | Path |
|------|------|
| Omarchy tmux keybindings | `omarchy/tmux/.config/tmux/tmux.reset.conf` |
| Omarchy tmux options/plugins | `omarchy/tmux/.config/tmux/tmux.conf` |
| End4 kitty cursor | `end4/kitty/.config/kitty/kitty.conf` (lines 5–11) |
| End4 fish abbrs/aliases | `end4/fish/.config/fish/config.fish` |
| Omarchy nvim avante | `omarchy/nvim/.config/nvim/lua/plugins/avante.lua` |
| Omarchy nvim config | `omarchy/nvim/.config/nvim/lua/config/` |

---

## Execution order

1. Phase 0 (backup)
2. Phase 1 (hypr)
3. Phase 2 (fish)
4. Phase 3 (kitty)
5. Phase 4 (tmux)
6. Phase 5a (git — no change)
7. Phase 5b (nvim)
8. Phase 5c (others)
9. Phase 6 (stow and verify)
