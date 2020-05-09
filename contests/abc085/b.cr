# ABC 085 B - Kagami Mochi
# https://atcoder.jp/contests/abc085/tasks/abc085_b

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第7問

n = read_line.to_i64
d = Array.new(n) { read_line.to_i64 }
puts d.uniq.size
