# ABC 152 B - Comparing Strings
# https://atcoder.jp/contests/abc152/tasks/abc152_b

a, b = read_line.split

a_string = a * b.to_i
b_string = b * a.to_i

if a_string < b_string
  puts a_string
else
  puts b_string
end
