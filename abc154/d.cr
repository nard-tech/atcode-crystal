# ABC 154 D - Dice in Line
# https://atcoder.jp/contests/abc154/tasks/abc154_d

n, k = read_line.split.map(&.to_i64)
p = read_line.split.map(&.to_i64)

expected_values = p.map { |pi| (pi + 1) * 1.0 / 2 }
puts expected_values.each_cons(k).map { |values|
    values.sum
}.max
