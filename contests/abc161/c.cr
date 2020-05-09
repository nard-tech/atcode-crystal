# ABC 161 C - Replacing Integer
# https://atcoder.jp/contests/abc161/tasks/abc161_c

n, k = read_line.split.map(&.to_i64)

n1 = n - (n / k) * k
n2 = n1 - k

puts [n1, n2].map(&.abs).min
