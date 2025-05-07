Coin = {
  current_coin_limit = 5,
  sprite = 4,

  current_coins = {},


  draw = function(self)
    local is_current_coins_lower_than_limit = # self.current_coins < self.current_coin_limit

    if is_current_coins_lower_than_limit then
      local random_x = flr(rnd((100)))
      local random_y = flr(rnd((100)))

      add(self.current_coins, {
        pixel_x = random_x,
        pixel_y = random_y,
        tile_x = flr(random_x / 8),
        tile_y = flr(random_y / 8),
        tile_x2 = flr((random_x + 7) / 8),
        tile_y2 = flr((random_y + 7)  / 8),
        size = 8,
        sprite = self.sprite
      })
    end

    draw_coin(self.current_coins, self.spawn_coins)

  end
}

function draw_coin(current_coins, spawn_coins)
    for coin in all(current_coins) do
      -- DEBUG 
      -- rect(coin.pixel_x, coin.pixel_y, coin.pixel_x + 16, coin.pixel_y + 16, 7)
      spr(coin.sprite, coin.pixel_x, coin.pixel_y, 2, 2)
  
    end
 
 
end
