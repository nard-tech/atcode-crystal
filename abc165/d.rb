# ABC 165 D - Floor Function
# https://atcoder.jp/contests/abc165/tasks/abc165_d

a, b, n = gets.split(/ /).map(&:to_i)
if n < b
  x = n
  x_per_b = x * 1.0 / b
  puts (a * x_per_b).floor - a * x_per_b.floor
else
  puts a - 1
end
