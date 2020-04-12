# ABC 162 D - RGB Triplets
# https://atcoder.jp/contests/abc162/tasks/abc162_d

n = read_line.to_i64
s = read_line

rgb = s.split(//).map(&.to_s).to_a

# puts rgb

class ColorIndexArray
  def initialize(@array : Array(Int64))
    @dict = Hash(Int64, Array(Int64) | Nil).new { nil }
  end

  getter :array

  def select_larger_than(n : Int64)
    return @dict[n].as(Array(Int64)) if !(@dict[n].nil?)

    first_index = @array.bsearch_index { |x, i| x > n }
    if first_index.nil?
      [] of Int64
    else
      a = @array[first_index..-1]
      @dict[n] = a
      a.as(Array(Int64))
    end
  end
end

def generate_index_array(a : Array(String)) : Array(ColorIndexArray)
  r_indexes = [] of Int64
  g_indexes = [] of Int64
  b_indexes = [] of Int64

  a.each_with_index do |str, i|
    r_indexes.push(i.to_i64) if str == "R"
    g_indexes.push(i.to_i64) if str == "G"
    b_indexes.push(i.to_i64) if str == "B"
  end

  [
    ColorIndexArray.new(r_indexes),
    ColorIndexArray.new(g_indexes),
    ColorIndexArray.new(b_indexes),
  ]
end

def count_combinations(a1 : ColorIndexArray, a2 : ColorIndexArray, a3 : ColorIndexArray)
  count = 0_i64
  a1.array.each do |i1|
    a2_larger_than_i1 = a2.select_larger_than(i1)
    a2_larger_than_i1.each do |i2|
      diff_of_i2_and_i1 = i2 - i1
      a3_larger_than_i2 = a3.select_larger_than(i2).select { |i3| i3 - i2 != diff_of_i2_and_i1 }
      count += a3_larger_than_i2.size
    end
  end
  count
end

r, g, b = generate_index_array(rgb)

sum = 0_i64

sum += count_combinations(r, g, b)
sum += count_combinations(r, b, g)
sum += count_combinations(g, r, b)
sum += count_combinations(g, b, r)
sum += count_combinations(b, r, g)
sum += count_combinations(b, g, r)

puts sum
