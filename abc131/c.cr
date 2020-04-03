# ABC 131 C - Anti-Division
# https://atcoder.jp/contests/abc131/tasks/abc131_c

a, b, c, d = read_line.split.map(&.to_i64)

gcd_of_c_and_d = c.gcd(d)
lcm_of_c_and_d = c * d / gcd_of_c_and_d

# puts "gcd: #{gcd_of_c_and_d}"
# puts "lcm: #{lcm_of_c_and_d}"

def number_of_undivisiable_numbers_not_greater_than(n, m1, m2, lcm)
  # result = n - (n / m1 + n / m2 - n / lcm)
  # puts "#{n} - (#{n/m1} + #{n/m2} - #{n/lcm}) = #{result}"
  n - (n / m1) - (n / m2) + (n / lcm)
end

puts number_of_undivisiable_numbers_not_greater_than(b, c, d, lcm_of_c_and_d) - number_of_undivisiable_numbers_not_greater_than(a - 1, c, d, lcm_of_c_and_d)
