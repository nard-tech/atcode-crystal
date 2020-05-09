# ABC 133 B - Good Distance
# https://atcoder.jp/contests/abc133/tasks/abc133_b

n, d = read_line.split.map(&.to_i64)
points = Array.new(n) { read_line.split.map(&.to_i64) }

def distance_square(a : Array(Int64), b : Array(Int64))
  [a, b].transpose.map { |yz|
    y, z = yz
    (y - z) ** 2
  }.sum
end

square_numbers = 1.upto(128).map { |i| i ** 2 }.to_a

# puts square_numbers.inspect

count = 0

0.upto(n - 2) do |i|
  (i + 1).upto(n - 1) do |j|
    distance_square = distance_square(points[i], points[j])
    # puts distance_square
    count += 1 if square_numbers.includes?(distance_square)
  end
end

puts count
