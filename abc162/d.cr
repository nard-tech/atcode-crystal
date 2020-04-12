# ABC 162 D - RGB Triplets
# https://atcoder.jp/contests/abc162/tasks/abc162_d

n = read_line.to_i64
s = read_line

rgb = s.split(//).map(&.to_s).to_a

# puts rgb

def generate_index_array(a : Array(String), color : String)
  index_array = [] of Int64

  a.each_with_index do |str, i|
    index_array.push(i.to_i64) if str == color
  end

  index_array
end

def count_combinations(a1 : Array(Int64), a2 : Array(Int64), a3 : Array(Int64))
  count = 0_i64
  a1.each do |i1|
    a2_larger_than_i1 = a2.select { |i2| i2 > i1 }
    a2_larger_than_i1.each do |i2|
      diff_of_i2_and_i1 = i2 - i1
      a3_larger_than_i2 = a3.select { |i3| i3 > i2 && i3 - i2 != diff_of_i2_and_i1 }
      count += a3_larger_than_i2.size
    end
  end
  count
end

r = generate_index_array(rgb, "R")
g = generate_index_array(rgb, "G")
b = generate_index_array(rgb, "B")

sum = 0_i64

sum += count_combinations(r, g, b)
sum += count_combinations(r, b, g)
sum += count_combinations(g, r, b)
sum += count_combinations(g, b, r)
sum += count_combinations(b, r, g)
sum += count_combinations(b, g, r)

puts sum
