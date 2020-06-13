# ABC 168 E
#  https://atcoder.jp/contests/abc168/tasks/abc168_e

# AC
# https://atcoder.jp/contests/abc168/submissions/13487171

require "big"

class Sardine
  def initialize(@taste : Int64, @fragrance : Int64)
  end

  getter :taste, :fragrance

  def to_a : Array(Int64)
    [taste, fragrance]
  end

  def zero_vector? : Bool
    to_a.all?(&.zero?)
  end

  def vertical? : Bool
    to_a.first.zero?
  end

  def horizontal? : Bool
    to_a.last.zero?
  end

  def to_rational : BigRational | Symbol
    return :zero_vector if zero_vector?
    return :vertical if vertical?
    return :horizontal if horizontal?

    BigRational.new(fragrance, taste)
  end
end

class ModPower
  def initialize(@base : Int64, @mod : Int64 | Nil = nil)
    @h = {
      0_i64 => 1_i64,
      1_i64 => (mod ? base % mod : base),
    }
  end

  getter :base, :mod
  getter h : Hash(Int64, Int64)

  def get(n : Int64)
    if @h.has_key?(n)
      return @h[n]
    end

    if n % 2 == 0
      v = get(n // 2) ** 2
      v %= mod.as(Int64) if mod
    else
      v = (get(n // 2) ** 2) * get(1_i64)
      v %= mod.as(Int64) if mod
    end

    @h[n] = v
  end
end

n = read_line.to_i64
sardines = Array.new(n) { a, b = read_line.split.map(&.to_i64); Sardine.new(a, b) }

# --------

sardines_with_zero_vector, sardines_with_nonzero_vector = sardines.partition(&.zero_vector?)

sardine_groups = Hash((Symbol | Array(Int64)), Array(Array(Sardine))).new {
  [
    [] of Sardine,
    [] of Sardine,
  ]
}
sardines_with_nonzero_vector.each do |sardine|
  r = sardine.to_rational

  case r
  when :horizontal
    sarding_group = [
      sardine_groups[:on_coordinate][0].push(sardine),
      sardine_groups[:on_coordinate][1],
    ]
    sardine_groups[:on_coordinate] = sarding_group
  when :vertical
    sarding_group = [
      sardine_groups[:on_coordinate][0],
      sardine_groups[:on_coordinate][1].push(sardine),
    ]
    sardine_groups[:on_coordinate] = sarding_group
  else
    rational = r.as(BigRational)
    denominator, numerator = rational.denominator.to_i64, rational.numerator.to_i64 # 分母，分子

    if rational > 0
      sardine_group = sardine_groups[[numerator, denominator]]
      sardine_group = [
        sardine_group[0].push(sardine),
        sardine_group[1],
      ]
      sardine_groups[[numerator, denominator]] = sardine_group
    else
      sardine_group = sardine_groups[[denominator, -numerator]]
      sardine_group = [
        sardine_group[0],
        sardine_group[1].push(sardine),
      ]
      sardine_groups[[denominator, -numerator]] = sardine_group
    end
  end
end

mod = 1000000007_i64

def calc_sardine_groups(sardine_group : Array(Array(Sardine)), power_instance : ModPower, mod : Int64)
  group_plus, group_minus = sardine_group
  j = power_instance.get(group_plus.size.to_i64)
  k = power_instance.get(group_minus.size.to_i64)

  (j + k - 1_i64) % mod
end

i = 0_i64
unless sardine_groups.empty?
  j = 1_i64
  power_instance = ModPower.new(2_i64, mod)

  sardine_groups.each do |key, sardine_group|
    j *= calc_sardine_groups(sardine_group, power_instance, mod)
    j %= mod
  end

  i += (j - 1_i64) % mod
end

unless sardines_with_zero_vector.empty?
  i += sardines_with_zero_vector.size % mod
end

puts i % mod
