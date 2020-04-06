# ABC 133 C - Remainder Minimization 2019
# https://atcoder.jp/contests/abc133/tasks/abc133_c

l, r = read_line.split.map(&.to_i64)
mod = 2019

if r - l <= mod
  if l.upto(r).map { |i| i % mod }.includes?(0)
    puts 0
  else
    l_mod = l % mod
    puts l_mod * (l_mod + 1)
  end
else
  puts 0
end
