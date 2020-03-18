# ABC 152 B - Comparing Strings
# https://atcoder.jp/contests/abc152/tasks/abc152_b

a, b = read_line.split

a_string = 1.upto(b.to_i).map { a }.join("")
b_string = 1.upto(a.to_i).map { b }.join("")

if a_string < b_string
  puts a_string
else
  puts b_string
end
