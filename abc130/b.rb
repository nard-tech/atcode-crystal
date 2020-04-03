# ABC 130 B - Bounding
# https://atcoder.jp/contests/abc130/tasks/abc130_b

# ./Main.rb:4: warning: assigned but unused variable - n

n, x = gets.split(/ /).map(&:to_i)
l = gets.split(/ /).map(&:to_i)

# puts "n: #{n}"
# puts "x: #{x}"
# puts "l: #{l.inspect} (#{l.length})"

d_list = []
d = 0 #
i = 0
while d <= x && i <= n + 1
  d_list.push(d)
  i += 1
  # puts "d_list: #{d_list.inspect} (#{d_list.length})"

  d = d + l[i - 1] if i <= n
end

puts i
