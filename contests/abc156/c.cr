# ABC 156 C - Rally
# https://atcoder.jp/contests/abc156/tasks/abc156_c

n = read_line.to_i64
x = read_line.split.map(&.to_i64)

x_min = x.min
x_max = x.max

powers = Array(Int64).new(x_max - x_min + 1)
x_min.upto(x_max) do |p|
  sum_of_power = x.map { |xi| ( p - xi) ** 2 }.sum
  powers.push(sum_of_power)
end

puts powers.min
