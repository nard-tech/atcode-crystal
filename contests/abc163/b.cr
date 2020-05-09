# ABC 163 B - Homework
# https://atcoder.jp/contests/abc163/tasks/abc163_b

n, m = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

a_sum = a.sum
if n >= a_sum
  puts n - a_sum
else
  puts -1
end
