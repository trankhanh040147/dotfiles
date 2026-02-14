# Sync Local to Omarchy, Then Merge Adjustments — Checklist

**Goal:** (1) Sync local configs into omarchy so repo = local and stow won’t cause conflicts. (2) Then merge in tmux keybindings/plugins, nvim options/avante, fish abbrs, kitty cursor animations step by step with testing.

**Repo:** `~/src/0_github/dotfiles` · **Stow from:** `omarchy/`

---

## Phase 1: Sync local configs into omarchy (no merging)

Copy `~/.config/<pkg>` into `omarchy/<pkg>/.config/` so the repo holds your current local. No edits yet.

- [x] **1.1** hypr — `rm -rf omarchy/hypr/.config/hypr` then `cp -a ~/.config/hypr omarchy/hypr/.config/`
- [x] **1.2** kitty — same pattern for `omarchy/kitty/.config/kitty`
- [x] **1.3** fish — same for `omarchy/fish/.config/fish`
- [x] **1.4** tmux — same for `omarchy/tmux/.config/tmux`
- [x] **1.5** nvim — same for `omarchy/nvim/.config/nvim`
- [x] **1.6** alacritty — same for `omarchy/alacritty/.config/alacritty`
- [x] **1.7** waybar — same for `omarchy/waybar/.config/waybar`
- [x] **1.8** walker — same for `omarchy/walker/.config/walker`
- [x] **1.9** Commit: e.g. `omarchy: Phase 1 — sync local configs (hypr, kitty, fish, tmux, nvim, alacritty, waybar, walker)`

**Note:** git is left as omarchy (do not overwrite with local) unless you decide otherwise.

---

## Phase 2: Step-by-step merge and test

After Phase 1, merge omarchy/end4 adjustments into the synced packages one at a time. Test after each step.

### 2.1 Tmux — keybindings + plugins (keep local theme)

- [x] Copy keybindings from `omarchy/tmux/.config/tmux/tmux.reset.conf` (or merge into main conf).
- [x] Add TPM plugin list + plugin options from omarchy `tmux.conf` (exclude theme plugin; keep local status bar/theme).
- [x] Set `@sessionx-custom-paths` and `@sessionx-x-path` to `~/src/0_github/dotfiles`.
- [x] Optional: fzf-url icon prompt, status bar styling with icons.
- [ ] Stow tmux only, test: prefix, splits, sessionx, floax. Commit when good.

### 2.2 Kitty — cursor animations

- [x] Merge from end4: cursor block (`cursor_shape`, `cursor_beam_thickness`, `cursor_blink_interval`, `cursor_trail*`).
- [x] Optional: search/zoom keymaps from end4.
- [ ] Stow kitty only, test: cursor blink/trail, tabs. Commit when good.

### 2.3 Fish — abbrs

- [x] Merge abbrs (and aliases) from `end4/fish/.config/fish/config.fish` into `omarchy/fish/.config/fish/config.fish`.
- [ ] Stow fish only, test: run abbrs (e.g. ls, nnh, lzg). Commit when good.

### 2.4 Nvim — options, keymaps, plugins, avante

- [x] Merge from omarchy (or saved): `lua/config/options.lua`, `keymaps.lua`, `autocmds.lua`, `lazy.lua`.
- [x] Add plugin: `lua/plugins/avante.lua`; optionally `disable-news-alert`, `snacks-animated-scrolling-off`, `example`. Skip theme plugins.
- [ ] Stow nvim only, run `:Lazy`, test avante and keymaps. Commit when good.

---

## Phase 3: Full stow and verify

- [ ] From `omarchy/`: `stow */` (or stow each package).
- [ ] Verify: Hyprland hotkeys, Kitty cursor/tabs, fish abbrs, tmux keybindings/plugins, nvim avante/keymaps.

---

## Quick reference

| Phase | What |
|-------|------|
| 1 | Sync local → repo for hypr, kitty, fish, tmux, nvim, alacritty, waybar, walker. No merging. |
| 2 | Merge tmux (keybindings/plugins), kitty (cursor), fish (abbrs), nvim (options/avante) one by one; test each. |
| 3 | Stow all and do final verification. |
