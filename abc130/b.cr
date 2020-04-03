# ABC 130 B - Bounding
# https://atcoder.jp/contests/abc130/tasks/abc130_b

n, x = read_line.split.map(&.to_i64)
l_list = read_line.split.map(&.to_i64)

class Jump
  def initialize(d : Int64, index : Int64)
    @d = d
    @index = index
  end

  getter :d, :index
end

d_list = [] of Jump
d_list.push(Jump.new(0_i64, 1_i64))

l_list.each_with_index(1_i64) do |l, i|
  d_next = d_list.last.d + l
  if d_next <= x
    d_list.push(Jump.new(d_next, i + 1))
  else
    break
  end
end

puts d_list.last.index
