# ABC 143 D - Triangles
# https://atcoder.jp/contests/abc143/tasks/abc143_d

# TLE
# https://atcoder.jp/contests/abc143/submissions/12697895

n = read_line.to_i64
l = read_line.split.map(&.to_i64)

count = 0
l.combinations(3).each do |sticks|
  a, b, c = sticks
  base = (a + b + c) * 0.5
  count += 1 if [a, b, c].all? { |i| i < base }
end
puts count
