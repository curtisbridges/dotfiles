-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Helper function:
-- returns color scheme dependant on operating system theme setting (dark/light)
local function color_scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    -- return "Tokyo Night"
    return "Catppuccin Mocha"
  else
    -- return "Tokyo Night Day"
    return "Catppuccin Latte"
  end
end

-- Fonts
config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font',
  'SF Mono',
  'Hack Nerd Font'
}
config.font_size = 14

-- Appearance
config.color_scheme = color_scheme_for_appearance(wezterm.gui.get_appearance())
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = false

-- Keybindings
config.keys = {
  -- Default QuickSelect keybind (CTRL-SHIFT-Space)
  -- close pane with confirmation if active process
  {
    key = 'w',
    mods = 'SUPER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

-- Misc
config.check_for_updates = false -- I update via package managers

-- and finally, return the configuration to wezterm
return config
