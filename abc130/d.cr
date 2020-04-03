# ABC 130 D - Enough Array
# https://atcoder.jp/contests/abc130/tasks/abc130_d

n, k = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)

sum = [0_i64] of Int64
a.each do |i|
  sum.push(sum.last + i)
end
sum.shift

count = 0_i64
j_last = 0_i64

sum.each_with_index do |s, i|
  if s < k
    next
  else
    j_first = 0
    while s - sum[j_last] >= k
      j_last += 1
    end
    count += j_last + 1
  end
end

puts count
