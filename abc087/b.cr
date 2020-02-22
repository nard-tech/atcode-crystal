# ABC 087 B - Coins
# https://atcoder.jp/contests/abc087/tasks/abc087_b

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第4問

a = read_line.to_i64
b = read_line.to_i64
c = read_line.to_i64
x = read_line.to_i64

ans = 0

0.upto(a) do |i|
  0.upto(b) do |j|
    0.upto(c) do |k|
      price = i * 500 + j * 100 + k * 50
      ans += 1 if x == price
    end
  end
end

puts ans
