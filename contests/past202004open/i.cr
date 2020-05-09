# 第二回 アルゴリズム実技検定 過去問 I - トーナメント
# https://atcoder.jp/contests/past202004-open/tasks/past202004_i

# AC
# https://atcoder.jp/contests/past202004-open/submissions/12817826

n = read_line.to_i64
powers = read_line.split.map(&.to_i64)

class Member
  def initialize(@index : Int64, @power : Int64, n : Int64)
    @groups = set_groups(n)
  end

  getter :index, :power, groups : Hash(Int64, Int64)

  def n_battles(tornament_result : Hash(Int64, Array(Member)), n : Int64) : Int64
    i = 1_i64
    win = true

    while win && i <= n
      tornament_result_of_this_battle = tornament_result[i]
      group = groups[i]
      # puts "i: #{i}"
      # puts "tornament_result_of_this_battle: #{tornament_result_of_this_battle.inspect}"
      # puts "group: #{group}"
      if self == tornament_result_of_this_battle[group]
        if i == n
          return i
        else
          i += 1
        end
      else
        win = false
      end
    end

    i
  end

  private def set_groups(n : Int64) : Hash(Int64, Int64)
    h = Hash(Int64, Int64).new { 0_i64 }
    1_i64.upto(n).each do |i|
      div, mod = index.divmod(2 ** i)
      if mod == 0
        h[i] = div - 1
      else
        h[i] = div
      end
    end
    h
  end
end

members = powers.map_with_index(1) { |power, i| Member.new(i.to_i64, power, n) }

def generate_tornament_result(members : Array(Member), n : Int64) : Hash(Int64, Array(Member))
  h = Hash(Int64, Array(Member)).new { [] of Member }

  1_i64.upto(n).each do |i|
    result = [] of Member

    if i == 1
      prev = members
    else
      prev = h[i - 1]
    end

    prev.in_groups_of(2).each do |group|
      a, b = group
      raise "Nil is not valid" if a.nil? || b.nil?
      result.push([a, b].max_by(&.power))
    end

    h[i] = result
  end

  h
end

tornament_result = generate_tornament_result(members, n)

# puts tornament_result.inspect

members.each do |member|
  puts member.n_battles(tornament_result, n)
end
