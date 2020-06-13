# ABC 167 A - Registration
#  https://atcoder.jp/contests/abc167/tasks/abc167_a

# AC
# https://atcoder.jp/contests/abc167/submissions/13022321

s = read_line
t = read_line

s_size = s.size
t_size = t.size

if t_size == s_size + 1 && t[0..-2] == s
  puts "Yes"
else
  puts "No"
end
