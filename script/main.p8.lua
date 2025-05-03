function _init()
end

function _update()
  Player:movement()
end

function _draw()
  cls(5)
  spr(1, Player.x, Player.y)
  map(0, 0, 0, 0, 16, 16)

  Coin:draw()
end
