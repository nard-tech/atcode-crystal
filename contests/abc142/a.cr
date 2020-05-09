# ABC 142 A - Odds of Oddness
# https://atcoder.jp/contests/abc142/tasks/abc142_a

n = read_line.to_i64
if n.odd?
  puts (n / 2 + 1) * 1.0 / n
else
  puts 0.5
end
