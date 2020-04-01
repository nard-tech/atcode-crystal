# ABC 160 E - Red and Green Apples
# https://atcoder.jp/contests/abc160/tasks/abc160_e

x, y, a, b, c = read_line.split.map(&.to_i64)
p = read_line.split.map(&.to_i64)
q = read_line.split.map(&.to_i64)
r = read_line.split.map(&.to_i64)

red_apples = p.sort.reverse[0..(x - 1)]
green_apples = q.sort.reverse[0..(y - 1)]
transparent_apples = r.sort.reverse[0..([(x + y), c].min - 1)]

puts (red_apples + green_apples + transparent_apples).sort.reverse[0..(x + y - 1)].sum
