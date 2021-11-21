function findOrLaunch(a)
  local app = hs.application.find(a)
  if not app then
    hs.application.launchOrFocus(a)
  end
  return hs.application.find(a)
end

function toggleApplication(name)
  local app = hs.application.find(name)
  if not app or app:isHidden() then
    hs.application.launchOrFocus(name)
  elseif hs.application.frontmostApplication() ~= app then
    app:activate()
  else
    app:hide()
  end
end

function fancyNotify(t,m)
     hs.notify.new({title=t, informativeText=m}):send():release()
end

-- function file_exists(path)
--     local f=io.open(path,"r")
--     if f~=nil then io.close(f) return true else return false end
--     -- ~= is != in other languages
-- end
-- function launchApp(name)
--     -- .. is concat string operator
--     return function()
--         path = "/Applications/" .. name .. ".app"
--         if file_exists(path) then
--             hs.application.launchOrFocus(path)
--             return
--         end
--         path = "/System/Library/CoreServices/" .. name .. ".app"
--         if file_exists(path) then
--             hs.application.launchOrFocus(path)
--             return
--         end
--         path = "/System/Applications/" .. name .. ".app"
--         if file_exists(path) then
--             hs.application.launchOrFocus(path)
--             return
--         end
--     end
-- end
