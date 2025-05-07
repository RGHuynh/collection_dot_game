function _init()
  -- music(0)
end

function _update()
  cls(3)
end

function _draw()

  print("Player Score: " .. Player.score)
  -- DEBUGGING
  -- print("X: " .. Player.x)
  -- print("Y: " .. Player.y)

  Map:draw()
  Coin:draw()
  Player:draw()
end
