# ABC 165 B - 1%
# https://atcoder.jp/contests/abc165/tasks/abc165_b

x = read_line.to_i64
i = 0
price = 100
while price < x
  price = (price * 1.01).floor
  i += 1
end
puts i
