# ABC 086 A - Product
# https://atcoder.jp/contests/abc086/tasks/abc086_a

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第1問

a, b = read_line.split.map(&.to_i64)

if a * b % 2 == 0
  puts "Even"
else
  puts "Odd"
end
