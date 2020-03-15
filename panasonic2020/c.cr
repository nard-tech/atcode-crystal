# Panasonic 2020 C - Sqrt Inequality
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_c

a, b, c = read_line.split.map(&.to_i64)

if a**2 + b**2 + c**2 - 2 * (a * b + b * c + c * a) > 0 && a + b < c
  puts "Yes"
else
  puts "No"
end

# https://atcoder.jp/contests/panasonic2020/submissions/10904148
# WA: 011.txt - 022.txt
