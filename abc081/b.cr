# ABC 081 B - Shift only
# https://atcoder.jp/contests/abc081/tasks/abc081_b

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第3問

# for Crystal 0.20.5

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

i = 0

while a.all? { |i| i % 2 == 0 }
  i += 1
  a.map! { |i| i / 2 }
end

puts i

