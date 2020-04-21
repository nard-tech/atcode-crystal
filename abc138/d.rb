# ABC 138 D - Ki
# https://atcoder.jp/contests/abc138/tasks/abc138_d

n, q = gets.chomp.split(/ /).map(&:to_i)
a_and_b = Array.new(n - 1) { gets.chomp.split(/ /).map(&:to_i) }
p_and_x = Array.new(q) { gets.chomp.split(/ /).map(&:to_i) }

class Node
  def initialize(from, to)
    @from = from
    @to = to
  end

  attr_reader :from, :to
end

class Tree
  attr_reader :number, :value, :children

  def initialize(n, c = [])
    @number = n
    @value = 0
    @children = c
  end

  attr_reader :number
  attr_accessor :value, :children

  def add_value(i)
    @value += i
    @children.each { |child| child.add_value(i) }
  end

  def search(n, indent: 0)
    # puts "#{' ' * indent}32: search #{n}"
    # puts "#{' ' * indent}33: #{self.inspect}"
    return self if number == n
    return nil if children.empty?

    # puts "#{' ' * indent}37: #{children.inspect}"
    subtree = children.detect { |child| child.search(n, indent: indent + 2) }
    return nil if subtree.nil?
    return subtree if subtree.number == n

    subtree = subtree.search(n)
    # puts "#{' ' * indent}39: #{subtree.inspect}"
    # puts "#{' ' * indent}43: #{subtree.inspect}"
    subtree
  end
end

nodes = a_and_b.map { |a, b| Node.new(a, b) }.group_by(&:from)

# puts "Nodes"
# puts nodes
# puts ""

def generate_tree(root, nodes)
  # puts "from #{root}"
  nodes_from_root = nodes[root]
  if nodes_from_root.nil?
    children = []
  else
    roots_of_children = nodes_from_root.map(&:to)
    # puts roots_of_children.inspect
    children = roots_of_children.map { |r| generate_tree(r, nodes) }
  end
  Tree.new(root, children)
end

tree = generate_tree(1, nodes)

# puts tree.inspect

p_and_x.each do |p, x|
  subtree = tree.search(p)
  # puts ""
  # puts "Subtree from #{p}"
  # puts subtree.inspect
  subtree.add_value(x) unless subtree.nil?
end

# puts "----------------"

puts 1.upto(n).map { |i| subtree = tree.search(i); subtree.value }.join(" ")
