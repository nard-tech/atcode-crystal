# ABC 165 D - Floor Function
# https://atcoder.jp/contests/abc165/tasks/abc165_d

a, b, n = read_line.split.map(&.to_i64)
if n < b
  puts (n * a * 1.0.to_f64 / b).floor.to_i64
else
  puts a - 1
end
