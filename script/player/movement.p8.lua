Player = {
  -- position
  x = 0,
  y = 0,

  movement = function(self)
    if btn(0) then self.x = self.x - 1 end
    if btn(1) then self.x = self.x + 1 end
    if btn(2) then self.y = self.y - 1 end
    if btn(3) then self.y = self.y + 1 end
  end
}

