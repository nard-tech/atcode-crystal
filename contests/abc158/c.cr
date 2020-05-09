# ABC 158 C - Tax Increase
# https://atcoder.jp/contests/abc158/tasks/abc158_c

a, b = read_line.split.map(&.to_i64)

p_for_a_min = (a * 12.5).ceil.to_i
p_for_a_upper_bound = ((a + 1) * 12.5).floor.to_i

# puts "p_for_a_min: #{p_for_a_min}"
# puts "p_for_a_upper_bound: #{p_for_a_upper_bound}"

p_for_b_min = b * 10
p_for_b_upper_bound = (b + 1) * 10

# puts "p_for_b_min: #{p_for_b_min}"
# puts "p_for_b_upper_bound: #{p_for_b_upper_bound}"

array = (p_for_a_min...p_for_a_upper_bound).to_a & (p_for_b_min...p_for_b_upper_bound).to_a

# puts array

puts array.empty? ? "-1" : array.min
