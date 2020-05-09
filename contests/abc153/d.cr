# ABC 153 D - Caracal vs Monster
# https://atcoder.jp/contests/abc153/tasks/abc153_d

h = read_line.to_i64
h_binary_str = h.to_s(2)

def attacks(str) : Int64
  if str == "1"
    1_i64
  else
    1_i64 + 2_i64 * attacks(str[0..(str.size - 2)])
  end
end

puts attacks(h_binary_str)
