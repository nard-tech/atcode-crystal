# ABC 168 B - ... (Triple Dots)
# https://atcoder.jp/contests/contests/abc168/tasks/contests/abc168_b

# AC
# https://atcoder.jp/contests/abc168/submissions/13291339

k = read_line.to_i64
s = read_line

s_size = s.size
if s_size <= k
  puts s
else
  puts "#{s[0..(k - 1)]}..."
end
