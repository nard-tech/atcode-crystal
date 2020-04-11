# 第一回 アルゴリズム実技検定 過去問 G - 組分け / Division
# https://atcoder.jp/contests/past201912-open/tasks/past201912_g

n = read_line.to_i64
matrix = Array.new(n - 1) { read_line.split.map(&.to_i64) }

class Happiness
  def initialize(@array : Array(Array(Int64)))
  end

  def fetch(pair : Pair)
    i, j = pair.i, pair.j

    # raise if i == j

    # puts "i: #{i}, j: #{j}"

    if i < j
      @array[i - 1][j - i - 1]
    else
      @array[j - 1][i - j - 1]
    end
  end
end

class Pair
  def initialize(@i : Int64, @j : Int64)
  end

  getter :i, :j

  def calc_happiness(table : Happiness)
    table.fetch(self)
  end
end

class Group
  def initialize(@members : Array(Int64))
  end

  getter :members

  def calc_happiness(table : Happiness)
    pairs.map { |pair| pair.calc_happiness(table) }.sum
  end

  private def size
    members.size
  end

  private def pairs
    array = [] of Pair

    return array if size == 1

    0.upto(size - 2) do |i|
      (i + 1).upto(size - 1) do |j|
        # puts "i: #{i}, j: #{j}"
        array.push(Pair.new(members[i], members[j]))
      end
    end

    array
  end
end

class GroupPattern
  def initialize(@groups : Array(Group))
  end

  getter :groups

  def calc_happiness(table : Happiness)
    groups.map { |group| group.calc_happiness(table) }.sum
  end
end

happiness = Happiness.new(matrix)

group_patterns = [] of GroupPattern
all_members = 1.upto(n).map(&.to_i64).to_a
group_patterns.push(GroupPattern.new([Group.new(all_members)]))

1.upto(n / 2).each do |i|
  groups = [] of Group

  combinations = all_members.combinations(i)
  combinations.each do |group_a|
    group_b = all_members - group_a

    groups.push(Group.new(group_a))
    groups.push(Group.new(group_b))

    group_patterns.push(GroupPattern.new(groups))
  end
end

1.upto(n / 3).each do |i|
  combinations = all_members.combinations(i)
  1.upto((n - i) / 2) do |j|
    combinations.each do |group_a|
      other_combinations = (all_members - group_a).combinations(j)
      other_combinations.each do |group_b|
        group_c = (all_members - group_a - group_b)

        group_patterns.push(
          GroupPattern.new([Group.new(group_a), Group.new(group_b), Group.new(group_c)])
        )
      end
    end
  end
end

puts group_patterns.map { |group_pattern| group_pattern.calc_happiness(happiness) }.max
