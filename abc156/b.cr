# ABC 156 B - Digits
# https://atcoder.jp/contests/abc156/tasks/abc156_b

n, k = read_line.split.map(&.to_i64)
puts ((Math.log(n) / Math.log(k)).floor + 1).to_i64
