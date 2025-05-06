Player = {
  -- position
  x = 65,
  y = 65,

  margin_left_px = 0,
  margin_right_px = 0,
  margin_bottom_px = 0,
  margin_top_px = 0,

  sprite = 1,

  score = 0,

  movement = function(self)
    if btn(0) then self.x = self.x - 1 end
    if btn(1) then self.x = self.x + 1 end
    if btn(2) then self.y = self.y - 1 end
    if btn(3) then self.y = self.y + 1 end
  end,

  d_pick_up = function(self, object)

    local player_hit_box = self:player_hit_box()



    for k, v in pairs(object.current_coins) do
      -- local dx = abs(self.x - o.x)
      -- local dy = abs(self.y - o.y)
      local a = mget(v.x, v.y)
      print(a)
      print("First name: "..v.x)
      print("First name: "..v.y)


      -- -- for example, pick up if within 8 pixels
      -- rect(dx, dy, dx + 8, dy +8, 3)
      -- if dx <= 8 and dy <= 8 then
      --   del(object.current_coins, o)
      --   spr(0, o.x, o.y, 2, 2)
      --   sfx(0)
      --   self.score = self.score + 1
      -- end
    end
  end,

  player_hit_box = function(self)
    local player_x = self.x / 8
    local player_y = self.y / 8
    local player_x2 = (self.x + 7) / 4
    local player_y2 = (self.y + 7) / 4

    return {
      player_x = player_x,
      player_y = player_y,
      player_x2 = player_x2,
      player_y2 = player_y2
    }
  end,

  draw = function(self)
    local current_player_position_x = self.x
    local current_player_position_y = self.y

    self:movement()

    Map:collision(self, current_player_position_x, current_player_position_y)
    rect(self.x, self.y, self.x +8, self.y +8, 8)

    self:d_pick_up(Coin)
    spr(Player.sprite, Player.x, Player.y)
  end

}
