# ABC 142 B - Roller Coaster
# https://atcoder.jp/contests/abc142/tasks/abc142_b

n, k = read_line.split.map(&.to_i64)
h = read_line.split.map(&.to_i64)

puts h.select { |height| height >= k }.size
