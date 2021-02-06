local scripts = love.filesystem.getDirectoryItems("scripts")

for i, v in ipairs(scripts) do
  coroutine.wrap(loadfile("scripts/"..v))()
end
