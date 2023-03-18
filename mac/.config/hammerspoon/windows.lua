-- -------------------------------------------------------------------
-- Window managment & Grid
-- -------------------------------------------------------------------

-- https://github.com/wincent/wincent/blob/a33430e43464842c067016e507ab91abd6569948/roles/dotfiles/files/.hammerspoon/init.lua
local lastSeenChain = nil
local lastSeenWindow = nil
local lastSeenAt = nil

hs.window.animationDuration = .1

hs.grid.setGrid '12x12'
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

local grid = {
  topHalf = '0,0 12x6',
  topThird = '0,0 12x4',
  topTwoThirds = '0,0 12x8',
  rightHalf = '6,0 6x12',
  rightThird = '8,0 4x12',
  rightTwoThirds = '4,0 8x12',
  bottomHalf = '0,6 12x6',
  bottomThird = '0,8 12x4',
  bottomTwoThirds = '0,4 12x8',
  leftHalf = '0,0 6x12',
  leftThird = '0,0 4x12',
  leftTwoThirds = '0,0 8x12',
  topLeft = '0,0 6x6',
  topRight = '6,0 6x6',
  bottomRight = '6,6 6x6',
  bottomLeft = '0,6 6x6',
  fullScreen = '0,0 12x12',
  centeredBig = '3,0 6x12',
  centeredSmall = '4,0 4x6',
}

-- Chain the specified movement commands.
--
-- This is like the 'chain' feature in Slate, but with a couple of enhancements:
--
--  - Chains always start on the screen the window is currently on.
--  - A chain will be reset after 2 seconds of inactivity, or on switching from
--    one chain to another, or on switching from one app to another, or from one
--    window to another.
--
local function chain(movements)
  local chainResetInterval = 2   -- seconds
  local cycleLength = #movements
  local sequenceNumber = 1

  return function()
    local win = hs.window.frontmostWindow()
    local id = win:id()
    local now = hs.timer.secondsSinceEpoch()
    local screen = win:screen()

    if
        lastSeenChain ~= movements
        or lastSeenAt < now - chainResetInterval
        or lastSeenWindow ~= id
    then
      sequenceNumber = 1
      lastSeenChain = movements
    elseif sequenceNumber == 1 then
      -- At end of chain, restart chain on next screen.
      -- screen = screen:next()
    end
    lastSeenAt = now
    lastSeenWindow = id

    hs.grid.set(win, movements[sequenceNumber], screen)
    sequenceNumber = sequenceNumber % cycleLength + 1
  end
end

--
-- Key bindings.
--

hs.hotkey.bind(meh, 'up', chain { grid.topHalf, grid.topThird, grid.topTwoThirds, })
hs.hotkey.bind(meh, 'right', chain { grid.rightHalf, grid.rightThird, grid.rightTwoThirds, })
hs.hotkey.bind(meh, 'down', chain { grid.bottomHalf, grid.bottomThird, grid.bottomTwoThirds, })
hs.hotkey.bind(meh, 'left', chain { grid.leftHalf, grid.leftThird, grid.leftTwoThirds, })

hs.hotkey.bind(meh, '|', chain { grid.centeredBig, grid.centeredSmall, })
hs.hotkey.bind(meh, 'f',
  function()
    local win = hs.window.frontmostWindow()
    win:setFullscreen(not win:isFullscreen())
  end)

-- half of screen
-- hs.hotkey.bind(meh, 'left', function() hs.window.focusedWindow():moveToUnit({ 0, 0, 0.5, 1 }) end)
-- hs.hotkey.bind(meh, 'right', function() hs.window.focusedWindow():moveToUnit({ 0.5, 0, 0.5, 1 }) end)
-- hs.hotkey.bind(meh, 'up', function() hs.window.focusedWindow():moveToUnit({ 0, 0, 1, 0.5 }) end)
-- hs.hotkey.bind(meh, 'down', function() hs.window.focusedWindow():moveToUnit({ 0, 0.5, 1, 0.5 }) end)

-- quarter of screen
hs.hotkey.bind(meh, '1', function() hs.window.focusedWindow():moveToUnit({ 0, 0, 0.5, 0.5 }) end)
hs.hotkey.bind(meh, '2', function() hs.window.focusedWindow():moveToUnit({ 0.5, 0, 0.5, 0.5 }) end)
hs.hotkey.bind(meh, '3', function() hs.window.focusedWindow():moveToUnit({ 0.5, 0.5, 0.5, 0.5 }) end)
hs.hotkey.bind(meh, '4', function() hs.window.focusedWindow():moveToUnit({ 0, 0.5, 0.5, 0.5 }) end)

-- full screen
hs.hotkey.bind(meh, 'return', function() hs.window.focusedWindow():moveToUnit({ 0, 0, 1, 1 }) end)

-- center screen
hs.hotkey.bind(meh, 'c', function() hs.window.focusedWindow():centerOnScreen() end)

-- move between displays
hs.hotkey.bind(meh, '.', function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast(true, true)
end)
hs.hotkey.bind(meh, ',', function()
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest(true, true)
end)

-- grid gui
-- hs.grid.setMargins({ w = 0, h = 0 })
-- hs.hotkey.bind(meh, 'g', hs.grid.show)
