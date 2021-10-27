-- -------------------------------------------------------------------
-- Window managment & Grid
-- -------------------------------------------------------------------
-- Stolen from:
-- https://github.com/ahmedelgabri/dotfiles/blob/main/config/.hammerspoon/window-managment.lua

-- https://github.com/wincent/wincent/blob/a33430e43464842c067016e507ab91abd6569948/roles/dotfiles/files/.hammerspoon/init.lua
local lastSeenChain = nil
local lastSeenWindow = nil
local lastSeenAt = nil

hs.grid.setGrid '12x12'
hs.grid.MARGINX = 10
hs.grid.MARGINY = 10

local grid = {
  topBig = '2,0 8x12',
  topMedium = '3,0 6x9',
  topSmall = '4,0 4x6',
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
  centeredBig = '3,3 6x6',
  centeredSmall = '4,4 4x4',
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
    elseif sequenceNumber == 1 then
      -- At end of chain, restart chain on next screen.
      screen = screen:next()
    end
    lastSeenAt = now
    lastSeenWindow = id

    hs.grid.set(win, movements[sequenceNumber], screen)
    sequenceNumber = sequenceNumber % cycleLength + 1
  end
end

local function alertCannotManipulateWindow()
  hs.alert.show "Can't move window"
end

--
-- Key bindings.
--

-- hs.hotkey.bind( hyper, 'w', chain { grid.topHalf, grid.topThird, grid.topTwoThirds, } )
hs.hotkey.bind( hyper, 'w', chain { grid.topBig, grid.topMedium, grid.topSmall })
hs.hotkey.bind( hyper, 'd', chain { grid.rightHalf, grid.rightThird, grid.rightTwoThirds, } )
hs.hotkey.bind( hyper, 's', chain { grid.bottomHalf, grid.bottomThird, grid.bottomTwoThirds, } )
hs.hotkey.bind( hyper, 'a', chain { grid.leftHalf, grid.leftThird, grid.leftTwoThirds, } )

hs.hotkey.bind( hyper, 'c', chain { grid.centeredBig, grid.centeredSmall, } )
hs.hotkey.bind( hyper, 'f', function() local win = hs.window.frontmostWindow() win:setFullscreen(not win:isFullscreen()) end)

----------------------------------------------------------------------------------------------------
-- resizeM modal environment
if spoon.WinWin then
    spoon.ModalMgr:new("resizeM")
    local cmodal = spoon.ModalMgr.modal_list["resizeM"]

    cmodal:bind('', 'escape', 'Deactivate resizeM', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
    cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end)

    cmodal:bind('', 'f', 'Fullscreen', function() spoon.WinWin:moveAndResize("fullscreen") end)
    cmodal:bind('', 'c', 'Center Window', function() spoon.WinWin:moveAndResize("center") end)

    cmodal:bind('', 'a', 'Left Half of Screen', function() spoon.WinWin:moveAndResize("halfleft") end)
    cmodal:bind('', 'd', 'Right Half of Screen', function() spoon.WinWin:moveAndResize("halfright") end)
    cmodal:bind('', 'w', 'Top Half of Screen', function() spoon.WinWin:moveAndResize("halfup") end)
    cmodal:bind('', 's', 'Bottom Half of Screen', function() spoon.WinWin:moveAndResize("halfdown") end)

    cmodal:bind('', 'q', 'NorthWest Corner', function() spoon.WinWin:moveAndResize("cornerNW") end)
    cmodal:bind('', 'e', 'NorthEast Corner', function() spoon.WinWin:moveAndResize("cornerNE") end)
    cmodal:bind('', 'z', 'SouthWest Corner', function() spoon.WinWin:moveAndResize("cornerSW") end)
    cmodal:bind('', 'c', 'SouthEast Corner', function() spoon.WinWin:moveAndResize("cornerSE") end)

    cmodal:bind('', 'left', 'Move Left', function() spoon.WinWin:stepMove("left") end, nil, function() spoon.WinWin:stepMove("left") end)
    cmodal:bind('', 'right', 'Move Right', function() spoon.WinWin:stepMove("right") end, nil, function() spoon.WinWin:stepMove("right") end)
    cmodal:bind('', 'up', 'Move Up', function() spoon.WinWin:stepMove("up") end, nil, function() spoon.WinWin:stepMove("up") end)
    cmodal:bind('', 'down', 'Move Down', function() spoon.WinWin:stepMove("down") end, nil, function() spoon.WinWin:stepMove("down") end)

    cmodal:bind('', '-', 'Shrink Inward', function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)
    cmodal:bind('', '=', 'Stretch Outward', function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)

    cmodal:bind('shift', 'a', 'Resize Left', function() spoon.WinWin:stepResize("left") end)
    cmodal:bind('shift', 'd', 'Resize Right', function() spoon.WinWin:stepResize("right") end)
    cmodal:bind('shift', 'w', 'Resize Up', function() spoon.WinWin:stepResize("up") end)
    cmodal:bind('shift', 's', 'Resize Down', function() spoon.WinWin:stepResize("down") end)

    cmodal:bind('', ',', 'Move to Left Screen', function() spoon.WinWin:moveToScreen("left") end)
    cmodal:bind('', '.', 'Move to Right Screen', function() spoon.WinWin:moveToScreen("right") end)
    cmodal:bind('', '/', 'Move to Next Screen', function() spoon.WinWin:moveToScreen("next") end)

    cmodal:bind('cmd', 'z', 'Undo Window Manipulation', function() spoon.WinWin:undo() end)
    cmodal:bind('', 'X', 'Center Cursor', function() spoon.WinWin:centerCursor() end)

    -- Register resizeM with modal supervisor
    hsresizeM_keys = hsresizeM_keys or {hyper, "return"}
    if string.len(hsresizeM_keys[2]) > 0 then
        spoon.ModalMgr.supervisor:bind(hsresizeM_keys[1], hsresizeM_keys[2], "Enter resizeM Environment", function()
            -- Deactivate some modal environments or not before activating a new one
            spoon.ModalMgr:deactivateAll()
            -- Show an status indicator so we know we're in some modal environment now
            spoon.ModalMgr:activate({"resizeM"}, "#B22222")
        end)
    end
end
