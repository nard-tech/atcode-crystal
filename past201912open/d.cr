# 第一回 アルゴリズム実技検定 過去問 D - 重複検査 / Duplicated?
# https://atcoder.jp/contests/past201912-open/tasks/past201912_d

n = read_line.to_i64
a = Array.new(n) { read_line.to_i64 }.sort

valid = true
converted_before = 0_i64
converted_after = 0_i64

a.each_with_index(1) do |element, i|
  if element == i
    converted_after = element unless valid
  else
    valid = false
    # puts "element: #{element}, i: #{i}"
    converted_before = i if converted_before == 0
  end
end

if valid
  puts "Correct"
else
  puts "#{converted_after} #{converted_before}"
end
