# ABC 143 A - Curtain
# https://atcoder.jp/contests/abc143/tasks/abc143_a

a, b = read_line.split.map(&.to_i64)

puts [a - b * 2, 0].max
