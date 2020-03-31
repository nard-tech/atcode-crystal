# ABC 160 E - Red and Green Apples
# https://atcoder.jp/contests/abc160/tasks/abc160_e

x, y, a, b, c = read_line.split.map(&.to_i64)
p = read_line.split.map(&.to_i64)
q = read_line.split.map(&.to_i64)
r = read_line.split.map(&.to_i64)

class Apple
  def initialize(point : Int64, color : Symbol)
    @point = point
    @color = color
  end

  getter :point, :color
end

red_apples = p.sort.reverse[0..(x - 1)].map { |i| Apple.new(i, :red) }
green_apples = q.sort.reverse[0..(y - 1)].map { |i| Apple.new(i, :green) }
transparent_apples = r.sort.reverse[0..([(x + y), c].min - 1)].map { |i| Apple.new(i, :transparent) }

puts (red_apples + green_apples + transparent_apples).sort_by(&.point).reverse[0..(x + y - 1)].map(&.point).sum
