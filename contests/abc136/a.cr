# ABC 136 A - Transfer
# https://atcoder.jp/contests/abc136/tasks/abc136_a

a, b, c = read_line.split.map(&.to_i64)

rest = a - b
input = c >= rest ? rest : c
puts c - input
