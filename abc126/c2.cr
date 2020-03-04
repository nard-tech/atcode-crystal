# ABC 126 C - Dice and Coin
# https://atcoder.jp/contests/abc126/tasks/abc126_c

n, k = read_line.split.map(&.to_i64)

result = 0

1.upto(n).each do |i|
  p = i
  t = 0
  while p < k
    p *= 2
    t += 1
  end
  result += (0.5) ** t / n
end

puts result
