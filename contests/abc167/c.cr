# ABC 167 C - Skill Up
#  https://atcoder.jp/contests/abc167/tasks/abc167_c

n, m, x = read_line.split.map(&.to_i64)

class Book
  def initialize(@price : Int64, @skill_ups_for_algorithms : Array(Int64))
  end

  getter :price, :skill_ups_for_algorithms

  def skill_up_for_algorithm(i : Int64)
    skill_ups_for_algorithms[i - 1]
  end
end

books = Array.new(n) { read_line.split.map(&.to_i64) }.map { |book| Book.new(book[0], book[1..-1]) }
unless (1..m).all? { |algorithm| books.map { |book| book.skill_up_for_algorithm(algorithm.to_i64) }.sum >= x }
  puts -1
  exit
end

combinations = [] of Array(Book)
(1..n).each do |i|
  combinations += books.combinations(i).to_a
end

condition = false
sum = books.map(&.price).sum
combinations.each do |books|
  if (1..m).all? { |algorithm| books.map { |book| book.skill_up_for_algorithm(algorithm.to_i64) }.sum >= x }
    condition = true
    sum_price = books.map(&.price).sum
    if sum > sum_price
      sum = sum_price
    end
  end
end

if condition
  puts sum
else
  puts -1
end
