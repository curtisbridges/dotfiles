# Hammerspoon Setup

Hammerspoon automates your Mac using the scripting language lua.
mod_resize = (ctrl-opt)
mod_move = (ctrl-cmd)
meh = (ctrl-opt-command)
hyper = (shift-ctrl-opt-command)

## Global Hotkeys
- [meh-r] Reload Hammerspoon config
- [meh-c] Show Hammerspoon console
- [mod_move-return] Quake-style Alacritty

## Window Management (12x12 grid)
- [mod_resize] Resize
- [mod_move] Move on current space & screen:
  - [f] Toggle full screen
  - [z] Toggle zoom
  - [left,up,right,down] Move with chaining sizes top, right, bottom, left
    - (chaining = 50%, 66%, 33% when repeating keybind)
  - [home] Chain full screen, top+big, top+small
  - [c] Move to center of screen
  - [1,2,3,4] Move to the corners
  - [hjkl] Push window left, down, up, right
  - [pgup,pgdown] Resize taller or shorter
  - [=,-] Resize wider, thinner
- Move to different screens
  - [n,p] Move to next or previous screen
  - [,.] Move to to right or left screen

## Other important macOS shortcuts
- Expose (ctrl-esc)
- Spaces (ctrl 1-4), (ctrl-left, ctrl-right)
- Close (cmd-w) and Hide Windows (cmd-h)
- Screenshot (cmd-shift-3,4,5) (`/Applications/Utilities/Screenshot.app`)
- 1Password (cmd-\)
