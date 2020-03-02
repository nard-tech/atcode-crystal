# ABC 127 C - Prison
# https://atcoder.jp/contests/abc127/tasks/abc127_c

n, m = read_line.split.map(&.to_i64)
lrs = Array.new(m) { read_line.split.map(&.to_i64) }

class Card
  def initialize(index : Int32)
    @index = index
  end

  getter :index
end

class Gate
  def initialize(index : Int32, l : Int64, r : Int64)
    @index = index
    @l = l
    @r = r
  end

  getter :l , :r

  def pass?(card : Card)
    l <= card.index && card.index <= r
  end
end

cards = 1.upto(n).map { |i| Card.new(i) }
gates = lrs.map_with_index { |lr, i|
  l, r = lr
  Gate.new(i + 1, l, r)
}

# puts cards.select { |card| gates.all? { |gate| gate.pass?(card) } }.size

