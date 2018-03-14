hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
  hs.window.focusedWindow():maximize()
end)

-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "up", function()
--   hs.window.focusedWindow():moveToUnit(hs.geometry.center)
-- end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "down", function()
  hs.window.focusedWindow():setSize(1680 + math.random(-10, 10), 1050 + math.random(-10, 10))
  hs.window.focusedWindow():setTopLeft(180 + math.random(-10, 10), 100 + math.random(-10, 10))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
  hs.window.focusedWindow():moveOneScreenWest()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
  hs.window.focusedWindow():moveOneScreenEast()
end)

-- source: https://github.com/rtoshiro/hammerspoon-init/blob/2d44c918d61a5b0f267d74a990a7f0a991730ecd/init.lua
hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "right", function()
  local win = hs.window.focusedWindow()
  win:right()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "left", function()
  local win = hs.window.focusedWindow()
  win:left()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "up", function()
  local win = hs.window.focusedWindow()
  win:up()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "down", function()
  local win = hs.window.focusedWindow()
  win:down()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "[", function()
  local win = hs.window.focusedWindow()
  win:upLeft()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "'", function()
  local win = hs.window.focusedWindow()
  win:downLeft()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "]", function()
  local win = hs.window.focusedWindow()
  win:upRight()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, ".", function()
  print "left66a"
  local win = hs.window.focusedWindow()
  win:left66()
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "\\", function()
  local win = hs.window.focusedWindow()
  win:downRight()
end)

-- +-----------------+
-- |        |        |
-- |        |  HERE  |
-- |        |        |
-- +-----------------+
function hs.window.right(win)
  -- local minFrame = hs.screen.minFrame(win:screen(), false)
  -- minFrame.x = minFrame.x + (minFrame.w/2)
  -- minFrame.w = minFrame.w/2
  -- win:setFrame(minFrame)
  local frame = win:screen():frame()
  frame.x = frame.x + (frame.w/2)
  frame.w = frame.w/2
  win:setFrame(frame)
end

-- +-----------------+
-- |        |        |
-- |  HERE  |        |
-- |        |        |
-- +-----------------+
function hs.window.left(win)
  local frame = win:screen():frame()
  frame.w = frame.w/2
  win:setFrame(frame)
end

function hs.window.left66(win)
  print "left66"
  local frame = win:screen():frame()
  frame.w = frame.w * 0.6666
  win:setFrame(frame)
end

-- +-----------------+
-- |      HERE       |
-- +-----------------+
-- |                 |
-- +-----------------+
function hs.window.up(win)
  local frame = win:screen():frame()
  frame.h = frame.h/2
  win:setFrame(frame)
end

-- +-----------------+
-- |                 |
-- +-----------------+
-- |      HERE       |
-- +-----------------+
function hs.window.down(win)
  local frame = win:screen():frame()
  frame.y = frame.y + frame.h/2
  frame.h = frame.h/2
  win:setFrame(frame)
end

-- +-----------------+
-- |  HERE  |        |
-- +--------+        |
-- |                 |
-- +-----------------+
function hs.window.upLeft(win)
  local frame = win:screen():frame()
  frame.w = frame.w/2
  frame.h = frame.h/2
  win:setFrame(frame)
end

-- +-----------------+
-- |                 |
-- +--------+        |
-- |  HERE  |        |
-- +-----------------+
function hs.window.downLeft(win)
  local frame = win:screen():frame()
  win:setFrame({
    x = frame.x,
    y = frame.y + frame.h/2,
    w = frame.w/2,
    h = frame.h/2
  })
end

-- +-----------------+
-- |                 |
-- |        +--------|
-- |        |  HERE  |
-- +-----------------+
function hs.window.downRight(win)
  local frame = win:screen():frame()
  win:setFrame({
    x = frame.x + frame.w/2,
    y = frame.y + frame.h/2,
    w = frame.w/2,
    h = frame.h/2
  })
end

-- +-----------------+
-- |        |  HERE  |
-- |        +--------|
-- |                 |
-- +-----------------+
function hs.window.upRight(win)
  local frame = win:screen():frame()
  win:setFrame({
    x = frame.x + frame.w/2,
    y = frame.y,
    w = frame.w/2,
    h = frame.h/2
  })
end

-- Returns the frame of the smaller available screen
-- considering the context of refScreen
-- isFullscreen = false removes the toolbar
-- and dock sizes
function hs.screen.minFrame(refScreen, isFullscreen)
  return {
    x = hs.screen.minX(refScreen),
    y = hs.screen.minY(refScreen),
    w = hs.screen.minWidth(isFullscreen),
    h = hs.screen.minHeight(isFullscreen)
  }
end

-- Returns the width of the smaller screen size
-- isFullscreen = false removes the toolbar
-- and dock sizes
function hs.screen.minWidth(isFullscreen)
  local min_width = math.maxinteger
  local allScreens = hs.screen.allScreens()
  for i, screen in ipairs(allScreens) do
    local screen_frame = screen:frame()
    if (isFullscreen) then
      screen_frame = screen:fullFrame()
    end
    min_width = math.min(min_width, screen_frame.w)
  end
  return min_width
end

-- isFullscreen = false removes the toolbar
-- and dock sizes
-- Returns the height of the smaller screen size
function hs.screen.minHeight(isFullscreen)
  local min_height = math.maxinteger
  local allScreens = hs.screen.allScreens()
  for i, screen in ipairs(allScreens) do
    local screen_frame = screen:frame()
    if (isFullscreen) then
      screen_frame = screen:fullFrame()
    end
    min_height = math.min(min_height, screen_frame.h)
  end
  return min_height
end

-- If you are using more than one monitor, returns X
-- considering the reference screen minus smaller screen
-- = (MAX_REFSCREEN_WIDTH - MIN_AVAILABLE_WIDTH) / 2
-- If using only one monitor, returns the X of ref screen
function hs.screen.minX(refScreen)
  local min_x = refScreen:frame().x
  local allScreens = hs.screen.allScreens()
  if (#allScreens > 1) then
    min_x = refScreen:frame().x + ((refScreen:frame().w - hs.screen.minWidth()) / 2)
  end
  return min_x
end

-- If you are using more than one monitor, returns Y
-- considering the focused screen minus smaller screen
-- = (MAX_REFSCREEN_HEIGHT - MIN_AVAILABLE_HEIGHT) / 2
-- If using only one monitor, returns the Y of focused screen
function hs.screen.minY(refScreen)
  local min_y = refScreen:frame().y
  local allScreens = hs.screen.allScreens()
  if (#allScreens > 1) then
    min_y = refScreen:frame().y + ((refScreen:frame().h - hs.screen.minHeight()) / 2)
  end
  return min_y
end
