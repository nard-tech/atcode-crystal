# ABC 152 C - Low Elements
# https://atcoder.jp/contests/abc152/tasks/abc152_c

n = read_line.to_i64
p = read_line.split.map(&.to_i64)

min = 999999
result = 0
p.each_with_index do |pi, i|
  if pi < min
    min = pi
    result += 1
  end
end

puts result
