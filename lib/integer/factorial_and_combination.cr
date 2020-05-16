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
