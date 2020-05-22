# ABC 168 E - ∙ (Bullet)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_e

# TLE, WA
# https://atcoder.jp/contests/abc168/submissions/13355945

# TLE: sub1_01
# WA: sub1_11, sub1_12, sub1_13, sub1_14, sub1_15, sub1_16

n = gets.chomp.to_i

class Sardine
  def initialize(taste, fragrance)
    @taste = taste
    @fragrance = fragrance

    @gcd = taste.abs.gcd(fragrance.abs)
  end

  attr_reader :taste, :fragrance
  attr_reader :gcd

  def to_a
    [taste, fragrance]
  end

  def basis_vector
    return [0, 0] if to_a.all?(&:zero?)
    return [0, 1] if to_a.first.zero?
    return [1, 0] if to_a.last.zero?

    a = to_a.map { |i| i / gcd }
    if a.first.negative?
      a.map { |i| i * -1 }
    else
      a
    end
  end
end

class SardineGroup
  def initialize(basis_vector, sardines)
    @basis_vector = basis_vector
    @sardines = sardines

    @invalid_group = nil
    @checked = false
  end

  attr_reader :basis_vector, :sardines
  attr_accessor :invalid_group, :checked

  def calc(mod)
    if basis_vector == [0, 0]
      (size + 1) % mod
    elsif invalid_group.nil?
      (2 ** size) % mod
    else
      invalid_checked!
      (2 ** size + 2 ** invalid_size - 1) % mod
    end
  end

  private

  def size
    sardines.size
  end

  def invalid_size
    if invalid_group.nil?
      0
    else
      invalid_group.sardines.size
    end
  end

  def invalid_checked!
    invalid_group.checked = true
  end
end

h = Array.new(n) { a, b = gets.chomp.split(/ /).map(&:to_i); Sardine.new(a, b) }.group_by(&:basis_vector)

sardine_groups = {}
h.each do |basis_vector, sardines|
  sardine_groups[basis_vector] = SardineGroup.new(basis_vector, sardines)
end

sardine_groups.each do |basis_vector, _sardine_group|
  basis_vector_inverse = basis_vector[1].negative? ? [basis_vector[1] * -1, basis_vector[0]] : [basis_vector[1], basis_vector[0] * -1]
  if sardine_groups.key?(basis_vector_inverse)
    sardine_groups[basis_vector].invalid_group = sardine_groups[basis_vector_inverse]
  end
end

mod = 1_000_000_007
i = 1
sardine_groups.each do |basis_vector, sardine_group|
  next if sardine_group.checked
  i *= sardine_group.calc(mod) % mod
end

puts (i - 1) % mod
