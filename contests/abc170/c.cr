# ABC 170 C - Forbidden List
# https://atcoder.jp/contests/abc170/tasks/abc170_c

# AC
# https://atcoder.jp/contests/abc170/submissions/14308764

x, n = read_line.split.map(&.to_i64)
p_array = read_line.split.map(&.to_i64).sort

candidate_numbers = (0_i64..101_i64).to_a - p_array

class N
  def initialize(@number : Int64)
  end

  getter :number

  def diff_of(x)
    (@number - x).abs
  end
end

numbers = candidate_numbers.sort.map { |p| N.new(p) }.sort_by { |number| number.diff_of(x) }
puts numbers.first.number
