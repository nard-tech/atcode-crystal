# ABC 168 E
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_e

# RE, WA
# https://atcoder.jp/contests/abc168/submissions/13351546

# RE: sub1_15, sub1_16
# WA: sub1_11, sub1_12, sub1_13, sub1_14

n = read_line.to_i64

class Sardine
  def initialize(@taste : Int64, @fragrance : Int64)
    @gcd = taste.abs.gcd(fragrance.abs)
  end

  getter :taste, :fragrance
  getter gcd : Int64

  def to_a : Array(Int64)
    [taste, fragrance]
  end

  def basis_vector : Array(Int64)
    if gcd == 0
      return [0_i64, 0_i64]
    end

    a = to_a.map { |i| i // gcd }
    if a.first < 0
      a.map { |i| i * -1 }
    else
      a
    end
  end
end

class SardineGroup
  def initialize(@basis_vector : Array(Int64), @sardines : Array(Sardine))
    @invalid_group = nil
    @checked = false
  end

  getter :basis_vector, :sardines

  property invalid_group : SardineGroup | Nil
  property checked : Bool

  def reset
    @checked = false
  end
end

h = Array.new(n) { a, b = read_line.split.map(&.to_i64); Sardine.new(a, b) }.group_by(&.basis_vector)

sardine_groups = Hash(Array(Int64), SardineGroup).new
h.each do |basis_vector, sardines|
  sardine_groups[basis_vector] = SardineGroup.new(basis_vector, sardines)
end

sardine_groups.each do |basis_vector, sardine_group|
  basis_vector_inverse = basis_vector[1] < 0 ? [basis_vector[1] * -1, basis_vector[0]] : [basis_vector[1], basis_vector[0] * -1]
  if sardine_groups.has_key?(basis_vector_inverse)
    # puts "basis_vector: #{basis_vector}, basis_vector_inverse: #{basis_vector_inverse}"
    sardine_groups[basis_vector].invalid_group = sardine_groups[basis_vector_inverse]
  end
end

# sardine_groups.each do |basis_vector, sardine_group|
#   puts "#{basis_vector.inspect}"
#   puts "  (#{sardine_group.sardines.size})"
#   puts "  #{sardine_group.inspect}"
# end

mod = 1000000007_i64
combination_calculator = Combination.generate(n.to_i64, mod.to_i64)
puts (count_combination(combination_calculator, sardine_groups, mod) - 1_i64) % mod

def count_combination(combination_calculator, sardine_groups, mod)
  i = 1_i64

  sardine_groups.each do |basis_vector, sardine_group|
    next if sardine_group.checked == true
    if basis_vector == [0, 0]
      sardines_size = sardine_group.sardines.size.to_i64
      i *= (sardines_size + 1)
      next
    end

    sardines_size = sardine_group.sardines.size.to_i64
    j = 0_i64.upto(sardines_size).map { |i| combination_calculator.get(sardines_size, i.to_i64) }.sum % mod

    if sardine_group.invalid_group.nil?
      # puts "sardines_size: #{sardines_size}, j: #{j}"
      i *= j.to_i64
      i %= mod
      next
    end

    invalid_group = sardine_group.invalid_group.as(SardineGroup)
    invalid_sardines_size = invalid_group.sardines.size.to_i64
    k = 0_i64.upto(invalid_sardines_size).map { |i| combination_calculator.get(invalid_sardines_size, i.to_i64) }.sum % mod

    # puts "j + k: #{j} + #{k}"
    i *= (j + k - 1).to_i64 % mod
    i %= mod

    invalid_group.checked = true
  end

  return i
end

# 階乗を扱うクラス
class Factorial
  # 与えられた自然数の階乗を計算して返すメソッド
  # @param n [Int64] 対象の自然数
  # @param mod [Int64 | Nil] 「p で割った余り」を計算する場合の p
  # @return [Int64] n の階乗
  def self.calc(n : Int64, mod : Int64 | Nil = nil) : Int64
    new(n, mod).get(n)
  end

  # 階乗を計算するインスタンスを生成するメソッド
  # @param max [Int64] 階乗を計算する対象となる最大の自然数
  # @param mod [Int64 | Nil] 「p で割った余り」を計算する場合の p
  def self.generate(max : Int64, mod : Int64 | Nil = nil) : Factorial
    new(max, mod)
  end

  # 階乗を計算するインスタンスを生成するメソッド
  # @note .generate を用い，.new は使わないこと
  # @param max [Int64] 階乗を計算する対象となる最大の自然数
  # @param mod [Int64 | Nil] 「p で割った余り」を計算する場合の p
  def initialize(@max : Int64, @mod : Int64 | Nil = nil)
    @array = [] of Int64
    set_up
  end

  getter :max, :mod, array : Array(Int64)

  # 計算済みの階乗の値を返すメソッド
  # @param n [Int64] 対象の自然数
  # @return [Int64] n の階乗
  def get(n : Int64) : Int64
    raise "ArgumentError" if n > max
    array[n]
  end

  def get(n : Int32) : Int64
    get(n.to_i64)
  end

  private def set_up
    array.push(1_i64) # 0
    array.push(1_i64) # 1

    if max >= 2
      2_i64.upto(max) do |i|
        f = array.last * i
        f = f % mod.as(Int64) unless mod.nil?
        array.push(f)
      end
    end
  end
end

# 逆元を扱うクラス
class Inverse
  # 与えられた自然数の逆元を計算して返すメソッド
  # @param n [Int64] 対象の自然数
  # @param mod [Int64 | Nil] mod p での逆元を計算する場合の p（素数）
  # @return [Int64] n の mod p での逆元
  def self.calc(n : Int64, mod : Int64) : Int64 | Nil
    new(n, mod).get(n)
  end

  # 逆元を生成するインスタンスを生成するメソッド
  # @param max [Int64] 逆元を計算する対象となる最大の自然数
  # @param mod [Int64] mod p での逆元を計算する場合の p（素数）
  def self.generate(max : Int64, mod : Int64) : Inverse
    new(max, mod)
  end

  # 逆元を生成するインスタンスを生成するメソッド
  # @note .generate を用い，.new は使わないこと
  # @param max [Int64] 逆元を計算する対象となる最大の自然数
  # @param mod [Int64] mod p での逆元を計算する場合の p（素数）
  def initialize(@max : Int64, @mod : Int64)
    @array = [] of Int64 | Nil
    set_up
  end

  getter :max, :mod, array : Array(Int64 | Nil)

  # 計算済みの逆元の値を返すメソッド
  # @param n [Int64] 対象の自然数
  # @return [Int64] n の逆元
  def get(n : Int64) : Int64 | Nil
    array[n]
  end

  def get(n : Int32) : Int64 | Nil
    get(n.to_i64)
  end

  private def set_up
    array.push(nil)   # 0
    array.push(1_i64) # 1

    if max >= 2
      2_i64.upto(max) do |i|
        inv = mod - array[mod % i].as(Int64) * div(mod, i) % mod
        array.push(inv)
      end
    end
  end

  # @note Crystal::VERSION に注意
  private def div(a : Int64, b : Int64) : Int64
    (a // b).to_i64 # Crystal::VERSION == "0.33.0"
  end
end

# 「階乗の逆元」を扱うクラス
class FactorialInverse
  # 与えられた自然数の「階乗の逆元」を計算して返すメソッド
  # @param n [Int64] 対象の自然数
  # @param mod [Int64] mod p での逆元を計算する場合の p（素数）
  # @return [Int64] n! の mod p での逆元
  def self.calc(n : Int64, mod : Int64 | Nil = nil)
    generate(n, mod).get(n)
  end

  # 「階乗の逆元」を計算するインスタンスを生成するメソッド
  # @param max [Int64] 「階乗の逆元」を計算する対象となる最大の自然数
  # @param mod [Int64] mod p での逆元を計算する場合の p（素数）
  def self.generate(max, mod)
    inverse = Inverse.generate(max, mod)
    new(max, inverse, mod)
  end

  # 「階乗の逆元」を計算するインスタンスを生成するメソッド
  # @note .generate を用い，.new は使わないこと
  # @param max [Int64] 「階乗の逆元」を計算する対象となる最大の自然数
  # @param inverse [Inverse] 計算済みの逆元を格納したオブジェクト
  # @param mod [Int64] mod p での逆元を計算する場合の p（素数）
  def initialize(@max : Int64, @inverse : Inverse, @mod : Int64)
    @array = [] of Int64
    set_up
  end

  getter :max, :inverse, :mod, array : Array(Int64)

  # 計算済みの「階乗の逆元」の値を返すメソッド
  # @param n [Int64] 対象の自然数
  # @return [Int64] 階乗の逆元
  def get(n : Int64) : Int64
    @array[n]
  end

  def get(n : Int32) : Int64
    get(n.to_i64)
  end

  private def set_up
    array.push(1_i64) # 0
    array.push(1_i64) # 1

    if max >= 2
      2_i64.upto(max) do |i|
        finv = array.last * inverse.get(i).as(Int64) % mod
        array.push(finv)
      end
    end
  end
end

# 二項係数を扱うクラス
class Combination
  # 二項係数を計算するメソッド
  # @param n [Int64]
  # @param k [Int64]
  # @param mod [Int64] 「p で割った余り」 を計算する場合の p
  # @return [Int64] 二項係数
  def self.calc(n : Int64, k : Int64, mod : Int64) : Int64
    if n < k
      0_i64
    elsif n < 0 || k < 0
      0_i64
    else
      generate(n, mod).get(n, k)
    end
  end

  # 二項係数を計算するインスタンスを生成するメソッド
  # @param max [Int64] 計算対象の n の最大値
  # @param mod [Int64] 「p で割った余り」 を計算する場合の p
  def self.generate(max : Int64, mod : Int64) : Combination
    factorial = Factorial.generate(max, mod)
    factorial_inverse = FactorialInverse.generate(max, mod)

    new(factorial, factorial_inverse, mod)
  end

  # 二項係数を計算するインスタンスを生成するメソッド
  # @note .generate を用い，.new は使わないこと
  # @param factorial [Factorial] 階乗を計算するインスタンス
  # @param factorial_inverse [FactorialInverse] 「階乗の逆元」を計算するインスタンス
  # @param mod [Int64] 「p で割った余り」 を計算する場合の p
  def initialize(@factorial : Factorial, @factorial_inverse : FactorialInverse, @mod : Int64)
  end

  getter :factorial, :factorial_inverse, :mod

  # 二項係数の値を計算して返すメソッド
  # @param n [Int64]
  # @param k [Int64]
  # @return [Int64]
  def get(n : Int64, k : Int64) : Int64
    if n < k
      0_i64
    elsif n < 0 || k < 0
      0_i64
    else
      factorial.get(n) * (factorial_inverse.get(k) * factorial_inverse.get(n - k) % mod) % mod
    end
  end

  def get(n : Int32, k : Int64)
    get(n.to_i64, k.to_i64)
  end
end
