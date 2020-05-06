# ABC 144 C - Walk on Multiplication Table
# https://atcoder.jp/contests/abc144/tasks/abc144_c

# TLE
# https://atcoder.jp/contests/abc144/submissions/12895628

n = gets.chomp.to_i
divisors = []

(1..(Math.sqrt(n))).each do |i|
  div, mod = n.divmod(i)
  if mod == 0
    divisors.push(div)
  end
end

result = Float::INFINITY

divisors.each do |divisor|
  another_divisor = n / divisor
  i = divisor + another_divisor
  if result > i
    result = i
  end
end

puts result - 2
