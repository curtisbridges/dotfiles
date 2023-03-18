--
-- Hammerspoon configuration file
--

-- Global Defines
meh = {'⌘', '⌥', '⌃'} -- bottom row modifiers
hyper = {'⌘', '⌥', '⇧', '⌃'} -- caps lock held down (karabiner hyper)

-- my modules
require 'quake'
require 'utils'

-- hammerspoon
-- hs.hotkey.bind(hyper, 'delete', function() hs.reload() end)
-- hs.hotkey.bind(meh, '/', function() hs.hotkey.showHotkeys() end)

-- show Hammerspoon loaded
hs.alert('Hammerspoon loaded')
