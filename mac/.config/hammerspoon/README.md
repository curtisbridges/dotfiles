# Hammerspoon Setup

Hammerspoon automates your Mac using the scripting language lua.

## Keybinds

- Esc / Modifier (Hyper or Ctrl)
- Arrow keys
- Edit (Home/End, PgUp/PgDn)

## Window Management

- Mostly maxed (90% or px value)

- 50/50 (halves)
- 70/30 (biased)
- 33/33/33 (thirds)
- 80% width / 100% height

Automatically / shortcuts
- Arrange 4K screens (main, dev, etc.)
- Arrange laptop screens

## TODO
- [x] Document existing keybinds in this README
- [ ] Add show keybinds overlay
- [ ] Convert window management to use `layout`
- [x] Add window to 80% width, 100% height
- [x] Add right bias halves
- [x] Move window to next/prev screens
- [ ] Shrink/Grow window (x and y)
- [ ] Move window
- [ ] Add multi-window layouts
  - [ ] Home
  - [ ] Dev
- [ ] Tiling?

## Quirks
- `hyper-.` seems to trigger a sysdiagnose
  - This can be fixed. I forgot how I fixed it... maybe disabled it in macOS Keyboard Shortcuts?

## Target Workflows
## Meh triggers (cmd-ctrl-alt)
- Window focus (arrows)

### Hyper triggers (cmd-ctrl-alt-shift)
- [x] Reload Hammerspoon (delete)
- [x] Window segments (
  - [x] halves (q,e)
  - [x] thirds (1, 2, 3)
  - [x] biased 70/30 (4, 3)
- [ ] Snap direction (arrows)
- [ ] Move Window (w-a-s-d), grows/shrinks when pinned
- [ ] Center window (c)
- [x] Maximize window (x)
- Shrink window (r)
- Grow/shrink window (when centered) (=, -)
- [x] Snap to grid (g)

- move first/last space (home, end)
- move next/prev space (pgup, pgdown)
- rotate screen

- When window is pinned to a side, left/right will grow (to max) or shrink window to a min size

- Predefined layouts for given spaces [ArrangeDesktop](https://www.hammerspoon.org/Spoons/ArrangeDesktop.html)
- Tile current windows (layouts: 1, 2, 3, 4+) (\)

- Changes should trigger on screen display of position and size for a short duration.

- [ClipboardTool](https://www.hammerspoon.org/Spoons/ClipboardTool.html) Spoon (v)

## Ideas
- Dynamic behavior based upon screen resolution (4K vs laptop)
- Trigger iterm hotkey window
- Trigger layouts based upon screen change events

## Most used Apps
Use [AppLauncher](https://www.hammerspoon.org/Spoons/AppLauncher.html)?
- Safari, Chrome
- Terminal
- Finder
- Visual Studio Code
- Tweetbot
- Spotify
- Pocket Casts
- Reminders
- Notes
- 1Password

## Other important shortcuts
- Expose (ctrl-esc)
- Spaces (ctrl 1-4)
- Close (cmd-w) and Hide Windows (cmd-h)
- Screenshot (cmd-shift-3,4,5) (`/Applications/Utilities/Screenshot.app`)
- 1Password (cmd-\)

## TODO
- Meh keybinds (right hand easy, left impossible)
  - Meh 1,2,3 -> manual layouts for spaces 1, 2, and 3
- [Show keybinds](https://www.hammerspoon.org/Spoons/HSKeybindings.html)
