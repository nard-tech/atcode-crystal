# ABC 145 D - Knight
# https://atcoder.jp/contests/abc145/tasks/abc145_d

# AC
# https://atcoder.jp/contests/abc145/submissions/12952018

x, y = gets.chomp.split(/ /).map(&:to_i)

class Factorial
  def self.calc(n)
    new(n).get(n)
  end

  def initialize(max, mod)
    @max = max
    @mod = mod

    @array = []
    set_up
  end

  attr_reader :max, :mod, :array

  def get(n)
    raise ArgumentError if n > max
    @array[n]
  end

  private

  def set_up
    array.push(1) # 0
    array.push(1) # 1

    if max >= 2
      2.upto(max) do |i|
        f = array.last * i
        f = f % mod unless mod.nil?
        array.push(f)
      end
    end
  end
end

class Inverse
  def initialize(max, mod)
    @max = max
    @mod = mod

    @array = []
    set_up
  end

  attr_reader :max, :mod, :array

  def get(n)
    array[n]
  end

  private

  def set_up
    array.push(nil) # 0
    array.push(1)   # 1

    if max >= 2
      2.upto(max) do |i|
        inv = mod - array[mod % i] * (mod / i) % mod
        array.push(inv)
      end
    end
  end
end

class FactorialInverse
  def initialize(max, inverse, mod)
    @max = max
    @inverse = inverse
    @mod = mod

    @array = []
    set_up
  end

  attr_reader :max, :inverse, :mod, :array

  def get(n)
    array[n]
  end

  private

  def set_up
    array.push(1) # 0
    array.push(1) # 1

    if max >= 2
      2.upto(max) do |i|
        finv = array.last * inverse.get(i) % mod
        array.push(finv)
      end
    end
  end
end

class Combination
  def self.calc(n, k, mod)
    if n < k
      0
    elsif n < 0 || k < 0
      0
    else
      factorial = Factorial.new(n, mod)
      inverse = Inverse.new(n, mod)
      factorial_inverse = FactorialInverse.new(n, inverse, mod)
      factorial.get(n) * (factorial_inverse.get(k) * factorial_inverse.get(n - k) % mod) % mod
    end
  end
end

if (x + y) % 3 == 0
  mod = 10 ** 9 + 7
  n = (x + y) / 3
  k = x - n

  puts Combination.calc(n, k, mod)
else
  puts 0
end
