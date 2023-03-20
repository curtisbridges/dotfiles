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

-- faster animations, default value = 0.2
hs.window.animationDuration = .1

-- browsers
chromeBrowser = getAppID('/Applications/Google Chrome.app')
safariBrowser = getAppID('/Applications/Safari.app')

DefaultBrowser = safariBrowser
WorkBrowser = chromeBrowser

-- Binds
hs.hotkey.bind(meh, "return", function() alacrittyQuake() end)
hs.hotkey.bind(meh, "space", function() alacrittyQuake() end)
