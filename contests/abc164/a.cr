# ABC 164 A - Sheep and Wolves
# https://atcoder.jp/contests/abc164/tasks/abc164_a

s, w = read_line.split.map(&.to_i64)
if w >= s
  puts "unsafe"
else
  puts "safe"
end
