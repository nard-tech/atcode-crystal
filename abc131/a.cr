# ABC 131 A - Security
# https://atcoder.jp/contests/abc131/tasks/abc131_a

s = read_line

hard_to_input = false
s.split(//).[0..-2].each_with_index do |str, i|
  if str == s[i + 1].to_s
    hard_to_input = true
    break
  end
end

if hard_to_input
  puts "Bad"
else
  puts "Good"
end
