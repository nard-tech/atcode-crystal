# ABC 160 B - Golden Coins
# https://atcoder.jp/contests/abc160/tasks/abc160_b

x = read_line.to_i64

n_500, r_500 = x.divmod(500)
n_5 = r_500 / 5
puts n_500 * 1000 + n_5 * 5
