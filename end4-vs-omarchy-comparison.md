# End-4 vs Omarchy Setup Comparison

A diagnosis of what each setup has that the other doesn't, based on the dotfiles in this repo.

---

## What End-4 has that Omarchy doesn't

| Feature | End-4 | Omarchy |
|--------|--------|---------|
| **Overlay** | **Super+G** → `quickshell:overlayToggle` | ❌ No overlay (no Quickshell) |
| **Media controls** | **Super+M** → `quickshell:mediaControlsToggle` | ❌ No dedicated media overlay (only app launch Super+Shift+M) |
| **Left sidebar** | **Super+A** (and B, O) → `quickshell:sidebarLeftToggle` | ❌ No sidebars |
| **Right sidebar** | **Super+N** → `quickshell:sidebarRightToggle` | ❌ No sidebars |
| **Cycle panel family** | **Ctrl+Super+P** → `quickshell:panelFamilyCycle` (Waffle / IllogicalImpulse) | ❌ No panel families (single waybar) |
| **Bar toggle** | **Super+J** → `quickshell:barToggle` | ❌ No bar toggle |
| **Cheatsheet** | **Super+/** → `quickshell:cheatsheetToggle` | ❌ No cheatsheet overlay |
| **Wallpaper selector** | **Ctrl+Super+T** (and random with Alt) | ❌ No built-in wallpaper selector |
| **Session menu** | **Ctrl+Alt+Delete** → `quickshell:sessionToggle` | ❌ Uses hyprlock/omarchy-lock directly |
| **Settings app** | **Super+I** → Quickshell **Settings** (Quick, General, Bar, Background, Interface, Services, Advanced, About) | ❌ No unified settings GUI (omarchy-menu is commented out; system settings are external) |
| **Welcome app** | **Super+Shift+Alt+/** → `welcome.qml` (first-run + re-open) | ❌ No welcome/onboarding |
| **Theming** | **matugen** (Material You from wallpaper) + **illogical-impulse** `config.json` (appearance, fonts, palette, transparency, wallpaper theming) | Different system (see Omarchy section) |
| **Launcher** | **Super** = Quickshell search (with fuzzel fallback) | Walker (different UX) |
| **Overview** | **Super+Tab** → workspace overview | Depends on Omarchy defaults |
| **Clipboard / Emoji** | **Super+V**, **Super+.** from Quickshell overlays | Has clipboard via Omarchy defaults |
| **Region tools** | **Super+Shift+S** (screenshot), **Super+Shift+A** (search), **Super+Shift+X/T** (OCR), **Super+Shift+R** (record), **Super+Shift+C** (color picker) | May be in Omarchy defaults; not in dotfiles |
| **Widget stack** | **Quickshell** (one process for bar, overlays, panels) | **Waybar** + **Walker** (separate) |
| **Misc** | wlogout, cava, MangoHud, micro, mpv, xdg-desktop-portal hyprland, xsettingsd, chrome/code/thorium flags | — |

**Summary:** Overlay (Super+G), media (Super+M), left/right sidebars (Super+A/N), cycle panel (Ctrl+Super+P), and the unified **Settings** menu (Super+I) are all **Quickshell/illogical-impulse** features that Omarchy doesn't have because it uses Waybar + Walker instead.

---

## What Omarchy has that End-4 doesn't

| Feature | Omarchy | End-4 |
|--------|---------|--------|
| **Themes management** | **Central theme dir**: `~/.config/omarchy/current/theme/` (theme.name, colors.toml, backgrounds/, and per-app: alacritty, btop, chromium, ghostty, hyprland, hyprlock, kitty, waybar, walker, neovim, swayosd, mako, etc.) + **hooks** (theme-set, font-set, post-update) | ❌ No single “theme pack”; uses matugen + illogical-impulse config instead |
| **Settings / config menu** | **omarchy-menu** (Super+Space in comments) + config sourced from `~/.config/omarchy/` and `~/.local/share/omarchy/default/` | ❌ No omarchy-menu; has Quickshell Settings (Super+I) instead |
| **Unified Omarchy CLI/helpers** | `omarchy-cmd-terminal-cwd`, `omarchy-launch-browser`, `omarchy-launch-or-focus`, `omarchy-launch-webapp`, `omarchy-launch-tui`, `omarchy-launch-editor`, `omarchy-launch-screensaver`, `omarchy-lock-screen` | ❌ Uses `launch_first_available.sh` and direct execs |
| **Volume OSD** | **swayosd** (config + style from theme) | ❌ No swayosd in dotfiles |
| **System integration** | **systemd user**: elephant.service, omarchy-battery-monitor (service + timer) | ❌ No user units in dotfiles |
| **Apps/tools in dotfiles** | btop, **cursor** (keybindings + settings), **fastfetch**, **ghostty**, **htop**, **lazydocker**, **lazygit**, **mise**, **walker**, **waybar**, **xournalpp**, mimeapps | ❌ None of these in end4 |
| **Browser/editor model** | Brave/Chromium flags; editor via `omarchy-launch-editor` | Chrome/code/thorium flags; editor via launch script |
| **Dotfiles layout** | Uses **GNU Stow** + sync.sh for dotfiles | Different layout (e.g. sync.sh mentions illogical-impulse) |

**Summary:** **Themes management** and the **settings/config menu** (omarchy-menu + omarchy config) are what Omarchy has and End-4 doesn't in the way you listed; End-4's “settings” are the Quickshell Settings app (Super+I), not a theme/config menu like Omarchy's.

---

## Why End-4 can feel “smoother / more elegant”

1. **Single widget process** – Quickshell handles bar, overlays, sidebars, media, session menu, and settings in one process (one IPC, one style/theme flow).
2. **Rich keybind set** – Overlay, media, sidebars, panel cycle, bar toggle, cheatsheet, wallpaper selector, region screenshot/OCR/record are all bound and consistent.
3. **Unified settings** – One Settings app (Super+I) for Quick, Bar, Background, Interface, Services, etc., with a clear structure (e.g. `settings.qml` with Quick, General, Bar, Background, Interface, Services, Advanced, About).
4. **Panel families** – Ctrl+Super+P cycles between different bar/panel layouts (e.g. Waffle vs IllogicalImpulse), which can feel more “desktop-y” and polished than a single bar.

Omarchy feels different because it's **Waybar + Walker + omarchy theme/CLI**: more theme-centric and distro-integrated, but without the overlay/sidebar/media/panel-cycle and the single Settings app that End-4 has.

---

## Checklist summary

### What End-4 is missing compared to Omarchy

- [x] **Themes management** – Omarchy has `~/.config/omarchy/current/theme/` and hooks; End-4 has matugen + illogical-impulse, no single theme pack.
- [x] **Setting config menu** – Omarchy has (or intends) **omarchy-menu** (and config under `omarchy/`); End-4 has Quickshell Settings (Super+I), not an “Omarchy-style” config menu.
- [ ] **swayosd** (volume OSD)
- [ ] **Centralized theme dir** and theme-set/font-set/post-update hooks
- [ ] **Omarchy-style launchers** (omarchy-launch-*, omarchy-cmd-*)
- [ ] **Stow-based layout** and sync script like Omarchy (if you care about that)

### What Omarchy is missing

- [x] **Overlay: Super+G**
- [x] **Media control: Super+M**
- [x] **Left/Right sidebar: Super+A / Super+N**
- [x] **Cycle panel family: Ctrl+Super+P**
- [x] **Bar toggle (Super+J)**, **cheatsheet (Super+/)**, **wallpaper selector (Ctrl+Super+T)**
- [x] **Unified Settings app** (Quickshell Settings with Quick/General/Bar/Background/Interface/Services/Advanced/About)
- [x] **Welcome / first-run** flow
- [x] **Quickshell** (single smooth stack for bar + overlays + panels)

---

## Key config locations

| Purpose | End-4 | Omarchy |
|--------|--------|---------|
| Hyprland | `end4/hypr/.config/hypr/` (hyprland.conf → hyprland/ + custom/) | `omarchy/hypr/.config/hypr/` (sources ~/.local/share/omarchy/default/hypr/ + ~/.config/omarchy/current/theme/hyprland.conf) |
| Bar / launcher | Quickshell `end4/quickshell/.config/quickshell/ii/` | Waybar `omarchy/waybar/`, Walker `omarchy/walker/` |
| Shell config | `end4/illogical-impulse/.config/illogical-impulse/config.json` | `omarchy/omarchy/.config/omarchy/` (current/theme/, hooks/) |
| Theme generation | `end4/matugen/` | `omarchy/omarchy/.config/omarchy/current/theme/` |
