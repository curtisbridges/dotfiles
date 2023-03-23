# Hammerspoon Setup

Hammerspoon automates your Mac using the scripting language lua.
mod_resize = (ctrl-opt)
mod_move = (ctrl-cmd)
meh = (ctrl-opt-command)
hyper = (shift-ctrl-opt-command)

## Global Hotkeys
- [hyper-r] Reload Hammerspoon config
- [hyper-c] Show Hammerspoon console
- [meh-return] Quake-style Alacritty

## Window Management (24x24 grid)
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

### Target Behavoir
Some keys will use absolute positioning.
Arrow keys move windows. When a window's side is on a screen edge, the window position should be sticky. The arrow keys will grow/shrink from there.

## Other important macOS shortcuts
- Expose (ctrl-esc)
- Spaces (ctrl 1-4), (ctrl-left, ctrl-right)
- Close (cmd-w) and Hide Windows (cmd-h)
- Screenshot (cmd-shift-3,4,5) (`/Applications/Utilities/Screenshot.app`)
- 1Password (cmd-\)


## ~~Window Management - WindowHalfsAndThirds~~
```json
{
  left_half    = { { "ctrl", "cmd" }, "Left" },
  right_half   = { { "ctrl", "cmd" }, "Right" },
  top_half     = { { "ctrl", "cmd" }, "Up" },
  bottom_half  = { { "ctrl", "cmd" }, "Down" },
  third_left   = { { "ctrl", "alt" }, "Left" },
  third_right  = { { "ctrl", "alt" }, "Right" },
  third_up     = { { "ctrl", "alt" }, "Up" },
  third_down   = { { "ctrl", "alt" }, "Down" },
  top_left     = { { "ctrl", "cmd" }, "1" },
  top_right    = { { "ctrl", "cmd" }, "2" },
  bottom_left  = { { "ctrl", "cmd" }, "3" },
  bottom_right = { { "ctrl", "cmd" }, "4" },
  max_toggle   = { { "ctrl", "cmd" }, "f" },
  max          = { { "ctrl", "alt", "cmd" }, "Up" },
  undo         = { { "ctrl", "cmd" }, "forwarddelete" },
  center       = { { "ctrl", "cmd" }, "c" },
  larger       = { { "ctrl", "alt", "cmd" }, "=" },
  smaller      = { { "ctrl", "alt", "cmd" }, "-" },
}
 ```

## ~~Screen Management - WindowScreenLeftAndRight~~
```json
{
  screen_left = { { "ctrl", "alt", "cmd" }, "Left" },
  screen_right = { { "ctrl", "alt", "cmd" }, "Right" },
}
```
