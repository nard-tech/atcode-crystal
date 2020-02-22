# ABC 049 C - 白昼夢
# https://atcoder.jp/contests/abc049/tasks/arc065_a

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第9問

s = read_line

if /^(?:dream|dreamer|erase|eraser)+$/ =~ s
  puts "YES"
else
  puts "NO"
end
