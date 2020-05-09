# ABC 132 A - Fifty-Fifty
# https://atcoder.jp/contests/abc132/tasks/abc132_a

s = read_line
chars = s.split(//)
if chars.uniq.size == 2 && chars.count(chars.uniq.first) == 2
  puts "Yes"
else
  puts "No"
end
