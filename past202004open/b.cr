# 第二回 アルゴリズム実技検定 過去問 B - 多数決
# https://atcoder.jp/contests/past202004-open/tasks/past202004_b

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12812455

s = read_line
votes = s.split(//).to_a
h = votes.group_by(&.itself)
puts h.to_a.max_by { |v|
  candidate, array = v
  array.size
}.first
