# Hammerspoon Setup

Hammerspoon automates your Mac using the scripting language lua.

## Keybinds

- Esc / Modifier (Hyper or Ctrl)
- Arrow keys
- Edit (Home/End, PgUp/PgDn)

- Global mute with overlay!

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
- [ ] Document existing keybinds in this README
- [ ] Add show keybinds overlay
- [ ] Convert window management to use `layout`
- [x] Add window to 80% width, 100% height
- [x] Add right bias halves
- [x] Move window to next/prev screens
- [ ] Shrink/Grow window (x or y)
  - [ ] Use resize key to cycle through sizes vertically
  - [ ] Use resize key to cycle through sizes horizontally
- [ ] Move window (left or right)
  - [ ] Use move key to cycle through sizes vertically
  - [ ] Use move key to cycle through sizes horizontally
- [ ] Add multi-window layouts
  - [ ] Home
  - [ ] Dev
- [ ] Tiling?

## Quirks
- `hyper-.` seems to trigger a sysdiagnose
  - This can be fixed. I forgot how I fixed it... maybe disabled it in macOS Keyboard Shortcuts?

## Target Workflow
- Move Window
  - Top, left, right
- Maximize window
- Grow window (when centered)
- Pin left/right
  - When window is pinned to a side, left/right will grow/shrink window to a min size

Changes should trigger on screen display of position and size for a short duration.
