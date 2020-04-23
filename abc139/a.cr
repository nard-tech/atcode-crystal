# ABC 139 A - Tenki
# https://atcoder.jp/contests/abc139/tasks/abc139_a

s = read_line
t = read_line

weathers_of_three_days = [s.split(//).to_a, t.split(//).to_a].transpose
puts weathers_of_three_days.select { |weather_of_a_day|
  forecast, actual = weather_of_a_day
  forecast == actual
}.size
