# HITACHI 2020 B - Nice Shopping
# https://atcoder.jp/contests/hitachi2020/tasks/hitachi2020_b

a, b, m = read_line.split.map(&.to_i64)
array_of_a = read_line.split.map(&.to_i64)
array_of_b = read_line.split.map(&.to_i64)
array_of_xyc = Array.new(m) { read_line.split.map(&.to_i64) }

a_min = array_of_a.min
b_min = array_of_b.min

sum = a_min + b_min

class DiscountTicket
  def initialize(x : Int64, y : Int64, c : Int64)
    @x = x
    @y = y
    @c = c
  end

  getter :x, :y, :c

  def x_and_y
    [x, y]
  end

  def apply(a, b)
    (a[x - 1] + b[y - 1] - c).to_i64
  end
end

discount_tickets = array_of_xyc.map { |xyc|
  x, y, c = xyc
  DiscountTicket.new(x, y, c)
}

valid_discount_tickets = discount_tickets.group_by(&.x_and_y).values.map { |groups| groups.max_by(&.c) }.flatten

# puts "a_min: #{a_min}"
# puts "b_min: #{b_min}"
# puts "sum: #{sum}"
# puts valid_discount_tickets

puts [sum, discount_tickets.map { |discount_ticket|
  discount_ticket.apply(array_of_a, array_of_b)
}.min].min
