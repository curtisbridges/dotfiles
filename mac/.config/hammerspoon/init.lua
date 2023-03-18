--
-- Hammerspoon configuration file
--
require 'config'
require 'utils'
require 'quake'
require 'windows'

-- Spoons!
-- Download and install this _one_ spoon to autoload all the others
-- hs.loadSpoon('SpoonInstall')
-- Install = spoon.SpoonInstall
-- spoon.SpoonInstall.use_syncinstall = true

-- Window Management
-- Install:andUse('ModalMgr')
-- Install:andUse('WinWin')

-- show Hammerspoon loaded
hs.hotkey.bind(meh, 'r', function() hs.reload() end)
hs.alert('Hammerspoon loaded')
