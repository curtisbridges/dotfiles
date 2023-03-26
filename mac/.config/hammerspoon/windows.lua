-- -------------------------------------------------------------------
-- Window managment & Grid
-- -------------------------------------------------------------------
hs.grid.setGrid '24x24'
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0

-- https://github.com/wincent/wincent/blob/a33430e43464842c067016e507ab91abd6569948/roles/dotfiles/files/.hammerspoon/init.lua
local lastSeenChain = nil
local lastSeenWindow = nil
local lastSeenAt = nil

local grid = {
  topHalf = '0,0 24x12',
  topThird = '0,0 24x8',
  topTwoThirds = '0,0 24x16',
  rightHalf = '12,0 12x24',
  rightHalfMedium = '13,2 9x20',
  rightHalfSmall = '13,2 8x16',
  rightThird = '16,0 8x24',
  rightTwoThirds = '8,0 18x24',
  bottomHalf = '0,12 24x12',
  bottomThird = '0,16 24x8',
  bottomTwoThirds = '0,8 24x18',
  leftHalf = '0,0 12x24',
  leftHalfMedium = '3,2 9x20',
  leftHalfSmall = '3,2 8x16',
  leftThird = '0,0 8x24',
  leftTwoThirds = '0,0 16x24',
  topLeft = '0,0 12x12',
  topRight = '12,0 12x12',
  bottomRight = '12,12 12x12',
  bottomLeft = '0,12 12x12',
  fullScreen = '0,0 24x24',
  centeredBig = '6,0 12x18',
  centeredMedium = '7,0 10x15',
  centeredSmall = '8,0 8x12',
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
    local chainResetInterval = 2 -- seconds
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
        -- elseif sequenceNumber == 1 then
            -- At end of chain, restart chain on next screen.
            -- screen = screen:next()
        end
        lastSeenAt = now
        lastSeenWindow = id

        hs.grid.set(win, movements[sequenceNumber], screen)
        sequenceNumber = sequenceNumber % cycleLength + 1
    end
end

-- move current window to the space sp
function moveFocusToSpace(sp)
  local win = hs.window.focusedWindow() -- current window
  local cur_screen = hs.screen.mainScreen()
  local cur_screen_id = cur_screen:getUUID()
  local all_spaces = hs.spaces.allSpaces()
  local spaceID = all_spaces[cur_screen_id][sp]

  hs.spaces.moveWindowToSpace(win:id(), spaceID)
  hs.spaces.gotoSpace(spaceID) -- follow window to new space
  win:focus()
end

function moveToNextScreen()
  local app = hs.window.focusedWindow()
  app:moveToScreen(app:screen():next())
  app:maximize()
end

function moveToPrevScreen()
  local app = hs.window.focusedWindow()
  app:moveToScreen(app:screen():previous())
  app:maximize()
end

--
-- Key bindings.
--
hs.hotkey.bind(meh, 'up', chain { grid.topHalf, grid.topThird, grid.topTwoThirds, })
hs.hotkey.bind(meh, 'right', chain { grid.rightHalf, grid.rightThird, grid.rightTwoThirds, })
hs.hotkey.bind(meh, 'down', chain { grid.bottomHalf, grid.bottomThird, grid.bottomTwoThirds, })
hs.hotkey.bind(meh, 'left', chain { grid.leftHalf, grid.leftThird, grid.leftTwoThirds, })

-- half of screen
hs.hotkey.bind(meh, '[', chain { grid.leftHalf, grid.leftHalfMedium, grid.leftHalfSmall, })
hs.hotkey.bind(meh, ']', chain { grid.rightHalf, grid.rightHalfMedium, grid.rightHalfSmall, })
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
hs.hotkey.bind(meh, '\\', chain { grid.centeredBig, grid.centeredMedium, grid.centeredSmall })
hs.hotkey.bind(meh, 'f', function() hs.window.focusedWindow():toggleFullScreen() end)
hs.hotkey.bind(meh, 'm', chain { grid.fullScreen })
hs.hotkey.bind(meh, 'z', function() hs.window.focusedWindow():toggleZoom() end)

-- center screen
hs.hotkey.bind(meh, 'home', function() hs.window.focusedWindow():moveToUnit({ 0.3, 0.0, 0.45, 0.65 }) end)
hs.hotkey.bind(meh, 'c', function() hs.window.focusedWindow():centerOnScreen() end)

-- move between displays
hs.hotkey.bind(mod_move, '.', function() hs.window.focusedWindow():moveOneScreenEast(true, true) end)
hs.hotkey.bind(mod_move, ',', function() hs.window.focusedWindow():moveOneScreenWest(true, true) end)
hs.hotkey.bind(mod_move, 'n', moveToNextScreen)
hs.hotkey.bind(mod_move, 'p', moveToPrevScreen)

-- move between spaces
hs.hotkey.bind(hyper, '1', function() moveFocusToSpace(1) end)
hs.hotkey.bind(hyper, '2', function() moveFocusToSpace(2) end)
hs.hotkey.bind(hyper, '3', function() moveFocusToSpace(3) end)
hs.hotkey.bind(hyper, '4', function() moveFocusToSpace(4) end)

-- grid gui
-- hs.grid.setMargins({ w = 0, h = 0 })
-- hs.hotkey.bind(meh, 'g', hs.grid.show)

-- Move Window
hs.hotkey.bind(mod_move, 'down', hs.grid.pushWindowDown)
hs.hotkey.bind(mod_move, 'up', hs.grid.pushWindowUp)
hs.hotkey.bind(mod_move, 'left', hs.grid.pushWindowLeft)
hs.hotkey.bind(mod_move, 'right', hs.grid.pushWindowRight)

-- Resize Window
hs.hotkey.bind(meh, 'pageup', hs.grid.resizeWindowShorter)
hs.hotkey.bind(meh, 'pagedown', hs.grid.resizeWindowTaller)
hs.hotkey.bind(meh, '=', hs.grid.resizeWindowWider)
hs.hotkey.bind(meh, '-', hs.grid.resizeWindowThinner)
