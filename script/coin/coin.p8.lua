Coin = {
  current_coin_limit = 1,
  sprite = 4,

  current_coins = {},

  draw = function(self)
    local is_current_coins_lower_than_limit = # self.current_coins < self.current_coin_limit

    if is_current_coins_lower_than_limit then
      local random_x = flr(rnd((100)))
      local random_y = flr(rnd((100)))

      add(self.current_coins, {
        x = random_x,
        y = random_y,
        sprite = self.sprite
      })
    end

    draw_coin(self.current_coins)

  end
}

function draw_coin(current_coins)
  for coin in all(current_coins) do
    rect(coin.x, coin.y, coin.x + 16, coin.y + 16, 7)
    spr(coin.sprite, coin.x, coin.y, 2, 2)
  end
end
