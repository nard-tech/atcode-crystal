# ABC 155 B - Papers, Please
# https://atcoder.jp/contests/abc155/tasks/abc155_b

n = read_line.to_i64
a = read_line.split.map(&.to_i64)
if a.select(&.even?).all? { |i| i % 3 == 0 || i % 5 == 0 }
  puts "APPROVED"
else
  puts "DENIED"
end
