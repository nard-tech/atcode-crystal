# ABC 138 B - Resistors in Parallel
# https://atcoder.jp/contests/abc138/tasks/abc138_b

n = gets.to_i
a = gets.split(/ /).map(&:to_i)

puts 1.0 / a.map { |i| 1.0 / i }.reduce(0) { |acc, i| acc + i }
