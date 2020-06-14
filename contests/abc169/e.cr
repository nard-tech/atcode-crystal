# ABC 169 E - Count Median
# https://atcoder.jp/contests/abc169/tasks/abc169_e

class ValueRange
  def initialize(@a : Int64, @b : Int64)
    @static = (a == b)
  end

  getter :a, :b
  getter static : Bool

  def static? : Bool
    @static
  end
end

n = read_line.to_i64
value_ranges = Array.new(n) { a, b = read_line.split.map(&.to_i64); ValueRange.new(a, b) }
