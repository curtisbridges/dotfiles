-- Settings
local MAX_WIDTH = 10
local MIN_WIDTH = 2
local MAX_HEIGHT = 10
local MIN_HEIGHT = 3

hs.grid.setGrid('10x10')
hs.grid.setMargins('10, 10')

hs.window.animationDuration = 0.0

-- Functions
local function getWin()
  return hs.window.focusedWindow()
end

local function gridWindow(cell)
  local win = hs.window.focusedWindow()
  local screen = win:screen()

  hs.grid.set(win, cell, screen)
end

-- window positions
local previousFrameSizes = {}
-- custom maximize toggle
local function toggleMaximize()
  local curWin = hs.window.focusedWindow()
  local curWinFrame = curWin:frame()

  -- if current window has a stored size
  if previousFrameSizes[curWin:id()] then
    -- restore frame position and reset storage
    curWin:setFrame(previousFrameSizes[curWin:id()])
    previousFrameSizes[curWin:id()] = nil
  else
    -- store current frame position
    previousFrameSizes[curWin:id()] = hs.geometry.copy(curWinFrame)
    gridWindow({0, 0, MAX_WIDTH, MAX_HEIGHT})
  end
end

local function modifyUp()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local sg = hs.grid.getGrid(screen)
  local g = hs.grid.get(win)
  if g.y + g.h >= sg.h and g.y ~= 0 then
    g.y = g.y - 1
    g.h = g.h + 1
    hs.grid.set(win, g)
  else
    g.h = g.h - 1
    hs.grid.set(win, g)
  end
end

local function modifyDown()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local sg = hs.grid.getGrid(screen)
  local g = hs.grid.get(win)
  if g.y + g.h == sg.h then
    g.y = g.y + 1
    g.h = g.h - 1
    hs.grid.set(win, g)
  else
    g.h = g.h + 1
    hs.grid.set(win, g)
  end
  -- if pinned to top, grow down until hits screen bottom
  -- if not pinned, move window down until window bottom hits screen bottom
end

local function modifyLeft()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()

  local sg = hs.grid.getGrid(screen)
  local g = hs.grid.get(win)
  if g.x + g.w >= sg.w and g.x ~= 0 then
    g.x = g.x - 1
    g.w = g.w + 1
    hs.grid.set(win, g)
  else
    g.w = g.w - 1
    hs.grid.set(win, g)
  end
  -- if pinned left, shrink to the shrink the window to minimum size
  -- if not pinned, move window left until window bottom hits screen left
end

local function modifyRight()
  local win = hs.window.focusedWindow()
  if win == nil then return end
  local screen = win:screen()
  local sg = hs.grid.getGrid(screen)
  local g = hs.grid.get(win)
  if g.x + g.w == sg.w then
    g.x = g.x + 1
    g.w = g.w - 1
    hs.grid.set(win, g)
  else
    g.w = g.w + 1
    hs.grid.set(win, g)
  end
end

--
-- Bindings
--

-- halves
hs.hotkey.bind( hyper, 'q', function() gridWindow({0, 0, 5, MAX_HEIGHT}) end ) -- first half
hs.hotkey.bind( hyper, 'e', function() gridWindow({5, 0, 5, MAX_HEIGHT}) end ) -- second half

-- thirds(ish) -> 33|33|33 or 30|40|30
hs.hotkey.bind( hyper, '1', function() gridWindow({0, 0, 3, MAX_HEIGHT}) end ) -- first third
hs.hotkey.bind( hyper, '2', function() gridWindow({3, 0, 4, MAX_HEIGHT}) end ) -- second third
hs.hotkey.bind( hyper, '3', function() gridWindow({7, 0, 3, MAX_HEIGHT}) end ) -- last third
hs.hotkey.bind( hyper, '4', function() gridWindow({3, 0, 7, MAX_HEIGHT}) end ) -- last 70

-- window state
hs.hotkey.bind( hyper, 'space', function() toggleMaximize() end )
hs.hotkey.bind( hyper, 'z', function() local win = getWin() win:toggleZoom() end )
hs.hotkey.bind( hyper, 'x', function() toggleMaximize() end )
hs.hotkey.bind( hyper, 'c', function() local win = getWin() win:centerOnScreen() end )
-- v is clipboard manager
hs.hotkey.bind( hyper, 'b', function() local win = getWin() win:sendToBack() end )
hs.hotkey.bind( hyper, 'f', function() local win = getWin() win:toggleFullScreen() end )

-- snap window to grid
hs.hotkey.bind( hyper, 'g', function() hs.grid.snap(getWin()) end )

hs.hotkey.bind( hyper, 'h', function() hs.expose.show() end ) -- doesn't work for some reason

-- move window to next screen
-- hs.hotkey.bind( hyper, ".", function() local win = getWin() win:moveToScreen(win:screen():next()) end )
-- hs.hotkey.bind( hyper, ",", function() local win = getWin() win:moveToScreen(win:screen():previous()) end )

-- move windows
hs.hotkey.bind( meh, 'up', function() hs.grid.pushWindowUp() end )
hs.hotkey.bind( meh, 'right', function() hs.grid.pushWindowRight() end )
hs.hotkey.bind( meh, 'left', function() hs.grid.pushWindowLeft() end )
hs.hotkey.bind( meh, 'down', function() hs.grid.pushWindowDown() end )

-- adjust window size
hs.hotkey.bind( hyper, '-', function() hs.grid.resizeWindowThinner() end )
hs.hotkey.bind( hyper, '=', function() hs.grid.resizeWindowWider() end )
hs.hotkey.bind( hyper, 'pageup', function() hs.grid.resizeWindowShorter() end )
hs.hotkey.bind( hyper, 'pagedown', function() hs.grid.resizeWindowTaller() end )

hs.hotkey.bind( hyper, 'up', function() modifyUp() end)
hs.hotkey.bind( hyper, 'right', function() modifyRight() end )
hs.hotkey.bind( hyper, 'left', function() modifyLeft() end )
hs.hotkey.bind( hyper, 'down', function() modifyDown() end )

-- focus windows
hs.hotkey.bind( hyper, 'w', function() local win = getWin() win:focusWindowNorth() end )
hs.hotkey.bind( hyper, 'd', function() local win = getWin() win:focusWindowEast() end )
hs.hotkey.bind( hyper, 'a', function() local win = getWin() win:focusWindowWest() end )
hs.hotkey.bind( hyper, 's', function() local win = getWin() win:focusWindowSouth() end )
