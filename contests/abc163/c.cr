# ABC 163 C - management
# https://atcoder.jp/contests/abc163/tasks/abc163_c

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

relations = Hash(Int64, Int64).new { 0_i64 }

# 社員番号 1
relations[0_i64] += 1_i64

# 社員番号 2..n
2_i64.upto(n).each do |i|
  relations[a[i - 2]] += 1_i64
end

1_i64.upto(n).each do |i|
  puts relations[i]
end
