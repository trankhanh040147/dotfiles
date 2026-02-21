# Key binding issues in tmux

Summary of why some key combinations fail inside tmux, and how to fix or work around them.

---

## Root cause

**Outside tmux:** The terminal (e.g. Kitty) and the application use a modern keyboard protocol (e.g. Kitty keyboard protocol). Every key combination has a distinct encoding (e.g. Ctrl+Backspace, Shift+Enter).

**Inside tmux:** tmux sits between the terminal and the application. It does **not** support the Kitty keyboard protocol. It only understands:

- Legacy encoding (e.g. Alt+key = `ESC` + key)
- Optionally xterm-style CSI u extended keys (`extended-keys always`)

Keys that have **no legacy encoding** are either collapsed to another key (e.g. Ctrl+Backspace → `Ctrl+H`) or lost (e.g. Shift+Enter → plain Enter). So the same key combo can work outside tmux and fail inside tmux.

---

## Affected key combinations (typical)

| Key combo           | In tmux often becomes | Fix / workaround |
|---------------------|------------------------|------------------|
| **Ctrl+Backspace**  | Backspace or Ctrl+H    | See [Ctrl+Backspace](#ctrlbackspace) below |
| **Shift+Enter**     | Plain Enter           | No global fix without breaking non-tmux; use per-app binding or avoid tmux for that app |
| **Ctrl+Enter**      | Plain Enter           | Per-app or avoid tmux |
| **Ctrl+Delete**     | Delete                | Per-app |
| **Ctrl+/**          | Broken in many apps   | Per-app (e.g. bind to another key in that app) |
| **Ctrl+;**, **Ctrl+,**, **Ctrl+.** | Often broken | Per-app |
| **Ctrl+Shift+letter** | Sometimes same as Ctrl+letter | `extended-keys always` can help for some |
| **Shift+Tab**       | Sometimes same as Tab | Depends on app/terminal |

---

## Solutions (by approach)

### 1. Tmux settings (already in this config)

- **`set -g extended-keys always`**  
  Tmux sends/receives xterm-style CSI u for modified keys when possible. Helps some combos; does **not** fix Ctrl+Backspace (tmux still sends it as Ctrl+H).

- **`set -gq allow-passthrough on`**  
  Lets unknown escape sequences pass through to the application.

- **`set -as terminal-features ',xterm*:extkeys'`**  
  Tells tmux the outer terminal supports extended keys; use with CSI u from the terminal if you ever send it (we don’t for Shift+Enter, to avoid breaking non-tmux).

### 2. Terminal remap (Kitty) — use with care

In `kitty.conf` you can force a key to send a **different** key or a CSI u sequence:

```conf
# Example: send Ctrl+W when user presses Ctrl+Backspace (so every app can bind Ctrl+W to "delete word")
map ctrl+backspace send_text all \x17
```

- **Pros:** One place to “fix” the key for all apps inside tmux.
- **Cons:** You repurpose a key (e.g. Ctrl+W); outside tmux you’re still sending that same repurposed key unless you avoid the mapping there (Kitty can’t condition on “inside tmux”).

Sending CSI u from Kitty (e.g. `map shift+enter send_text all \x1b[13;1u`) can fix behavior **inside** tmux but often **breaks** the same key **outside** tmux, because many apps expect the native protocol, not CSI u. So we don’t use that for Shift+Enter.

### 3. Per-application binding (recommended where possible)

- **Shell (Fish):** Bind the key that tmux actually sends.  
  Example: Ctrl+Backspace is sent as `Ctrl+H` → in Fish bind `ctrl-h` to `backward-kill-word`. If a plugin (e.g. autopair) overrides it, use a deferred bind (e.g. on `fish_prompt`) so your binding runs after the plugin.

- **Neovim / Vim:** Map the key that tmux sends, or use a different combo.  
  Example: `inoremap <C-H> <C-W>` (or use `\x08` / `ctrl-h` in the mapping).

- **Other apps (Cursor, browsers, REPLs):** In the app’s keybinding settings, bind “new line” or “delete word” to a key that **does** work in tmux (e.g. Alt+Enter, Ctrl+Enter, or the key the terminal sends after a Kitty remap).

### 4. Avoid tmux for that workflow

Run the session where you need problematic keys (e.g. Cursor Agent, chat, REPL) in a terminal window **without** tmux so the terminal and app can use the full keyboard protocol.

---

## Ctrl+Backspace (what we did)

- **Cause:** Tmux has no distinct encoding for Ctrl+Backspace; it sends `Ctrl+H`. So Fish (and others) see `ctrl-h`, not “Ctrl+Backspace”.
- **Fix (Fish):** Bind `ctrl-h` to `backward-kill-word`. Autopair (CachyOS) also binds `ctrl-h`, so we apply our bind in a function that runs after plugins (e.g. `--on-event fish_prompt`) and then remove that function so it only runs once.
- **Config:** See `~/.config/fish/config.fish` (deferred `bind ctrl-h backward-kill-word`).

---

## Shift+Enter (why we didn’t fix it globally)

- **Cause:** No legacy encoding; inside tmux it becomes plain Enter.
- **Attempted fix:** In Kitty, `map shift+enter send_text all \x1b[13;1u` so tmux would get a distinct CSI u sequence. That broke Shift+Enter **outside** tmux (apps expect native encoding, not CSI u).
- **Conclusion:** Reverted the Kitty mapping. No global fix at the terminal level without breaking non-tmux. Use per-app bindings (e.g. “new line” on Ctrl+Enter or Alt+Enter) or run that app without tmux.

---

## Quick reference: fix a broken key in tmux

1. **Identify what tmux sends**  
   In the app (e.g. Fish), use the app’s key reader (e.g. `fish_key_reader`) **inside** tmux and press the key. Note the reported key (e.g. `ctrl-h`).

2. **Decide where to fix it**  
   - **In the app:** Bind that reported key to the desired action (and use deferred/override if a plugin binds it).  
   - **In the terminal:** Only if you’re okay changing the key for **all** sessions (including non-tmux), e.g. remap to another key or to CSI u.

3. **Don’t** force CSI u from Kitty for keys that already work outside tmux (like Shift+Enter) unless you’re sure every app you use understands CSI u for that key.
