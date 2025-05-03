Coin = {

  -- Position --
  x = 0,
  y = 0,
  sprite = 4,

  new = function(self, o)
    o = o or {} -- create object if user does not provide one
    setmetatable(o, {

      __index = self
    })

    self.x = o.x
    self.y = o.y

    return o
  end,

  count = 0,

  current_coins = {
    -- spr(self.sprite, 40, 30, 2, 2),
    -- spr(self.sprite, 50, 90, 2, 2)
  },

  draw = function(self)
    -- coint = self:new()
    -- local random_x = flr(rnd((100)))

    -- local random_y = flr(rnd((100)))


    add(self.current_coins, spr(self.sprite, 40, 30, 2, 2))
    -- return self.current_coins
    -- if self.count < 2 then
    --   coint = self:new()
    --   local random_x = flr(rnd((100)))

    --   local random_y = flr(rnd((100)))

    --   spr(self.sprite, random_x, random_y, 2, 2)
    --   self.count = self.count + 1
    -- end
  end
}
