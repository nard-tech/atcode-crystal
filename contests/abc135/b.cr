# ABC 135 B - 0 or 1 Swap
# https://atcoder.jp/contests/abc135/tasks/abc135_b

n = read_line.to_i64
p = read_line.split.map(&.to_i64)

p_sorted = p.sort

if p_sorted == p
  puts "YES"
elsif p_sorted.map_with_index { |element, i| element == p[i] }.count(false) == 2
  puts "YES"
else
  puts "NO"
end
