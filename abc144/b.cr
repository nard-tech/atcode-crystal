# ABC 144 B - 81
# https://atcoder.jp/contests/abc144/tasks/abc144_b

# AC
# https://atcoder.jp/contests/abc144/submissions/12895196

n = read_line.to_i64

numbers = (1..9).map { |i| (1..9).map { |j| i * j } }.flatten
if numbers.includes?(n)
  puts "Yes"
else
  puts "No"
end
