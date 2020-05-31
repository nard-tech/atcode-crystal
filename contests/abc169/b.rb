# ABC 169 B - Multiplication 2
# https://atcoder.jp/contests/abc169/tasks/abc169_b

# https://atcoder.jp/contests/abc169/submissions/13794566

n = gets.chomp.to_i
a = gets.chomp.split(/ /).map(&:to_i)

i = 1
if a.any?(&:zero?)
  puts 0
else
  a.each do |element|
    i *= element

    if i > 10 ** 18
      i = -1
      break
    end
  end

  puts i
end
