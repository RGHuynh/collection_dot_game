Player = {
  -- position
  x = 0,
  y = 0,

  sprite = 1,

  score = 0,

  movement = function(self)
    if btn(0) then self.x = self.x - 1 end
    if btn(1) then self.x = self.x + 1 end
    if btn(2) then self.y = self.y - 1 end
    if btn(3) then self.y = self.y + 1 end
  end,

  d_pick_up = function(self, object)
    for o in all(object.current_coins) do
      local dx = abs(self.x - o.x)
      local dy = abs(self.y - o.y)
  

      -- for example, pick up if within 8 pixels
      if dx <= 4 and dy <= 4 then
        del(object.current_coins, o)
        spr(0, o.x, o.y, 2, 2)
        sfx(0)
        self.score = self.score + 1

      end
    end
   
  end

}

