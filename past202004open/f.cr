# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12818746

n = read_line.to_i64
ab_s = Array.new(n) { read_line.split.map(&.to_i64) }

class Task
  def initialize(@begin_at_or_after : Int64, @point : Int64)
  end

  getter :begin_at_or_after, :point
end

tasks = ab_s.map { |ab| a, b = ab; Task.new(a, b) }.sort_by(&.point).reverse.group_by(&.begin_at_or_after)

# puts tasks.inspect

def serach_task(tasks : Hash(Int64, Array(Task)), day : Int64, n : Int64) : Task
  candidates = [] of Task
  (1_i64..day).each do |i|
    next unless tasks.has_key?(i)
    next if tasks[i].empty?
    candidates.push(tasks[i].first)
  end
  task = candidates.max_by(&.point)
  tasks[task.begin_at_or_after].delete(task)
  task
end

results = [] of Int64
task_points = Hash(Int64, Int64).new { 0_i64 }

1_i64.upto(n) do |k|
  task = serach_task(tasks, k, n)
  if k == 1
    point = task.point
  else
    point = task_points[k - 1] + task.point
  end
  task_points[k] = point
end

task_points.values.each do |v|
  puts v
end
