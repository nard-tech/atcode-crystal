# ABC 170 B - Crane and Turtle
# https://atcoder.jp/contests/abc170/tasks/abc170_b

# AC
# https://atcoder.jp/contests/abc170/submissions/14298927

x, y = read_line.split.map(&.to_i64)

unless y % 2 == 0
  puts "No"
  exit
end

tsuru = 2 * x - y // 2
kame = -x + y // 2
unless tsuru >= 0 && kame >= 0
  puts "No"
  exit
end

puts "Yes"
