# ABC 170 D - Not Divisible
# https://atcoder.jp/contests/abc170/tasks/abc170_d

# TLE, WA
# https://atcoder.jp/contests/abc170/submissions/14322641

n = gets.chomp.to_i
h = gets.chomp.split(/ /).map(&:to_i).sort.tally
numbers = h.keys.sort

def divisors(n)
  list_a = []
  list_b = []

  (1..(Math.sqrt(n))).each do |i|
    div, mod = n.divmod(i)
    if mod.zero?
      list_a.push(i)
      list_b.push(div)
    end
  end

  list_b.pop if list_b.last == list_a.last
  list_a + list_b.reverse
end

def divisible?(numbers, n, i)
  return false if i == 0
  divisors = divisors(n)
  # puts "divisors of #{n}: #{divisors}"
  (divisors & numbers[0..(i - 1)]).size > 0
end

count = 0
# puts "numbers: #{numbers}"
# puts "h: #{h}"
if h.size == 1
  puts 0
  exit
end

numbers.each_with_index do |n, i|
  v = divisible?(numbers, n, i)
  # puts  "n: #{n}, i: #{i}, divisible: #{v}"
  count += h[n] unless v
end

puts count
