# ABC 127 A - Ferris Wheel
# https://atcoder.jp/contests/abc127/tasks/abc127_a

age, price_base = read_line.split.map(&.to_i64)
if age >= 13
  price = price_base
elsif age >= 6
  price = (price_base / 2).to_i64
else
  price = 0
end

puts price
