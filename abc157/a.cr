# ABC 157 A - Duplex Printing
# https://atcoder.jp/contests/abc157/tasks/abc157_a

n = read_line.to_i64
n_papers = n.even? ? n / 2 : n / 2 + 1
puts n_papers
