# ABC 153 B - Common Raccoon vs Monster
# https://atcoder.jp/contests/abc153/tasks/abc153_b

h, n = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

if h <= a.sum
  puts "Yes"
else
  puts "No"
end
