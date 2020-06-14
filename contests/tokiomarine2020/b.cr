# TOKIOMARINE 2020 B - Tag
# https://atcoder.jp/contests/tokiomarine2020/tasks/tokiomarine2020_b

# AC
# https://atcoder.jp/contests/tokiomarine2020/submissions/14226031

a, v = read_line.split.map(&.to_i64)
b, w = read_line.split.map(&.to_i64)
t = read_line.to_i64

distance = (a - b).abs
r = (v - w).abs

if v > w && r * t >= distance
  puts "YES"
else
  puts "NO"
end
