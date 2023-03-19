local main_layout = {
  { "Safari", nil, MAIN_MONITOR, hs.layout.maximized, nil, nil },
  { "Mail",   nil, MAIN_MONITOR, hs.layout.hidden,    nil, nil },
}

hs.hotkey.bind(hyper, '1', function()
  hs.application.launchOrFocus('Safari')
  hs.application.launchOrFocus('Mail')

  hs.layout.apply(main_layout)
end)
