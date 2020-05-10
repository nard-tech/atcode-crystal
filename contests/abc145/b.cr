# ABC 145 B - Echo
# https://atcoder.jp/contests/abc145/tasks/abc145_b

# AC
# https://atcoder.jp/contests/abc145/submissions/12949794

n = read_line.to_i64
s = read_line

div, mod = n.divmod(2)
if mod == 0 && s[0..(div - 1)] == s[div..(n - 1)]
  puts "Yes"
else
  puts "No"
end
