# ABC 169 C - Multiplication 3
# https://atcoder.jp/contests/abc169/tasks/abc169_c

# https://atcoder.jp/contests/abc169/submissions/13800503

require 'bigdecimal'

a_as_str, b_as_str = gets.chomp.split(/ /)
a = a_as_str.to_i
b = BigDecimal(b_as_str)

puts a * (b * 100).to_i / 100
