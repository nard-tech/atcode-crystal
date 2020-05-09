# ABC 141 D - Powerful Discount Tickets
# https://atcoder.jp/contests/abc141/tasks/abc141_d

n, m = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

class Item
  def initialize(@price : Int64)
  end

  getter :price

  def discount!
    @price = (price / 2.0).floor.to_i64
  end
end

items = a.map { |price| Item.new(price) }.sort_by(&.price)
m.times do
  item = items.max_by(&.price)
  item.discount!
end

puts items.map(&.price).sum
