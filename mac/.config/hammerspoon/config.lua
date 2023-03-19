-- Global Defines
meh = { '⌘', '⌥', '⌃' }  -- bottom row modifiers
hyper = { '⌘', '⌥', '⇧', '⌃' } -- caps lock held down (karabiner hyper)

-- universal modifiers
mod = { '⌥' }
mod_resize = { '⌘', '⌃' }
mod_move = { '⌥', '⌃' }
mod_focus = { '⌥', '⌘' }

MACBOOK_MONITOR = 'Built-in Retina Display'
MAIN_MONITOR = 'DELL U3219Q'
SECOND_MONITOR = 'DELL U2723QE (1)'
THIRD_MONITOR = 'DELL U2723QE (2)'

-- Binds
hs.hotkey.bind(mod_resize, "return", function() alacrittyQuake() end)
