--
-- Key bindings.
--
-- WindowManager modal environment
if spoon.WinWin then
  spoon.ModalMgr:new('WindowManager')
  local cmodal = spoon.ModalMgr.modal_list['WindowManager']

  -- modal related
  cmodal:bind( '', 'escape', 'Deactivate WindowManager', function() spoon.ModalMgr:deactivate({'WindowManager'}) end )
  cmodal:bind( '', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end )

  -- big state changes
  cmodal:bind( '', 'f', 'Fullscreen', function() spoon.WinWin:moveAndResize('fullscreen') end )
  cmodal:bind( '', 'c', 'Center Window', function() spoon.WinWin:moveAndResize('center') end )
  cmodal:bind( '', 'space', 'Maximize Window', function() local win = getWin() win:toggleFullScreen() end )

  -- halves
  cmodal:bind( '', 'w', 'Top Half of Screen', function() spoon.WinWin:moveAndResize('halfup') end )
  cmodal:bind( '', 'a', 'Left Half of Screen', function() spoon.WinWin:moveAndResize('halfleft') end )
  cmodal:bind( '', 'd', 'Right Half of Screen', function() spoon.WinWin:moveAndResize('halfright') end )
  cmodal:bind( '', 's', 'Bottom Half of Screen', function() spoon.WinWin:moveAndResize('halfdown') end )

  -- quarters
  cmodal:bind( '', 'q', 'NorthWest Corner', function() spoon.WinWin:moveAndResize('cornerNW') end )
  cmodal:bind( '', 'e', 'NorthEast Corner', function() spoon.WinWin:moveAndResize('cornerNE') end )
  cmodal:bind( '', 'z', 'SouthWest Corner', function() spoon.WinWin:moveAndResize('cornerSW') end )
  cmodal:bind( '', 'c', 'SouthEast Corner', function() spoon.WinWin:moveAndResize('cornerSE') end )

  -- step moves
  cmodal:bind( '', 'left', 'Move Left', function() spoon.WinWin:stepMove('left') end, nil,
    function() spoon.WinWin:stepMove('left') end )
  cmodal:bind( '', 'right', 'Move Right', function() spoon.WinWin:stepMove('right') end, nil,
    function() spoon.WinWin:stepMove('right') end )
  cmodal:bind( '', 'up', 'Move Up', function() spoon.WinWin:stepMove('up') end, nil,
    function() spoon.WinWin:stepMove('up') end )
  cmodal:bind( '', 'down', 'Move Down', function() spoon.WinWin:stepMove('down') end, nil,
    function() spoon.WinWin:stepMove('down') end )

  -- step resize
  cmodal:bind( 'shift', 'left', 'Resize Left', function() spoon.WinWin:stepResize('left') end )
  cmodal:bind( 'shift', 'right', 'Resize Right', function() spoon.WinWin:stepResize('right') end )
  cmodal:bind( 'shift', 'up', 'Resize Up', function() spoon.WinWin:stepResize('up') end )
  cmodal:bind( 'shift', 'down', 'Resize Down', function() spoon.WinWin:stepResize('down') end )

  -- grow and shrink
  cmodal:bind( '', '-', 'Shrink Inward', function() spoon.WinWin:moveAndResize('shrink') end,
    nil, function() spoon.WinWin:moveAndResize('shrink') end )
  cmodal:bind( '', '=', 'Stretch Outward', function() spoon.WinWin:moveAndResize('expand') end,
    nil, function() spoon.WinWin:moveAndResize('expand') end )

  -- screen moves
  cmodal:bind( '', ',', 'Move to Left Screen', function() spoon.WinWin:moveToScreen('left') end )
  cmodal:bind( '', '.', 'Move to Right Screen', function() spoon.WinWin:moveToScreen('right') end )
  cmodal:bind( '', 'n', 'Move to Next Screen', function() spoon.WinWin:moveToScreen('next') end )

  -- utils
  cmodal:bind( 'cmd', 'z', 'Undo Window Manipulation', function() spoon.WinWin:undo() end )
  cmodal:bind( '', 'X', 'Center Cursor', function() spoon.WinWin:centerCursor() end )

  -- Register WindowManager with modal supervisor
  hsWindowManager_keys = hsWindowManager_keys or {hyper, 'return'}
  if string.len(hsWindowManager_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(
      hsWindowManager_keys[1],
      hsWindowManager_keys[2],
      'Enter WindowManager Environment',
      function()
        -- Deactivate some modal environments or not before activating a new one
        spoon.ModalMgr:deactivateAll()
        -- Show an status indicator so we know we're in some modal environment now
        spoon.ModalMgr:activate({'WindowManager'}, '#B22222')
      end
    )
  end
end
