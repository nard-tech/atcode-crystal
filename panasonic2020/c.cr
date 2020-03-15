# Panasonic 2020 C - Sqrt Inequality
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_c

a, b, c = read_line.split.map(&.to_i64)

if Math.sqrt(a) + Math.sqrt(b) < Math.sqrt(c)
  puts "Yes"
else
  puts "No"
end

# https://atcoder.jp/contests/panasonic2020/submissions/10904092
# WA: 006.txt - 009.txt
