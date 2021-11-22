--
-- Hammerspoon configuration file
--

-- Global Defines
meh = {'⌘', '⌥', '⌃'} -- bottom row modifiers
hyper = {'⌘', '⌥', '⇧', '⌃'} -- caps lock held down (karabiner hyper)

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
hs.hotkey.bind(hyper, 'v', function() spoon.ClipboardTool:toggleClipboard() end)

-- Window Management
Install:andUse('ModalMgr')
Install:andUse('WinWin')

-- Shortcut overlay
Install:andUse('KSheet', { hotkeys = { toggle = {meh, '/'}}})

-- my modules
require 'utils'
require 'app-switcher'
require 'window-custom'
require 'window-modal'

-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()

-- hammerspoon
hs.hotkey.bind(hyper, 'delete', function() hs.reload() end)
hs.hotkey.bind(meh, '/', function() hs.hotkey.showHotkeys() end)

-- show Hammerspoon loaded
hs.alert('Hammerspoon loaded')
