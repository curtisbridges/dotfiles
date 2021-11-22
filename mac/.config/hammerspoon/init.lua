--
-- Hammerspoon configuration file
--

-- Global Defines
meh = {'⌘', '⌥', '⌃'} -- bottom row modifiers
hyper = {'⌘', '⌥', '⇧', '⌃'} -- caps lock held down (karabiner hyper)

BROWSER = 'Safari'
EDITOR = 'Visual Studio Code'
FILES = 'Finder'
MAIL = 'Mail'
TERMINAL = 'iTerm2'

-- Spoons!
-- Download and install this _one_ spoon to autoload all the others
hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
spoon.SpoonInstall.use_syncinstall = true
-- Clipboard manager
Install:andUse('ClipboardTool')
spoon.ClipboardTool.paste_on_select = true
spoon.ClipboardTool.show_in_menubar = false
spoon.ClipboardTool.show_copied_alert = false
spoon.ClipboardTool:start()
hs.hotkey.bind( hyper, 'v', function() spoon.ClipboardTool:toggleClipboard() end )

-- Window Management
Install:andUse("ModalMgr")
Install:andUse("WinWin")

-- Shortcut overlay
Install:andUse( 'KSheet', { hotkeys = { toggle = {meh, '/'} } } )

-- my modules
require 'utils'
require 'window-custom'
require 'window-modal'

hs.hotkey.bind(hyper, 'b', function() toggleApplication(BROWSER) end)
hs.hotkey.bind(hyper, 'e', function() toggleApplication(EDITOR) end)
hs.hotkey.bind(hyper, 'f', function() toggleApplication(FILES) end)
hs.hotkey.bind(hyper, 'm', function() toggleApplication(MAIL) end)
hs.hotkey.bind(hyper, 't', function() toggleApplication(TERMINAL) end)

-- require "layout"
-- this one for lock the screen
-- hs.hotkey.bind(hyper, "l", function() hs.caffeinate.lockScreen() end)
-- this one is for putting the system to sleep
-- hs.hotkey.bind(meh, "z", function() hs.caffeinate.systemSleep() end)
-- vi like cursor movements
-- local keyDelay = 100
-- hs.hotkey.bind(hyper, "h", function() hs.eventtap.keyStroke({}, "left", keyDelay) end, true)
-- hs.hotkey.bind(hyper, "j", function() hs.eventtap.keyStroke({}, "down", keyDelay) end, true)
-- hs.hotkey.bind(hyper, "k", function() hs.eventtap.keyStroke({}, "up", keyDelay) end, true)
-- hs.hotkey.bind(hyper, "l", function() hs.eventtap.keyStroke({}, "right", keyDelay) end, true)
-- h_bind("f", function() hs.eventtap.keyStroke({}, "pagedown", keyDelay) end, true)
-- h_bind("b", function() hs.eventtap.keyStroke({}, "pageup", keyDelay) end, true)
-- hs_bind("a", function() hs.eventtap.keyStroke({}, "home", keyDelay) end, true)
-- hs_bind("e", function() hs.eventtap.keyStroke({}, "end", keyDelay) end, true)

-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()

-- hammerspoon
hs.hotkey.bind( hyper, 'delete', function() hs.reload() end )
hs.hotkey.bind( meh, '/', function() hs.hotkey.showHotkeys() end )

-- show Hammerspoon loaded
hs.alert('Hammerspoon loaded')
