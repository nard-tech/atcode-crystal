# ABC 155 D - Pairs
# https://atcoder.jp/contests/abc155/tasks/abc155_d

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

products = [] of Int64

0.upto(n - 2).each do |i|
  (i + 1).upto(n - 1).each do |j|
    products.push(a[i] * a[j]) unless i == j
  end
end

puts products.sort[k - 1]
