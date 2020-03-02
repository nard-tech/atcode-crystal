# ABC 157 F - Yakiniku Optimization Problem
# https://atcoder.jp/contests/abc157/tasks/abc157_f

n, k = read_line.split.map(&.to_i64)
meats = Array.new(n) { read_line.split.map(&.to_i64) }

x, y, c = meats.transpose

# puts x
# puts y
# puts c

xg = 0
yg = 0

x.each_with_index do |xi, i|
  xg += xi * c[i]
end

y.each_with_index do |yi, i|
  yg += yi * c[i]
end

c_sum = c.reduce(0) { |acc, i| acc + i }

xg = xg * 1.0 / c_sum
yg = yg * 1.0 / c_sum

times = meats.map { |meat|
  x, y, c = meat
  c * Math.sqrt( (xg - x)**2 + (yg - y)**2 )
}

puts [xg, yg]
puts times

puts times.sort[0..(k - 1)].last
