# ABC 136 A - Transfer
# https://atcoder.jp/contests/abc136/tasks/abc136_a

a, b, c = read_line.split.map(&.to_i64)
puts [c - (a - b), c].min
