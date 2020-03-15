# ABC 153 D - Caracal vs Monster
# https://atcoder.jp/contests/abc153/tasks/abc153_d

h = gets.chomp.to_i
h_binary_str = h.to_s(2)

def attacks(str)
  if str == "1"
    1
  else
    1 + 2 * attacks(str[0..(str.size - 2)])
  end
end

puts attacks(h_binary_str)
