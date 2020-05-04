# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12826432

n = gets.chomp.to_i
ab_s = Array.new(n) { gets.chomp.split.map(&:to_i) }

class Task
  def initialize(begin_at_or_after, point)
    @begin_at_or_after = begin_at_or_after
    @point = point
  end

  attr_reader :begin_at_or_after, :point
end

tasks = ab_s.map { |a, b| Task.new(a, b) }.sort_by(&:point).reverse.group_by(&:begin_at_or_after)

v = Array.new(101, 0)
sum_of_point = 0

(1..n).each do |i|
  if tasks[i]
    tasks[i].each do |task|
      v[task.point] += 1
    end
  end

  (1..100).reverse_each do |point|
    if v[point] > 0
      v[point] -= 1
      sum_of_point += point
      break
    end
  end

  puts sum_of_point
end
