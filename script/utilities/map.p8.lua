Map = {

  border_left = 0,
  border_right = 119,
  border_top = 0,
  border_bottom = 119,

  draw = function(self)
    map(0, 0, 0, 0, 16, 16)
  end,


  collision = function(self, player, current_player_x, current_player_y)

    local left = player.x == self.border_left
    local right = player.x == self.border_right
    local bottom = player.y == self.border_bottom
    local top = player.y == self.border_top

    if left or right then
      player.x = current_player_x
    elseif top or bottom then
      player.y = current_player_y
    end

  end

}
