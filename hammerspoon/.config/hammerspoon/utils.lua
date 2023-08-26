function fancyNotify(t, m)
    hs.notify.new({ title = t, informativeText = m }):send():release()
end
