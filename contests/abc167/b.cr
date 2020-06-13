# ABC 167 B
#  https://atcoder.jp/contests/abc167/tasks/abc167_b

# AC
# https://atcoder.jp/contests/abc167/submissions/13080291

a, b, c, k = read_line.split.map(&.to_i64)

if k <= a
  puts k
elsif k <= a + b
  puts a
else
  puts a - (k - (a + b))
end
