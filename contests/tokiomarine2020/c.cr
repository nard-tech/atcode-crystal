# TOKIOMARINE 2020 C - Lamps
# https://atcoder.jp/contests/tokiomarine2020/tasks/tokiomarine2020_c

# TLE
# https://atcoder.jp/contests/tokiomarine2020/submissions/14245066

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

class Lamp
  def initialize(@position : Int64, @power : Int64)
  end

  getter :position
  property :power

  def range(n)
    if power == 0
      return [position]
    end

    ([(position - power), 1].max..[(position + power), n].min).to_a
  end
end

lamps = a.map_with_index(1) { |power, i| Lamp.new(i.to_i64, power) }
while k > 0
  if lamps.all? { |lamp| lamp.power == n }
    # puts "break"
    break
  end

  powers = Array(Int64).new(n, 0_i64)

  lamps.each do |lamp|
    range = lamp.range(n)
    range.each do |position|
      powers[position - 1] = powers[position - 1] + 1
    end
  end

  lamps.each_with_index do |lamp, i|
    lamp.power = powers[i]
  end
  k -= 1
end

puts lamps.map(&.power).join(" ")
