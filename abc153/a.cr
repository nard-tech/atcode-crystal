# ABC 153 A - Serval vs Monster
# https://atcoder.jp/contests/abc153/tasks/abc153_a

h, a = read_line.split.map(&.to_i64)

if a >= h
  puts 1
else
  t, remaining = h.divmod(a)
  if remaining == 0
    puts t
  else
    puts t + 1
  end
end
