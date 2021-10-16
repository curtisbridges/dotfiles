
hs.window.animationDuration = 0

function getWin()
  return hs.window.focusedWindow()
end

hs.hotkey.bind(mash, "\\", function() hs.grid.maximizeWindow() end)
