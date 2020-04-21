# ABC 138 C - Alchemist
# https://atcoder.jp/contests/abc138/tasks/abc138_c

n = read_line.to_i64
v = read_line.split.map(&.to_i64)

class Item
  def initialize(@value : Int64, @i : Int64)
  end

  getter :value, :i

  def composed_value(n : Int64)
    j = i == 0 ? n - 1 : n - i
    value * 1.0 / (2 ** j)
  end
end

puts v.sort.map_with_index { |value, i| Item.new(value, i.to_i64) }.map { |item| item.composed_value(n) }.sum
