# ABC 134 D - Preparing Boxes
# https://atcoder.jp/contests/abc134/tasks/abc134_d

n = read_line.to_i64
a = read_line.split.map(&.to_i)

class Box
  def initialize(@a : Int32, @index : Int64, @balls_count : Int32)
  end

  getter a
  getter index
  property balls_count
  # setter checked : Bool
end

boxes = a.map_with_index { |element, i| Box.new(element, i + 1, 0) }
boxes.reverse.each_cons(2) do |boxes|
  box_large, box_small = boxes
  box_large.balls_count = (box_large.a == box_small.a ? 0 : 1)
end

balls_count_all = boxes.map(&.balls_count)
balls_count_sum = balls_count_all.sum

if (balls_count_sum.even? && boxes.first.a == 0) || (balls_count_sum.odd? && boxes.first.a == 1)
  puts balls_count_all.select(&.zero?).size
  puts boxes.map(&.index).join(' ')
else
  puts "-1"
end
