# HITACHI 2020 C - ThREE
# https://atcoder.jp/contests/hitachi2020/tasks/hitachi2020_c

n = read_line.to_i64
array_of_ab = Array.new(n - 1) { read_line.split.map(&.to_i64) }

class Node
  def initialize(number : Int64)
    @number = number
  end

  getter :number
end

class Edge
  def initialize(from : Node, to : Node)
    @from = from
    @to = to
  end

  getter :from, :to

  def has?(node : Node)
    from == node || to == node
  end
end

class Tree
  def initialize(edges : Array(Edge))
    @edges = edges
  end

  getter :edges

  def distance(node_a : Node, node_b : Node)
  end
end

nodes = 1.upto(n).map { |i| Node.new(i) }
edges = array_of_ab.map { |ab|
  a, b = ab
  node_a = nodes[a - 1]
  node_b = nodes[b - 1]
  Edge.new(node_a, node_b)
}

tree = Tree.new(edges)
