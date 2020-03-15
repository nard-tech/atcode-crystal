# Panasonic 2020 C - Sqrt Inequality
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_c

a, b, c = read_line.split.map(&.to_i64)

if (c - (a + b))**2 > 4_i64 * a * b && c - a - b > 0
  puts "Yes"
else
  puts "No"
end
