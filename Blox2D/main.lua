RunService = {
  Priority = {
    list = {};
    Connect = function(self, f)
      table.insert(self.list, f)
    end
  },

  PreRender = {
    list = {};
    Connect = function(self, f)
      table.insert(self.list, f)
    end
  },

  PostRender = {
    list = {};
    Connect = function(self, f)
      table.insert(self.list, f)
    end
  },

  Draw = {
    list = {};
    Connect = function(self, f)
      table.insert(self.list, f)
    end
  }
}

require("Classes")
workspace = require("workspace")
UIService = require("UIService")
world = workspace.genWorld()
ScriptService = require("ScriptService")

function love.update(dt)
  for _, v in ipairs(RunService.Priority.list) do
    v(dt)
  end

  for _, v in ipairs(RunService.PreRender.list) do
    v(dt)
  end
end

function love.draw()
  for _, v in ipairs(RunService.Draw.list) do
    v()
  end

  world:Render()

  for _, v in ipairs(RunService.PostRender.list) do
    v()
  end
end
