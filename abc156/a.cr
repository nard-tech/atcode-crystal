# ABC 156 A - Beginner
# https://atcoder.jp/contests/abc156/tasks/abc156_a

n, r = read_line.split.map(&.to_i64)

if n >= 10
  puts r
else
  puts (r + 100 * (10 - n))
end
