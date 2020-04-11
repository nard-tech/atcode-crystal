# 第一回 アルゴリズム実技検定 過去問 D - 重複検査 / Duplicated?
# https://atcoder.jp/contests/past201912-open/tasks/past201912_d

n = read_line.to_i64
a = Array.new(n) { read_line.to_i64 }

if a.size == 1
  if a.first == 1
    puts "Correct"
  else
    puts "#{a.first} 1"
  end
elsif a.uniq.size == n
  puts "Correct"
else
  a_sorted = a.sort

  duplicated = 0
  converted = 0

  a.sort.each_cons(2) do |pair|
    before, after = pair
    next if before + 1 == after

    if before == after
      duplicated = before
    elsif after - before > 1
      converted = before + 1
    end
  end

  puts "#{duplicated} #{converted}"
end
