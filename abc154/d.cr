# ABC 154 D - Dice in Line
# https://atcoder.jp/contests/abc154/tasks/abc154_d

n, k = read_line.split.map(&.to_i64)
p = read_line.split.map(&.to_i64)

p_pairs = p.each_cons(k).to_a
puts (p_pairs.map(&.sum).max + k) / 2.0
