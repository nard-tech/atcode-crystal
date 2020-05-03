# ABC 165 D - Floor Function
# https://atcoder.jp/contests/abc165/tasks/abc165_d

a, b, n = read_line.split.map(&.to_i64)
if n < b
  k = b * 1.0 / a
  puts n // k
else
  puts a - 1
end
