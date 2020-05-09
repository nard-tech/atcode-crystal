# ABC 138 B - Resistors in Parallel
# https://atcoder.jp/contests/abc138/tasks/abc138_b

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

a_inverse = a.map { |i| 1.0 / i }
a_inverse_sum = a_inverse.sum

# puts "a"
# puts a.inspect
# puts a.class
# puts ""

# puts "a_inverse"
# puts a_inverse.inspect
# puts a_inverse.class
# puts ""

# puts "a_inverse_sum"
# puts a_inverse_sum.inspect
# puts a_inverse_sum.class
# puts ""

# puts 0.1
# puts 0.1.class
# puts ""

# puts "0.1_f64"
# puts 0.1_f64.class
# puts ""

# puts 1.0
# puts 1.0.class
# puts ""

# puts "1.0_f64"
# puts 1.0_f64.class
# puts ""

# puts 1.0_f64 / a_inverse_sum
puts 1.0 / a_inverse_sum
# puts 1.0_f64 / 0.1
# puts 1.0 / 0.1
# puts a_inverse_sum == 0.1
# puts a_inverse_sum.class
# puts 0.1.class
