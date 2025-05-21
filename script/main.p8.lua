<<<<<<< Updated upstream
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
=======
function _init() music(0) end

function _update()

    Player:movement()
    Player:d_pick_up(Coin)

end

function _draw()
    cls(5)

    print("Player Score: " .. Player.score)
    map(0, 0, 0, 0, 16, 16)

    spr(Player.sprite, Player.x, Player.y)
    Coin:draw()

>>>>>>> Stashed changes
end
