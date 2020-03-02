# ABC 157 A - Duplex Printing
# https://atcoder.jp/contests/abc157/tasks/abc157_a

n = read_line.to_i64
if n.even?
  puts n / 2
else
  puts n / 2 + 1
end
