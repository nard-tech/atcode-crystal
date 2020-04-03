# ABC 132 C - Divide the Problems
# https://atcoder.jp/contests/abc132/tasks/abc132_c

n = read_line.to_i64
d_list = read_line.split.map(&.to_i64).sort

# puts d_list.inspect

half = n / 2

# puts "half: #{half}"
if d_list[half - 1] == d_list[half]
  # same_problems_prev = d_list[0..(half - 1)].count(d_list[half])
  # same_problems_next = d_list[half..(n - 1)].count(d_list[half])

  # m = same_problems_prev + same_problems_next
  # puts m.downto(m - same_problems_prev + 1).to_a.reduce(1) { |acc, i| acc * i } / 1.upto(same_problems_prev).to_a.reduce(1) { |acc, i| acc * i }
  puts 0
else
  puts d_list[half] - d_list[half - 1]
end
