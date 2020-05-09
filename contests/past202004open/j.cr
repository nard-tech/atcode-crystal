# 第二回 アルゴリズム実技検定 過去問 J - 文字列解析
# https://atcoder.jp/contests/past202004-open/tasks/past202004_j

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12824200

s = read_line
re_for_no_patentheses = /\A[a-z]+\Z/
re_for_in_parentheses = /\(([a-z]*)\)/

while s !~ re_for_no_patentheses
  s = s.gsub(re_for_in_parentheses) { |s|
    tmp = s.delete("(").delete(")")
    "#{tmp}#{tmp.reverse}"
  }
end

puts s
