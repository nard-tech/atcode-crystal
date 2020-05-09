# ABC 166 B - Trick or Treat
# https://atcoder.jp/contests/abc166/tasks/abc166_b

# AC
# https://atcoder.jp/contests/abc166/submissions/12719488

class Snack
  def initialize(@index : Int64, @sunukes : Array(Int64))
  end

  getter :index, :sunukes
end

n, k = read_line.split.map(&.to_i64)
d_array = Array.new(k) { d = read_line.to_i64; a = read_line.split.map(&.to_i64); a }
snacks = d_array.map_with_index { |a, i| Snack.new(i.to_i64, a) }
sunukes_without_snacks = (1_i64..n).to_a - snacks.map { |snack| snack.sunukes }.reduce([] of Int64) { |acc, i| acc | i }
puts sunukes_without_snacks.size
