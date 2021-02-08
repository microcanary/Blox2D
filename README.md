# Blox2D
*Roblox-like enviroment for roblox.*

Comparison:

```lua
-- Blox2D
local c = world:addItem("Box")
c.Position = Vector.new(300, 300)
c.Size = Vector.new(10, 10)
c.Color = Color4.new(200, 100, 100, 1)
```

```lua
-- Roblox
local c = Instance.new("Part", workspace)
c.Position = Vector3.new(300, 300, 300)
c.Size = Vector3.new(10, 10, 10)
c.Color = Color3.new(200, 100, 100)
c.Transparency = 0
```

## Usage:

List of services:

workspace  
UIService  
InputService  
RunService  

#### workspace:

You can create a workspace with workspace.genWorld()  
This will return a world object. You can have as much worlds as you want.  
You will by default already have a world, called 'world'.  
Once you create a new world object, you must hook it up to a Draw or PostRender event for it to update.  

```lua
local newWorld = workspace.genWorld()

RunService.Draw:Connect(function()
  newWorld:Render()
end)
```

Nonetheless, you will usually only work on the main world provided, which automatically renders, and doesn't need creation.  
The world object has an addItem method, that acts simillarly to Roblox's Instance.new().  
Here is the current list of items and their properties:  

```
Box:  
[Size] = Vector Value      (Default 100, 100)  
[Position] = Vector Value  (Default 0, 0)  
[IsHollow] = Bool Value    (Default False)  
[World] = World Value      (Default world it was created in)  
[Color] = Color4 Value     (Default 255, 255, 255, 1)  
```

Example code:  
```lua
local myBox = world:addItem("Box")
myBox.Size = Vector.new(50, 50)
myBox.Position = Vector.new(300, 300)
myBox.Color = Color4.new(255, 0, 0, 1)
```
Result:  
![Result](https://i.gyazo.com/2b7e9a530ece2c69b26a309e78b878cd)
