# ABC 168 E - ∙ (Bullet)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_e

# RE
# https://atcoder.jp/contests/abc168/submissions/13340475

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

  def reset
    @checked = false
  end
end

# 階乗を扱うクラス
class Factorial
  # 与えられた自然数の階乗を計算して返すメソッド
  # @param n [Integer] 対象の自然数
  # @param mod [Integer | Nil] 「p で割った余り」を計算する場合の p
  # @return [Integer] n の階乗
  def self.calc(n, mod = nil)
    new(n, mod).get(n)
  end

  # 階乗を計算するインスタンスを生成するメソッド
  # @param max [Integer] 階乗を計算する対象となる最大の自然数
  # @param mod [Integer | Nil] 「p で割った余り」を計算する場合の p
  def self.generate(max, mod = nil)
    new(max, mod)
  end

  class << self
    private :new
  end

  # @param max [Integer] 階乗を計算する対象となる最大の自然数
  # @param mod [Integer | Nil] 「p で割った余り」を計算する場合の p
  def initialize(max, mod = nil)
    @max = max
    @mod = mod

    @array = []
    set_up
  end

  attr_reader :max, :mod, :array

  # 計算済みの階乗の値を返すメソッド
  # @param n [Integer] 対象の自然数
  # @return [Integer] n の階乗
  def get(n)
    raise ArgumentError if n > max

    @array[n]
  end

  private

  def set_up
    array.push(1) # 0
    array.push(1) # 1

    return unless max >= 2

    2.upto(max) do |i|
      f = array.last * i
      f = f % mod unless mod.nil?
      array.push(f)
    end
  end
end

# 逆元を扱うクラス
class Inverse
  # 与えられた自然数の逆元を計算して返すメソッド
  # @param n [Integer] 対象の自然数
  # @param mod [Integer | Nil] mod p での逆元を計算する場合の p（素数）
  # @return [Integer] n の mod p での逆元
  def self.calc(n, mod)
    new(n, mod).get(n)
  end

  # 逆元を生成するインスタンスを生成するメソッド
  # @param max [Integer] 逆元を計算する対象となる最大の自然数
  # @param mod [Integer] mod p での逆元を計算する場合の p（素数）
  def self.generate(max, mod)
    new(max, mod)
  end

  class << self
    private :new
  end

  # @param max [Integer] 逆元を計算する対象となる最大の自然数
  # @param mod [Integer] mod p での逆元を計算する場合の p（素数）
  def initialize(max, mod)
    @max = max
    @mod = mod

    @array = []
    set_up
  end

  attr_reader :max, :mod, :array

  # 計算済みの逆元の値を返すメソッド
  # @param n [Integer] 対象の自然数
  # @return [Integer] n の逆元
  def get(n)
    array[n]
  end

  private

  def set_up
    array.push(nil) # 0
    array.push(1)   # 1

    return unless max >= 2

    2.upto(max) do |i|
      inv = mod - array[mod % i] * (mod / i) % mod
      array.push(inv)
    end
  end
end

# 「階乗の逆元」を扱うクラス
class FactorialInverse
  # 与えられた自然数の「階乗の逆元」を計算して返すメソッド
  # @param n [Integer] 対象の自然数
  # @param mod [Integer] mod p での逆元を計算する場合の p（素数）
  # @return [Integer] n! の mod p での逆元
  def self.calc(n, mod)
    generate(n, mod).get(n)
  end

  # 「階乗の逆元」を計算するインスタンスを生成するメソッド
  # @param max [Integer] 「階乗の逆元」を計算する対象となる最大の自然数
  # @param mod [Integer] mod p での逆元を計算する場合の p（素数）
  def self.generate(max, mod)
    inverse = Inverse.generate(max, mod)
    new(max, inverse, mod)
  end

  class << self
    private :new
  end

  # @param max [Integer] 「階乗の逆元」を計算する対象となる最大の自然数
  # @param inverse [Inverse] 計算済みの逆元を格納したオブジェクト
  # @param mod [Integer] mod p での逆元を計算する場合の p（素数）
  def initialize(max, inverse, mod)
    @max = max
    @inverse = inverse
    @mod = mod

    @array = []
    set_up
  end

  attr_reader :max, :inverse, :mod, :array

  # 計算済みの「階乗の逆元」の値を返すメソッド
  # @param n [Integer] 対象の自然数
  # @return [Integer] 階乗の逆元
  def get(n)
    array[n]
  end

  private

  def set_up
    array.push(1) # 0
    array.push(1) # 1

    return unless max >= 2

    2.upto(max) do |i|
      finv = array.last * inverse.get(i) % mod
      array.push(finv)
    end
  end
end

# 二項係数を扱うクラス
class Combination
  # 二項係数を計算するメソッド
  # @param n [Integer]
  # @param k [Integer]
  # @param mod [Integer] 「p で割った余り」 を計算する場合の p
  # @return [Integer] 二項係数
  def self.calc(n, k, mod)
    if n < k
      0
    elsif n.negative? || k.negative?
      0
    else
      generate(n, mod).get(n, k)
    end
  end

  # 二項係数を計算するインスタンスを生成するメソッド
  # @param max [Integer] 計算対象の n の最大値
  # @param mod [Integer] 「p で割った余り」 を計算する場合の p
  def self.generate(max, mod)
    factorial = Factorial.generate(max, mod)
    factorial_inverse = FactorialInverse.generate(max, mod)

    new(factorial, factorial_inverse, mod)
  end

  class << self
    private :new
  end

  # @param factorial [Factorial] 階乗を計算するインスタンス
  # @param factorial_inverse [FactorialInverse] 「階乗の逆元」を計算するインスタンス
  # @param mod [Integer] 「p で割った余り」 を計算する場合の p
  def initialize(factorial, factorial_inverse, mod)
    @factorial = factorial
    @factorial_inverse = factorial_inverse
    @mod = mod
  end

  attr_reader :factorial, :factorial_inverse, :mod

  # 二項係数の値を計算して返すメソッド
  # @param n [Integer]
  # @param k [Integer]
  # @return [Integer]
  def get(n, k)
    if n < k
      0
    elsif n.negative? || k.negative?
      0
    else
      factorial.get(n) * (factorial_inverse.get(k) * factorial_inverse.get(n - k) % mod) % mod
    end
  end
end

def count_combination(combination_calculator, sardine_groups, mod)
  i = 1

  sardine_groups.each do |_basis_vector, sardine_group|
    next if sardine_group.checked == true

    sardines_size = sardine_group.sardines.size
    j = 0.upto(sardines_size).map { |i| combination_calculator.get(sardines_size, i) }.sum % mod

    if sardine_group.invalid_group.nil?
      # puts "sardines_size: #{sardines_size}, j: #{j}"
      i = i * j
      i = i % mod
      next
    end

    invalid_group = sardine_group.invalid_group
    invalid_sardines_size = invalid_group.sardines.size
    k = 0.upto(invalid_sardines_size).map { |i| combination_calculator.get(invalid_sardines_size, i) }.sum % mod

    # puts "j + k: #{j} + #{k}"
    i = i * (j + k - 1) % mod
    i = i % mod

    invalid_group.checked = true
  end

  i
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
combination_calculator = Combination.generate(n, mod)
puts (count_combination(combination_calculator, sardine_groups, mod) - 1) % mod
