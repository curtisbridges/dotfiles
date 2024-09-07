-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato'
config.font = wezterm.font_with_fallback {
  'SF Mono',
  'Fira Code Nerd Font',
  'Hack Nerd Font'
}
config.font_size = 14

config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

config.check_for_updates = false

-- and finally, return the configuration to wezterm
return config

