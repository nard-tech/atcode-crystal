# 第一回 アルゴリズム実技検定 過去問 A - 2 倍チェック / Is It a Number?
# https://atcoder.jp/contests/past201912-open/tasks/past201912_a

s = read_line

if /^\d+$/ =~ s
  puts s.to_i * 2
else
  puts "error"
end
