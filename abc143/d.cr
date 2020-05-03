# ABC 143 D - Triangles
# https://atcoder.jp/contests/abc143/tasks/abc143_d

# TLE
# https://atcoder.jp/contests/abc143/submissions/12698292

n = read_line.to_i64
l = read_line.split.map(&.to_i64).sort

class Stick
  def initialize(@length : Int64, @index : Int64)
  end

  getter :length, :index
end

sticks = l.map_with_index { |length, i| Stick.new(length, i.to_i64) }

# puts sticks.inspect
# puts ""

count = 0
0_i64.upto(n - 3) do |i|
  a = sticks[i]
  (i + 1).upto(n - 2) do |j|
    b = sticks[j]
    c_candidates = sticks[(j + 1)..(n - 1)]
    t = a.length + b.length
    c_over = c_candidates.bsearch { |stick| stick.length >= t }
    if c_over.nil?
      c_last_index = n - 1
    else
      c_last_index = c_over.as(Stick).index - 1
    end
    # puts "--------"
    # puts c_candidates.inspect
    # puts "a: #{a}, b: #{b}, a + b: #{t} -> #{c_last_index - j}"
    # puts ""
    count += c_last_index - j
  end
end

puts count
