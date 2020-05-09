# ABC 086 C - Traveling
# https://atcoder.jp/contests/abc086/tasks/arc089_a

# cf. [AtCoder に登録したら解くべき精選過去問 10 問を Crystal で解いてみた](https://qiita.com/tomerun/items/23ce2a2ed6ead291d222)
# 第10問

n = read_line.to_i64
point_infos = Array.new(n) { read_line.split.map(&.to_i64) }

point_infos.unshift([0, 0, 0].map(&.to_i64))

def valid?(dt, dx, dy)
  return false if dx.abs + dy.abs > dt

  if dt.even?
    (dx + dy).even?
  else
    (dx + dy).odd?
  end
end

# 配列の長さが n + 1 となっていることに注意

valid = 0.upto(n - 1).all? { |i|
  point_info_prev = point_infos[i]
  point_info_next = point_infos[i + 1]

  t_prev, x_prev, y_prev = point_info_prev
  t_next, x_next, y_next = point_info_next

  valid?(t_next - t_prev, x_next - x_prev, y_next - y_prev)
}

if valid
  puts "Yes"
else
  puts "No"
end
