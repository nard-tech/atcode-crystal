# ABC 169 B - Multiplication 2
# https://atcoder.jp/contests/abc169/tasks/abc169_b

# https://atcoder.jp/contests/abc169/submissions/13859281

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

if a.any?(&.zero?)
  puts 0
  exit
end

i = 1_i64

a.each do |element|
  begin
    i *= element
  rescue e : OverflowError
    i = -1_i64
    break
  end

  if i > 10_i64 ** 18
    i = -1_i64
    break
  end
end

puts i
