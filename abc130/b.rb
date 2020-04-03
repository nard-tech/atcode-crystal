# ABC 130 B - Bounding
# https://atcoder.jp/contests/abc130/tasks/abc130_b

n, x = gets.split(/ /).map(&:to_i)
l = gets.split(/ /).map(&:to_i)

d_list = []
d = 0
i = 1
while d <= x
  d_list.push(d)
  d = d + l[i - 1]
  i += 1
end

puts i - 1
