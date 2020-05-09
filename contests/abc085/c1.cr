# ABC 085 C - Otoshidama
# https://atcoder.jp/contests/abc085/tasks/abc085_c

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第8問

n, y = read_line.split.map(&.to_i64)

a, b, c = -1, -1, -1
0.upto(n) do |i| # 10000円札
  0.upto(n - i) do |j| # 5000円札
    k = n - i - j # 1000円札
    price = 10000 * i + 5000 * j + 1000 * k
    if price == y
      a, b, c = i, j, k
    end
  end
end

puts "#{a} #{b} #{c}"
