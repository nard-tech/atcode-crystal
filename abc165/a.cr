# ABC 165 A - We Love Golf
# https://atcoder.jp/contests/abc165/tasks/abc165_a

k = read_line.to_i64
a, b = read_line.split.map(&.to_i64)

if (a..b).to_a.any? { |i| i % k == 0 }
  puts "OK"
else
  puts "NG"
end
