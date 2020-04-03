# ABC 130 C - Rectangle Cutting
# https://atcoder.jp/contests/abc130/tasks/abc130_c

w, h, x0, y0 = read_line.split.map(&.to_i64)

half = w * h * 1.0 / 2
if x0 == 0 || x0 == w || y0 == 0 || y0 == h
  puts "#{half} #{0}"
else
  if x0 * 2 == w && y0 * 2 == h # 中心
    puts "#{half} #{1}"
  else
    puts "#{half} #{0}"
  end
end
