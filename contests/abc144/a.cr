# ABC 144 A - 9x9
# https://atcoder.jp/contests/abc144/tasks/abc144_a

# AC
# https://atcoder.jp/contests/abc144/submissions/12895161

a, b = read_line.split.map(&.to_i64)

if [a, b].all? { |i| 1 <= i && i <= 9 }
  puts a * b
else
  puts -1
end
