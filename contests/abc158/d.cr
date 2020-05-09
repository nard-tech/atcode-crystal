# ABC 158 D - String Formation
# https://atcoder.jp/contests/abc158/tasks/abc158_d

s = read_line
q = read_line.to_i64
queries = Array.new(q) { read_line.split }

queries.each do |query|
  if query.size == 1 && query.first == "1"
    s = s.reverse
  elsif query.size == 3 && query[1] == "1"
    s = "#{query[2]}#{s}"
  else
    s = "#{s}#{query[2]}"
  end
end

puts s

# puts queries
# n_reverse = queries.select { |query| query.size == 1 && query.first == "1" }.size
# puts "n_reverse: #{n_reverse}"
# add_to_first = queries.select { |query| query.size == 3 && query[1] == "1" }.map { |query| query[2] }.reverse
# puts "add_to_first: #{add_to_first}"
# add_to_last = queries.select { |query| query.size == 3 && query[1] == "2" }.map { |query| query[2] }
# puts "add_to_last: #{add_to_last}"

# str = add_to_first.join
# if n_reverse.even?
#   str += s
# else
#   str += s.reverse
# end
# str += add_to_last.join

# puts str
