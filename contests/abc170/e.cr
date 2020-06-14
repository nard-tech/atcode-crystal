# ABC 170 E - Smart Infants
# https://atcoder.jp/contests/abc170/tasks/abc170_e

n, q = read_line.split.map(&.to_i64)
ab_array = Array.new(n) { read_line.split.map(&.to_i64) }
cd_array = Array.new(q) { read_line.split.map(&.to_i64) }

class Child
  def initialize(@rate : Int64, @school : Int64 | Nil, @index : Int64)
  end

  # index は 1 から n まで
  getter :rate, :index
  property :school
end

class School
  def initialize(@index : Int64, @children : Hash(Int64, Child), @highest_rate : Int64)
  end

  # index は 1 から 2 * 10^5 まで
  getter :index, :children
  property :highest_rate

  def remove_child(i) : Child
    child = children.remove(i)
    raise unless child.index == i
    child.school = nil

    if highest_rate == child.rate
      self.highest_rate = children.values.max_of(&.rate)
    end

    return child
  end

  def add_child(child : Child)
    child.school = self
    self.children[child.index] = child

    if child.rate > highest_rate
      self.highest_rate = child.rate
    end
  end
end

class Schools
  # , children : Array(Child)

  # highest_rates = Hash(Int64, Int64).new
  # children_group_by_school = children.group_by(&.school)
  # children_group_by_school.each do |school_index, children_of_school|
  #   highest_rates[school_index] = children_of_school.max_of(&.rate)
  # end

  # children_of_school = children_group_by_school.key?(i) ? children_group_by_school[i] : [] of Child

  # children_of_school_as_hash = Hash(Int64, Child).new
  # children_of_school.each do |child|
  #   children_of_school_as_hash[child.index] = child
  # end

  def self.build(n : Int64)
    schools = (1_i64..n).to_a.map do |i|
      School.new(i, children_of_school_as_hash)
    end

    new(children, schools)
  end

  def initialize(@children : Array(Child), @schools : Array(School))
    @equality = 0_i64
  end

  getter :children, :schools
  property equality : Int64

  def apply(move : Move)
    child = move.child(children)
    school_index = child.school.index
    prev_school = schools[school_index - 1]

    if equality == prev_school.highest_rate
      removed_child = prev_school.remove_child(child.index)
      self.equality = schools.min_of(&.highest_rate)
    else
      removed_child = prev_school.remove_child(child.index)
    end

    next_school = move.next_school(schools)
    next_school.add_child(child)

    if next_school.highest_rate < equality
      self.equality = next_school.highest_rate
    end

    puts equality
  end
end

class Move
  def initialize(@child_index : Int64, @school_index : Int64)
  end

  getter :child_index, :school_index

  def child(children : Array(Child)) : Child
    children[child_index - 1]
  end

  def next_school(schools : Array(School)) : School
    schools[school_index - 1]
  end
end

schools = Schools.build(2_i64 * 10_i64 ** 5)
children = ab_array.map_with_index(1) { |ab, i| a, b = ab; Child.new(a, b, i.to_i64) }
moves = cd_array.map { |cd| c, d = cd; Move.new(c, d) }

moves.each do |move|
  schools.apply(move)
end
