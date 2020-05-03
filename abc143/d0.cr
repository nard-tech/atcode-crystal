# ABC 143 D - Triangles
# https://atcoder.jp/contests/abc143/tasks/abc143_d

# TLE
# https://atcoder.jp/contests/abc143/submissions/12697944

n = read_line.to_i64
l = read_line.split.map(&.to_i64).sort.reverse

h = Hash(Int64, Int64).new
l.group_by(&.itself).each do |k, v|
  h[k] = v.size.to_i64
end

l_uniq = l.uniq

count = 0
l.combinations(3).to_a.uniq.each do |sticks|
  a, b, c = sticks
  base = (a + b + c) * 0.5
  count += h[a] * h[b] * h[c] if [a, b, c].all? { |i| i < base }
end
puts count
