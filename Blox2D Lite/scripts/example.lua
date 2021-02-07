local a = world:addItem("Box")
a.Position = Vector.new(100, 100)

local b = 0
RunService.PreRender:Connect(function(dt)
  b = b + dt
  a.Size = Vector.new(math.sin(b)*100, math.sin(b)*100)
end)
