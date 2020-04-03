# ABC 130 B - Bounding
# https://atcoder.jp/contests/abc130/tasks/abc130_b

n, x = read_line.split.map(&.to_i64)
l = read_line.split.map(&.to_i64)

d_list = [] of Int64
d = 0_i64
i = 1_i64
while d <= x
  d_list.push(d)
  d = d + l[i - 1]
  i += 1
end

puts i - 1
