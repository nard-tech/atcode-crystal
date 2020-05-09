# ABC 153 C - Fennec vs Monster
# https://atcoder.jp/contests/abc153/tasks/abc153_c

n, k = read_line.split.map(&.to_i64)
h = read_line.split.map(&.to_i64).sort.reverse

if k > n
  puts 0
else
  puts h[k..(h.size - 1)].sum
end
