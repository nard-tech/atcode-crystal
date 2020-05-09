# ABC 154 D - Dice in Line
# https://atcoder.jp/contests/abc154/tasks/abc154_d

n, k = read_line.split.map(&.to_i64)
p = read_line.split.map(&.to_i64)

s = Array(Int64).new
p.each_with_index do |pi, i|
  if i == 0
    s.push(pi)
  else
    s.push(s[i - 1] + pi)
  end
end

result = (0.upto(n - k).map { |j| s[j + k - 1] - (j == 0 ? 0 : s[j - 1]) }.max + k) / 2.0
puts result
