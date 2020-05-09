# HITACHI 2020 A - Hitachi String
# https://atcoder.jp/contests/hitachi2020/tasks/hitachi2020_a

s = read_line

if /\A(?:hi)+\Z/ =~ s
  puts "Yes"
else
  puts "No"
end
