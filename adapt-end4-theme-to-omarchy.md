# Adapting End-4 Theme to Omarchy

What you can carry over from end-4 into omarchy so the “pleasant” feel transfers.

---

## 1. Palette and colors

End-4’s current look (from your synced `hyprland/colors.conf`) is a dark, soft Material-style scheme:

- **Borders:** active `#968e95` (mauve/gray), inactive `#4b454b`
- **Background:** `#141314`
- **Text:** `#e7e1e3`

Omarchy is currently **Everforest** (greens/teal in `colors.toml`). To get the end-4 feel in omarchy:

- Copy (or derive) those hex values into **`omarchy/omarchy/.config/omarchy/current/theme/colors.toml`**.
- Add any extra keys you need (e.g. `accent`, `border_active`, `border_inactive`, `surface`) so Waybar/Hyprland/kitty can all use the same source.
- Point **`waybar.css`**, **`hyprland.conf`**, **kitty.conf**, **hyprlock**, etc. at that palette (via `@define-color` / variables / `include` as you already do).

**Bottom line:** Adapt the palette by making end-4’s colors the source of truth in `colors.toml` and using them everywhere.

---

## 2. Fonts

End-4 (illogical-impulse `config.json`) uses:

- **Main/UI:** Google Sans Flex
- **Expressive:** Space Grotesk
- **Monospace / icons:** JetBrains Mono NF
- **Reading:** Readex Pro

Omarchy uses **CaskaydiaMono Nerd Font** in Waybar and Everforest in kitty. To match end-4’s tone:

- Set **Google Sans Flex** (or Space Grotesk) for bar/UI and **JetBrains Mono NF** for monospace in:
  - Waybar `style.css` (`font-family`),
  - Hyprland (e.g. hyprbars, any other font options),
  - `theme-set` / `font-set` hooks if you use them,
  - and optionally kitty/ghostty in the theme.

**Bottom line:** Adapt the font set (UI + mono + reading) in omarchy’s theme and hooks.

---

## 3. Hyprland decoration (rounding, blur, shadow, dim)

End-4’s “pleasant” look also comes from **`end4/hypr/.config/hypr/hyprland/general.conf`**:

- **Rounding:** `rounding = 18`, `rounding_power = 2.4` (soft squircle).
- **Blur:** size 10, 3 passes, brightness 1, noise 0.05, contrast 0.89, vibrancy 0.5, etc.
- **Shadow:** range 50, offset `0 4`, color `rgba(00000027)`.
- **Dim:** `dim_inactive = true`, strength 0.05, special 0.07.

Omarchy’s theme only injects **`hyprland.conf`** with border colors; the rest is in default/base Hypr config. To adapt:

- Either add a **decoration (and optionally animations) block** into the file that omarchy’s Hyprland sources from the theme (e.g. `~/.config/omarchy/current/theme/hyprland.conf`), **or**
- Put the same `decoration { ... }` (and optionally `animations { ... }`) in the base Hypr config that your omarchy setup uses.

**Bottom line:** Adapt decoration (rounding, blur, shadow, dim)—and optionally animations—from end-4’s `general.conf` into the Hypr config that omarchy uses.

---

## 4. Transparency

End-4 uses **backgroundTransparency 0.11**, **contentTransparency 0.57** in illogical-impulse. In omarchy:

- **Waybar:** use a semi-transparent background (e.g. `background-color: alpha(@background, 0.89)` or the equivalent with your new palette).
- **Hyprland:** optional `windowrule = opacity ...` for specific apps or window types, or layer rules for panels, so the overall transparency feel matches.

**Bottom line:** Adapt transparency in bar and (if you want) window/layer rules to be in the same ballpark as end-4.

---

## 5. Bar styling (floating, shadow, rounding)

End-4’s bar has **floatStyleShadow**, **fakeScreenRounding: 2**, **showBackground**. In Waybar you can approximate that with:

- **Border radius** (e.g. `border-radius: 8px` or 12px).
- **Box shadow** for a subtle “floating” look.
- **Background** from `colors.toml` with alpha for transparency.

**Bottom line:** Adapt bar look by adding rounding + shadow + themed background in Waybar’s `style.css` using your omarchy theme colors.

---

## 6. Animations

End-4 uses specific **bezier curves and animation timings** in `general.conf` (e.g. `emphasizedDecel`, `menu_decel`, `menu_accel`, `stall`) for windows, layers, workspaces. If your omarchy Hyprland config doesn’t set these, you can copy the `animations { ... }` block from end-4 into the same Hypr config you use for omarchy. That will make window/layer motion feel much closer to end-4.

**Bottom line:** Adapt animations by reusing end-4’s animation block in the Hypr config used by omarchy.

---

## 7. Optional: Material You pipeline

End-4’s theme is **dynamic** (matugen + illogical-impulse: palette from wallpaper, terminal harmony, etc.). Omarchy is **static** (single theme dir). You can:

- **Keep it static:** Snapshot end-4’s current colors (and optionally run matugen once, then copy the generated `colors.conf` / colors into `colors.toml`) and use that in omarchy.
- **Make it dynamic:** Run matugen (or a small script) and write results into `~/.config/omarchy/current/theme/` (e.g. `colors.toml` or a generated `waybar.css` / hyprland snippet) and reload Waybar/Hyprland; optionally tie that to a **theme-set** or **post-update** hook.

**Bottom line:** You can optionally adapt the *mechanism* (wallpaper → colors → omarchy theme) if you want the same “theme follows wallpaper” behavior.

---

## Summary table

| What to adapt              | Where in end-4                          | Where in omarchy                                                                 |
|---------------------------|----------------------------------------|-----------------------------------------------------------------------------------|
| **Palette**               | `hyprland/colors.conf`, matugen output, illogical-impulse palette | `current/theme/colors.toml` (+ waybar.css, hyprland.conf, kitty, etc.)           |
| **Fonts**                 | illogical-impulse `appearance.fonts`  | Waybar style, theme/font-set hooks, kitty/ghostty                                 |
| **Rounding / blur / shadow / dim** | `hyprland/general.conf` → decoration | Theme Hyprland.conf or base Hypr config                                          |
| **Transparency**          | illogical-impulse `transparency`      | Waybar background alpha, optional window/layer rules                             |
| **Bar look**              | Quickshell bar (float, shadow, rounding) | Waybar `style.css`: border-radius, box-shadow, background                      |
| **Animations**            | `hyprland/general.conf` → animations  | Same Hypr config as above                                                         |
| **Dynamic theme (optional)** | matugen + illogical-impulse         | Script + theme-set/post-update writing into `current/theme/`                     |

---

## Quick wins

The highest impact for “how the theme works” in a pleasant way is: **palette in `colors.toml`**, **decoration (rounding, blur, shadow, dim)** and **animations** in Hyprland, and **fonts + bar styling** in Waybar. After that, transparency and optional Material You pipeline will get you even closer to end-4.
