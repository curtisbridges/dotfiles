-- Global Defines
meh = { '⌘', '⌥', '⌃' }  -- bottom row modifiers
hyper = { '⌘', '⌥', '⇧', '⌃' } -- caps lock held down (karabiner hyper)

-- universal modifiers
mod = { '⌥' }
mod_focus = { '⌘', '⌃' }
mod_move = { '⌥', '⌃' }
mod_resize = { '⌥', '⌘' }

-- Monitors
MACBOOK_MONITOR = 'Built-in Retina Display'
MAIN_MONITOR = 'DELL U3219Q'
SECOND_MONITOR = 'DELL U2723QE (1)'
THIRD_MONITOR = 'DELL U2723QE (2)'

-- Apps
TERMINAL_APP = 'Alacritty'

-- faster animations, default value = 0.2
hs.window.animationDuration = .1

-- Binds
hs.hotkey.bind(hyper, "space", function() quakeTerminal() end)
