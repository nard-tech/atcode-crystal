# ABC 141 B - Tap Dance
# https://atcoder.jp/contests/abc141/tasks/abc141_b

s = read_line
chars = s.split(//).to_a
# puts chars.inspect

odd_chars = [] of String
even_chars = [] of String

chars.each_with_index(1) do |char, i|
  if i.odd?
    odd_chars.push(char)
  else
    even_chars.push(char)
  end
end

if odd_chars.all? { |char| char == "R" || char == "U" || char == "D" } && even_chars.all? { |char| char == "L" || char == "U" || char == "D" }
  puts "Yes"
else
  puts "No"
end
