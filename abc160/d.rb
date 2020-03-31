# ABC 160 D - Line++
# https://atcoder.jp/contests/abc160/tasks/abc160_d

n, x, y = gets.chomp.split(/ /).map(&:to_i)
a = n.times.map { n.times.map { Float::INFINITY }}

(0..(n - 2)).each do |from|
  to = from + 1
  a[from][to] = 1
  a[to][from] = 1
end

(0..(n - 1)).each do |i|
  a[i][i] = Float::INFINITY
end

a[x - 1][y - 1] = 1
a[y - 1][x - 1] = 1

for k in 0..(n - 1)
  for i in 0..(n - 1)
    for j in 0..(n - 1)
      distance = [a[i][j], a[i][k] + a[k][j]].min
      # puts "#{i + 1} -> #{j + 1} : #{distance}"
      a[i][j] = distance
    end
  end
end

# a.each do |ai|
#   puts ai.inspect
# end

a_flatten = a.flatten
h = a_flatten.group_by { |i| i }

# puts h

1.upto(n - 1) do |i|
  v = h[i]

  if v
    if i == 2
      puts (v.length - n) / 2
    else
      puts (v.length / 2)
    end
  else
    puts 0
  end
end
