-- Poor man's tiling window manager

hs.window.animationDuration = 0
units = {
  left50  = { x = 0.0025, y = 0.005, w = 0.495, h = 0.99 },
  right50 = { x = 0.5025, y = 0.005, w = 0.495, h = 0.99 },
  up50    = { x = 0.0025, y = 0.005, w = 0.995, h = 0.49 },
  down50  = { x = 0.0025, y = 0.5025, w = 0.995, h = 0.49 },
  max     = { x = 0.0025, y = 0.005, w = 0.995, h = 0.99 },
}

mash = { 'shift', 'ctrl' }
hs.hotkey.bind(mash, 'left', function()
  hs.window.focusedWindow():move(units.left50, nil, true)
end)
hs.hotkey.bind(mash, 'right', function()
  hs.window.focusedWindow():move(units.right50, nil, true)
end)
hs.hotkey.bind(mash, 'up', function()
  hs.window.focusedWindow():move(units.up50, nil, true)
end)
hs.hotkey.bind(mash, 'down', function()
  hs.window.focusedWindow():move(units.down50, nil, true)
end)
hs.hotkey.bind(mash, 'return', function()
  hs.window.focusedWindow():move(units.max, nil, true)
end)
