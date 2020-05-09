# ABC 152 D - Handstand 2
# https://atcoder.jp/contests/abc152/tasks/abc152_d

# 先頭，末尾は 1- 9

n_as_string = read_line
n = n_as_string.to_i64

def n_pairs(n)
  if n % 10 == 0
    n_pairs(n - 1)
  else
    n_as_string = n.to_s
    0.upto(n_as_string.size - 1).each do |digit|
      ai = n_as_string[digit]
    end
  end
end

puts n_pairs(n)
