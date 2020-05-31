# ABC 169 B - Multiplication 2
# https://atcoder.jp/contests/abc169/tasks/abc169_b

# https://atcoder.jp/contests/abc169/submissions/13785661

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

i = 1_i64
if a.any?(&.zero?)
  puts 0
else
  a.each do |element|
    i *= element
    if i > 10_i64 ** 18
      i = -1_i64
      break
    elsif i == 0
      break
    end
  end

  puts i
end
