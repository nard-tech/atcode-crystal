# ABC 167 B - Easy Linear Programming
# https://atcoder.jp/contests/contests/abc167/tasks/contests/abc167_b

# WA
# https://atcoder.jp/contests/abc167/submissions/13046584

a, b, c, k = read_line.split.map(&.to_i64)

if a >= k
  puts k
elsif a + b >= k
  puts a
else
  puts a + b - c
end
