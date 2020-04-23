# ABC 139 B - Power Socket
# https://atcoder.jp/contests/abc139/tasks/abc139_b

a, b = read_line.split.map(&.to_i64)
div, mod = b.divmod(a)
if mod == 0
  puts div
else
  puts div + 1
end
