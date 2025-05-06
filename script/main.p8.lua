function _init()
  -- music(0)
end

function _update()
  cls(5)
end

function _draw()

  -- DEBUGGING
  print("Player Score: " .. Player.score)
  -- print("X: " .. Player.x)
  -- print("Y: " .. Player.y)

  Map:draw()
  Coin:draw()
  Player:draw()
end
