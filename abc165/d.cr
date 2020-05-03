# ABC 165 D - Floor Function
# https://atcoder.jp/contests/abc165/tasks/abc165_d

a, b, n = read_line.split.map(&.to_i64)
if n < b
  x = n
  x_per_b = x * 1.0.to_f64 / b
  puts ((a * x_per_b).floor - a * x_per_b.floor).to_i64
else
  puts a - 1
end
