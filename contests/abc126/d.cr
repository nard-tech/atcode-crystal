# ABC 126 D - Even Relation
# https://atcoder.jp/contests/abc126/tasks/abc126_d

n = read_line.to_i64

class Edge
  def initialize(from : Int64, to : Int64, length : Int64)
    @from = from
    @to = to
    @length = length
  end

  getter :from, :to, :length
end

edges = Array.new(n) { read_line.split.map(&.to_i64) }
even_edges = edges.select { |edge| edge.length.even? }
