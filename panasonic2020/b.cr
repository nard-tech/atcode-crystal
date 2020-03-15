# Panasonic 2020 B - Bishop
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_b

h, w = read_line.split.map(&.to_i64)

if h.even?
  puts w * (h / 2)
elsif h == 1
  puts 1
else
  if w.even?
    puts w * (h / 2) + (w / 2) # (w * (h + 1)) / 2
  elsif w == 1
    puts 1
  else
    puts w * (h / 2) + (w / 2 + 1)
  end
end
