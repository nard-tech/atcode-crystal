# ABC 129 A - Airplane
# https://atcoder.jp/contests/abc129/tasks/abc129_a

p, q, r = read_line.split.map(&.to_i64)
puts p + q + r - [p, q, r].max
