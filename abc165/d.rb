# ABC 165 D - Floor Function
# https://atcoder.jp/contests/abc165/tasks/abc165_d

a, b, n = gets.split(/ /).map(&:to_i)

require 'bigdecimal'

def calc(a, b, x)
  x_per_b = BigDecimal((BigDecimal(x.to_s) * 1.0 / b).to_s)
  (a * x_per_b).floor - a * x_per_b.floor
end

if n < b
  puts calc(a, b, n)
elsif a > b
  puts (0..(b - 1)).map { |x| calc(a, b, x) }.max
else
  puts a - 1
end
