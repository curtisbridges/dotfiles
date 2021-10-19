-- Defines
-- hyper =  {"⌘", "⌥", "⌃"}	-- caps lock held down
-- shyper = {"⌘", "⌥", "⇧", "⌃"}	-- caps lock held down, with shift
hyper = {"⌘", "⌥", "⇧", "⌃"}

-- Download and install this _one_ spoon to autoload all the others
hs.loadSpoon('SpoonInstall')
Install = spoon.SpoonInstall
spoon.SpoonInstall.use_syncinstall = true

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
require "windows"

-- Show Hammerspoon loaded
hs.alert("Hammerspoon config loaded")
-- Install:andUse("FadeLogo", {
--   config = {
--     default_run = 0.5,
--   },
--   start = true
-- })
