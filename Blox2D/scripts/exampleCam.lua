local cam = world.Camera

RunService.Priority:Connect(function(dt)
  local pos = cam.Position
  pos.X = love.keyboard.isDown("a") and pos.X - 100 * dt or pos.X
  pos.X = love.keyboard.isDown("d") and pos.X + 100 * dt or pos.X
  pos.Y = love.keyboard.isDown("w") and pos.Y - 100 * dt or pos.Y
  pos.Y = love.keyboard.isDown("s") and pos.Y + 100 * dt or pos.Y
end)
