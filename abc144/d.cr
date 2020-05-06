# ABC 144 D - Water Bottle
# https://atcoder.jp/contests/abc144/tasks/abc144_d

a, b, x = read_line.split.map(&.to_i64)
if a**2 * b > 2 * x
  l = 2 * x * 1.0 / (a * b)
  theta = Math.asin(b * 1.0 / Math.sqrt(l**2 + b**2))
else
  theta = Math.atan(2 * (b - x * 1.0 / a ** 2) * 1.0 / a)
end

puts theta * 180 / Math::PI
