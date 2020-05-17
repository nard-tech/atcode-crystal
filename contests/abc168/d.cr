# ABC 168 D - .. (Double Dots)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_d

n, m = read_line.split.map(&.to_i64)
ab_s = Array.new(m) { a, b = read_line.split.map(&.to_i64).sort }

class Room
  def initialize(@index : Int64)
  end

  getter :index
end

class Path
  def initialize(@from : Int64, @to : Int64)
  end

  getter :from, :to
end

rooms = 1.upto(n).map { |i| Room.new(i) }
paths = ab_s.map { |ab| a, b = ab; Path.new(room[a - 1], rooms[b - 1]) }
