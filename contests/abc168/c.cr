# ABC 168 C - : (Colon)
#  https://atcoder.jp/contests/abc168/tasks/abc168_c

# AC
# https://atcoder.jp/contests/abc168/submissions/13302924

a, b, h, m = read_line.split.map(&.to_i64)

time_theta = (h * 30 + m * 0.5) * Math::PI / 180
minute_theta = (m * 6) * Math::PI / 180

time_x = a * Math.cos(time_theta)
time_y = a * Math.sin(time_theta)

minute_x = b * Math.cos(minute_theta)
minute_y = b * Math.sin(minute_theta)

puts Math.sqrt((time_x - minute_x)**2 + (time_y - minute_y)**2)
