# ABC 145 C - Average Length
# https://atcoder.jp/contests/abc145/tasks/abc145_c

# AC
# https://atcoder.jp/contests/abc145/submissions/12949971

n = read_line.to_i64
xy_s = Array.new(n) { read_line.split.map(&.to_i64) }

class Point
  def initialize(@x : Int64, @y : Int64)
  end

  getter :x, :y

  def from(point : Point)
    Math.sqrt((x - point.x)**2 + (y - point.y)**2)
  end
end

points = xy_s.map { |xy| x, y = xy; Point.new(x, y) }

sum = 0
permutation = points.each_permutation.to_a

permutation.to_a.each do |points_in_permutation|
  length = 0
  points_in_permutation.each_cons(2) do |group|
    a, b = group
    length += a.from(b)
  end
  sum += length
end

puts sum * 1.0 / permutation.size
