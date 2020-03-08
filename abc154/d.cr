# ABC 154 D - Dice in Line
# https://atcoder.jp/contests/abc154/tasks/abc154_d

n, k = read_line.split.map(&.to_i64)
p = read_line.split.map(&.to_i64)

class Pair
  def initialize(array : Array(Int64), from : Int64)
    @array = array
    @from = from
  end

  getter :from

  def sum
    @array.sum
  end
end

p_pairs = p.each_cons(k)
pairs = [] of Pair
p_pairs.each.with_index(0) do |p_pair, i|
  pairs.push(Pair.new(p_pair, i.to_i64))
end

def calc_max_sum(pairs : Array(Pair))
  if pairs.size == 1
    pairs.first.sum
  else
    last_index_of_first = (pairs.size - 1) / 2
    first_index_of_last = last_index_of_first + 1
    groups = [
      pairs[0..last_index_of_first],
      pairs[first_index_of_last..(pairs.size - 1)]
    ] # Array(Array(Pair))
    groups.map { |group|
      calc_max_sum(group)
    }.max
  end
end

puts (calc_max_sum(pairs) + k) / 2.0
