# ABC 134 C - Exception Handling
# https://atcoder.jp/contests/abc134/tasks/abc134_c

n = read_line.to_i64
a = Array.new(n) { read_line.to_i64 }

a_sorted = a.sort.reverse

a_max = a_sorted.first
a_second = a_sorted[1]

a.each do |element|
  if element == a_max
    puts a_second
  else
    puts a_max
  end
end
