# ABC 159 B - String Palindrome
# https://atcoder.jp/contests/abc159/tasks/abc159_b

s = read_line

n = s.size
s_sub_1 = s[0..((n - 1)/2 - 1)]
s_sub_2 = s[((n + 3) / 2 - 1)..(n - 1)]

if s.reverse == s && s_sub_1.reverse == s_sub_1 && s_sub_2.reverse == s_sub_2
  puts "Yes"
else
  puts "No"
end
