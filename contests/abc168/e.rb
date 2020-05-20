# ABC 168 E - ∙ (Bullet)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_e

# TLE
# https://atcoder.jp/contests/abc168/submissions/13436903

# TLE: sub1_01
# 2210 ms

class Sardine
  def initialize(taste, fragrance)
    @taste = taste
    @fragrance = fragrance
  end

  attr_reader :taste, :fragrance

  def to_a
    [taste, fragrance]
  end

  def zero_vector?
    to_a.all?(&:zero?)
  end

  def vertical?
    to_a.first.zero?
  end

  def to_rational
    return :zero_vector if zero_vector?
    return :vertical if to_a.first.zero?
    return :horizontal if to_a.last.zero?

    Rational(fragrance, taste)
  end
end

n = gets.chomp.to_i
sardines = Array.new(n) { a, b = gets.chomp.split(/ /).map(&:to_i); Sardine.new(a, b) }

sardines_with_zero_vector, sardines_with_nonzero_vector = sardines.partition(&:zero_vector?)

sardine_groups = {}
sardines_with_nonzero_vector.each do |sardine|
  r = sardine.to_rational
  case r
  when :horizontal
    sardine_groups[:on_coordinate] ||= [[], []]
    sardine_groups[:on_coordinate][0].push(sardine)
  when :vertical
    sardine_groups[:on_coordinate] ||= [[], []]
    sardine_groups[:on_coordinate][1].push(sardine)
  when Proc.new(&:positive?)
    sardine_groups[r] ||= [[], []]
    sardine_groups[r][0].push(sardine)
  else
    sardine_groups[- (r ** -1)] ||= [[], []]
    sardine_groups[- (r ** -1)][1].push(sardine)
  end
end

mod = 1_000_000_007

def calc_sardine_groups(sardine_group, mod)
  group_plus, group_minus = sardine_group
  (((2 ** group_plus.size) % mod) + ((2 ** group_minus.size) % mod) - 1) % mod
end

i = 0
unless sardine_groups.empty?
  j = 1
  sardine_groups.each do |key, sardine_group|
    j *= calc_sardine_groups(sardine_group, mod) % mod
  end
  i += (j - 1) % mod
end

unless sardines_with_zero_vector.empty?
  i += sardines_with_zero_vector.size % mod
end

puts i % mod
