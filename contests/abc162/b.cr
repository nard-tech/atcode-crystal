# ABC 162 B - FizzBuzz Sum
# https://atcoder.jp/contests/abc162/tasks/abc162_b

n = read_line.to_i64
sum = 0_i64
1_i64.upto(n) do |i|
  sum += i if i % 3 != 0 && i % 5 != 0
end
puts sum
