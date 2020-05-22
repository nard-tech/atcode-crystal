# ABC 168 E - ∙ (Bullet)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_e

# TLE
# https://atcoder.jp/contests/abc168/submissions/13471768

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

  def horizontal?
    to_a.last.zero?
  end

  def to_rational
    return :zero_vector if zero_vector?
    return :vertical if vertical?
    return :horizontal if horizontal?

    Rational(fragrance, taste)
  end
end

class ModPower
  def initialize(base, mod = nil)
    @base = base
    @mod = mod

    @h = {
      0 => 1,
      1 => (mod ? base % mod : base )
    }
  end

  attr_reader :base, :mod

  def get(n)
    if @h.key?(n)
      # puts "n: #{n}"
      return @h[n]
    end

    if n % 2 == 0
      v = get(n / 2) ** 2
      v %= mod if mod
    else
      v = (get(n / 2) ** 2) * get(1)
      v %= mod if mod
    end

    @h[n] = v
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

def calc_sardine_groups(sardine_group, power_instance, mod)
  group_plus, group_minus = sardine_group
  j = power_instance.get(group_plus.size)
  k = power_instance.get(group_minus.size)
  (j + k - 1) % mod
end

i = 0
unless sardine_groups.empty?
  j = 1
  power_instance = ModPower.new(2, mod)
  sardine_groups.each do |key, sardine_group|
    j *= calc_sardine_groups(sardine_group, power_instance, mod) % mod
  end
  i += (j - 1) % mod
end

unless sardines_with_zero_vector.empty?
  i += sardines_with_zero_vector.size % mod
end

puts i % mod
