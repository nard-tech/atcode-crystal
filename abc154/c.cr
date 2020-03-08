# ABC 154 C - Distinct or Not
# https://atcoder.jp/contests/abc154/tasks/abc154_c

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

if a.uniq.size == a.size
  puts "YES"
else
  puts "NO"
end
