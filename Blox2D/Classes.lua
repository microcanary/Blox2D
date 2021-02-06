local oldtype = type
type = function(x)
  return x == table and (x.__type or oldtype(x)) or oldtype(x)
end

Vector = {}

Vector.new = function(x, y)
  local vect = {
    X = x;
    Y = y;
    Magnitude = math.sqrt(x^2, y^2);
    __type = "Vector";
  }

  return setmetatable({}, {
    __index = vect;
    __newindex = function(t, k, v)
      error("Attempted to assign or change value in vector value")
    end;
    __add = function(v1, v2)
      if type(v1) ~= type(v2) or type(v1) ~= "Vector" then error("Attempted to add "..type(v1).." value with "..type(v2).." value.") end
      return Vector.new(v1.X + v2.X, v1.Y + v2.Y)
    end;
    __sub = function(v1, v2)
      if type(v1) ~= type(v2) or type(v1) ~= "Vector" then error("Attempted to subtract "..type(v1).." value with "..type(v2).." value.") end
      return Vector.new(v1.X - v2.X, v1.Y - v2.Y)
    end;
    __eq = function(v1, v2)
      if type(v1) ~= type(v2) or type(v1) ~= "Vector" then error("Attempted to compare "..type(v1).." value with "..type(v2).." value.") end
      return v1.X == v2.X and v1.Y == v2.Y
    end
  })
end
