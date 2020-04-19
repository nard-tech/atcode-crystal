# ABC 163 D - Sum of Large Numbers
# https://atcoder.jp/contests/abc163/tasks/abc163_d

n, k = read_line.split.map(&.to_i64)

mod = 10**9 + 7

puts (((n + 1) * (n - k + 2) * (n + k + 1) // 2) % mod + (n - k + 2) % mod - (((n + 1) * (n + 2) * (2 * n + 3) - (k - 1) * k * (2 * k - 1)) // 6) % mod) % mod
