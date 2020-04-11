# 第一回 アルゴリズム実技検定 過去問 D - 重複検査 / Duplicated?
# https://atcoder.jp/contests/past201912-open/tasks/past201912_d

n = read_line.to_i64
a = Array.new(n) { read_line.to_i64 }

a_uniq = a.uniq

if a_uniq.size == n
  puts "Correct"
else
  a_valid = 1_i64.upto(n).to_a
  converted_before = (a_valid - a_uniq).shift
  converted_after = a_valid.find { |i| a.count(i) == 2 }
  puts "#{converted_after} #{converted_before}"
end
