# 第二回 アルゴリズム実技検定 過去問 E - 順列
# https://atcoder.jp/contests/past202004-open/tasks/past202004_e

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12813973

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

result = [] of Int64
1.upto(n) do |i|
  x = i.to_i64
  j = 0_i64
  completed = false
  while !completed
    x = a[x - 1]
    j += 1
    completed = true if x == i
  end
  result.push(j)
end

puts result.join(" ")
