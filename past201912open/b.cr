# 第一回 アルゴリズム実技検定 過去問 B - 増減管理 / Up and Down
# https://atcoder.jp/contests/past201912-open/tasks/past201912_b

n = read_line.to_i64
a = Array.new(n) { read_line.to_i64 }

a.each_cons(2).each do |values|
  before, after = values
  if before == after
    puts "stay"
  elsif before > after
    puts "down #{before - after}"
  else
    puts "up #{after - before}"
  end
end
