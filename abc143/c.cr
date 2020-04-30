# ABC 143 C - Slimes
# https://atcoder.jp/contests/abc143/tasks/abc143_c

n = read_line.to_i64
s = read_line

chars = s.split(//).to_a
new_slime = [] of String
new_slime.push(chars.first)
1.upto(n - 1) do |i|
  new_slime.push(chars[i]) if new_slime.last != chars[i]
end
puts new_slime.size
