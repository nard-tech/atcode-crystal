# ABC 126 A - Changing a Character
# https://atcoder.jp/contests/abc126/tasks/abc126_a

n, k = read_line.split.map(&.to_i64)
s = read_line

puts s.sub(k - 1, s[k-1].downcase)
