# ABC 140 B - Buffet
# https://atcoder.jp/contests/abc140/tasks/abc140_b

n = read_line.to_i64
a = read_line.split.map(&.to_i64)
b = read_line.split.map(&.to_i64)
c = read_line.split.map(&.to_i64)

point = 0

a.each_with_index do |food, i|
  # puts "food ##{i} (#{food}): #{b[i]}"
  point += b[i]
  next if i == n - 1
  next_food = a[i + 1]
  if food + 1 == next_food
    # puts "additional point ##{i} (#{food}, #{next_food}): #{c[i]}"
    point += c[food - 1]
  end
end

puts point
