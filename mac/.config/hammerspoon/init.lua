mash = {"⌘", "⌥", "⌃", "shift"}

require "apps"
require "windows"

hs.hotkey.bind(mash, "r", function() hs.reload(); end)
hs.hotkey.bind(mash, "l", function() hs.caffeinate.lockScreen(); end)

hs.alert("Hammerspoon config loaded")
