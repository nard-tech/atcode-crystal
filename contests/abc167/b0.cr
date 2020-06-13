# ABC 167 B
#  https://atcoder.jp/contests/abc167/tasks/abc167_b

# AC
# https://atcoder.jp/contests/abc167/submissions/13049285

a, b, c, k = read_line.split.map(&.to_i64)

i = 0

na = [a, k].min
i += na
k -= na

if k == 0
  puts i
  exit
end

nb = [b, k].min
k -= nb

if k == 0
  puts i
  exit
end

nc = [c, k].min
i -= nc

puts i
