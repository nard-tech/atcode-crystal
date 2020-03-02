# ABC 156 D - Bouquet
# https://atcoder.jp/contests/abc156/tasks/abc156_d

# n, a, b = read_line.split.map(&.to_i64)
n, a, b = 1000000000, 141421, 173205

def factorial(n)
  if n == 1
    1
  else
    n * factorial(n - 1)
  end
end

def choose(n, r)
  (factorial(n) / (factorial(r) * factorial(n - r)))
end

# factorial_n_a = factorial(n - a)
# factorial_n_b = factorial(n - b)
# factorial_n = factorial(n)

n_flower_patterns = (n ** 2 - 1) - choose(n, a) - choose(n, b)

puts (n_flower_patterns % (10 ** 9 + 7).to_i)
