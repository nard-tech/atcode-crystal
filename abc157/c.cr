# ABC 157 C - Guess The Number
# https://atcoder.jp/contests/abc157/tasks/abc157_c

# n: 桁数
n, m = read_line.split.map(&.to_i64)
sc = Array.new(m) { read_line.split.map(&.to_i64) }.uniq

numbers = n > 1 ? (10 ** (n-1)).upto(10 ** n - 1).to_a : 0.upto(9).to_a

def valid?(number, sc)
  number_as_string = number.to_s
  sc.all? { |sc_pair|
    s, c = sc_pair
    number_as_string[s - 1].to_s == c.to_s
  }
end

candidates = numbers.select do |number|
  valid?(number, sc)
end

if candidates.size == 0
  puts "-1"
else
  puts candidates.sort.first
end

# __END__

# # n: 桁数
# n, m = "3 3".split.map(&.to_i64)
# sc = [[1,7],[3,2],[1,7]].uniq

# numbers = (10 ** (n-1)).upto(10 ** n - 1).to_a

# def valid?(number, sc)
#   number_as_string = number.to_s
#   sc.all? { |sc_pair|
#     s, c = sc_pair
#     # puts s
#     # puts c
#     # puts number_as_string[s - 1].to_s
#     # puts number_as_string[s - 1].to_s.class
#     # puts c.to_s
#     # puts c.to_s.class
#     number_as_string[s - 1].to_s == c.to_s
#   }
# end

# # puts sc
# # puts valid?(702, sc)

# candidates = numbers.select do |number|
#   valid?(number, sc)
# end

# if candidates.size == 0
#   puts "-1"
# else
#   puts candidates.sort.first
# end
