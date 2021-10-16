local function toggleApplication(name)
  local app = hs.application.find(name)
  if not app or app:isHidden() then
    hs.application.launchOrFocus(name)
  elseif hs.application.frontmostApplication() ~= app then
    app:activate()
  else
    app:hide()
  end
end

hs.hotkey.bind(mash, "b", function() toggleApplication("Safari") end)
-- hs.hotkey.bind(mash, "c", function() toggleApplication("Google Chrome") end)
hs.hotkey.bind(mash, "f", function() toggleApplication("Finder") end)
-- hs.hotkey.bind(mash, "m", function() toggleApplication("Mail") end)
-- hs.hotkey.bind(mash, ",", function() toggleApplication("System Preferences") end)
hs.hotkey.bind(mash, "t", function() toggleApplication("Terminal") end)
