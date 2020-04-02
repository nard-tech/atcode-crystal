# ABC 128 C - Switches
# https://atcoder.jp/contests/abc128/tasks/abc128_c

n, m = read_line.split.map(&.to_i64)
ks = Array.new(m) { read_line.split.map(&.to_i64) }
p_s = read_line.split.map(&.to_i64)

class Lamp
  def initialize(switch_numbers : Array(Int64), p : Int64)
    @switch_numbers = switch_numbers
    @p = p
  end

  getter :switch_numbers, :p

  def valid?(switch_pattern : SwitchPattern)
    switch_patterns = switch_numbers.map { |i| switch_pattern.at(i) }
    switch_patterns.select { |switch_pattern| switch_pattern == '1' }.size % 2 == p
  end
end

class SwitchPattern
  def initialize(pattern : String)
    @pattern = pattern
  end

  def at(i : Int64)
    @pattern[i - 1]
  end
end

lamps = [] of Lamp
ks.each_with_index do |lamp_ks, i|
  a = lamp_ks.dup
  a.shift
  lamps.push(Lamp.new(a, p_s[i]))
end

switch_patterns = 1.upto(2 ** n).map { |i| ("0" * n + i.to_s(2))[-n..-1] }.map { |pattern| SwitchPattern.new(pattern) }

puts switch_patterns.select { |switch_pattern|
  lamps.all? { |lamp| lamp.valid?(switch_pattern) }
}.size
