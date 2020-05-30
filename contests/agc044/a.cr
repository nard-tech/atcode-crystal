# AGC 044 A - Pay to Win
# https://atcoder.jp/contests/agc044/tasks/agc044_a

class TestCase
  def initialize(@n : Int64, @a : Int64, @b : Int64, @c : Int64, @d : Int64)
    @dp = Hash(Int64, Int64).new
    @dp[1_i64] = d
    @dp[2_i64] = d + [
      d,             # p(1) + 1
      a,             # p(1) * 2
      b + d,         # p(1) * 3 - 1
      c + 3_i64 * d, # p(1) * 5 - 3
    ].min
  end

  getter :n, :a, :b, :c, :d
  getter dp : Hash(Int64, Int64)

  def calc : Int64
    calc_sub(n)
  end

  private def calc_sub(n : Int64) : Int64
    return n if dp.has_key?(n)

    puts "n: #{n}"
    read_line

    candidates = [] of Int64

    if n % 5 == 0
      prev = n // 5
      candidates << calc_sub(prev) + coins_for_five_times(prev)
    end

    if n % 3 == 0
      prev = n // 3
      candidates << calc_sub(prev) + coins_for_three_times(prev)
    end

    if n % 2 == 0
      prev = n // 2
      candidates << calc_sub(prev) + coins_for_two_times(prev)
    end

    candidates << calc_sub(n - 1) + d
    candidates << calc_sub(n + 1) + d

    dp[n] = candidates.min
  end

  def coins_for_two_times(n : Int64)
    [a, d * n].min
  end

  def coins_for_three_times(n : Int64)
    [b, d * n * 2].min
  end

  def coins_for_five_times(n : Int64)
    [c, d * n * 4].min
  end
end

t = read_line.to_i64
test_cases = Array.new(t) { n, a, b, c, d = read_line.split.map(&.to_i64); TestCase.new(n, a, b, c, d) }
test_cases.each do |test_case|
  puts "calc: #{test_case.calc}"
end
