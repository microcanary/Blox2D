local cam = world.Camera

RunService.Priority:Connect(function(dt)
  local X = 0
  local Y = 0
  X = love.keyboard.isDown("a") and X - 100 * dt or X
  Y = love.keyboard.isDown("w") and Y - 100 * dt or Y
  X = love.keyboard.isDown("d") and X + 100 * dt or X
  Y = love.keyboard.isDown("s") and Y + 100 * dt or Y
  cam.Position = cam.Position + Vector.new(X, Y)
end)
