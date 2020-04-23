# ABC 139 B - Power Socket
# https://atcoder.jp/contests/abc139/tasks/abc139_b

a, b = read_line.split.map(&.to_i64)

plugs = 0_i64
taps = 0_i64

if b == 1
  puts 0
else
  while plugs < b
    if taps == 0
      plugs += a
    else
      plugs += a - 1
    end
    taps += 1
  end

  puts taps
end
