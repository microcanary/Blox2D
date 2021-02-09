# Blox2D
*Roblox-like enviroment for Love2D.*

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
c.Color = Color3.fromRGB(200, 100, 100)
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

You can change the .Camera property of a world to shift the viewport.

Nonetheless, you will usually only work on the main world provided, which automatically renders, and doesn't need creation.  


The world object has an addItem method, that acts simillarly to Roblox's Instance.new().  
Here is the current list of items and their properties:  

```
Box:  
[Size] = Vector Value      (Default; 100, 100)  
[Position] = Vector Value  (Default; 0, 0)  
[IsHollow] = Bool Value    (Default; False)  
[World] = World Value      (Default; world it was created in) <const> 
[Color] = Color4 Value     (Default; 255, 255, 255, 1)  

[Destroy] = Method
```

Example code:  
```lua
local myBox = world:addItem("Box")
myBox.Size = Vector.new(50, 50)
myBox.Position = Vector.new(300, 300)
myBox.Color = Color4.new(255, 0, 0, 1)
```
Result:  
![Result](https://gyazo.com/2b7e9a530ece2c69b26a309e78b878cd.png)

#### RunService:  

In Blox2D, there are 4 render types:  
Priority  
PreRender  
Draw  
PostRender  

The first 2 are in the update category. Love draw functions do not work there, and it is meant for updating data.  
Priority runs before everything else.  
PreRender is what you should generally use, it happens right before Renderring.  

The last 2 are in the render category. They run with or after the renderring occurs.  
Draw happens right on par with world and gui rendering.  
PostRender is when the GUI, workspace, etc. are all done renderring. It is last.  

All have dt as the first parameter.  

Example code:
```lua
local myBox = world:addItem("Box")
myBox.Size = Vector.new(50, 50)
myBox.Position = Vector.new(300, 300)
myBox.Color = Color4.new(255, 255, 255, 1)

local a = 0
RunService.PreRender:Connect(function(dt)
  a = a + dt
  myBox.Size = Vector.new(math.abs(math.sin(a))*100, math.abs(math.sin(a))*100)
end)
```

Result:  
![Result2](https://gyazo.com/4f44ea2642222ce1c3897c410ed6f8c1.gif)  

In Roblox, this code is equivalent to  
```lua
local myBox = Instance.new("Part")
myBox.Parent = workspace
myBox.Size = Vector3.new(50, 50, 50)
myBox.Position = Vector3.new(300, 300, 300)
myBox.Color = Color3.fromRGB(255, 255, 255)

local a = 0
RunService.RenderStepped:Connect(function(dt)
  a = a + dt
  myBox.Size = Vector3.new(math.abs(math.sin(a))*100, math.abs(math.sin(a))*100, math.abs(math.sin(a))*100)
end)
```

#### UIService:

This is very simillar to workspace.  

You can create a workspace with UIService.newUI() 
This will return a UI object. You can have as much UI objects as you want.  
You will by default already have a UI, called 'mainUI'.  
Once you create a new UI object, you must hook it up to a Draw or PostRender event for it to update.  

```lua
local newUI = UIService.newUI()

RunService.Draw:Connect(function()
  newUI:Render()
end)
```

Nonetheless, you will usually only work on the main UI provided, which automatically renders, and doesn't need creation.  


The UI object has an addItem method, that acts simillarly to Roblox's Instance.new().  
Here is the current list of items and their properties:  

```
UI:  
[Size] = Vector Value      (Default; 100, 100)  
[Position] = Vector Value  (Default; 0, 0)  
[Main] = UI object Value   (Default; UI it was created in) <const> 
[Color] = Color4 Value     (Default; 255, 255, 255, 1)  
[BorderColor] = Color4 Value (Default; 255, 255, 255, 1)
[BorderSize] = int         (Default; 1)
[Layer] = int              (Default; 1)

[Destroy] = Method
```

Example code:  
```lua
local myUI = mainUI:addItem("UI")
myUI.Size = Vector.new(50, 50)
myUI.Position = Vector.new(300, 300)
myUI.Color = Color4.new(255, 0, 0, 1)
```

Result:  
![Result](https://gyazo.com/18891c153854a482533d7a4116a68f01.png)  

It acts very simillar to a a box, but it is always in it's same position int he screeen, and will have UI events.  

#### InputService:  

##### There are 2 events for InputService: 

InputBegan
InputEnded

They both pass 2 arguments, Input and Type.  

##### There are 2 types:  
"Mouse"  
"KeyBoard"  

Input is a table of information about the input, shown below.  
```
-- Mouse --
{1} = INT (Button Type)
{2} = VECT (Mouse Vector)
```

```
-- KeyBoard --
{1} = STR (Lowercase Char)
{2} = STR (Scancode) // DOES NOT EXIST IN INPUTENDED
{3} = BOOL (isRepeat) // DOES NOT EXIST IN INPUTENDED
```
