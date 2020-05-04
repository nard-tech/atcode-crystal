# 第二回 アルゴリズム実技検定 過去問 F - タスクの消化
# https://atcoder.jp/contests/past202004-open/tasks/past202004_f

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12814533

n = read_line.to_i64
ab_s = Array.new(n) { read_line.split.map(&.to_i64) }

class Task
  def initialize(@begin_at_or_after : Int64, @point : Int64)
  end

  getter :begin_at_or_after, :point
end

tasks = ab_s.map { |ab| a, b = ab; Task.new(a, b) }.sort_by(&.point).reverse

results = [] of Int64

1.upto(n) do |k|
  tasks_to_execute = [] of Task
  tasks_copy = tasks.dup
  1.upto(k) do |j|
    task_to_execute = tasks_copy.find { |task| task.begin_at_or_after <= j }
    raise "Nil is not valid for k: #{k}, day #{j}" if task_to_execute.nil?
    tasks_copy.delete(task_to_execute)
    tasks_to_execute.push(task_to_execute)
  end
  results.push(tasks_to_execute.sum(&.point))
end

results.each do |result|
  puts result
end
