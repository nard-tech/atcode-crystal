# ABC 158 B - Count Balls
# https://atcoder.jp/contests/abc158/tasks/abc158_b

n, a, b = read_line.split.map(&.to_i64)
if a == 0
  puts 0
elsif b == 0
  puts n
else
  n_loops = (n / (a + b)).to_i64
  r = (n % (a + b)).to_i64
  puts n_loops * a + [a, r].min
end
