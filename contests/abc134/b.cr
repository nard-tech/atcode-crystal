# ABC 134 B - Golden Apple
# https://atcoder.jp/contests/abc134/tasks/abc134_b

n, d = read_line.split.map(&.to_i64)
div, mod = n.divmod(2 * d + 1)
if mod == 0
  puts div
else
  puts div + 1
end
