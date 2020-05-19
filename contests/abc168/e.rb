# ABC 168 E - ∙ (Bullet)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_e

# TLE, WA
# https://atcoder.jp/contests/abc168/submissions/13411139

# TLE: sub1_01
# WA: sub1_11, sub1_13, sub1_16
# 2063 ms

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
    return size if basis_vector.all?(&:zero?)

    j = 1.upto(size).reduce(1) { |acc, i| acc * 2 % mod }

    return j if invalid_group.nil?

    k = 1.upto(invalid_size).reduce(1) { |acc, i| acc * 2 % mod }
    invalid_checked!
    (j + k - 1) % mod
  end

  def size
    @size ||= sardines.size
  end

  def basis_vector_inverse
    basis_vector[1].negative? ? [basis_vector[1] * -1, basis_vector[0]] : [basis_vector[1], basis_vector[0] * -1]
  end

  private

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

n = gets.chomp.to_i
h = Array.new(n) { a, b = gets.chomp.split(/ /).map(&:to_i); Sardine.new(a, b) }.group_by(&:basis_vector)

# rows = File.open("contests/abc168/e/in/#{gets.chomp}.txt", 'r:utf-8').read.chomp.split(/\n/)
# n = rows.shift.to_i
# h = rows.map { |row| a, b = row.split(/ /).map(&:to_i); Sardine.new(a, b) }.group_by(&:basis_vector)

sardine_groups = {}
h.each do |basis_vector, sardines|
  sardine_groups[basis_vector] = SardineGroup.new(basis_vector, sardines)
end

sardine_groups.each do |basis_vector, sardine_group|
  next if basis_vector.all?(&:zero?)
  basis_vector_inverse = sardine_group.basis_vector_inverse
  if sardine_groups.key?(basis_vector_inverse)
    sardine_groups[basis_vector].invalid_group = sardine_groups[basis_vector_inverse]
  end
end

mod = 1_000_000_007

sardine_group_with_zero_basis_vector = sardine_groups.delete([0, 0])

def calc_sardine_groups(sardine_groups, mod)
  return 0 if sardine_groups.size == 0

  i = 1
  sardine_groups.each do |basis_vector, sardine_group|
    next if sardine_group.checked
    i *= sardine_group.calc(mod)
    i %= mod
  end
  (i - 1) % mod
end

i = 0
i += calc_sardine_groups(sardine_groups, mod)
unless sardine_group_with_zero_basis_vector.nil?
  # puts "sardine_group_with_zero_basis_vector: #{sardine_group_with_zero_basis_vector.size}"
  i += sardine_group_with_zero_basis_vector.size.to_i % mod
end

puts i % mod
