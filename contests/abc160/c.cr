# ABC 160 C - Traveling Salesman around Lake
# https://atcoder.jp/contests/abc160/tasks/abc160_c

k, n = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64).sort

diff = [] of Int64

a.each_cons(2) do |d_houses|
  d_house_1, d_house_2 = d_houses
  diff.push(d_house_2 - d_house_1)
end

diff.push(k - a.last + a.first)
puts k - diff.max
