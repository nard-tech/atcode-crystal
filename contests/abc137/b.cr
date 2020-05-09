# ABC 137 B - One Clue
# https://atcoder.jp/contests/abc137/tasks/abc137_b

k, x = read_line.split.map(&.to_i64)
x_min = [x - (k - 1), -1000000].max
x_max = [x + (k - 1), 1000000].min

puts x_min.upto(x_max).to_a.join(" ")
