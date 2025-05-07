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
  is_flip_x = false,

  movement_timer = 1,
  movement = function(self)
    if btn(0) then 
      self.x = self.x - 1
      self.is_flip_x = true
      self:movement_motion()
    end
    if btn(1) then
       self.x = self.x + 1 
       self.is_flip_x = false
       self:movement_motion()
    end
    if btn(2) then 
      self.y = self.y - 1 
    end
    if btn(3) then self.y = self.y + 1 end
  end,

  movement_motion = function(self)

    if self.movement_timer < 5 then
      self.movement_timer += 1
    else
      if self.sprite < 2 then
        self.sprite += 1
      else
        self.sprite = 1
      end

      self.movement_timer = 1
    end
   
  end,
  
  d_pick_up = function(self, object)

    local player_hit_box = self:player_hit_box()

    for k, coin in pairs(object.current_coins) do

      local a = player_hit_box.tile_player_x == coin.tile_x and player_hit_box.tile_player_y == coin.tile_y

      local b = player_hit_box.tile_player_x == coin.tile_x and player_hit_box.tile_player_y2 == coin.tile_y2

      local c = player_hit_box.tile_player_x2 == coin.tile_x2 and player_hit_box.tile_player_y2 == coin.tile_y2 

      local d = player_hit_box.tile_player_x2 == coin.tile_x2 and player_hit_box.tile_player_y == coin.tile_y

      
      if a or b or c or d then
      del(object.current_coins, coin)
      sfx(0)
      self.score = self.score + 1

      end
  
    end
  end,

  player_hit_box = function(self)
    local tile_player_x = flr(self.x / 8)
    local tile_player_y = flr(self.y / 8)
    local tile_player_x2 = flr((self.x + 7) / 8)
    local tile_player_y2 = flr((self.y + 7) / 8)

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

    -- DEGUB
    -- rect(self.x - self.size, self.y - self.size, self.x +8 + self.size, self.y +8 + self.size, 8)

    self:d_pick_up(Coin)
    spr(self.sprite, self.x, self.y, 1, 1, self.is_flip_x)
  end

}
