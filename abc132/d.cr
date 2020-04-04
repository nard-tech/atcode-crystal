# ABC 132 D - Blue and Red Balls
# https://atcoder.jp/contests/abc132/tasks/abc132_d

n, k = read_line.split.map(&.to_i64)
mod = 10**9 + 7

def separation_patterns(n, i, i_minus_1_factorial)
  n.downto(n - i + 1).to_a.reduce(1) { |acc, j| acc * j } / i_minus_1_factorial
end

def factorial(n)
  1.upto(n).to_a.reduce(1) { |acc, i| acc * i }
end

1.upto(k).each do |i|
  i_minus_1_factorial = factorial(i - 1)
  i_factorial = i_minus_1_factorial * i

  puts "i_factorial: #{i_factorial}"

  blue_patterns = (k - 1).downto(k - i + 1).to_a.reduce(1) { |acc, j| acc * j } / i_minus_1_factorial
  # puts "blue_patterns: #{blue_patterns}"
  patterns = (n - k + 1).downto(n - k + 1 - i + 1).to_a.reduce(1) { |acc, j| acc * j } / i_factorial
  puts (patterns * blue_patterns) % mod
end
