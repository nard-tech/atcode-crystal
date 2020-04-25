# ABC 140 C - Maximal Value
# https://atcoder.jp/contests/abc140/tasks/abc140_c

n = read_line.to_i64
b = read_line.split.map(&.to_i64)

a = [] of Int64
a.push(b.first)

b.each_with_index do |bi, i|
  if i == n - 2
    a.push(bi)
  else
    b_next = b[i + 1]
    if bi > b_next
      a.push(b_next)
    else
      a.push(bi)
    end
  end
end

puts a.sum
