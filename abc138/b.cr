# ABC 138 B - Resistors in Parallel
# https://atcoder.jp/contests/abc138/tasks/abc138_b

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

puts 1.0 / a.map { |i| 1.0 / i }.sum
