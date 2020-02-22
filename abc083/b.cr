# ABC 083 B - Some Sums
# https://atcoder.jp/contests/abc083/tasks/abc083_b

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第5問

n, a, b = read_line.split.map(&.to_i64)

puts 1.upto(n).select { |i|
  sum_of_digits = i.to_s.chars.map(&.to_i64).sum
  a <= sum_of_digits && sum_of_digits <= b
}.sum
