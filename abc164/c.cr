# ABC 164 C - gacha
# https://atcoder.jp/contests/abc164/tasks/abc164_c

n = read_line.to_i64
s = Array.new(n) { read_line }

puts s.uniq.size
