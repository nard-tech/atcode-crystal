# ABC 161 B - Popular Vote
# https://atcoder.jp/contests/abc161/tasks/abc161_b

n, m = read_line.split.map(&.to_i64)
points = read_line.split.map(&.to_i64)

points_sum = points.reduce(0) { |acc, i| acc + i }

selected_points = points.select { |point| point >= points_sum * 1.0 / (4 * m) }
# puts selected_points.inspect
if selected_points.size >= m
  puts "Yes"
else
  puts "No"
end
