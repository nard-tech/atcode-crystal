# ABC 138 C - Alchemist
# https://atcoder.jp/contests/abc138/tasks/abc138_c

n = gets.to_i
v = gets.split(/ /).map(&:to_i)

class Item
  def initialize(value, i)
    @value = value
    @i = i
  end

  attr_reader :value, :i

  def composed_value(n)
    j = i == 0 ? n - 1 : n - i
    value * 1.0 / (2 ** j)
  end
end

composed_values = v.sort.map.with_index(0) { |value, i| Item.new(value, i).composed_value(n) }
# puts composed_values
puts composed_values.reduce(0) { |acc, i| acc + i }
