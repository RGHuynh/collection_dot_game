Player = {
  -- position
  x = 65,
  y = 65,

  margin_left_px = 0,
  margin_right_px = 0,
  margin_bottom_px = 0,
  margin_top_px = 0,

  sprite = 1,
  size = 0,

  score = 0,

  movement = function(self)
    if btn(0) then self.x = self.x - 1 end
    if btn(1) then self.x = self.x + 1 end
    if btn(2) then self.y = self.y - 1 end
    if btn(3) then self.y = self.y + 1 end
  end,

  d_pick_up = function(self, object)

    local player_hit_box = self:player_hit_box()

    local t = player_hit_box.tile_player_x
    local e =  player_hit_box.tile_player_y

    print('player x: ' .. self.x + self.size)
    print('player y: ' .. self.y + self.size)


    for k, coin in pairs(object.current_coins) do

      local found_coin = (coin.pixel_x +4) == self.x + self.size and (coin.pixel_y  + 4) == self.y + self.size

      print('coin x: ' .. coin.pixel_x)
      print('coin y: ' .. coin.pixel_y)
      print(found_coin)
      
      if found_coin then
        del(object.current_coins, coin)
        spr(0, coin.pixel_x, coin.pixel_x, 2, 2)
        sfx(0)
        self.score = self.score + 1
      end

    end
  end,

  player_hit_box = function(self)
    local tile_player_x = flr(self.x / 8)
    local tile_player_y = flr(self.y / 8)
    local tile_player_x2 = flr((self.x + 7) / 4)
    local tile_player_y2 = flr((self.y + 7) / 4)

    return {
      tile_player_x = tile_player_x,
      tile_player_y = tile_player_y,
      tile_player_x2 = tile_player_x2,
      tile_player_y2 = tile_player_y2
    }
  end,

  draw = function(self)
    local current_player_position_x = self.x
    local current_player_position_y = self.y

    self:movement()

    Map:collision(self, current_player_position_x, current_player_position_y)
    rect(self.x - self.size, self.y - self.size, self.x +8 + self.size, self.y +8 + self.size, 8)

    self:d_pick_up(Coin)
    spr(Player.sprite, Player.x, Player.y)
  end

}
