-- Settings
hs.grid.setGrid('16x9')
hs.grid.setMargins('10, 10')

hs.window.animationDuration = 0.1

-- Functions
function getWin()
  return hs.window.focusedWindow()
end

function moveWindow(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w*x)
  f.y = max.y + (max.h*y)
  f.w = max.w*w
  f.h = max.h*h

  win:setFrame(f)
end

function gridWindow(cell)
  local win = hs.window.focusedWindow()
  local screen = win:screen()

  hs.grid.set(win, cell, screen)
end

--
-- Bindings
--

-- maximized window
hs.hotkey.bind(hyper, "space", function() hs.grid.maximizeWindow() end)
-- mostly maxed window
hs.hotkey.bind(hyper, "w", function() gridWindow({2, 0, 12, 9}) end)

-- minimize window
-- hs.hotkey.bind(hyper, "s", function() local win = hs.window.frontmostWindow() win:minimize() end)
hs.hotkey.bind(hyper, "s", function() gridWindow({5, 0, 6, 5}) end)
hs.hotkey.bind(hyper, "c", function() local win = hs.window.frontmostWindow() win:centerOnScreen() end)

-- full screen
hs.hotkey.bind(hyper, "f", function() local win = hs.window.frontmostWindow() win:setFullscreen(not win:isFullscreen()) end)
-- move window to next screen
hs.hotkey.bind(hyper, "pagedown", function() local win = getWin(); win:moveToScreen(win:screen():next()) end)
hs.hotkey.bind(hyper, "pageup", function() local win = getWin(); win:moveToScreen(win:screen():previous()) end)

-- snap window to grid
hs.hotkey.bind(hyper, "g", function() hs.grid.snap(getWin()) end)

-- halves
hs.hotkey.bind(hyper,"a", function() gridWindow({0, 0, 8, 9}) end)
hs.hotkey.bind(hyper,"d", function() gridWindow({8, 0, 8, 9}) end)

-- thirds(ish)
hs.hotkey.bind(hyper,"1", function() gridWindow({0, 0, 5, 9}) end)
hs.hotkey.bind(hyper,"2", function() gridWindow({5, 0, 6, 9}) end)
hs.hotkey.bind(hyper,"3", function() gridWindow({11, 0, 5, 9}) end)

-- biased (70/30 ish)
hs.hotkey.bind(hyper,"[", function() gridWindow({0, 0, 10, 9}) end)
hs.hotkey.bind(hyper,"]", function() gridWindow({10, 0, 6, 9}) end)
hs.hotkey.bind(hyper,"q", function() gridWindow({0, 0, 6, 9}) end)
hs.hotkey.bind(hyper,"e", function() gridWindow({6, 0, 10, 9}) end)

-- layout1 = {
--  {"Mail", nil, "Color LCD", hs.layout.maximized, nil, nil},
--  {"Safari", nil, "Thunderbolt Display", hs.layout.maximized, nil, nil},
--  {"iTunes", "iTunes", "Color LCD", hs.layout.maximized, nil, nil},
--  {"iTunes", "MiniPlayer", "Color LCD", nil, nil, hs.geometry.rect(0, -48, 400, 48)},
-- }
