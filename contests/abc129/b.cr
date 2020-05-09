# ABC 129 B - Balance
# https://atcoder.jp/contests/abc129/tasks/abc129_b

n = read_line.to_i64
w = read_line.split.map(&.to_i64)

s = [] of Int64
s.push(w[0])
1.upto(n - 1).each do |i|
  s_next = s.last + w[i]
  s.push(s_next)
end

puts 1.upto(n - 1).map { |t|
  (s[t - 1] - (s[n - 1] - s[t - 1])).abs
}.min
