# ABC 142 D - Disjoint Set of Common Divisors
# https://atcoder.jp/contests/abc142/tasks/abc142_d

require 'prime'

a, b = gets.chomp.split(/ /).map(&:to_i)
gcd_prime_division = Prime.prime_division(a.gcd(b))
puts gcd_prime_division.size + 1
