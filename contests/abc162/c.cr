# ABC 162 C - Sum of gcd of Tuples (Easy)
# https://atcoder.jp/contests/abc162/tasks/abc162_c

k = read_line.to_i64

sum = 0_i64

1.upto(k) do |a|
  1.upto(k) do |b|
    1.upto(k) do |c|
      sum += a.gcd(b).gcd(c)
    end
  end
end

puts sum
