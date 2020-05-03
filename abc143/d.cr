# ABC 143 D - Triangles
# https://atcoder.jp/contests/abc143/tasks/abc143_d

# TLE
# https://atcoder.jp/contests/abc143/submissions/12698084

n = read_line.to_i64
l = read_line.split.map(&.to_i64).sort

# puts l.inspect
# puts ""

count = 0
0_i64.upto(n - 3) do |i|
  a = l[i]
  (i + 1).upto(n - 2) do |j|
    b = l[j]
    c_candidates = l[(j + 1)..(n - 1)]
    t = a + b
    # puts "--------"
    # puts c_candidates.inspect
    # puts "a: #{a}, b: #{b}, a + b: #{t}"
    c_over_index = c_candidates.bsearch_index { |c| c >= t }
    if c_over_index.nil?
      count += (n - 1) - j
    else
      count += c_over_index
    end
  end
end

puts count
