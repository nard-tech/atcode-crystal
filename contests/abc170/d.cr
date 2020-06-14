# ABC 170 D - Not Divisible
# https://atcoder.jp/contests/abc170/tasks/abc170_d

# TLE, WA
# https://atcoder.jp/contests/abc170/submissions/14322641

n = read_line.to_i64
h = read_line.split.map(&.to_i64).sort.group_by(&.itself)
numbers = h.keys.sort

def divisible?(numbers : Array(Int64), n : Int64, i : Int64)
  return false if i == 1
end

i = 0_i64
numbers.each_with_index(1) do |n, i|
  i += h[n].size unless divisible?(numbers, n, i)
end

puts i
