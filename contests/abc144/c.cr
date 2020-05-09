# ABC 144 C - Walk on Multiplication Table
# https://atcoder.jp/contests/abc144/tasks/abc144_c

n = read_line.to_i64
divisors = [] of Int64

(1_i64..(Math.sqrt(n))).each do |i|
  div, mod = n.divmod(i.to_i64)
  if mod == 0
    divisors.push(div)
  end
end

result = Float64::INFINITY

divisors.each do |divisor|
  another_divisor = n / divisor
  i = divisor + another_divisor
  if result > i
    result = i
  end
end

puts result - 2
