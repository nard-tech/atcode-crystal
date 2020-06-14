# ABC 169 C - Multiplication 3
# https://atcoder.jp/contests/abc169/tasks/abc169_c

# https://atcoder.jp/contests/abc169/submissions/13862181

require "big"

a_as_str, b_as_str = read_line.split
a = a_as_str.to_i64
b = BigDecimal.new(b_as_str.to_f64)

puts (a * (b * 100).to_i64) // 100
