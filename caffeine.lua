-- Replace Caffeine.app with 18 lines of Lua :D
-- NOTE: If you reload your config on a hotkey or a pathwatcher, you should call caffeine:delete() there
local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
  local result
  if state then
    result = caffeine:setIcon('caffeine-on.pdf')
  else
    result = caffeine:setIcon('caffeine-off.pdf')
  end
end

function caffeineClicked()
  setCaffeineDisplay(hs.caffeinate.toggle('displayIdle'))
end

if caffeine then
  caffeine:setClickCallback(caffeineClicked)
  setCaffeineDisplay(hs.caffeinate.get('displayIdle'))
end
