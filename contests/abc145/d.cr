# ABC 145 D - Knight
# https://atcoder.jp/contests/abc145/tasks/abc145_d

# AC
# https://atcoder.jp/contests/abc145/submissions/12951655

x, y = read_line.split.map(&.to_i64)

class Factorial
  def self.calc(n : Int64) : Int64
    new(n).get(n)
  end

  def initialize(@max : Int64, @mod : Int64 | Nil)
    @array = [] of Int64

    @array.push(1_i64) # 0
    @array.push(1_i64) # 1

    if max >= 2
      2_i64.upto(max) do |i|
        f = @array.last * i
        f = f % mod unless mod.nil?
        @array.push(f)
      end
    end
  end

  getter :max, :mod, array : Array(Int64)

  def get(n : Int64) : Int64
    raise "ArgumentError" if n > max
    @array[n]
  end
end

class Inverse
  def initialize(@max : Int64, @mod : Int64)
    @array = [] of Int64 | Nil

    @array.push(nil)   # 0
    @array.push(1_i64) # 1

    if max >= 2
      2_i64.upto(max) do |i|
        inv = mod - @array[mod % i].as(Int64) * (mod / i) % mod
        @array.push(inv)
      end
    end
  end

  getter :max, :mod

  def get(n : Int64) : Int64 | Nil
    @array[n]
  end
end

class FactorialInverse
  def initialize(@max : Int64, @inverse : Inverse, @mod : Int64)
    @array = [] of Int64

    @array.push(1_i64) # 0
    @array.push(1_i64) # 1

    if max >= 2
      2_i64.upto(max) do |i|
        finv = @array.last * inverse.get(i).as(Int64) % mod
        @array.push(finv)
      end
    end
  end

  getter :max, :inverse, :mod

  def get(n : Int64) : Int64
    @array[n]
  end
end

class Combination
  def self.calc(n : Int64, k : Int64, mod : Int64) : Int64
    if n < k
      0_i64
    elsif n < 0 || k < 0
      0_i64
    else
      factorial = Factorial.new(n, mod)
      inverse = Inverse.new(n, mod)
      factorial_inverse = FactorialInverse.new(n, inverse, mod)
      factorial.get(n) * (factorial_inverse.get(k) * factorial_inverse.get(n - k) % mod) % mod
    end
  end
end

if (x + y) % 3 == 0
  mod = 10_i64 ** 9 + 7
  n = ((x + y) / 3).to_i64
  k = (x - n).to_i64

  puts Combination.calc(n, k, mod)
else
  puts 0
end
