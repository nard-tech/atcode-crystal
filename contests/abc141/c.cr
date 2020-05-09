# ABC 141 C - Attack Survival
# https://atcoder.jp/contests/abc141/tasks/abc141_c

n, k, q = read_line.split.map(&.to_i64)
a = Array.new(q) { read_line.to_i64 }

class Person
  def initialize(@point : Int64, @index : Int64)
  end

  property :point
  getter :index

  def win?
    point > 0
  end
end

persons = 1_i64.upto(n).map { |i| Person.new(k - q, i) }.to_a
h = a.group_by(&.itself)
h.each do |key, v|
  person = persons[key - 1]
  person.point += v.size
end

persons.each do |person|
  puts (person.win? ? "Yes" : "No")
end
