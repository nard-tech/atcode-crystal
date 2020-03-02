# ABC 127 C - Prison
# https://atcoder.jp/contests/abc127/tasks/abc127_c

n, m = read_line.split.map(&.to_i64)
l, r = Array.new(m) { read_line.split.map(&.to_i64) }.transpose

l_max = l.max
r_min = r.min

if l_max <= r_min
  puts r_min - l_max + 1
else
  puts 0
end
