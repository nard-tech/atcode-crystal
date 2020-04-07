# ABC 135 A - Harmony
# https://atcoder.jp/contests/abc135/tasks/abc135_a

a, b = read_line.split.map(&.to_i64)

div, mod = (a + b).divmod(2)
if mod == 0
  puts div
else
  puts "IMPOSSIBLE"
end
