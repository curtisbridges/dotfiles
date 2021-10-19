hs.grid.setGrid('16x9')
hs.grid.setMargins('10x10')

hs.window.animationDuration = 0

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

-- maximized
hs.hotkey.bind(hyper, "\\", function() hs.grid.maximizeWindow() end)
-- full screen
-- this one for fullscreen mode
 hs.hotkey.bind(hyper, "return", function() local win = hs.window.frontmostWindow() win:setFullscreen(not win:isFullscreen()) end)

-- halves
hs.hotkey.bind(hyper,"[", function() gridWindow({0, 0, 8, 9}) end)
hs.hotkey.bind(hyper,"]", function() gridWindow({8, 0, 8, 9}) end)

-- thirds(ish)
hs.hotkey.bind(hyper,"1", function() gridWindow({0, 0, 5, 9}) end)
hs.hotkey.bind(hyper,"2", function() gridWindow({5, 0, 6, 9}) end)
hs.hotkey.bind(hyper,"3", function() gridWindow({11, 0, 5, 9}) end)

-- biased (70/30 ish)
hs.hotkey.bind(hyper,"pageup", function() gridWindow({0, 0, 10, 9}) end)
hs.hotkey.bind(hyper,"pagedown", function() gridWindow({10, 0, 6, 9}) end)
