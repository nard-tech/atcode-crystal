# ABC 151 B - Achieve the Goal
# https://atcoder.jp/contests/abc151/tasks/abc151_b

n, k, m = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

target_point = m * n
current_point = a.sum

next_test_target_point = target_point - current_point
if next_test_target_point > k
  puts "-1"
else
  puts [next_test_target_point, 0].max
end
