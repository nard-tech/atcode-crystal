# ABC 132 D - Blue and Red Balls
# https://atcoder.jp/contests/abc132/tasks/abc132_d

n, k = gets.split(/ /).map(&:to_i)
mod = 10**9 + 7

def separation_patterns(n, i, i_minus_1_factorial)
  n.downto(n - i + 1).to_a.reduce(1) { |acc, j| acc * j } / i_minus_1_factorial
end

def factorial(n)
  1.upto(n).to_a.reduce(1) { |acc, i| acc * i }
end

class Factorial
  def initialize(n)
    @n = n
    @array = [1, 1]
    2.upto(n).each do |i|
      @array.push(@array.last * i)
    end
  end

  def [](n)
    @array[n]
  end
end

factorial = Factorial.new(k)

1.upto(k).each do |i|
  # puts "i_factorial: #{factorial[i]}"

  blue_patterns = (k - 1).downto(k - i + 1).to_a.reduce(1) { |acc, j| acc * j } / factorial[i - 1]
  # puts "blue_patterns: #{blue_patterns}"
  patterns = (n - k + 1).downto(n - k + 1 - i + 1).to_a.reduce(1) { |acc, j| acc * j } / factorial[i]
  puts (patterns * blue_patterns) % mod
end
