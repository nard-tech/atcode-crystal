# ABC 159 A - The Number of Even Pairs
# https://atcoder.jp/contests/abc159/tasks/abc159_a

n, m = read_line.split.map(&.to_i)

puts n * (n - 1) / 2 + m * (m - 1) / 2
