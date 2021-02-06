local a = 0

local b = world:addItem("Box")
b.Position = Vector.new(100, 100)

local c = world:addItem("Box")
c.Position = Vector.new(300, 300)
c.Size = Vector.new(10, 10)

RunService.PreRender:Connect(function(dt)
  a = a + dt
  b.Size = Vector.new(math.abs(math.sin(a)*100), math.abs(math.sin(a)*100))

  c.Position = Vector.new(300, 300) + Vector.new(math.sin(a)*100, math.sin(a)*100)
end)
