# NOMURA 2020 B - Postdocs
# https://atcoder.jp/contests/nomura2020/tasks/nomura2020_b

t = read_line

new_chars = [] of String
chars = t.split(//).map(&.to_s)
chars.each_with_index do |char, i|
  if char == "P" || char == "D"
    new_chars << char
    next
  end

  if chars[i - 1] == "P"
    new_chars << "D"
  else
    new_chars << "D"
  end
end

puts new_chars.join("")
