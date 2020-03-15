# ABC 153 E - Crested Ibis vs Monster
# https://atcoder.jp/contests/abc153/tasks/abc153_e

class MagicPattern
  def initialize(@decreased_monster_power : Int64, @decreased_self_power : Int64, @index : Int32)
  end

  getter :decreased_monster_power, :decreased_self_power, :index

  def rate
    decreased_monster_power * 1.0 / decreased_self_power
  end
end

def select_magic_pattern(magic_patterns : Array(MagicPattern), power_of_monster : Int64)
  last_pattern = magic_patterns.last
  if last_pattern.decreased_monster_power <= power_of_monster
    last_pattern
  else
    weak_patterns = magic_patterns.select { |magic_pattern| magic_pattern.decreased_monster_power < power_of_monster }
    if weak_patterns.size >= 1
      max_rate_in_weak_patterns = weak_patterns.max_of(&.rate)
      weak_patterns.select { |magic_pattern| magic_pattern.rate == max_rate_in_weak_patterns }.max_by(&.decreased_monster_power)
    else
      strong_patterns = magic_patterns.select { |magic_pattern| magic_pattern.decreased_monster_power >= power_of_monster }
      strong_patterns.min_by(&.decreased_self_power)
    end
  end
end

h, n = read_line.split.map(&.to_i64)
magic_patterns = Array.new(n) { read_line.split.map(&.to_i64) }
  .map_with_index { |pattern, i| a, b = pattern; MagicPattern.new(a, b, i) }
  .sort_by(&.rate)

# puts "h: #{h}"
# puts "n: #{n}"
# puts "magic_patterns: #{magic_patterns}"

power_of_monster = h
selected_magic_patterns = Array(MagicPattern).new

while power_of_monster > 0
  valid_pattern = select_magic_pattern(magic_patterns, power_of_monster)
  power_of_monster -= valid_pattern.decreased_monster_power
  selected_magic_patterns.push(valid_pattern)
  puts "power_of_monster: #{power_of_monster} / #{valid_pattern.inspect}"
end

puts selected_magic_patterns.map(&.decreased_self_power).reduce(0_i64) { |acc, i| acc + i }
