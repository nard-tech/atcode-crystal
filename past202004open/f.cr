# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12826510

n = read_line.to_i64
ab_s = Array.new(n) { read_line.split.map(&.to_i64) }

class Task
  def initialize(@begin_at_or_after : Int64, @point : Int64)
  end

  getter :begin_at_or_after, :point
end

tasks = ab_s.map { |ab| a, b = ab; Task.new(a, b) }.sort_by(&.point).reverse.group_by(&.begin_at_or_after)

v = Array.new(101, 0)
sum_of_point = 0

(1..n).each do |i|
  if tasks.has_key?(i)
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
