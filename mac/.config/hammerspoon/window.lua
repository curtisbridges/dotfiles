-- Settings
hs.grid.setGrid('12x12')
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
hs.hotkey.bind(hyper, 'space', function() hs.grid.maximizeWindow() end)
-- mostly maxed window
-- hs.hotkey.bind(hyper, "w", function() gridWindow({2, 0, 12, 9}) end)

-- minimize window
-- hs.hotkey.bind(hyper, "s", function() local win = hs.window.frontmostWindow() win:minimize() end)
-- hs.hotkey.bind(hyper, "s", function() gridWindow({5, 0, 6, 5}) end)
-- hs.hotkey.bind(hyper, "c", function() local win = hs.window.frontmostWindow() win:centerOnScreen() end)

-- full screen
-- hs.hotkey.bind(hyper, "f", function() local win = hs.window.frontmostWindow() win:setFullscreen(not win:isFullscreen()) end)

-- move window to next screen
hs.hotkey.bind(hyper, '.', function() local win = getWin(); win:moveToScreen(win:screen():next()) end)
hs.hotkey.bind(hyper, ',', function() local win = getWin(); win:moveToScreen(win:screen():previous()) end)

-- snap window to grid
-- hs.hotkey.bind(hyper, "s", function() hs.grid.snap(getWin()) end)

-- move windows
hs.hotkey.bind(meh, 'up', function() hs.grid.pushWindowUp() end)
hs.hotkey.bind(meh, 'right', function() hs.grid.pushWindowRight() end)
hs.hotkey.bind(meh, 'left', function() hs.grid.pushWindowLeft() end)
hs.hotkey.bind(meh, 'down', function() hs.grid.pushWindowDown() end)

-- resize windows
hs.hotkey.bind(hyper, 'up', function() hs.grid.resizeWindowTaller() end)
hs.hotkey.bind(hyper, 'right', function() hs.grid.resizeWindowThinner() end)
hs.hotkey.bind(hyper, 'left', function() hs.grid.resizeWindowWider() end)
hs.hotkey.bind(hyper, 'down', function() hs.grid.resizeWindowShorter() end)

-- halves
-- hs.hotkey.bind(hyper,"a", function() gridWindow({0, 0, 6, 12}) end)
-- hs.hotkey.bind(hyper,"d", function() gridWindow({6, 0, 6, 12}) end)

-- thirds(ish)
hs.hotkey.bind(hyper, '1', function() gridWindow({0, 0, 4, 12}) end)
hs.hotkey.bind(hyper, '2', function() gridWindow({4, 0, 4, 12}) end)
hs.hotkey.bind(hyper, '3', function() gridWindow({8, 0, 4, 12}) end)

-- biased (70/30 ish)
-- hs.hotkey.bind(hyper,"[", function() gridWindow({0, 0, 8, 12}) end)
-- hs.hotkey.bind(hyper,"]", function() gridWindow({8, 0, 6, 12}) end)
-- hs.hotkey.bind(hyper,"q", function() gridWindow({0, 0, 8, 12}) end)
-- hs.hotkey.bind(hyper,"e", function() gridWindow({8, 0, 4, 12}) end)
