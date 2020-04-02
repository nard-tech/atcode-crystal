# ABC 160 D - Line++
# https://atcoder.jp/contests/abc160/tasks/abc160_d

n, x, y = gets.chomp.split(/ /).map(&:to_i)
array = 1.upto(n).map { |i| i.times.map { Float::INFINITY } }

for i in 1..(n - 1) do
  for j in (i + 1)..n do
    array[j - 1][i - 1] = [
      j - i,
      (x - i).abs + 1 + (y - j).abs
    ].min
  end
end

a_flatten = array.flatten
h = a_flatten.group_by { |i| i }

1.upto(n - 1) do |i|
  v = h[i]
  if v
    puts v.length
  else
    puts 0
  end
end
