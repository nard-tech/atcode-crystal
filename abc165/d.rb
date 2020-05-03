# ABC 165 D - Floor Function
# https://atcoder.jp/contests/abc165/tasks/abc165_d

require 'bigdecimal'

a, b, n = gets.split(/ /).map(&:to_i)
if n < b
  x = n
  x_per_b = BigDecimal(x.to_s) * 1.0 / BigDecimal(b.to_s)
  puts (a * BigDecimal(x_per_b.to_s)).floor - a * BigDecimal(x_per_b.to_s).floor
else
  puts a - 1
end
