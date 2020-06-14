# TOKIOMARINE 2020 C - Lamps
# https://atcoder.jp/contests/tokiomarine2020/tasks/tokiomarine2020_c

# TLE
# https://atcoder.jp/contests/tokiomarine2020/submissions/14241113

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

class Lamp
  def initialize(@position : Int64, @power : Int64)
  end

  getter :position
  property :power

  def for?(point)
    # @position - @power - 0.5 <= point <= @position + @power + 0.5
    # @position - (@power + 0.5) <= point <= @position + (@power + 0.5)
    (@position - point).abs <= @power + 0.5
  end
end

lamps = a.map_with_index(1) { |power, i| Lamp.new(i.to_i64, power) }
while k > 0
  if lamps.all? { |lamp| lamp.power == n }
    # puts "break"
    break
  end
  powers = (1..n).map { |i| lamps.select { |lamp| lamp.for?(i) }.size.to_i64 }
  lamps.each_with_index do |lamp, i|
    lamp.power = powers[i]
  end
  k -= 1
end

puts lamps.map(&.power).join(" ")
