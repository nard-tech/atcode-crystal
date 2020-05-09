# ABC 132 B - Ordinary Number
# https://atcoder.jp/contests/abc132/tasks/abc132_b

n = read_line.to_i64
p_s = read_line.split.map(&.to_i64)

count = 0

p_s.each_cons(3).each do |group|
  a, b, c = group
  count += 1 if [a, b, c].sort[1] == b
end

puts count
