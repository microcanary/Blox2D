local a = 0

local b = world:addItem("Box")

RunService.PreRender:Connect(function(dt)
  a = a + dt
  b.Size = Vector.new(math.abs(math.sin(a)*100), math.abs(math.sin(a)*100))
end)
