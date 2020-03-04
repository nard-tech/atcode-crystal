#   ABC 087

##  B - Coins

AC

テーマ: Iterator，四則演算，if 文

*   再帰は使えないか？ <!-- TODO -->

```ruby
def n_coins(x, a, b, c)
  if a < 0 || b < 0 || c < 0
    return 0
  end

  if x == 50
    return 1 # 「50 円玉 1枚」
  end

  if x == 100
    if c == 0 || c == 1
      if b < 1
        raise "Error"
      end

      return 1 # 「100 円玉 1枚」
    else
      if b == 0
        return 1 # 「50 円玉 2枚」
      else
        return 2 # 「100 円玉 1枚」，「50 円玉 2枚」
      end
    end
  end

  if x <= 500
    return n_coins(x - 100, a, b - 1, c) + n_coins(x - 50, a, b, c - 1)
  end

  return n_coins(x - 500, a - 1, b, c) + n_coins(x - 100, a, b - 1, c) + n_coins(x - 50, a, b, c - 1)
end

puts n_coins(x, a, b, c)
```
