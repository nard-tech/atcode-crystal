# ABC 138 B - Resistors in Parallel
# https://atcoder.jp/contests/abc138/tasks/abc138_b

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

cumulative_product = 1.0
a.each do |i|
  cumulative_product *= i
end

puts cumulative_product / a.map { |i| cumulative_product / i }.sum
