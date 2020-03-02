# ABC 127 B - Algae
# https://atcoder.jp/contests/abc127/tasks/abc127_b

r, d, x = read_line.split.map(&.to_i64)

10.times do |i|
  x = r * x - d
  puts x
end
