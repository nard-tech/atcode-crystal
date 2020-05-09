# ABC 143 B - TAKOYAKI FESTIVAL 2019
# https://atcoder.jp/contests/abc143/tasks/abc143_b

n = read_line.to_i64
d = read_line.split.map(&.to_i64)

sum = 0
d.combinations(2).each do |group|
  a, b = group
  sum += a * b
end

puts sum
