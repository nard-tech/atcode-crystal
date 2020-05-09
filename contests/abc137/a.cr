# ABC 137 A - +-x
# https://atcoder.jp/contests/abc137/tasks/abc137_a

a, b = read_line.split.map(&.to_i64)

puts [a + b, a - b, a * b].max
