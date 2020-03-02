# ABC 127 A - Ferris Wheel
# https://atcoder.jp/contests/abc127/tasks/abc127_a

age, price_base = read_line.split.map(&.to_i64)
if age >= 13
  price = price_base
elsif age >= 6
  price, _ = price_base.divmod(2)
else
  price = 0
end

puts price
