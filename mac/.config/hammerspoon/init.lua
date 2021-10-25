-- Defines
meh =  {"⌘", "⌥", "⌃"}	-- bottom row modifiers
hyper = {"⌘", "⌥", "⇧", "⌃"}	-- caps lock held down (karabiner hyper)

-- Download and install this _one_ spoon to autoload all the others
hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
spoon.SpoonInstall.use_syncinstall = true

-- ModalMgr Spoon must be loaded explicitly, because this repository heavily relies upon it.
Install:andUse("ModalMgr")
Install:andUse("WinWin")

-- Spoons!
-- Install:andUse("KSheet", {
--   hotkeys = {
--     toggle = { hyper, "/" }
--   }
-- })
-- Install:andUse("enantravers/Hyper")

-- load my modules
require "utils"
require "apps"
require "binds"
-- require "layout"
require "window"
require "window-management"

hs.hotkey.bind(hyper, "\\", function() SwitchLayout() end)

-- hs.ArrangeDesktop:logCurrentArrangement()

-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()

-- Show Hammerspoon loaded
hs.alert("Hammerspoon config loaded")
-- Install:andUse("FadeLogo", {
--   config = {
--     default_run = 0.5,
--   },
--   start = true
-- })
