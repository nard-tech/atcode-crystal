# ABC 163 C - management
# https://atcoder.jp/contests/abc163/tasks/abc163_c

n = read_line.to_i64
a = read_line.split.map(&.to_i64)

class Relation
  def initialize(@boss : Int64, @subordinate : Int64)
  end

  property :boss, :subordinate
end

relations = [] of Relation

# 社員番号 1
relations.push(Relation.new(0_i64, 1_i64))

# 社員番号 2..n
2.upto(n).each do |i|
  relations.push(Relation.new(a[i - 2], i.to_i64))
end

1.upto(n).each do |i|
  puts relations.select { |relation| relation.boss == i }.size
end
