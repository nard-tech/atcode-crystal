# ABC 160 D - Line++
# https://atcoder.jp/contests/abc160/tasks/abc160_d

class Node
  attr_accessor :id, :edges, :cost, :done, :from

  def initialize(id, edges = [], cost = nil, done = false)
    @id, @edges, @cost, @done = id, edges, cost, done
  end
end

class Edge
  attr_reader :cost, :nid
  def initialize(cost, nid)
    @cost, @nid = cost, nid
  end
end

class Graph
  def initialize(data)
    @nodes =
      data.map do |id, edges|
        edges.map! { |edge| Edge.new(*edge) }
        Node.new(id, edges)
      end
  end

  def route(sid, gid)
    dijkstra(sid)
    base = @nodes.find { |node| node.id == gid }
    @res = [base]
    while base = @nodes.find { |node| node.id == base.from }
      @res << base
    end
    @res
  end

  def print_route(sid, gid)
    route(sid, gid)
    # puts @res.reverse.map { |node| "#{node.id}(#{node.cost})" }.join(" -> ")
    puts @res.reverse.last.cost
  end

  def cost(nid, sid)
    dijkstra(sid)
    @nodes.find { |node| node.id == nid }.cost
  end

  private

  def dijkstra(sid)
    @nodes.each do |node|
      node.cost = node.id == sid ? 0 : nil
      node.done = false
      node.from = nil
    end

    loop do
      done_node = nil
      @nodes.each do |node|
        next if node.done or node.cost.nil?
        done_node = node if done_node.nil? or node.cost < done_node.cost
      end
      break unless done_node
      done_node.done = true
      done_node.edges.each do |edge|
        to = @nodes.find{ |node| node.id == edge.nid }
        cost = done_node.cost + edge.cost
        from = done_node.id
        if to.cost.nil? || cost < to.cost
          to.cost = cost
          to.from = from
        end
      end
    end
  end
end

data = {}
data[1] = [[1, 2]]
2.upto(n - 1).each do |i|
  data[i] = [[1, i - 1], [1, i + 1]]
end
data[n] = [[1, n - 1]]

 g = Graph.new(data)
 g.print_route(:s, :g)