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

apples = [] of Apple
red_candidates = p.sort.reverse[0..(x - 1)]
green_candidats = q.sort.reverse[0..(y - 1)]

p.each do |i|
  apples.push(Apple.new(i, :red))
end

q.each do |i|
  apples.push(Apple.new(i, :green))
end

r.each do |i|
  apples.push(Apple.new(i, :transparent))
end
